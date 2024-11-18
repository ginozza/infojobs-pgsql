/*********************************DEFINICIÓN DE TRIGGERS Y FUNCIONES*********************************/

/*
 * CREACIÓN DEL TRIGGER PARA ENCRIPTAR CONTRASEÑAS
 * Este trigger asegura que las contraseñas se almacenen encriptadas en la base de datos.
 * Utiliza el módulo pgcrypto para encriptar y desencriptar contraseñas.
 */

CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE OR REPLACE FUNCTION encrypt_password_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    NEW.password := pgp_sym_encrypt(NEW.password, 'my_secret_key');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

/*
 * CREACIÓN DEL TRIGGER EN LA TABLA "public".users
 * Este trigger encripta las contraseñas antes de almacenarlas en la base de datos.
 */

CREATE TRIGGER trg_encrypt_password
BEFORE INSERT OR UPDATE ON "public".users
FOR EACH ROW
EXECUTE FUNCTION encrypt_password_before_insert();

/*
 * CREACIÓN DEL PROCEDIMIENTO PARA REGISTRAR CANDIDATOS
 * Este procedimiento permite registrar un nuevo candidato en el sistema. Realiza las siguientes acciones:
 * 1. Inserta un nuevo registro en la tabla "users" con los datos proporcionados (correo electrónico, contraseña, nombre, apellidos, etc.).
 * - El estado de la cuenta se establece como 'Active' por defecto.
 * - El tipo de usuario se obtiene de la tabla "users_types" con el valor 'Candidate'.
 * - La fecha de registro se establece como la fecha y hora actuales.
 * - Se genera un token alfanumérico único usando la función MD5 sobre un valor aleatorio.
 * 2. Inserta un nuevo registro en la tabla "users_candidates" asociando el nuevo usuario con el número de teléfono y la fecha de nacimiento proporcionados.
 */

CREATE OR REPLACE PROCEDURE register_candidate(
    p_email VARCHAR(254),
    p_password TEXT,
    p_name VARCHAR(100),
    p_first_surname VARCHAR(50),
    p_second_surname VARCHAR(50),
    p_phone_number VARCHAR(20),
    p_birth_date DATE
) AS $$
DECLARE
    v_user_id INT;
BEGIN
    -- Insertar en la tabla users
    INSERT INTO users (
        email, password, name, first_surname, second_surname,
        account_status, id_user_type, registration_date, token
    )
    VALUES (
        p_email, p_password, p_name, p_first_surname, p_second_surname,
        'Active', (SELECT id_user_type FROM users_types WHERE user_type = 'Candidate'),
        CURRENT_TIMESTAMP, md5(random()::text)
    )
    RETURNING id_user INTO v_user_id;

    -- Insertar en la tabla users_candidates
    INSERT INTO users_candidates (id_user, phone_number, birth_date)
    VALUES (v_user_id, p_phone_number, p_birth_date);
END;
$$ LANGUAGE plpgsql;

/*
 * CREACIÓN DEL PROCEDIMIENTO PARA REGISTRAR EMPRESARIOS
 * Este procedimiento permite registrar un nuevo empresario en el sistema. Realiza las siguientes acciones:
 * 1. Valida que el tipo de empresa especificado exista en la tabla "company_type".
 * 2. Inserta un nuevo registro en la tabla "users" con los datos proporcionados (correo electrónico, contraseña, nombre, apellidos, etc.).
 * - El estado de la cuenta se establece como 'Active' por defecto.
 * - El tipo de usuario se obtiene de la tabla "users_types" con el valor 'Employer'.
 * - La fecha de registro se establece como la fecha y hora actuales.
 * - Se genera un token alfanumérico único usando la función MD5 sobre un valor aleatorio.
 * 3. Inserta un nuevo registro en la tabla "users_employers" asociando el nuevo usuario con los datos de la empresa proporcionados (nombre de la empresa, teléfono, identificación fiscal, descripción y tipo de empresa).
 */

CREATE OR REPLACE PROCEDURE register_employer(
    p_email VARCHAR(254),
    p_password TEXT,
    p_name VARCHAR(100),
    p_first_surname VARCHAR(50),
    p_second_surname VARCHAR(50),
    p_company_name VARCHAR(100),
    p_phone_number VARCHAR(20),
    p_tax_identification VARCHAR(15),
    p_company_description TEXT,
    p_company_type_id INT
) AS $$
DECLARE
    v_user_id INT;
BEGIN
    IF NOT EXISTS (SELECT 1 FROM company_type WHERE id_company_type = p_company_type_id) THEN
        RAISE EXCEPTION 'El tipo de empresa especificado no existe';
    END IF;

    INSERT INTO users (
        email, password, name, first_surname, second_surname,
        account_status, id_user_type, registration_date, token
    )
    VALUES (
        p_email, p_password, p_name, p_first_surname, p_second_surname,
        'Active', (SELECT id_user_type FROM users_types WHERE user_type = 'Employer'),
        CURRENT_TIMESTAMP, md5(random()::text)
    )
    RETURNING id_user INTO v_user_id;

    INSERT INTO users_employers (
        id_user,
        company_name,
        phone_number,
        tax_identification,
        description,
        id_company_type
    )
    VALUES (
        v_user_id,
        p_company_name,
        p_phone_number,
        p_tax_identification,
        p_company_description,
        p_company_type_id
    );

EXCEPTION
    WHEN others THEN
        IF v_user_id IS NOT NULL THEN
            DELETE FROM users WHERE id_user = v_user_id;
        END IF;
        RAISE;
END;
$$ LANGUAGE plpgsql;

/*
 * CREACIÓN DEL TRIGGER PARA VERIFICAR QUE LA CIUDAD PERTENECE AL PAÍS
 * Este trigger asegura que la ciudad de residencia esté asociada correctamente con el país de residencia.
 * Verifica que la ciudad pertenezca al país antes de insertar o actualizar un registro.
 */

CREATE OR REPLACE FUNCTION check_city_belongs_to_country()
RETURNS trigger AS
$$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM "public".cities c
        JOIN "public".provinces p ON c.id_province = p.id_province
        WHERE c.id_city = NEW.id_residence_city
        AND p.id_country = NEW.id_residence_country
    ) THEN
        RAISE EXCEPTION 'La ciudad % no pertenece al país %', NEW.id_residence_city, NEW.id_residence_country;
    END IF;

    RETURN NEW;
END;
$$
LANGUAGE plpgsql;


/*
 * CREACIÓN DEL TRIGGER EN LA TABLA "public".candidate_residences
 * Este trigger verifica que la ciudad de residencia pertenezca al país de residencia antes de insertar o actualizar un registro.
 */

CREATE TRIGGER trg_check_city_belongs_to_country
BEFORE INSERT OR UPDATE ON "public".candidate_residences
FOR EACH ROW
EXECUTE FUNCTION check_city_belongs_to_country();

/*
 * CREACIÓN DE LA FUNCIÓN PARA OBTENER ESTADÍSTICAS DE APLICACIONES POR VACANTE
 * Esta función calcula y devuelve las estadísticas de las aplicaciones para una vacante específica. Realiza las siguientes acciones:
 * 1. Cuenta el total de aplicaciones para la vacante especificada por el ID de la vacante.
 * 2. Cuenta las aplicaciones que están en estado 'Waiting', 'Accepted' y 'Rejected'.
 * 3. Calcula la tasa de aceptación de aplicaciones, que se obtiene dividiendo las aplicaciones aceptadas por el total de aplicaciones.
 * - Si no hay aplicaciones, la tasa de aceptación será 0.
 */

CREATE OR REPLACE FUNCTION get_vacancy_application_stats(vacancy_id INT)
RETURNS TABLE (
    total_applications INT,
    waiting_applications INT,
    accepted_applications INT,
    rejected_applications INT,
    acceptance_rate DECIMAL(5,2)
) AS $$
BEGIN
    RETURN QUERY
    WITH stats AS (
        SELECT
            COUNT(*) as total,
            COUNT(*) FILTER (WHERE application_status = 'Waiting') as waiting,
            COUNT(*) FILTER (WHERE application_status = 'Accepted') as accepted,
            COUNT(*) FILTER (WHERE application_status = 'Rejected') as rejected
        FROM entry_applications
        WHERE id_vacancy = vacancy_id
    )
    SELECT
        total::INT,
        waiting::INT,
        accepted::INT,
        rejected::INT,
        CASE
            WHEN total > 0 THEN ROUND((accepted::DECIMAL / total::DECIMAL) * 100, 2)
            ELSE 0
        END
    FROM stats;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM get_vacancy_application_stats(1);

SELECT
    v.id_vacancy,
    v.job_title,
    stats.*
FROM vacancies v
LEFT JOIN LATERAL get_vacancy_application_stats(v.id_vacancy) stats ON true
WHERE v.id_company = 456;


/*
 * CREACIÓN DE LA FUNCIÓN PARA BUSCAR VACANTES POR PREFERENCIAS DEL CANDIDATO
 * Esta función busca las vacantes que coinciden con las preferencias de un candidato específico. Realiza las siguientes acciones:
 * 1. Recupera las preferencias del candidato sobre salario, categorías de vacante, tipos de contrato y provincias.
 * 2. Calcula el porcentaje de coincidencias entre las preferencias del candidato y las propiedades de las vacantes disponibles.
 * - Si el salario mínimo de la vacante es mayor o igual al salario preferido, se asignan 30 puntos.
 * - Si la vacante pertenece a alguna de las categorías preferidas, se asignan 30 puntos.
 * - Si el tipo de contrato coincide con el preferido, se asignan 20 puntos.
 * - Si la vacante se encuentra en una de las provincias preferidas, se asignan 20 puntos.
 * 3. Devuelve las vacantes que tienen un porcentaje de coincidencia mayor a 0, ordenadas por el porcentaje de coincidencia en orden descendente.
 */

CREATE OR REPLACE FUNCTION find_matching_vacancies(candidate_id INT)
RETURNS TABLE (
    id_vacancy INT,
    title VARCHAR(250),
    match_percentage DECIMAL(5,2),
    vacancy_salary DECIMAL(10,2)
) AS $$
BEGIN
    RETURN QUERY
    WITH candidate_prefs AS (
        SELECT
            cp.salary,
            array_agg(DISTINCT pc.id_vacancy_category) AS categories,
            array_agg(DISTINCT pct.id_contract_type) AS contract_types,
            array_agg(DISTINCT pp.id_province) AS provinces
        FROM candidates_preferences cp
        LEFT JOIN candidates_preferences_categories pc ON cp.id_preference = pc.id_preference
        LEFT JOIN candidates_preferences_contract_type pct ON cp.id_preference = pct.id_preference
        LEFT JOIN candidates_preferences_provinces pp ON cp.id_preference = pp.id_preference
        WHERE cp.id_user = candidate_id
        GROUP BY cp.salary
    )
    SELECT
        v.id_vacancy,
        v.title,
        ROUND(
            (
                CASE WHEN vs.minimum_salary >= cp.salary THEN 30 ELSE 0 END +
                CASE WHEN vp.id_vacancy_category = ANY(cp.categories) THEN 30 ELSE 0 END +
                CASE WHEN vp.id_contract_type = ANY(cp.contract_types) THEN 20 ELSE 0 END +
                CASE WHEN c.id_province = ANY(cp.provinces) THEN 20 ELSE 0 END
            )::DECIMAL, 2
        ) AS match_percentage,
        vs.minimum_salary::DECIMAL(10,2) AS vacancy_salary
    FROM vacancies v
    JOIN vacancies_properties vp ON v.id_vacancy = vp.id_vacancy
    JOIN vacancies_salaries vs ON v.id_vacancy = vs.id_vacancy
    JOIN cities c ON v.id_city = c.id_city
    CROSS JOIN candidate_prefs cp
    WHERE v.vacancy_status = 'Open'
    AND (
        CASE WHEN vs.minimum_salary >= cp.salary THEN 30 ELSE 0 END +
        CASE WHEN vp.id_vacancy_category = ANY(cp.categories) THEN 30 ELSE 0 END +
        CASE WHEN vp.id_contract_type = ANY(cp.contract_types) THEN 20 ELSE 0 END +
        CASE WHEN c.id_province = ANY(cp.provinces) THEN 20 ELSE 0 END
    ) > 0
    ORDER BY match_percentage DESC;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM find_matching_vacancies(1);

/*
 * CREACIÓN DEL PROCEDIMIENTO PARA ACCIONES ADMINISTRATIVAS
 * Este procedimiento realiza acciones administrativas como suspender cuentas de usuario, activar cuentas de usuario o eliminar vacantes.
 * Las acciones se verifican según el tipo de acción proporcionado:
 * 1. Si el tipo de acción es 'SUSPEND_ACCOUNT', suspende la cuenta del usuario especificado y registra el evento en los logs de auditoría.
 * 2. Si el tipo de acción es 'ACTIVATE_ACCOUNT', activa la cuenta del usuario especificado y registra el evento en los logs de auditoría.
 * 3. Si el tipo de acción es 'DELETE_VACANCY', elimina los registros relacionados con la vacante especificada (vacantes, propiedades de vacantes, salarios, y aplicaciones) y también registra el evento en los logs de auditoría.
 * 4. Si el tipo de acción no es válido, se lanza un error.
 */

CREATE OR REPLACE FUNCTION admin_actions(
    p_admin_id INT,
    p_action VARCHAR(25),
    p_target_id INT,
    p_action_type VARCHAR(25)
) RETURNS VOID AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM users_admin WHERE id_user = p_admin_id) THEN
        RAISE EXCEPTION 'El usuario no es un administrador';
    END IF;

    CASE p_action_type
        WHEN 'SUSPEND_ACCOUNT' THEN
            UPDATE users
            SET account_status = 'Suspended'::account_status
            WHERE id_user = p_target_id;

            INSERT INTO audit_logs (
                event_name,
                event_description,
                table_name,
                event_date,
                id_trigger_user
            ) VALUES (
                'ACCOUNT_SUSPENDED',
                format('Cuenta de usuario %s suspendida por el administrador %s', p_target_id, p_admin_id),
                'users',
                CURRENT_TIMESTAMP,
                p_admin_id
            );

        WHEN 'ACTIVATE_ACCOUNT' THEN
            UPDATE users
            SET account_status = 'Active'::account_status
            WHERE id_user = p_target_id;

            INSERT INTO audit_logs (
                event_name,
                event_description,
                table_name,
                event_date,
                id_trigger_user
            ) VALUES (
                'ACCOUNT_ACTIVATED',
                format('Cuenta de usuario %s activada por el administrador %s', p_target_id, p_admin_id),
                'users',
                CURRENT_TIMESTAMP,
                p_admin_id
            );

        WHEN 'DELETE_VACANCY' THEN
            DELETE FROM vacancies_properties WHERE id_vacancy = p_target_id;
            DELETE FROM vacancies_salaries WHERE id_vacancy = p_target_id;
            DELETE FROM entry_applications WHERE id_vacancy = p_target_id;
            DELETE FROM vacancies WHERE id_vacancy = p_target_id;

            INSERT INTO audit_logs (
                event_name,
                event_description,
                table_name,
                event_date,
                id_trigger_user
            ) VALUES (
                'VACANCY_DELETED',
                format('Vacante %s eliminada por el administrador %s', p_target_id, p_admin_id),
                'vacancies',
                CURRENT_TIMESTAMP,
                p_admin_id
            );

        ELSE
            RAISE EXCEPTION 'Tipo de acción inválido';
    END CASE;
END;
$$ LANGUAGE plpgsql;

/*
 * CREACIÓN DEL TRIGGER PARA ACTUALIZAR EL ESTADO DE LA VACANTE CUANDO SE LLENE
 * Este trigger asegura que, cuando el número de aplicaciones aceptadas alcanza el total de posiciones abiertas para una vacante,
 * el estado de la vacante se actualice automáticamente a 'Closed'. Además, mantiene actualizado el número de posiciones abiertas
 * para cada vacante.
 *
 * 1. Se cuenta el número de aplicaciones aceptadas para la vacante.
 * 2. Se obtiene el total de posiciones abiertas para esa vacante.
 * 3. Si el número de aplicaciones aceptadas alcanza el número de posiciones disponibles, se cierra la vacante.
 * 4. Se actualiza el número de posiciones abiertas disponibles después de la aceptación de una aplicación.
 */

CREATE OR REPLACE FUNCTION update_vacancy_status() RETURNS TRIGGER AS $$
DECLARE
    accepted_count INT;
    total_positions INT;
BEGIN
    SELECT COUNT(*) INTO accepted_count
    FROM entry_applications
    WHERE id_vacancy = NEW.id_vacancy
    AND application_status = 'Accepted';

    SELECT open_positions INTO total_positions
    FROM vacancies
    WHERE id_vacancy = NEW.id_vacancy;

    IF accepted_count >= total_positions THEN
        UPDATE vacancies
        SET vacancy_status = 'Closed'
        WHERE id_vacancy = NEW.id_vacancy;
    END IF;

    UPDATE vacancies
    SET open_positions = total_positions - accepted_count
    WHERE id_vacancy = NEW.id_vacancy;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

/*
 * ASOCIAR EL TRIGGER A LA TABLA "entry_applications"
 * Este trigger se ejecuta después de cada actualización del estado de la aplicación.
 * Cuando el estado de una aplicación es 'Accepted', se activará el trigger para actualizar el estado de la vacante.
 */

CREATE TRIGGER vacancy_status_update
AFTER UPDATE OF application_status ON entry_applications
FOR EACH ROW
WHEN (NEW.application_status = 'Accepted')
EXECUTE FUNCTION update_vacancy_status();

/*
 * CREACIÓN DE LA FUNCIÓN PARA CREAR VACANTES
 * Esta función permite a un empleador crear una vacante proporcionando los siguientes parámetros:
 * 1. Verifica que el usuario que está generando la vacante sea un empleador.
 * 2. Inserta una nueva vacante con los detalles proporcionados (título, descripción, posiciones abiertas, experiencia requerida, etc.).
 * 3. Si se proporcionan, también inserta los salarios mínimo y máximo para la vacante.
 * 4. Inserta propiedades de la vacante (tipo de jornada laboral, categoría de vacante, tipo de contrato y tipo de vacante).
 * 5. Devuelve el ID de la vacante recién generada.
 */

CREATE OR REPLACE FUNCTION create_vacancy(
    p_employer_id INT,
    p_title VARCHAR(250),
    p_description TEXT,
    p_open_positions INTEGER,
    p_work_experience_years NUMERIC,
    p_city_id INT,
    p_workday_type_id INT,
    p_vacancy_category_id INT,
    p_contract_type_id INT,
    p_vacancy_type_id INT,
    p_minimum_salary NUMERIC,
    p_maximum_salary NUMERIC
) RETURNS INT AS $$
DECLARE
    v_vacancy_id INT;
BEGIN
    IF NOT EXISTS (SELECT 1 FROM users_employers WHERE id_user = p_employer_id) THEN
        RAISE EXCEPTION 'El usuario no es un empleador';
    END IF;

    INSERT INTO vacancies (
        title,
        description,
        open_positions,
        publication_date,
        work_experience_years,
        vacancy_status,
        published_by,
        id_city
    ) VALUES (
        p_title::VARCHAR(250),
        p_description::TEXT,
        p_open_positions::INTEGER,
        CURRENT_TIMESTAMP,
        p_work_experience_years::NUMERIC,
        'Open',
        p_employer_id::INTEGER,
        p_city_id::INTEGER
    ) RETURNING id_vacancy INTO v_vacancy_id;

    INSERT INTO vacancies_properties (
        id_vacancy,
        id_workday_type,
        id_vacancy_category,
        id_contract_type,
        id_vacancy_type
    ) VALUES (
        v_vacancy_id::INTEGER,
        p_workday_type_id::INTEGER,
        p_vacancy_category_id::INTEGER,
        p_contract_type_id::INTEGER,
        p_vacancy_type_id::INTEGER
    );

    IF p_minimum_salary IS NOT NULL OR p_maximum_salary IS NOT NULL THEN
        INSERT INTO vacancies_salaries (
            id_vacancy,
            minimum_salary,
            maximum_salary
        ) VALUES (
            v_vacancy_id::INTEGER,
            p_minimum_salary::MONEY,
            p_maximum_salary::MONEY
        );
    END IF;

    RETURN v_vacancy_id;
END;
$$ LANGUAGE plpgsql;

SELECT create_vacancy(49, 'Desarrollador Backend', 'Buscamos un desarrollador backend con experiencia en Python.', 3, 3.0, 2, 1, 2, 1, 1, 25000, 35000);

/*
 * CREACIÓN DEL TRIGGER PARA PREVENIR POSTULACIONES A VACANTES CERRADAS
 * Este trigger asegura que no se pueda postular a vacantes que estén cerradas.
 * Verifica si el estado de la vacante es 'Closed' antes de insertar una nueva postulación.
 */

CREATE OR REPLACE FUNCTION prevent_closed_vacancy_application()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM vacancies v
        WHERE v.id_vacancy = NEW.id_vacancy
        AND v.vacancy_status = 'Closed'
    ) THEN
        RAISE EXCEPTION 'No se puede postular a una vacante cerrada';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

/*
 * CREACIÓN DEL TRIGGER EN LA TABLA "public".entry_applications
 * Este trigger previene que se inserten postulaciones a vacantes con estado 'Closed'.
 */

CREATE TRIGGER check_vacancy_status
    BEFORE INSERT ON entry_applications
    FOR EACH ROW
    EXECUTE FUNCTION prevent_closed_vacancy_application();

/*
 * CREACIÓN DE LA FUNCIÓN PARA ACTUALIZAR EL ESTADO DE UNA APLICACIÓN
 * Esta función permite a un empleador actualizar el estado de una aplicación, verificando que el empleador
 * sea el dueño de la vacante asociada a la aplicación. Si el empleador no tiene autorización, se lanza un error.
 */

CREATE OR REPLACE FUNCTION update_application_status(
    p_application_id INT,
    p_employer_id INT,
    p_new_status application_status
) RETURNS VOID AS $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM entry_applications ea
        JOIN vacancies v ON ea.id_vacancy = v.id_vacancy
        WHERE ea.id_entry_application = p_application_id
        AND v.published_by = p_employer_id
    ) THEN
        RAISE EXCEPTION 'El empleador no está autorizado para actualizar esta aplicación';
    END IF;

    UPDATE entry_applications
    SET application_status = p_new_status
    WHERE id_entry_application = p_application_id;
END;
$$ LANGUAGE plpgsql;

SELECT update_application_status(
    32, 49,'Accepted'
);

/*
 * CREACIÓN DE LA FUNCIÓN PARA ESTABLECER PREFERENCIAS DE CANDIDATO
 * Esta función permite a un candidato establecer sus preferencias en diferentes aspectos de una vacante.
 * Si el candidato ya tiene preferencias guardadas, estas son eliminadas antes de insertar las nuevas preferencias.
*/

CREATE OR REPLACE FUNCTION set_candidate_preferences(
    p_user_id INT,
    p_salary MONEY,
    p_vacancy_categories INT[],
    p_contract_types INT[],
    p_provinces INT[],
    p_vacancy_types INT[],
    p_workday_types INT[]
) RETURNS VOID AS $$
DECLARE
    v_preference_id INT;
BEGIN
    IF NOT EXISTS (SELECT 1 FROM users_candidates WHERE id_user = p_user_id) THEN
        RAISE EXCEPTION 'El usuario no es un candidato';
    END IF;

    DELETE FROM candidates_preferences WHERE id_user = p_user_id;

    INSERT INTO candidates_preferences (salary, id_user)
    VALUES (p_salary, p_user_id)
    RETURNING id_preference INTO v_preference_id;

    IF p_vacancy_categories IS NOT NULL THEN
        INSERT INTO candidates_preferences_categories (id_preference, id_vacancy_category)
        SELECT v_preference_id, unnest(p_vacancy_categories);
    END IF;

    IF p_contract_types IS NOT NULL THEN
        INSERT INTO candidates_preferences_contract_type (id_preference, id_contract_type)
        SELECT v_preference_id, unnest(p_contract_types);
    END IF;

    IF p_provinces IS NOT NULL THEN
        INSERT INTO candidates_preferences_provinces (id_preference, id_province)
        SELECT v_preference_id, unnest(p_provinces);
    END IF;

    IF p_vacancy_types IS NOT NULL THEN
        INSERT INTO candidates_preferences_types (id_preference, id_vacancy_type)
        SELECT v_preference_id, unnest(p_vacancy_types);
    END IF;

    IF p_workday_types IS NOT NULL THEN
        INSERT INTO candidates_preferences_workday_type (id_preference, id_workday_type)
        SELECT v_preference_id, unnest(p_workday_types);
    END IF;
END;
$$ LANGUAGE plpgsql;

SELECT set_candidate_preferences(
    48::INTEGER,
    35000::MONEY,
    ARRAY[1, 2]::INTEGER[],
    ARRAY[1]::INTEGER[],
    ARRAY[1, 2]::INTEGER[],
    ARRAY[1]::INTEGER[],
    ARRAY[1, 2]::INTEGER[]
);

/*********************************DEFINICIÓN DE VISTAS*********************************/


/*
 * CREACIÓN DE UNA VISTA PARA DESENCRIPTAR CONTRASEÑAS
 * Esta vista permite mostrar contraseñas desencriptadas para los administradores o en casos específicos.
 * Las contraseñas desencriptadas no deben almacenarse directamente en las tablas.
 */

CREATE VIEW "public".users_with_decrypted_passwords AS
SELECT
    id_user,
    "token",
    email,
    pgp_sym_decrypt(password::bytea, 'my_secret_key') AS password,
    registration_date,
    name,
    first_surname,
    second_surname,
    account_status,
    id_user_type
FROM "public".users;

-- Manejo de controles de acceso para nuestra vista segura
REVOKE ALL ON "public".users_with_decrypted_passwords FROM PUBLIC;
CREATE ROLE admin_role;
GRANT SELECT ON "public".users_with_decrypted_passwords TO admin_role;

SELECT * FROM users_with_decrypted_passwords;

/*
 * CREACIÓN DE LA VISTA PARA LISTAR CANDIDATOS POR CANTIDAD DE APLICACIONES
 * Esta vista proporciona un listado de los candidatos registrados en el sistema,
 * mostrando la cantidad total de aplicaciones realizadas por cada uno.
 *
 * 1. Combina las tablas "users", "users_candidates" y "entry_applications" para relacionar los candidatos con sus aplicaciones.
 * 2. Agrupa los resultados por el identificador único del candidato.
 * 3. Calcula el número total de aplicaciones para cada candidato.
 * 4. Ordena los resultados de mayor a menor según la cantidad total de aplicaciones.
 */
CREATE OR REPLACE VIEW candidates_by_applications AS
SELECT
    u.id_user,
    u.name || ' ' || u.first_surname || ' ' || u.second_surname AS full_name,
    COUNT(ea.id_entry_application) AS total_applications
FROM
    users u
INNER JOIN
    users_candidates uc ON u.id_user = uc.id_user
INNER JOIN
    entry_applications ea ON u.id_user = ea.id_user
GROUP BY
    u.id_user
ORDER BY
    total_applications DESC;

/*
 * CREACIÓN DE LA VISTA PARA LISTAR LOS CANDIDATOS MÁS ACTIVOS EN EL ÚLTIMO MES
 * Esta vista identifica a los candidatos que han realizado más aplicaciones durante el último mes.
 *
 * 1. Combina las tablas "users", "users_candidates" y "entry_applications".
 * 2. Filtra las aplicaciones realizadas en los últimos 30 días desde la fecha actual.
 * 3. Calcula la cantidad total de aplicaciones para cada candidato dentro de este período.
 * 4. Ordena los resultados en orden descendente según la cantidad total de aplicaciones recientes.
 */
CREATE OR REPLACE VIEW most_active_users_last_month AS
SELECT
    u.id_user,
    u.name || ' ' || u.first_surname || ' ' || u.second_surname AS full_name,
    COUNT(ea.id_entry_application) AS total_applications_last_month
FROM
    users u
INNER JOIN
    users_candidates uc ON u.id_user = uc.id_user
INNER JOIN
    entry_applications ea ON u.id_user = ea.id_user
WHERE
    ea.applied_date >= NOW() - INTERVAL '1 month'
GROUP BY
    u.id_user
ORDER BY
    total_applications_last_month DESC;

/*
 * CREACIÓN DE LA VISTA PARA LISTAR LAS EMPRESAS CON MÁS VACANTES PUBLICADAS POR AÑO
 * Esta vista proporciona un listado de las empresas que han publicado vacantes,
 * mostrando la cantidad total de vacantes abiertas por cada empresa y su ranking dentro de cada año.
 *
 * 1. Combina las tablas "vacancies" y "users_employers" para relacionar las vacantes con las empresas.
 * 2. Agrupa los resultados por nombre de la empresa y el año de publicación de la vacante.
 * 3. Calcula el número total de vacantes publicadas por cada empresa dentro de cada año.
 * 4. Utiliza la función de ventana ROW_NUMBER() para clasificar las empresas dentro de cada año,
 * ordenándolas por la cantidad de vacantes en orden descendente.
 * 5. Ordena los resultados de mayor a menor según la cantidad total de vacantes.
 */
CREATE OR REPLACE VIEW most_vacancies_with_ranking AS
SELECT
    e.company_name,
    EXTRACT(YEAR FROM v.publication_date) AS year,
    COUNT(v.id_vacancy) AS total_vacancies,
    ROW_NUMBER() OVER (PARTITION BY EXTRACT(YEAR FROM v.publication_date) ORDER BY COUNT(v.id_vacancy) DESC) AS rank
FROM
    "public".vacancies v
JOIN
    "public".users_employers e ON v.published_by = e.id_user
GROUP BY
    e.company_name,
    EXTRACT(YEAR FROM v.publication_date)
ORDER BY
    year DESC, total_vacancies DESC;

SELECT * FROM most_vacancies_with_ranking;

/*
 * CREACIÓN DE LA VISTA MATERIALIZADA PARA LAS 10 EMPRESAS CON MÁS VACANTES PUBLICADAS EN 2024
 * Esta vista materializada muestra las 10 empresas con la mayor cantidad de vacantes publicadas en el año 2024.
 * La vista se actualiza periódicamente para reflejar los datos más recientes.
 *
 * 1. Combina las tablas "vacancies" y "users_employers" para relacionar las vacantes con las empresas.
 * 2. Filtra las vacantes publicadas en el año 2024, usando EXTRACT para obtener el año de la fecha de publicación.
 * 3. Agrupa los resultados por nombre de la empresa y calcula la cantidad total de vacantes publicadas en 2024.
 * 4. Ordena los resultados por la cantidad de vacantes en orden descendente.
 * 5. Devuelve las 10 primeras empresas con más vacantes.
 */
CREATE MATERIALIZED VIEW top_companies_2024 AS
SELECT
    e.company_name,
    COUNT(v.id_vacancy) AS total_vacancies
FROM
    "public".vacancies v
JOIN
    "public".users_employers e ON v.published_by = e.id_user
WHERE
    EXTRACT(YEAR FROM v.publication_date) = 2024
GROUP BY
    e.company_name
ORDER BY
    total_vacancies DESC
LIMIT 10;

REFRESH MATERIALIZED VIEW top_companies_2024;

SELECT * FROM top_companies_2024;

/*
 * CREACIÓN DE LA VISTA PARA EL TOP 3 CIUDADES CON MÁS VACANTES ABIERTAS POR PAÍS
 * Esta vista muestra las 3 ciudades con más vacantes abiertas para cada país.
 * La vista clasifica las ciudades por la cantidad de vacantes abiertas dentro de cada país.
 * Utiliza funciones de ventana para asignar un ranking dentro de cada país y luego filtra las ciudades
 * con los 3 primeros puestos en cada país.
 *
 * 1. Se agrupa por ciudad y país para contar el número total de vacantes por ciudad.
 * 2. Se utiliza la función de ventana `RANK()` para asignar un ranking a las ciudades dentro de cada país.
 * 3. Se filtra para obtener solo las ciudades con el ranking 1, 2 o 3.
 * 4. Se realiza una combinación con las tablas "cities", "provinces" y "countries" para obtener los detalles de cada ciudad y país.
 */
CREATE OR REPLACE VIEW top_3_cities_by_country AS
WITH city_vacancies AS (
    SELECT
        c.id_city,
        c.city_name,
        p.id_province,
        co.id_country,
        COUNT(v.id_vacancy) AS total_vacancies
    FROM
        "public".vacancies v
    JOIN
        "public".cities c ON v.id_city = c.id_city
    JOIN
        "public".provinces p ON c.id_province = p.id_province
    JOIN
        "public".countries co ON p.id_country = co.id_country
    WHERE
        v.vacancy_status = 'Open'
    GROUP BY
        c.id_city, c.city_name, p.id_province, co.id_country
),
ranked_cities AS (
    SELECT
        cv.id_city,
        cv.city_name,
        cv.total_vacancies,
        cv.id_country,
        RANK() OVER (PARTITION BY cv.id_country ORDER BY cv.total_vacancies DESC) AS city_rank
    FROM
        city_vacancies cv
)
SELECT
    rc.city_name,
    rc.total_vacancies,
    co.country_name
FROM
    ranked_cities rc
JOIN
    "public".countries co ON rc.id_country = co.id_country
WHERE
    rc.city_rank <= 3
ORDER BY
    rc.id_country, rc.city_rank;

/*
 * CREACIÓN DE LA VISTA EDAD Y EXPERIENCIA LABORAL DE LOS CANDIDATOS
 * Vista que muestra la edad de los candidatos y su experiencia laboral total en años.
 * Esta vista calcula la edad de cada candidato basado en su fecha de nacimiento y suma su experiencia laboral total
 * a partir de los trabajos en los que ha estado involucrado.
 *
 * 1. Se calcula la edad de cada candidato restando su fecha de nacimiento de la fecha actual.
 * 2. Se calcula la experiencia laboral total sumando los años de trabajo para cada puesto que haya tenido el candidato.
 * 3. Si un candidato no tiene experiencia laboral, se asigna un valor de 0.
 */
CREATE OR REPLACE VIEW candidate_age_experience AS
SELECT
    u.id_user,
    u.name || ' ' || u.first_surname AS full_name,
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, uc.birth_date)) AS age,
    COALESCE(
        SUM(
            EXTRACT(YEAR FROM AGE(
                COALESCE(cj.end_date, CURRENT_DATE),
                cj.start_date
            ))
        ),
        0
    ) AS total_years_experience
FROM
    users u
    JOIN users_candidates uc ON u.id_user = uc.id_user
    LEFT JOIN candidates_jobs cj ON u.id_user = cj.id_user
GROUP BY
    u.id_user, u.name, u.first_surname, uc.birth_date;

/*
 * CREACIÓN DE LA VISTA ESTADÍSTICAS DE SALARIOS POR CATEGORÍA DE VACANTE
 * Vista que muestra estadísticas de salarios, como salario mínimo, máximo, promedio y cantidad de vacantes,
 * agrupadas por categoría de vacante.
 * Esta vista proporciona un resumen de los salarios asociados a cada categoría de vacante,
 * incluyendo el salario más bajo, más alto y los promedios de salarios mínimos y máximos.
 *
 * 1. Se agrupan los datos por categoría de vacante.
 * 2. Se calculan las siguientes estadísticas para cada categoría:
 * - Total de vacantes
 * - Promedio de salario mínimo
 * - Promedio de salario máximo
 * - Salario más alto
 * - Salario más bajo
 */
CREATE OR REPLACE VIEW salary_statistics_by_category AS
SELECT
    vc.job_name AS category,
    COUNT(v.id_vacancy) AS total_vacancies,
    AVG(vs.minimum_salary::numeric) AS avg_minimum_salary,
    AVG(vs.maximum_salary::numeric) AS avg_maximum_salary,
    MAX(vs.maximum_salary::numeric) AS highest_salary,
    MIN(vs.minimum_salary::numeric) AS lowest_salary
FROM
    vacancies v
    JOIN vacancies_properties vp ON v.id_vacancy = vp.id_vacancy
    JOIN vacancies_categories vc ON vp.id_vacancy_category = vc.id_vacancy_category
    JOIN vacancies_salaries vs ON v.id_vacancy = vs.id_vacancy
GROUP BY
    vc.job_name;

/*
 * CREACIÓN DE LA VISTA APLICACIONES POR PROVINCIA Y TIPO DE CONTRATO
 * Vista que muestra el número total de aplicaciones por provincia y tipo de contrato,
 * junto con el número de candidatos únicos que aplicaron a esas vacantes.
 * Se filtran las combinaciones de provincia y tipo de contrato que tienen más de 5 aplicaciones.
 *
 * 1. Se agrupan los datos por provincia y tipo de contrato.
 * 2. Se cuenta el número total de aplicaciones y el número de candidatos únicos en cada combinación.
 * 3. Se filtra para mostrar solo las combinaciones con más de 5 aplicaciones.
 * 4. La vista incluye el nombre de la provincia, el tipo de contrato, el total de aplicaciones y los candidatos únicos.
 */
CREATE OR REPLACE VIEW applications_by_region_contract AS
SELECT
    p.province_name,
    vct.contract_type,
    COUNT(ea.id_entry_application) AS total_applications,
    COUNT(DISTINCT ea.id_user) AS unique_candidates
FROM
    entry_applications ea
    JOIN vacancies v ON ea.id_vacancy = v.id_vacancy
    JOIN cities c ON v.id_city = c.id_city
    JOIN provinces p ON c.id_province = p.id_province
    JOIN vacancies_properties vp ON v.id_vacancy = vp.id_vacancy
    JOIN vacancies_contract_type vct ON vp.id_contract_type = vct.id_contract_type
GROUP BY
    p.province_name, vct.contract_type
HAVING
    COUNT(ea.id_entry_application) > 5;

/*
 * CREACIÓN DE LA VISTA VACANTES CON SALARIOS SUPERIORES AL PROMEDIO DE SU CATEGORÍA
 * Vista que muestra las vacantes cuyo salario máximo es superior al salario promedio de su categoría.
 * Utiliza subconsultas para calcular el salario promedio por categoría y compara cada vacante con ese promedio.
 *
 * 1. Se obtienen las vacantes, sus salarios y las categorías correspondientes.
 * 2. Se calcula el salario promedio de la categoría de cada vacante mediante una subconsulta.
 * 3. Se filtra para mostrar solo las vacantes cuyo salario máximo es superior al promedio de su categoría.
 * 4. La vista incluye el título de la vacante, el salario mínimo y máximo, la categoría y el salario promedio de la categoría.
 */
CREATE OR REPLACE VIEW above_average_salary_vacancies AS
SELECT
    v.id_vacancy,
    v.title,
    vc.job_name AS category,
    vs.minimum_salary,
    vs.maximum_salary,
    (
        SELECT AVG(vs2.maximum_salary::numeric)
        FROM vacancies_salaries vs2
        JOIN vacancies v2 ON vs2.id_vacancy = v2.id_vacancy
        JOIN vacancies_properties vp2 ON v2.id_vacancy = vp2.id_vacancy
        WHERE vp2.id_vacancy_category = vp.id_vacancy_category
    ) AS category_avg_salary
FROM
    vacancies v
    JOIN vacancies_properties vp ON v.id_vacancy = vp.id_vacancy
    JOIN vacancies_categories vc ON vp.id_vacancy_category = vc.id_vacancy_category
    JOIN vacancies_salaries vs ON v.id_vacancy = vs.id_vacancy
WHERE
    vs.maximum_salary::numeric > (
        SELECT AVG(vs2.maximum_salary::numeric)
        FROM vacancies_salaries vs2
        JOIN vacancies v2 ON vs2.id_vacancy = v2.id_vacancy
        JOIN vacancies_properties vp2 ON v2.id_vacancy = vp2.id_vacancy
        WHERE vp2.id_vacancy_category = vp.id_vacancy_category
    );

/*
 * CREACIÓN DE LA VISTA EMPAREJAMIENTO DE CANDIDATOS Y VACANTES DISPONIBLES
 * Vista que muestra el emparejamiento entre las preferencias de los candidatos y las vacantes disponibles.
 * Compara las preferencias salariales y de ubicación de los candidatos con las vacantes activas para determinar la coincidencia.
 *
 * 1. Se obtiene el nombre del candidato y las vacantes disponibles, junto con las preferencias salariales y de ubicación del candidato.
 * 2. Se realiza una comparación para verificar si el salario deseado del candidato coincide con el salario mínimo de la vacante.
 * 3. Se verifica si la ubicación preferida por el candidato coincide con la ubicación de la vacante.
 * 4. Se asignan indicadores (`1` o `0`) para señalar si el salario y la ubicación coinciden.
 * 5. La vista muestra el emparejamiento de las vacantes con las preferencias de los candidatos.
 */
CREATE OR REPLACE VIEW candidate_vacancy_matching AS
SELECT
    u.id_user,
    u.name || ' ' || u.first_surname AS candidate_name,
    v.id_vacancy,
    v.title AS vacancy_title,
    cp.salary AS desired_salary,
    vs.minimum_salary,
    vs.maximum_salary,
    CASE
        WHEN vs.minimum_salary::numeric >= cp.salary::numeric THEN 1
        ELSE 0
    END AS salary_match,
    CASE
        WHEN cpp.id_province = c.id_province THEN 1
        ELSE 0
    END AS location_match
FROM
    users u
    JOIN users_candidates uc ON u.id_user = uc.id_user
    JOIN candidates_preferences cp ON u.id_user = cp.id_user
    JOIN candidates_preferences_provinces cpp ON cp.id_preference = cpp.id_preference
    JOIN vacancies v ON v.vacancy_status = 'Open'
    JOIN vacancies_salaries vs ON v.id_vacancy = vs.id_vacancy
    JOIN cities c ON v.id_city = c.id_city;

/*
 * CREACIÓN DE LA VISTA ANÁLISIS DE LA BRECHA DE HABILIDADES
 * Vista que compara las habilidades requeridas en vacantes abiertas con las habilidades disponibles en los candidatos.
 * Utiliza operaciones de conjunto para mostrar las habilidades demandadas por las vacantes y las habilidades que los candidatos poseen.
 *
 * 1. Se obtienen las habilidades requeridas en las vacantes activas, contando cuántas veces cada habilidad es solicitada.
 * 2. Se obtienen las habilidades disponibles en los candidatos, contando cuántas veces cada habilidad es poseída.
 * 3. Se utiliza `UNION ALL` para combinar los resultados de las habilidades requeridas y disponibles.
 * 4. La vista muestra el tipo de habilidad (requerida o disponible) junto con el nombre de la habilidad y la cantidad correspondiente.
 */
CREATE OR REPLACE VIEW skills_gap_analysis AS
(
    SELECT
        js.skill_name,
        COUNT(*) AS demand_count,
        'Required' AS skill_type
    FROM
        vacancies v
        JOIN candidates_jobs cj ON v.work_experience_years <= EXTRACT(YEAR FROM AGE(COALESCE(cj.end_date, CURRENT_DATE), cj.start_date))
        JOIN jobs_skills js ON cj.id_job = js.id_job
    WHERE
        v.vacancy_status = 'Open'
    GROUP BY
        js.skill_name
)
UNION ALL
(
    SELECT
        js.skill_name,
        COUNT(*) AS supply_count,
        'Available' AS skill_type
    FROM
        jobs_skills js
        JOIN candidates_jobs cj ON js.id_job = cj.id_job
    GROUP BY
        js.skill_name
);

/*
 * CREACIÓN DE LA VISTA RANKING DE CANDIDATOS POR APLICACIONES EXITOSAS Y EXPERIENCIA
 * Vista que muestra el ranking de candidatos basado en sus aplicaciones exitosas y experiencia laboral,
 * tanto a nivel global como por categoría de vacante.
 * Utiliza funciones de ventana para calcular los rankings generales y específicos por categoría de vacantes.
 *
 * 1. Se cuenta el total de trabajos y la experiencia laboral de cada candidato.
 * 2. Se cuenta la cantidad de aplicaciones exitosas de cada candidato.
 * 3. Se utiliza la función de ventana `RANK()` para asignar un ranking general basado en el número de aplicaciones exitosas
 * y la experiencia laboral, ordenando primero por aplicaciones exitosas y luego por experiencia.
 * 4. Se utiliza la función de ventana `DENSE_RANK()` para asignar un ranking dentro de cada categoría de vacantes
 * según el número de aplicaciones exitosas.
 * 5. Se realiza una combinación con las tablas de usuarios, trabajos de candidatos, aplicaciones de entrada,
 * vacantes, propiedades de vacantes y categorías de vacantes.
 */
CREATE OR REPLACE VIEW candidate_ranking AS
SELECT
    u.id_user,
    u.name || ' ' || u.first_surname AS candidate_name,
    COUNT(DISTINCT cj.id_job) AS total_jobs,
    SUM(EXTRACT(YEAR FROM AGE(COALESCE(cj.end_date, CURRENT_DATE), cj.start_date))) AS total_experience,
    COUNT(DISTINCT CASE WHEN ea.application_status = 'Accepted' THEN ea.id_entry_application END) AS successful_applications,
    RANK() OVER (
        ORDER BY
            COUNT(DISTINCT CASE WHEN ea.application_status = 'Accepted' THEN ea.id_entry_application END) DESC,
            SUM(EXTRACT(YEAR FROM AGE(COALESCE(cj.end_date, CURRENT_DATE), cj.start_date))) DESC
    ) AS overall_rank,
    DENSE_RANK() OVER (
        PARTITION BY vc.id_vacancy_category
        ORDER BY COUNT(DISTINCT CASE WHEN ea.application_status = 'Accepted' THEN ea.id_entry_application END) DESC
    ) AS category_rank
FROM
    users u
    JOIN users_candidates uc ON u.id_user = uc.id_user
    LEFT JOIN candidates_jobs cj ON u.id_user = cj.id_user
    LEFT JOIN entry_applications ea ON u.id_user = ea.id_user
    LEFT JOIN vacancies v ON ea.id_vacancy = v.id_vacancy
    LEFT JOIN vacancies_properties vp ON v.id_vacancy = vp.id_vacancy
    LEFT JOIN vacancies_categories vc ON vp.id_vacancy_category = vc.id_vacancy_category
GROUP BY
    u.id_user, u.name, u.first_surname, vc.id_vacancy_category;