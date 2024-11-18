/*
 * INSERCIÓN DE TIPOS DE USUARIOS
 */
-- ************************************** "public".users_types
INSERT INTO "public".users_types (user_type) VALUES 
('Admin'), 
('Candidate'), 
('Employer');

/*
 * INSERCIÓN DE USUARIOS CANDIDATOS
 */
CALL register_candidate('juan.perez1@example.com', 'XxXp@ssw0rd1!', 'Juan', 'Perez', 'Gomez', '555-0101', '1990-05-10');
CALL register_candidate('maria.gonzalez2@example.com', 'M@r1@G0nz@l3z2!', 'Maria', 'Gonzalez', 'Lopez', '555-0102', '1985-08-15');
CALL register_candidate('luis.martinez3@example.com', 'Lui$M@rt1n3z3#', 'Luis', 'Martinez', 'Hernandez', '555-0103', '1992-02-20');
CALL register_candidate('ana.rodriguez4@example.com', 'A@naR0dR!gu3z4$', 'Ana', 'Rodriguez', 'Fernandez', '555-0104', '1988-11-30');
CALL register_candidate('jose.luna5@example.com', 'J0s3.Lun@5!23', 'Jose', 'Luna', 'Diaz', '555-0105', '1993-03-25');
CALL register_candidate('carla.sanchez6@example.com', 'C@rla$@nch3z6#', 'Carla', 'Sanchez', 'Moreno', '555-0106', '1989-07-18');
CALL register_candidate('pedro.mora7@example.com', 'P3dr0_Mor@7#', 'Pedro', 'Mora', 'Vargas', '555-0107', '1991-06-22');
CALL register_candidate('lucia.fernandez8@example.com', 'Luc1@F3rn3nd3z8#', 'Lucia', 'Fernandez', 'Castro', '555-0108', '1995-01-15');
CALL register_candidate('andres.ramirez9@example.com', '4ndr3$R@m1r3z9!', 'Andres', 'Ramirez', 'Jimenez', '555-0109', '1987-04-05');
CALL register_candidate('elena.jimenez10@example.com', 'El3n@_J1m3n3z10$', 'Elena', 'Jimenez', 'Morales', '555-0110', '1990-12-12');
CALL register_candidate('sergio.martinez11@example.com', 'S3rg!0M@rt1n3z11#', 'Sergio', 'Martinez', 'Lopez', '555-0111', '1986-09-19');
CALL register_candidate('marta.garcia12@example.com', 'M@rt@_G@rc!@12', 'Marta', 'Garcia', 'Torres', '555-0112', '1994-08-23');
CALL register_candidate('juan.perez13@example.com', 'J_U4nP@r3z#13', 'Juan', 'Perez', 'Sanchez', '555-0113', '1992-11-29');
CALL register_candidate('isabel.lopez14@example.com', 'I$@b3lL0p3z14$', 'Isabel', 'Lopez', 'Gomez', '555-0114', '1993-05-17');
CALL register_candidate('arturo.romero15@example.com', 'Artur0_R0m3r0#15', 'Arturo', 'Romero', 'Hernandez', '555-0115', '1988-03-30');
CALL register_candidate('nuria.morales16@example.com', 'Nuri@M0r@l3s16#', 'Nuria', 'Morales', 'Fernandez', '555-0116', '1991-07-22');
CALL register_candidate('ruben.silva17@example.com', 'Rub3n_S!lv@17$', 'Ruben', 'Silva', 'Castro', '555-0117', '1989-10-13');
CALL register_candidate('raquel.diaz18@example.com', 'R@qu3l.D!@z18$', 'Raquel', 'Diaz', 'Lopez', '555-0118', '1992-01-04');
CALL register_candidate('javier.castro19@example.com', 'J@vi3rC@str019!', 'Javier', 'Castro', 'Moreno', '555-0119', '1986-06-08');
CALL register_candidate('marta.moreno20@example.com', 'M@rT@_M0r3n0#20', 'Marta', 'Moreno', 'Sanchez', '555-0120', '1990-02-11');
CALL register_candidate('carlos.perez21@example.com', 'C@rl0sP@r3z21$', 'Carlos', 'Perez', 'Vargas', '555-0121', '1987-12-18');
CALL register_candidate('sara.rodriguez22@example.com', 'S@r@Rodr1gu3z22!', 'Sara', 'Rodriguez', 'Jimenez', '555-0122', '1994-11-23');
CALL register_candidate('fernando.hernandez23@example.com', 'F3rn@nd0_H3rn@nd3z23$', 'Fernando', 'Hernandez', 'Luna', '555-0123', '1985-09-16');
CALL register_candidate('maria.jimenez24@example.com', 'M@r!@J1m3n3z24$', 'Maria', 'Jimenez', 'Castro', '555-0124', '1991-04-30');
CALL register_candidate('manuel.garcia25@example.com', 'M@nu3l_G@rc!@25#', 'Manuel', 'Garcia', 'Morales', '555-0125', '1988-07-01');
CALL register_candidate('claudia.perez26@example.com', 'Cl@ud!@P3r3z26$', 'Claudia', 'Perez', 'Hernandez', '555-0126', '1993-02-09');
CALL register_candidate('alberto.martinez27@example.com', '@lB3rt0_M@rt!n3z27#', 'Alberto', 'Martinez', 'Torres', '555-0127', '1990-10-12');
CALL register_candidate('liliana.romero28@example.com', 'L!l14n@Rom3r0_28$', 'Liliana', 'Romero', 'Diaz', '555-0128', '1992-05-21');
CALL register_candidate('victor.mora29@example.com', 'V!ct0r_Mor@_29#', 'Victor', 'Mora', 'Silva', '555-0129', '1987-03-04');
CALL register_candidate('lidia.sanchez30@example.com', 'L!d!@_S@nch3z30$', 'Lidia', 'Sanchez', 'Vargas', '555-0130', '1994-09-15');
CALL register_candidate('carmen.torres31@example.com', 'C@rm3n_T0rr3s31!', 'Carmen', 'Torres', 'Garcia', '555-0131', '1992-10-01');
CALL register_candidate('natalia.perez32@example.com', 'N@t@l14P3r3z32$', 'Natalia', 'Perez', 'Hernandez', '555-0132', '1986-04-07');
CALL register_candidate('diego.mora33@example.com', 'D!3g0_M0r@_33!', 'Diego', 'Mora', 'Luna', '555-0133', '1989-01-14');
CALL register_candidate('susan.rodriguez34@example.com', 'S!s@_R0dr!gu3z34$', 'Susan', 'Rodriguez', 'Castro', '555-0134', '1994-06-28');
CALL register_candidate('hugo.diaz35@example.com', 'Hug0.D!@z35$', 'Hugo', 'Diaz', 'Vargas', '555-0135', '1993-07-04');
CALL register_candidate('laura.martinez36@example.com', 'L@ur@_M@rt1n3z36!', 'Laura', 'Martinez', 'Gomez', '555-0136', '1987-12-01');
CALL register_candidate('felipe.romero37@example.com', 'F3l!p3_R0m3r0_37$', 'Felipe', 'Romero', 'Jimenez', '555-0137', '1992-02-18');
CALL register_candidate('sofia.gonzalez38@example.com', 'S0f!@G0nz@l3z38$', 'Sofia', 'Gonzalez', 'Torres', '555-0138', '1994-03-25');
CALL register_candidate('oscar.castro39@example.com', '0sc@rC@str0_39#', 'Oscar', 'Castro', 'Moreno', '555-0139', '1991-05-17');
CALL register_candidate('carolina.sanchez40@example.com', 'C@r0l!n@_S@ncH3z40$', 'Carolina', 'Sanchez', 'Perez', '555-0140', '1992-04-11');
CALL register_candidate('esteban.morales41@example.com', 'Est3b@n_Mor@l3s41#', 'Esteban', 'Morales', 'Diaz', '555-0141', '1988-09-24');
CALL register_candidate('ines.garcia42@example.com', '1n3s_G@rc!@42$', 'Ines', 'Garcia', 'Lopez', '555-0142', '1993-06-19');
CALL register_candidate('roberto.hernandez43@example.com', 'R0b3rt0_H3rn@nd3z43!', 'Roberto', 'Hernandez', 'Morales', '555-0143', '1990-12-30');
CALL register_candidate('patricia.diaz44@example.com', 'P@tr!c!@D!@z44$', 'Patricia', 'Diaz', 'Vargas', '555-0144', '1987-11-22');
CALL register_candidate('jorge.morales45@example.com', 'J0rg3_M0r@l3s45#', 'Jorge', 'Morales', 'Hernandez', '555-0145', '1994-01-03');
CALL register_candidate('elena.gonzalez46@example.com', 'El3n@_G0nz@l3z46$', 'Elena', 'Gonzalez', 'Rodriguez', '555-0146', '1992-07-10');
CALL register_candidate('manuel.martinez47@example.com', 'M@nu3l_M@rt1n3z47$', 'Manuel', 'Martinez', 'Vargas', '555-0147', '1991-09-05');
CALL register_candidate('rosa.sanchez48@example.com', 'R0s@_S@ncH3z48!', 'Rosa', 'Sanchez', 'Lopez', '555-0148', '1989-11-14');

/*
 * INSERCIÓN DE TIPOS DE EMPRESAS
 */
INSERT INTO company_type (company_type) VALUES
    ('Corporación Multinacional'),
    ('Pequeña y Mediana Empresa (PYME)'),
    ('Startup'),
    ('Empresa Familiar'),
    ('Organización Sin Ánimo de Lucro'),
    ('Empresa Pública'),
    ('Cooperativa'),
    ('Sociedad Anónima'),
    ('Sociedad Limitada'),
    ('Empresa Unipersonal'),
    ('Consultora'),
    ('Empresa de Servicios Profesionales'),
    ('Franquicia'),
    ('Joint Venture'),
    ('Empresa Manufacturera'),
    ('Empresa de Tecnología'),
    ('Institución Educativa'),
    ('Organización Gubernamental'),
    ('Empresa de Retail'),
    ('Empresa de Construcción'),
    ('Empresa de Servicios Financieros'),
    ('Empresa de Telecomunicaciones'),
    ('Empresa de Energía'),
    ('Empresa de Logística y Transporte'),
    ('Empresa de Servicios Sanitarios');

/*
 * INSERCIÓN DE USUARIOS EMPLEADORES
 */
CALL register_employer('ginozza.garcia@example.com', 'G1n0zZ@_G@rc!@', 'Ginozza', 'Garcia', 'Moreno', 'Corporación Multinacional', '555-0001', 'A12345678', 'Desarrollo global de productos tecnológicos y soluciones innovadoras', 2);
CALL register_employer('maria.sanchez02@example.com', 'M@r!@_S@nch3z02$', 'Maria', 'Sanchez', 'Fernandez', 'Pequeña y Mediana Empresa (PYME)', '555-0002', 'B23456789', 'Servicios de consultoría en marketing y ventas', 11);
CALL register_employer('juan.perez03@example.com', 'J@unP3r3z03$', 'Juan', 'Perez', 'Gomez', 'Startup', '555-0003', 'C34567890', 'Aplicaciones móviles para la mejora de la productividad empresarial', 16);
CALL register_employer('laura.gomez04@example.com', 'L@ur@_G0m3z04$', 'Laura', 'Gomez', 'Rodriguez', 'Empresa Familiar', '555-0004', 'D45678901', 'Comercio de productos artesanales y de fabricación propia', 15);
CALL register_employer('felipe.martinez05@example.com', 'F3l!p3_M@rt!n3z05$', 'Felipe', 'Martinez', 'Ruiz', 'Organización Sin Ánimo de Lucro', '555-0005', 'E56789012', 'Proyectos educativos y culturales en comunidades marginadas', 5);
CALL register_employer('antonio.garcia06@example.com', 'A#nt0n!0_G@rc!@06$', 'Antonio', 'Garcia', 'Perez', 'Empresa Pública', '555-0006', 'F67890123', 'Gestión de recursos y servicios públicos a nivel nacional', 6);
CALL register_employer('carla.silva07@example.com', 'C@rl@_S!lv@07$', 'Carla', 'Silva', 'Torres', 'Cooperativa', '555-0007', 'G78901234', 'Cooperativa de producción agrícola sostenible', 7);
CALL register_employer('juanita.martinez08@example.com', 'Ju@n!t@_M@rt!n3z08$', 'Juanita', 'Martinez', 'Luna', 'Sociedad Anónima', '555-0008', 'H89012345', 'Servicios de consultoría financiera y auditoría', 11);
CALL register_employer('victor.gomez09@example.com', 'V!ct0r_G0m3z09$', 'Victor', 'Gomez', 'Rodriguez', 'Sociedad Limitada', '555-0009', 'I90123456', 'Asesoría en recursos humanos y capacitación empresarial', 12);
CALL register_employer('sara.castro10@example.com', 'S@r@_C@str0_10$', 'Sara', 'Castro', 'Hernandez', 'Consultora', '555-0010', 'J01234567', 'Consultoría en innovación empresarial y cambio organizacional', 17);
CALL register_employer('luis.perez11@example.com', 'Lu!s_P3r3z11$', 'Luis', 'Perez', 'Martinez', 'Empresa de Servicios Profesionales', '555-0011', 'K12345678', 'Servicios legales y de asesoría jurídica a empresas', 11);
CALL register_employer('ana.morales12@example.com', '@n@_M0r@l3s12$', 'Ana', 'Morales', 'Diaz', 'Franquicia', '555-0012', 'L23456789', 'Franquicia de restaurantes de comida rápida saludable', 4);
CALL register_employer('roberto.lopez13@example.com', 'R0b3rt0_L0p3z13$', 'Roberto', 'Lopez', 'Fernandez', 'Joint Venture', '555-0013', 'M34567890', 'Alianza estratégica en la industria automotriz y electrónica', 13);
CALL register_employer('mario.soto14@example.com', 'M@r!0_S0t0_14$', 'Mario', 'Soto', 'Garcia', 'Empresa Manufacturera', '555-0014', 'N45678901', 'Fabricación de componentes electrónicos y maquinaria', 1);
CALL register_employer('paola.rodriguez15@example.com', 'P@0l@_R0dr!gu3z15$', 'Paola', 'Rodriguez', 'Mendez', 'Empresa de Tecnología', '555-0015', 'O56789012', 'Desarrollo de software y soluciones tecnológicas innovadoras', 2);
CALL register_employer('juan.castro16@example.com', 'Ju@n_C@str0_16$', 'Juan', 'Castro', 'Torres', 'Institución Educativa', '555-0016', 'P67890123', 'Educación en programación y desarrollo de software', 16);
CALL register_employer('patricia.gomez17@example.com', 'P@tr!c!@_G0m3z17$', 'Patricia', 'Gomez', 'Sanchez', 'Organización Gubernamental', '555-0017', 'Q78901234', 'Gestión de políticas públicas y proyectos gubernamentales', 6);
CALL register_employer('mario.ramirez18@example.com', 'M@r10_R@m!r3z18$', 'Mario', 'Ramirez', 'Lopez', 'Empresa de Retail', '555-0018', 'R89012345', 'Venta de productos electrónicos al por menor', 19);
CALL register_employer('elena.mendez19@example.com', 'El3n@_M3nd3z19$', 'Elena', 'Mendez', 'Salazar', 'Empresa de Construcción', '555-0019', 'S90123456', 'Construcción y rehabilitación de viviendas y oficinas', 20);
CALL register_employer('pedro.silva20@example.com', 'P3dr0_S!lv@20$', 'Pedro', 'Silva', 'Perez', 'Empresa de Servicios Financieros', '555-0020', 'T01234567', 'Asesoría financiera y de inversión para pymes', 21);

/*
 * INSERCIÓN DE USUARIOS ADMINISTRADORES
 */
INSERT INTO "public".users (email, password, name, first_surname, second_surname, account_status, id_user_type, registration_date, token)
VALUES
(
    'admin1@example.com',
    'adminpassword1',
    'Admin',
    'One',
    'User',
    'Active',
    (SELECT id_user_type FROM "public".users_types WHERE user_type = 'Employer'),
    CURRENT_TIMESTAMP,
    md5(random()::text)
);

INSERT INTO "public".users (email, password, name, first_surname, second_surname, account_status, id_user_type, registration_date, token)
VALUES
(
    'admin2@example.com',
    'adminpassword2',
    'Admin',
    'Two',
    'User',
    'Active',
    (SELECT id_user_type FROM "public".users_types WHERE user_type = 'Employer'),
    CURRENT_TIMESTAMP,
    md5(random()::text)
);

INSERT INTO "public".users_admin (id_user, admin_role)
VALUES (
    (SELECT id_user FROM "public".users WHERE email = 'admin1@example.com'),
    'SUPER_ADMIN'
);


INSERT INTO "public".users_admin (id_user, admin_role)
VALUES (
    (SELECT id_user FROM "public".users WHERE email = 'admin2@example.com'),
    'MODERATOR'
);

/*
 * INSERCIÓN DE ENTIDADES NETAMENTE IDENTIFICADAS POR USUARIO CANDIDATO
 */
INSERT INTO candidates_languages (language, level, comments, id_user) VALUES
    ('English', 'C1', 'Competente en comunicación empresarial.', 1),
    ('Spanish', 'B2', 'Fluidez conversacional.', 2),
    ('French', 'A1', 'Nivel principiante, en proceso de aprendizaje.', 3),
    ('German', 'B1', 'Nivel intermedio, buen conocimiento de gramática.', 4),
    ('Italian', 'C2', 'Hablante nativo.', 5),
    ('Mandarin', 'A2', 'Habilidades básicas de conversación.', 6),
    ('Japanese', 'B2', 'Competente en lectura y escritura.', 7),
    ('Portuguese', 'C1', 'Excelentes habilidades de habla y escritura.', 8),
    ('Russian', 'B1', 'Dominio intermedio.', 9),
    ('Arabic', 'A2', 'Frases básicas y vocabulario.', 10),
    ('English', 'C2', 'Hablante y escritor fluido.', 11),
    ('Spanish', 'B1', 'Capaz de mantener conversaciones cotidianas.', 12),
    ('French', 'C1', 'Competente en comunicación oral y escrita.', 13),
    ('German', 'A2', 'Conocimiento básico.', 14),
    ('Italian', 'B2', 'Fluidez intermedia.', 15),
    ('Mandarin', 'B1', 'Buenas habilidades de escucha y habla.', 16),
    ('Japanese', 'A1', 'Aprendiendo gramática básica.', 17),
    ('Portuguese', 'C2', 'Dominio nativo.', 18),
    ('Russian', 'B2', 'Fluidez en conversación y escritura.', 19),
    ('Arabic', 'C1', 'Comprensión y habla avanzada.', 20),
    ('English', 'B2', 'Buen uso profesional.', 21),
    ('Spanish', 'A1', 'Acabo de comenzar a aprender.', 22),
    ('French', 'B1', 'Habilidades intermedias de comunicación.', 23),
    ('German', 'C2', 'Hablante nativo.', 24),
    ('Italian', 'A2', 'Habilidades básicas de conversación.', 25),
    ('Mandarin', 'C1', 'Fluido en negocios.', 26),
    ('Japanese', 'B1', 'Gramática y vocabulario intermedio.', 27),
    ('Portuguese', 'B2', 'Fluidez conversacional.', 28),
    ('Russian', 'C1', 'Dominio avanzado en habla y escucha.', 29),
    ('Arabic', 'A1', 'Aprendiendo el alfabeto y frases básicas.', 30),
    ('English', 'A2', 'Gramática y vocabulario básico.', 31),
    ('Spanish', 'C2', 'Dominio nativo.', 32),
    ('French', 'A1', 'Nivel principiante.', 33),
    ('German', 'B1', 'Habilidades intermedias de conversación.', 34),
    ('Italian', 'C1', 'Competente en comunicación formal.', 35),
    ('Mandarin', 'A2', 'Habilidades básicas de habla.', 36),
    ('Japanese', 'C1', 'Fluido en entornos formales.', 37),
    ('Portuguese', 'A1', 'Aprendiendo frases simples.', 38),
    ('Russian', 'A2', 'Conocimientos básicos.', 39),
    ('Arabic', 'B2', 'Fluidez conversacional.', 40),
    ('English', 'C1', 'Excelente dominio del idioma.', 41),
    ('Spanish', 'B2', 'Buena comprensión y escritura.', 42),
    ('French', 'C2', 'Hablante fluido.', 43),
    ('German', 'A1', 'Principiante en gramática y conversación.', 44),
    ('Italian', 'B1', 'Dominio intermedio oral.', 45),
    ('Mandarin', 'B2', 'Habilidades conversacionales y formales.', 46),
    ('Japanese', 'A2', 'Aprendiendo lo básico de kanji.', 47),
    ('Portuguese', 'C1', 'Competente en escritura profesional.', 48);

INSERT INTO "public".candidates_jobs (
    company_name, job_title, job_description, start_date, end_date, get_offers, id_user
) VALUES
('Tech Solutions', 'Desarrollador Full Stack', 'Desarrollador encargado de proyectos web modernos.', '2020-01-15', '2023-05-30', TRUE, 1),
('Global Enterprises', 'Analista de Datos', 'Análisis de grandes volúmenes de datos empresariales.', '2018-09-01', '2021-12-31', TRUE, 2),
('GreenBuild Co.', 'Ingeniero Civil', 'Diseño y supervisión de obras de construcción.', '2019-03-20', NULL, TRUE, 3),
('InnoTech', 'Gerente de Proyectos', 'Liderazgo en la ejecución de proyectos tecnológicos.', '2017-06-10', '2022-08-15', TRUE, 4),
('EduSoft', 'Diseñador de Experiencia de Usuario', 'Creación de interfaces educativas.', '2021-02-01', '2023-01-20', FALSE, 5),
('AlphaCorp', 'Arquitecto de Software', 'Planificación de la arquitectura de aplicaciones empresariales.', '2015-07-15', '2020-12-31', TRUE, 6),
('EcoEnergy', 'Especialista en Energías Renovables', 'Desarrollo de proyectos sostenibles.', '2019-05-01', NULL, TRUE, 7),
('HealthWay', 'Administrador de Redes', 'Mantenimiento de sistemas de telecomunicaciones.', '2016-11-20', '2021-03-30', FALSE, 8),
('DesignX', 'Artista Gráfico', 'Creación de material visual para campañas publicitarias.', '2020-07-01', '2023-07-01', TRUE, 9),
('BioGen', 'Investigador Científico', 'Desarrollo de nuevos productos biotecnológicos.', '2018-08-15', NULL, FALSE, 10),
('FoodFusion', 'Chef Ejecutivo', 'Supervisión y creación de menús innovadores.', '2015-12-01', '2021-10-30', TRUE, 11),
('SafeGuard', 'Analista de Seguridad Informática', 'Prevención y mitigación de ataques cibernéticos.', '2019-01-10', NULL, TRUE, 12),
('FutureLab', 'Técnico de Laboratorio', 'Análisis y pruebas de muestras industriales.', '2017-04-25', '2023-09-15', FALSE, 13),
('StarConsult', 'Consultor Empresarial', 'Asesoría en estrategias organizacionales.', '2021-09-01', NULL, TRUE, 14),
('MegaRetail', 'Gerente de Ventas', 'Gestión de estrategias de ventas y equipo comercial.', '2020-03-15', '2023-03-15', TRUE, 15),
('BrightEdu', 'Profesor de Matemáticas', 'Docencia en niveles de secundaria y preparatoria.', '2014-02-01', '2020-05-30', FALSE, 16),
('Constructiva', 'Supervisor de Obras', 'Supervisión de proyectos de construcción en sitio.', '2018-05-10', NULL, TRUE, 17),
('Cloudify', 'Ingeniero en la Nube', 'Diseño e implementación de soluciones cloud.', '2019-06-15', '2023-01-01', TRUE, 18),
('Artistry Co.', 'Director Creativo', 'Liderazgo en proyectos artísticos y culturales.', '2016-03-20', NULL, TRUE, 19),
('LogicHub', 'Desarrollador Backend', 'Desarrollo de sistemas internos robustos.', '2020-08-01', '2023-06-20', FALSE, 20),
('HealthSecure', 'Médico General', 'Atención primaria en centros de salud comunitarios.', '2015-11-01', '2022-04-15', TRUE, 21),
('VisionMedia', 'Productor Audiovisual', 'Creación y edición de contenido multimedia.', '2018-07-10', '2023-09-10', TRUE, 22),
('DataHive', 'Científico de Datos', 'Aplicación de modelos predictivos en datos.', '2019-02-15', NULL, TRUE, 23),
('EcoLife', 'Gestor Ambiental', 'Gestión de programas de sostenibilidad.', '2017-08-20', '2022-11-30', TRUE, 24),
('QuantumCorp', 'Físico Teórico', 'Investigación en física avanzada.', '2016-01-01', NULL, FALSE, 25),
('SpeedTrans', 'Logístico', 'Coordinación de rutas de transporte.', '2021-05-01', '2023-02-28', TRUE, 26),
('SmartBuild', 'Ingeniero de Automatización', 'Diseño de procesos automatizados para fábricas.', '2019-10-10', NULL, TRUE, 27),
('NextGen', 'Desarrollador Móvil', 'Creación de aplicaciones móviles modernas.', '2020-09-15', '2023-09-15', TRUE, 28),
('GoldenHarvest', 'Agrónomo', 'Supervisión de cultivos y técnicas de siembra.', '2018-04-15', NULL, TRUE, 29),
('MetroSecure', 'Especialista en Seguridad Pública', 'Planeación de estrategias de seguridad urbana.', '2015-08-01', '2021-12-01', TRUE, 30),
('BrightIdeas', 'Investigador de Mercado', 'Análisis de tendencias y comportamiento del consumidor.', '2017-09-20', '2023-04-10', TRUE, 31),
('InfinityTech', 'Desarrollador de Inteligencia Artificial', 'Creación de algoritmos de aprendizaje profundo.', '2021-11-01', NULL, TRUE, 32),
('PrimeCare', 'Enfermero', 'Atención personalizada en clínicas privadas.', '2016-06-15', '2022-07-15', FALSE, 33),
('BlueOcean', 'Oceanógrafo', 'Investigación sobre la biodiversidad marina.', '2018-01-01', NULL, TRUE, 34),
('BioPharma', 'Químico Farmacéutico', 'Diseño y prueba de medicamentos innovadores.', '2019-03-01', '2022-12-15', TRUE, 35),
('SkyBridge', 'Ingeniero Aeronáutico', 'Diseño y optimización de aeronaves.', '2020-01-20', NULL, FALSE, 36),
('CultureConnect', 'Traductor', 'Traducción de documentos en diferentes idiomas.', '2017-11-10', '2022-08-30', TRUE, 37),
('SolarBright', 'Ingeniero Solar', 'Desarrollo de sistemas de energía solar.', '2019-07-15', NULL, TRUE, 38),
('GlobalAd', 'Especialista en Marketing Digital', 'Gestión de campañas digitales.', '2021-01-01', '2023-05-10', TRUE, 39),
('UrbanPlan', 'Urbanista', 'Diseño de proyectos de planificación urbana.', '2016-09-01', NULL, TRUE, 40),
('VistaTech', 'Soporte Técnico', 'Asistencia técnica en sistemas informáticos.', '2018-06-20', '2023-02-15', TRUE, 41),
('CoreLogic', 'Analista de Procesos', 'Optimización de procesos internos.', '2020-04-15', '2023-07-01', FALSE, 42),
('EcoTravel', 'Guía Turístico', 'Organización de rutas de ecoturismo.', '2017-02-01', NULL, TRUE, 43),
('AstroVision', 'Astrónomo', 'Investigación en observatorios internacionales.', '2015-01-01', NULL, FALSE, 44),
('MegaGames', 'Desarrollador de Videojuegos', 'Creación de videojuegos en diversas plataformas.', '2019-11-01', '2023-03-20', TRUE, 45),
('FineArt', 'Curador de Arte', 'Organización de exposiciones artísticas.', '2018-09-01', NULL, TRUE, 46),
('TechWorld', 'Especialista en DevOps', 'Automatización y gestión de infraestructura.', '2020-12-01', NULL, TRUE, 47),
('BrightFuture', 'Coach Profesional', 'Asesoramiento para el crecimiento profesional.', '2021-06-01', NULL, TRUE, 48);

INSERT INTO "public".jobs_skills (
    skill_name, level, id_job
) VALUES
('Programación en JavaScript', 'Avanzado', 1),
('Análisis de datos', 'Intermedio', 2),
('Gestión de proyectos', 'Avanzado', 3),
('Diseño de bases de datos', 'Intermedio', 4),
('UX/UI Design', 'Avanzado', 5),
('Arquitectura de software', 'Avanzado', 6),
('Implementación de paneles solares', 'Intermedio', 7),
('Mantenimiento de redes', 'Básico', 8),
('Edición gráfica en Photoshop', 'Avanzado', 9),
('Técnicas de laboratorio', 'Intermedio', 10),
('Gastronomía internacional', 'Avanzado', 11),
('Pentesting y ciberseguridad', 'Avanzado', 12),
('Técnicas de investigación', 'Intermedio', 13),
('Análisis estratégico', 'Avanzado', 14),
('Gestión de ventas', 'Intermedio', 15),
('Resolución de problemas matemáticos', 'Avanzado', 16),
('Supervisión de personal', 'Intermedio', 17),
('Implementación en AWS', 'Avanzado', 18),
('Dirección creativa', 'Avanzado', 19),
('Desarrollo en Python', 'Avanzado', 20),
('Atención médica primaria', 'Intermedio', 21),
('Producción de videos', 'Intermedio', 22),
('Machine learning', 'Avanzado', 23),
('Gestión ambiental', 'Intermedio', 24),
('Análisis físico teórico', 'Avanzado', 25),
('Coordinación logística', 'Intermedio', 26),
('Automatización con PLC', 'Avanzado', 27),
('Desarrollo de apps móviles', 'Avanzado', 28),
('Conocimientos en agricultura', 'Intermedio', 29),
('Seguridad urbana', 'Intermedio', 30),
('Estudio de mercados', 'Avanzado', 31),
('Redes neuronales profundas', 'Avanzado', 32),
('Cuidados de enfermería', 'Intermedio', 33),
('Análisis de ecosistemas marinos', 'Intermedio', 34),
('Química farmacéutica', 'Avanzado', 35),
('Diseño aeronáutico', 'Avanzado', 36),
('Traducción técnica', 'Intermedio', 37),
('Diseño de paneles solares', 'Intermedio', 38),
('Campañas digitales', 'Avanzado', 39),
('Planificación urbana', 'Intermedio', 40),
('Asistencia técnica', 'Intermedio', 41),
('Optimización de procesos', 'Avanzado', 42),
('Guía turística', 'Intermedio', 43),
('Astronomía observacional', 'Avanzado', 44),
('Desarrollo en Unity', 'Avanzado', 45),
('Curaduría de arte', 'Intermedio', 46),
('Pipeline de CI/CD', 'Avanzado', 47),
('Asesoramiento profesional', 'Intermedio', 48);

INSERT INTO "public".candidates_formal_educations (level, education_center, start_date, end_date, id_user)
VALUES
('Bachiller', 'Instituto Nacional de Aprendizaje', '2005-01-15', '2008-12-10', 1),
('Licenciatura', 'Universidad de la Sabana', '2009-01-10', '2013-12-15', 2),
('Diplomado', 'Instituto Técnico Superior', '2014-03-01', '2015-06-30', 3),
('Maestría', 'Universidad de los Andes', '2016-02-15', '2018-11-20', 4),
('Bachiller', 'Colegio Técnico Industrial', '2000-03-01', '2003-12-10', 5),
('Doctorado', 'Instituto de Investigaciones Avanzadas', '2010-09-10', '2015-07-20', 6),
('Licenciatura', 'Universidad Nacional', '2012-01-20', '2016-06-25', 7),
('Maestría', 'Universidad Javeriana', '2017-03-05', '2019-12-15', 8),
('Diplomado', 'Centro de Formación Empresarial', '2019-02-10', '2020-06-30', 9),
('Licenciatura', 'Universidad de Antioquia', '2011-08-15', '2015-12-20', 10),
('Bachiller', 'Escuela Secundaria Central', '1998-02-01', '2001-12-01', 11),
('Licenciatura', 'Universidad Tecnológica', '2008-03-10', '2012-11-30', 12),
('Diplomado', 'Centro Académico Moderno', '2017-06-01', '2018-09-30', 13),
('Maestría', 'Universidad Pontificia Bolivariana', '2014-01-15', '2016-10-25', 14),
('Doctorado', 'Universidad de Investigación Científica', '2011-02-20', '2017-11-15', 15),
('Licenciatura', 'Universidad Libre', '2015-08-10', '2019-05-20', 16),
('Maestría', 'Universidad del Norte', '2020-01-10', '2022-11-20', 17),
('Diplomado', 'Instituto Superior de Comercio', '2016-04-15', '2017-08-30', 18),
('Bachiller', 'Colegio Nacional del Sur', '2007-02-01', '2010-11-30', 19),
('Licenciatura', 'Universidad Central', '2006-03-10', '2010-12-15', 20),
('Diplomado', 'Centro de Formación Profesional', '2018-02-10', '2019-05-30', 21),
('Maestría', 'Universidad del Valle', '2013-03-05', '2015-12-20', 22),
('Doctorado', 'Instituto Avanzado de Ciencias Sociales', '2015-01-20', '2020-06-30', 23),
('Bachiller', 'Escuela Normal Superior', '1999-02-01', '2002-11-30', 24),
('Licenciatura', 'Universidad Autónoma', '2014-03-10', '2018-10-15', 25),
('Maestría', 'Universidad de Santander', '2017-08-01', '2020-05-15', 26),
('Diplomado', 'Instituto Técnico Educativo', '2021-01-15', '2022-06-30', 27),
('Bachiller', 'Liceo Moderno', '2002-03-01', '2005-11-30', 28),
('Licenciatura', 'Universidad Distrital', '2009-02-10', '2013-07-20', 29),
('Maestría', 'Universidad del Magdalena', '2016-04-10', '2018-11-30', 30),
('Diplomado', 'Centro Académico Empresarial', '2018-06-15', '2019-12-15', 31),
('Doctorado', 'Instituto Científico Nacional', '2010-09-15', '2016-07-10', 32),
('Licenciatura', 'Universidad de La Guajira', '2012-03-05', '2016-12-01', 33),
('Maestría', 'Universidad Autónoma del Caribe', '2018-02-20', '2021-05-30', 34),
('Diplomado', 'Centro Técnico Regional', '2019-07-15', '2020-12-20', 35),
('Bachiller', 'Instituto Técnico Comercial', '2001-02-01', '2004-11-25', 36),
('Licenciatura', 'Universidad Pedagógica', '2005-01-20', '2009-06-10', 37),
('Doctorado', 'Centro de Altos Estudios Científicos', '2013-03-15', '2020-08-25', 38),
('Maestría', 'Universidad Surcolombiana', '2020-04-05', '2023-01-15', 39),
('Diplomado', 'Centro de Innovación Tecnológica', '2016-05-10', '2017-09-30', 40),
('Bachiller', 'Colegio Público Nacional', '1997-02-10', '2000-12-10', 41),
('Licenciatura', 'Universidad Popular del Cesar', '2010-03-05', '2014-11-15', 42),
('Maestría', 'Universidad de Cartagena', '2017-01-15', '2019-06-30', 43),
('Diplomado', 'Instituto Profesional del Norte', '2019-04-10', '2020-07-15', 44),
('Doctorado', 'Universidad Internacional de Colombia', '2014-05-10', '2021-12-20', 45),
('Licenciatura', 'Universidad de Córdoba', '2016-08-01', '2020-03-10', 46),
('Maestría', 'Universidad del Cauca', '2020-02-15', '2022-11-10', 47),
('Bachiller', 'Colegio Privado Moderno', '1996-02-01', '1999-11-30', 48);

INSERT INTO "public".candidates_curriculum_vitae (url, file_type, id_user) VALUES
('https://example.com/cv1_user1.pdf', 'PDF', 1),
('https://example.com/cv2_user1.docx', 'DOCX', 1),
('https://example.com/cv1_user2.doc', 'DOC', 2),
('https://example.com/cv2_user2.pdf', 'PDF', 2),
('https://example.com/cv1_user3.pdf', 'PDF', 3),
('https://example.com/cv2_user3.txt', 'TXT', 3),
('https://example.com/cv1_user4.docx', 'DOCX', 4),
('https://example.com/cv2_user4.pdf', 'PDF', 4),
('https://example.com/cv1_user5.pdf', 'PDF', 5),
('https://example.com/cv2_user5.doc', 'DOC', 5),
('https://example.com/cv1_user6.txt', 'TXT', 6),
('https://example.com/cv2_user6.pdf', 'PDF', 6),
('https://example.com/cv1_user7.docx', 'DOCX', 7),
('https://example.com/cv2_user7.pdf', 'PDF', 7),
('https://example.com/cv1_user8.doc', 'DOC', 8),
('https://example.com/cv2_user8.pdf', 'PDF', 8),
('https://example.com/cv1_user9.txt', 'TXT', 9),
('https://example.com/cv2_user9.pdf', 'PDF', 9),
('https://example.com/cv1_user10.docx', 'DOCX', 10),
('https://example.com/cv2_user10.pdf', 'PDF', 10),
('https://example.com/cv1_user11.pdf', 'PDF', 11),
('https://example.com/cv2_user11.txt', 'TXT', 11),
('https://example.com/cv1_user12.docx', 'DOCX', 12),
('https://example.com/cv2_user12.pdf', 'PDF', 12),
('https://example.com/cv1_user13.doc', 'DOC', 13),
('https://example.com/cv2_user13.pdf', 'PDF', 13),
('https://example.com/cv1_user14.pdf', 'PDF', 14),
('https://example.com/cv2_user14.txt', 'TXT', 14),
('https://example.com/cv1_user15.docx', 'DOCX', 15),
('https://example.com/cv2_user15.pdf', 'PDF', 15),
('https://example.com/cv1_user16.pdf', 'PDF', 16),
('https://example.com/cv2_user16.doc', 'DOC', 16),
('https://example.com/cv1_user17.txt', 'TXT', 17),
('https://example.com/cv2_user17.pdf', 'PDF', 17),
('https://example.com/cv1_user18.docx', 'DOCX', 18),
('https://example.com/cv2_user18.pdf', 'PDF', 18),
('https://example.com/cv1_user19.pdf', 'PDF', 19),
('https://example.com/cv2_user19.doc', 'DOC', 19),
('https://example.com/cv1_user20.txt', 'TXT', 20),
('https://example.com/cv2_user20.pdf', 'PDF', 20),
('https://example.com/cv1_user21.docx', 'DOCX', 21),
('https://example.com/cv2_user21.pdf', 'PDF', 21),
('https://example.com/cv1_user22.doc', 'DOC', 22),
('https://example.com/cv2_user22.pdf', 'PDF', 22),
('https://example.com/cv1_user23.txt', 'TXT', 23),
('https://example.com/cv2_user23.pdf', 'PDF', 23),
('https://example.com/cv1_user24.docx', 'DOCX', 24),
('https://example.com/cv2_user24.pdf', 'PDF', 24),
('https://example.com/cv1_user25.pdf', 'PDF', 25),
('https://example.com/cv2_user25.docx', 'DOCX', 25),
('https://example.com/cv1_user26.doc', 'DOC', 26),
('https://example.com/cv2_user26.pdf', 'PDF', 26),
('https://example.com/cv1_user27.txt', 'TXT', 27),
('https://example.com/cv2_user27.pdf', 'PDF', 27),
('https://example.com/cv1_user28.docx', 'DOCX', 28),
('https://example.com/cv2_user28.pdf', 'PDF', 28),
('https://example.com/cv1_user29.doc', 'DOC', 29),
('https://example.com/cv2_user29.pdf', 'PDF', 29),
('https://example.com/cv1_user30.pdf', 'PDF', 30),
('https://example.com/cv2_user30.txt', 'TXT', 30),
('https://example.com/cv1_user31.docx', 'DOCX', 31),
('https://example.com/cv2_user31.pdf', 'PDF', 31),
('https://example.com/cv1_user32.pdf', 'PDF', 32),
('https://example.com/cv2_user32.doc', 'DOC', 32),
('https://example.com/cv1_user33.txt', 'TXT', 33),
('https://example.com/cv2_user33.pdf', 'PDF', 33),
('https://example.com/cv1_user34.docx', 'DOCX', 34),
('https://example.com/cv2_user34.pdf', 'PDF', 34),
('https://example.com/cv1_user35.pdf', 'PDF', 35),
('https://example.com/cv2_user35.txt', 'TXT', 35),
('https://example.com/cv1_user36.docx', 'DOCX', 36),
('https://example.com/cv2_user36.pdf', 'PDF', 36),
('https://example.com/cv1_user37.doc', 'DOC', 37),
('https://example.com/cv2_user37.pdf', 'PDF', 37),
('https://example.com/cv1_user38.pdf', 'PDF', 38),
('https://example.com/cv2_user38.txt', 'TXT', 38),
('https://example.com/cv1_user39.docx', 'DOCX', 39),
('https://example.com/cv2_user39.pdf', 'PDF', 39),
('https://example.com/cv1_user40.pdf', 'PDF', 40),
('https://example.com/cv2_user40.doc', 'DOC', 40),
('https://example.com/cv1_user41.txt', 'TXT', 41),
('https://example.com/cv2_user41.pdf', 'PDF', 41),
('https://example.com/cv1_user42.docx', 'DOCX', 42),
('https://example.com/cv2_user42.pdf', 'PDF', 42),
('https://example.com/cv1_user43.doc', 'DOC', 43),
('https://example.com/cv2_user43.pdf', 'PDF', 43),
('https://example.com/cv1_user44.txt', 'TXT', 44),
('https://example.com/cv2_user44.pdf', 'PDF', 44),
('https://example.com/cv1_user45.docx', 'DOCX', 45),
('https://example.com/cv2_user45.pdf', 'PDF', 45),
('https://example.com/cv1_user46.pdf', 'PDF', 46),
('https://example.com/cv2_user46.doc', 'DOC', 46),
('https://example.com/cv1_user47.txt', 'TXT', 47),
('https://example.com/cv2_user47.pdf', 'PDF', 47),
('https://example.com/cv1_user48.docx', 'DOCX', 48),
('https://example.com/cv2_user48.pdf', 'PDF', 48);

INSERT INTO "public".candidates_misc_information (gender, "is_self-employed", id_user) VALUES
('M', true, 1),
('F', false, 2),
('M', false, 3),
('F', true, 4),
('M', true, 5),
('F', false, 6),
('M', false, 7),
('F', true, 8),
('M', false, 9),
('M', true, 10),
('F', false, 11),
('M', true, 12),
('F', false, 13),
('M', true, 14),
('F', false, 15),
('M', false, 16),
('F', true, 17),
('M', true, 18),
('F', false, 19),
('M', false, 20),
('F', true, 21),
('M', true, 22),
('F', false, 23),
('M', true, 24),
('F', false, 25),
('M', false, 26),
('F', true, 27),
('M', true, 28),
('F', false, 29),
('M', true, 30),
('F', false, 31),
('M', false, 32),
('F', true, 33),
('M', true, 34),
('F', false, 35),
('M', false, 36),
('F', true, 37),
('M', true, 38),
('F', false, 39),
('M', false, 40),
('F', true, 41),
('M', true, 42),
('F', false, 43),
('M', true, 44),
('F', false, 45),
('M', false, 46),
('F', true, 47),
('M', true, 48);

INSERT INTO "public".candidate_vehicle_information (has_driving_license, has_own_vehicle, id_user) VALUES
(true, true, 1),
(false, false, 2),
(true, true, 3),
(false, true, 4),
(true, false, 5),
(false, false, 6),
(true, true, 7),
(false, true, 8),
(true, false, 9),
(false, false, 10),
(true, true, 11),
(false, true, 12),
(true, false, 13),
(false, false, 14),
(true, true, 15),
(false, true, 16),
(true, false, 17),
(false, false, 18),
(true, true, 19),
(false, true, 20),
(true, false, 21),
(false, false, 22),
(true, true, 23),
(false, true, 24),
(true, false, 25),
(false, false, 26),
(true, true, 27),
(false, true, 28),
(true, false, 29),
(false, false, 30),
(true, true, 31),
(false, true, 32),
(true, false, 33),
(false, false, 34),
(true, true, 35),
(false, true, 36),
(true, false, 37),
(false, false, 38),
(true, true, 39),
(false, true, 40),
(true, false, 41),
(false, false, 42),
(true, true, 43),
(false, true, 44),
(true, false, 45),
(false, false, 46),
(true, true, 47),
(false, true, 48);

INSERT INTO "public".countries (country_name) VALUES
('Colombia'),
('Argentina'),
('México'),
('España'),
('Perú');

INSERT INTO "public".provinces (province_name, id_country) VALUES
('Antioquia', 1),
('Buenos Aires', 2),
('Jalisco', 3),
('Andalucía', 4),
('Arequipa', 5),
('Lima Metropolitana', 5),
('Cundinamarca', 1),
('Puebla', 3),
('Cataluña', 4),
('Magdalena', 1);

INSERT INTO "public".cities (city_name, id_province) VALUES
('Medellín', 1),
('Mar del Plata', 2),
('Guadalajara', 3),
('Sevilla', 4),
('Arequipa', 5),
('Callao', 5),
('Bogotá', 7),
('Puebla', 8),
('Barcelona', 9),
('Barranquilla', 1),
('La Plata', 2),
('Tijuana', 3),
('Granada', 4),
('Cusco', 5),
('Valparaíso', 6),
('Lima', 5),
('Zacatecas', 3),
('Madrid', 4),
('Trujillo', 5),
('Santiago', 6),
('Cali', 1),
('Buenos Aires', 2),
('Cancún', 3),
('Madrid', 4),
('Chiclayo', 5),
('Santa Marta', 10);

INSERT INTO "public".candidate_work_permit_countries (id_country, id_user) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(1, 6), (2, 7), (3, 8), (4, 9), (5, 10),
(1, 11), (2, 12), (3, 13), (4, 14), (5, 15),
(1, 16), (2, 17), (3, 18), (4, 19), (5, 20),
(1, 21), (2, 22), (3, 23), (4, 24), (5, 25),
(1, 26), (2, 27), (3, 28), (4, 29), (5, 30),
(1, 31), (2, 32), (3, 33), (4, 34), (5, 35),
(1, 36), (2, 37), (3, 38), (4, 39), (5, 40),
(1, 41), (2, 42), (3, 43), (4, 44), (5, 45),
(1, 46), (2, 47), (3, 48);

INSERT INTO "public".candidate_residences (postal_code, id_user, id_birth_country, id_residence_country, id_residence_city) VALUES
('050001', 1, 1, 1, 1),
('7600', 2, 2, 2, 2),
('44100', 3, 3, 3, 3),
('41001', 4, 4, 4, 4),
('04000', 5, 5, 5, 5),
('15000', 6, 1, 1, 7),
('1630', 7, 2, 2, 11),
('65100', 8, 3, 3, 8),
('08001', 9, 4, 4, 9),
('470001', 10, 1, 1, 10),
('1900', 11, 2, 2, 2),
('22300', 12, 3, 3, 12),
('18001', 13, 4, 4, 13),
('08001', 14, 5, 5, 5),
('14000', 15, 1, 5, 6),
('6000', 16, 2, 2, 2),
('67500', 17, 3, 5, 15),
('28001', 18, 4, 3, 17),
('04010', 19, 5, 5, 5),
('75200', 20, 1, 1, 7),
('19000', 21, 2, 3, 12),
('21900', 22, 3, 3, 8),
('08010', 23, 4, 4, 9),
('50000', 24, 5, 5, 16),
('09000', 25, 1, 1, 1),
('44000', 26, 2, 2, 2),
('44500', 27, 3, 3, 3),
('41000', 28, 4, 4, 4),
('02000', 29, 5, 5, 5),
('5000', 30, 1, 5, 6),
('1600', 31, 2, 2, 2),
('21000', 32, 3, 3, 12),
('08002', 33, 4, 4, 9),
('15000', 34, 5, 5, 5),
('57000', 35, 1, 1, 7),
('22000', 36, 2, 3, 12),
('25000', 37, 3, 3, 8),
('03001', 38, 4, 4, 13),
('16000', 39, 5, 5, 5),
('83000', 40, 1, 1, 10),
('18000', 41, 2, 3, 3),
('35000', 42, 3, 5, 15),
('12000', 43, 4, 3, 17),
('28001', 44, 5, 5, 16),
('73000', 45, 1, 5, 6),
('53000', 46, 2, 2, 11),
('89000', 47, 3, 3, 8),
('35001', 48, 4, 4, 9);

INSERT INTO "public".company_facilities (id_user, id_city) VALUES
(49, 1),
(50, 2),
(51, 3),
(52, 4),
(53, 5),
(54, 6),
(55, 7),
(56, 8),
(57, 9),
(58, 10),
(59, 11),
(60, 12),
(49, 13),
(50, 14),
(51, 15),
(52, 16),
(53, 17),
(54, 18),
(55, 19),
(56, 20),
(57, 1),
(58, 2),
(59, 3),
(60, 4);

/*
 * INSERCIÓN DE ENTIDADES RELACIONADAS CON LAS OFERTAS DE EMPLEO
 */
INSERT INTO "public".vacancies_type (type) VALUES
('Presencial'),
('Híbrido'),
('Sin especificar'),
('Solo teletrabajo');

INSERT INTO "public".vacancies (title, description, open_positions, publication_date, work_experience_years, vacancy_status, published_by, id_city) VALUES
('Desarrollador Backend', 'Buscamos un desarrollador backend con experiencia en Go y SQL.', 5, '2024-11-01 09:00:00+00', 3, 'Open', 49, 1),
('Analista de Seguridad', 'Requerimos un analista de seguridad con experiencia en auditorías y protección de sistemas.', 3, '2024-11-02 09:00:00+00', 4, 'Open', 50, 2),
('Ingeniero de Software', 'Se busca ingeniero de software con experiencia en proyectos ágiles y en la nube.', 10, '2024-11-05 09:00:00+00', 2, 'Open', 51, 3),
('Diseñador UI/UX', 'Estamos contratando un diseñador UI/UX con conocimientos en herramientas de diseño como Figma y Sketch.', 2, '2024-11-06 09:00:00+00', 1, 'Open', 52, 4),
('Gerente de Proyectos', 'Se requiere un gerente de proyectos con experiencia liderando equipos y entregando proyectos a tiempo.', 1, '2024-11-10 09:00:00+00', 5, 'Open', 53, 5),
('Soporte Técnico', 'Buscamos un técnico de soporte con experiencia en redes y hardware.', 3, '2024-11-12 09:00:00+00', 2, 'Open', 54, 6),
('Tester de Software', 'Se necesita un tester con experiencia en pruebas manuales y automatizadas.', 4, '2024-11-14 09:00:00+00', 3, 'Open', 55, 7),
('Desarrollador Frontend', 'Buscamos un desarrollador frontend con experiencia en React y JavaScript.', 6, '2024-11-15 09:00:00+00', 2, 'Open', 56, 8),
('Especialista en Marketing', 'Se requiere un especialista en marketing con experiencia en SEO y redes sociales.', 2, '2024-11-16 09:00:00+00', 3, 'Open', 57, 9),
('Administrador de Sistemas', 'Se busca un administrador de sistemas con conocimientos en Linux y administración de servidores.', 4, '2024-11-17 09:00:00+00', 4, 'Open', 58, 10),
('Desarrollador de Aplicaciones Móviles', 'Buscamos un desarrollador con experiencia en aplicaciones móviles para iOS y Android.', 5, '2024-11-18 09:00:00+00', 3, 'Open', 59, 11),
('Consultor SAP', 'Se requiere un consultor SAP con experiencia en la implementación de soluciones SAP.', 1, '2024-11-19 09:00:00+00', 6, 'Open', 60, 12),
('Administrador de Bases de Datos', 'Se busca administrador de bases de datos con experiencia en PostgreSQL y optimización de consultas.', 4, '2024-11-20 09:00:00+00', 5, 'Open', 49, 13),
('Desarrollador Full Stack', 'Buscamos un desarrollador full stack con conocimientos en Node.js, React y bases de datos relacionales.', 3, '2024-11-21 09:00:00+00', 4, 'Open', 50, 14),
('Coordinador de Marketing Digital', 'Se requiere un coordinador de marketing digital con experiencia en campañas pagadas y SEO.', 5, '2024-11-22 09:00:00+00', 3, 'Open', 51, 15),
('Ingeniero en Redes', 'Buscamos ingeniero en redes con experiencia en configuración de redes corporativas y VPN.', 2, '2024-11-23 09:00:00+00', 4, 'Open', 52, 16),
('Product Owner', 'Se necesita un Product Owner con experiencia en metodologías ágiles y gestión de equipos de desarrollo.', 1, '2024-11-24 09:00:00+00', 5, 'Open', 53, 17),
('Arquitecto de Software', 'Buscamos un arquitecto de software con experiencia en diseño y escalabilidad de aplicaciones.', 3, '2024-11-25 09:00:00+00', 6, 'Open', 54, 18),
('Desarrollador de Backend Java', 'Se busca un desarrollador de backend con experiencia en Java y arquitectura de microservicios.', 4, '2024-11-26 09:00:00+00', 5, 'Open', 55, 19),
('Consultor de Negocios', 'Se requiere un consultor de negocios con experiencia en la optimización de procesos y ERP.', 3, '2024-11-27 09:00:00+00', 4, 'Open', 56, 20),
('Especialista en SEO', 'Buscamos un especialista en SEO con experiencia en la optimización de motores de búsqueda y análisis de keywords.', 5, '2024-11-28 09:00:00+00', 3, 'Open', 57, 21),
('Técnico de Redes', 'Se necesita un técnico de redes con experiencia en configuración de switches y routers.', 2, '2024-11-29 09:00:00+00', 4, 'Open', 58, 22),
('Ingeniero DevOps', 'Buscamos un ingeniero DevOps con experiencia en automatización de infraestructuras y CI/CD.', 4, '2024-11-30 09:00:00+00', 5, 'Open', 59, 23),
('Consultor en Seguridad Informática', 'Se requiere un consultor con experiencia en auditoría de seguridad y protección de redes.', 3, '2024-12-01 09:00:00+00', 4, 'Open', 60, 24),
('Gerente de Ventas', 'Buscamos un gerente de ventas con experiencia en la industria retail, para liderar un equipo de ventas en la ciudad de Medellín.', 3, '2024-11-01 09:00:00+00', 5, 'Open', 49, 1),
('Chef Ejecutivo', 'Se necesita un chef ejecutivo con experiencia en cocina gourmet, liderazgo y creación de menús.', 2, '2024-11-02 09:00:00+00', 4, 'Open', 50, 2),
('Asesor de Marketing Digital', 'Requerimos un asesor de marketing digital con experiencia en gestión de redes sociales y campañas de publicidad online.', 4, '2024-11-03 09:00:00+00', 3, 'Open', 51, 3),
('Recepcionista', 'Se busca un recepcionista con habilidades en atención al cliente, manejo de agendas y atención telefónica.', 2, '2024-11-04 09:00:00+00', 1, 'Open', 52, 4),
('Contador Público', 'Estamos buscando un contador público con experiencia en auditorías y declaraciones fiscales para pequeñas y medianas empresas.', 1, '2024-11-05 09:00:00+00', 5, 'Open', 53, 5),
('Cajero/a', 'Se necesita un cajero/a con experiencia en atención al cliente y manejo de efectivo y tarjetas.', 6, '2024-11-06 09:00:00+00', 1, 'Open', 54, 6),
('Gerente de Restaurante', 'Buscamos un gerente de restaurante con experiencia en la industria de alimentos y bebidas, con conocimientos en gestión de personal y operaciones.', 1, '2024-11-07 09:00:00+00', 6, 'Open', 55, 7),
('Abogado/a Corporativo', 'Se necesita un abogado corporativo con experiencia en asesoría legal a empresas, manejo de contratos y cumplimiento normativo.', 2, '2024-11-08 09:00:00+00', 4, 'Open', 56, 8),
('Operario/a de Producción', 'Buscamos un operario de producción con experiencia en plantas industriales y manejo de maquinaria pesada.', 10, '2024-11-09 09:00:00+00', 2, 'Open', 57, 9),
('Asistente Administrativo', 'Se requiere un asistente administrativo con experiencia en gestión de documentos, agendas y atención a clientes internos.', 3, '2024-11-10 09:00:00+00', 2, 'Open', 58, 10),
('Agente de Viajes', 'Se busca un agente de viajes con experiencia en asesoramiento a clientes, venta de paquetes turísticos y manejo de reservas.', 2, '2024-11-11 09:00:00+00', 3, 'Open', 59, 11),
('Cocinero/a', 'Se necesita un cocinero/a con experiencia en preparación de platos a la carta en un restaurante de alta gama.', 3, '2024-11-12 09:00:00+00', 2, 'Open', 60, 12),
('Vendedor/a en Tienda', 'Buscamos un vendedor/a en tienda con experiencia en atención al cliente, ventas y organización del inventario.', 5, '2024-11-13 09:00:00+00', 1, 'Open', 49, 13),
('Jefe de Logística', 'Requerimos un jefe de logística con experiencia en la gestión de almacenes y distribución de productos a nivel nacional.', 2, '2024-11-14 09:00:00+00', 4, 'Open', 50, 14),
('Enfermero/a', 'Se necesita un enfermero/a con experiencia en atención hospitalaria, urgencias y gestión de pacientes.', 3, '2024-11-15 09:00:00+00', 3, 'Open', 51, 15),
('Gerente de Recursos Humanos', 'Buscamos un gerente de recursos humanos con experiencia en selección de personal, capacitaciones y clima organizacional.', 1, '2024-11-16 09:00:00+00', 5, 'Open', 52, 16),
('Peluquero/a', 'Se busca un peluquero/a con experiencia en cortes de cabello, peinados y atención personalizada a clientes.', 4, '2024-11-17 09:00:00+00', 2, 'Open', 53, 17),
('Técnico/a de Mantenimiento', 'Se necesita un técnico de mantenimiento con experiencia en reparaciones eléctricas y mecánicas en equipos industriales.', 6, '2024-11-18 09:00:00+00', 3, 'Open', 54, 18),
('Asistente de Recursos Humanos', 'Requerimos un asistente de recursos humanos con experiencia en manejo de documentos, bases de datos y atención al personal.', 3, '2024-11-19 09:00:00+00', 2, 'Open', 55, 19),
('Profesor/a de Idiomas', 'Buscamos un profesor de idiomas con experiencia en enseñanza de inglés y otros idiomas a estudiantes de diferentes niveles.', 5, '2024-11-20 09:00:00+00', 3, 'Open', 56, 20),
('Supervisor/a de Producción', 'Se necesita un supervisor de producción con experiencia en la gestión de líneas de producción en la industria alimentaria.', 4, '2024-11-21 09:00:00+00', 5, 'Open', 57, 21),
('Farmacéutico/a', 'Buscamos un farmacéutico con experiencia en la dispensación de medicamentos, asesoramiento farmacológico y gestión de inventarios.', 2, '2024-11-22 09:00:00+00', 4, 'Open', 58, 22);

INSERT INTO "public".vacancies_workday_type (workday_type) VALUES
('Completa'),
('Indiferente'),
('Parcial - Indiferente'),
('Parcial - Mañana'),
('Intensiva - Mañana'),
('Parcial - Tarde'),
('Intensiva - Indiferente'),
('Intensiva - Tarde'),
('Parcial - Noche'),
('Intensiva - Noche');

INSERT INTO "public".vacancies_contract_type (contract_type) VALUES
('Indefinido'),
('De duración determinada'),
('Otros contratos'),
('Fijo discontinuo'),
('Autónomo'),
('A tiempo parcial'),
('Formativo'),
('De relevo');

INSERT INTO "public".vacancies_categories (job_name) VALUES
('Desarrollador de Software'),
('Ingeniero de Sistemas'),
('Administrador de Redes'),
('Analista de Datos'),
('Gerente de Proyectos'),
('Diseñador Gráfico'),
('Community Manager'),
('Especialista en Marketing Digital'),
('Auxiliar Administrativo'),
('Consultor de Recursos Humanos'),
('Asistente Ejecutivo'),
('Director Comercial'),
('Ingeniero Industrial'),
('Contador Público'),
('Abogado Corporativo'),
('Vendedor de Tecnología'),
('Especialista en Ciberseguridad'),
('Técnico de Soporte IT'),
('Recepcionista'),
('Asesor de Ventas'),
('Marketing de Contenidos'),
('Especialista en SEO'),
('Product Manager'),
('Diseñador UX/UI'),
('Consultor Financiero'),
('Ingeniero de Soporte Técnico'),
('Desarrollador Frontend'),
('Desarrollador Backend'),
('Community Manager'),
('Gestor de Proyectos de TI'),
('Técnico de Mantenimiento'),
('Operador de Maquinaria'),
('Gerente de TI'),
('Director de Tecnología'),
('Especialista en IA'),
('Administrador de Bases de Datos'),
('Técnico de Hardware'),
('Agente de Atención al Cliente'),
('Gestor de Recursos Humanos'),
('Director de Innovación');

INSERT INTO "public".vacancies_properties (id_vacancy, id_workday_type, id_vacancy_category, id_contract_type, id_vacancy_type) VALUES
(1, 1, 1, 1, 1),
(2, 2, 3, 2, 2),
(3, 1, 4, 3, 1),
(4, 4, 5, 1, 4),
(5, 2, 6, 4, 2),
(6, 5, 7, 1, 3),
(7, 1, 8, 2, 1),
(8, 3, 9, 5, 3),
(9, 2, 10, 3, 4),
(10, 1, 11, 1, 2),
(11, 4, 12, 2, 1),
(12, 3, 13, 4, 4),
(13, 1, 14, 5, 1),
(14, 2, 15, 1, 3),
(15, 5, 16, 2, 2),
(16, 1, 17, 3, 4),
(17, 2, 18, 5, 1),
(18, 1, 19, 2, 3),
(19, 4, 20, 1, 4),
(20, 3, 21, 4, 1),
(21, 2, 22, 5, 2),
(22, 1, 23, 3, 1),
(23, 4, 24, 2, 2),
(24, 5, 25, 1, 4),
(25, 2, 26, 4, 3),
(26, 1, 27, 3, 4),
(27, 3, 28, 5, 1),
(28, 4, 29, 2, 3),
(29, 1, 30, 1, 2),
(30, 5, 31, 4, 3);

INSERT INTO "public".vacancies_salaries (id_vacancy, minimum_salary, maximum_salary) VALUES
(1, '1500.00', '2500.00'),
(2, '2000.00', '3500.00'),
(3, '1800.00', '3000.00'),
(4, '2500.00', '4000.00'),
(5, '2200.00', '3200.00'),
(6, '1900.00', '2700.00'),
(7, '1600.00', '2300.00'),
(8, '2700.00', '4500.00'),
(9, '2000.00', '3800.00'),
(10, '2100.00', '3500.00'),
(11, '2300.00', '4000.00'),
(12, '2400.00', '4200.00'),
(13, '1900.00', '3100.00'),
(14, '2200.00', '3800.00'),
(15, '2500.00', '4300.00'),
(16, '2100.00', '3400.00'),
(17, '2300.00', '3600.00'),
(18, '2700.00', '5000.00'),
(19, '2000.00', '3300.00'),
(20, '2400.00', '3800.00'),
(21, '2600.00', '4600.00'),
(22, '2500.00', '4000.00'),
(23, '2300.00', '3600.00'),
(24, '1800.00', '2800.00'),
(25, '2100.00', '3500.00'),
(26, '2400.00', '4200.00'),
(27, '2200.00', '3700.00'),
(28, '2500.00', '4200.00'),
(29, '2800.00', '4800.00'),
(30, '2000.00', '3300.00'),
(31, '2300.00', '3800.00'),
(32, '2200.00', '3400.00'),
(33, '2100.00', '3700.00'),
(34, '2400.00', '4200.00'),
(35, '2300.00', '3800.00'),
(36, '2200.00', '3800.00'),
(37, '2500.00', '4000.00'),
(38, '2700.00', '4600.00'),
(39, '1900.00', '2900.00'),
(40, '2600.00', '4500.00');

iNSERT INTO "public".vacancies_salaries (id_vacancy, minimum_salary, maximum_salary) VALUES
(43, '30000.00', '30000.00');

INSERT INTO "public".entry_applications (application_status, id_user, id_vacancy)
VALUES
  ('Waiting', 1, 1),
  ('Waiting', 2, 2),
  ('Waiting', 3, 3),
  ('Waiting', 4, 4),
  ('Waiting', 5, 5),
  ('Waiting', 6, 6),
  ('Waiting', 7, 7),
  ('Waiting', 8, 8),
  ('Waiting', 9, 9),
  ('Waiting', 10, 10),
  ('Waiting', 11, 11),
  ('Waiting', 12, 12),
  ('Waiting', 13, 13),
  ('Waiting', 14, 14),
  ('Waiting', 15, 15),
  ('Waiting', 16, 16),
  ('Waiting', 17, 17),
  ('Waiting', 18, 18),
  ('Waiting', 19, 19),
  ('Waiting', 20, 20),
  ('Waiting', 21, 21),
  ('Waiting', 22, 22),
  ('Waiting', 23, 23),
  ('Waiting', 24, 24),
  ('Waiting', 25, 25),
  ('Waiting', 26, 26),
  ('Waiting', 27, 27),
  ('Waiting', 28, 28),
  ('Waiting', 29, 29),
  ('Waiting', 30, 30);

INSERT INTO "public".candidates_preferences (salary, id_user)
VALUES
  (30000, 1),
  (35000, 2),
  (40000, 3),
  (45000, 4),
  (50000, 5),
  (55000, 6),
  (60000, 7),
  (65000, 8),
  (70000, 9),
  (75000, 10),
  (80000, 11),
  (85000, 12),
  (90000, 13),
  (95000, 14),
  (100000, 15),
  (105000, 16),
  (110000, 17),
  (115000, 18),
  (120000, 19),
  (125000, 20),
  (130000, 21),
  (135000, 22),
  (140000, 23),
  (145000, 24),
  (150000, 25);

INSERT INTO "public".candidates_preferences_categories (id_preference, id_vacancy_category)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 8),
  (9, 9),
  (10, 10);

INSERT INTO "public".candidates_preferences_contract_type (id_preference, id_contract_type)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 1),
  (9, 2),
  (10, 3);

INSERT INTO "public".candidates_preferences_provinces (id_preference, id_province)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 8),
  (9, 9),
  (10, 10);

INSERT INTO "public".candidates_preferences_types (id_preference, id_vacancy_type)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 3),
  (6, 1),
  (7, 2),
  (8, 3),
  (9, 4),
  (10, 1);

INSERT INTO "public".candidates_preferences_workday_type (id_preference, id_workday_type)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 1),
  (5, 2),
  (6, 3),
  (7, 1),
  (8, 2),
  (9, 3),
  (10, 1);

/*
 * INSERCIÓN DE LA TABLA PARA EMPRESAS DE RECLUTAMIENTO
 */
INSERT INTO "public".recruitment_companies (id_user)
VALUES
  (49),
  (50),
  (51),
  (52);

/*
 * INSERCIÓN EN LA TABLA DE AUDITORIAS PARA ADMINISTRADORES
 */
SELECT admin_actions(69, 'SUSPEND_ACCOUNT', 45, 'SUSPEND_ACCOUNT');
SELECT admin_actions(69, 'ACTIVATE_ACCOUNT', 45, 'ACTIVATE_ACCOUNT');