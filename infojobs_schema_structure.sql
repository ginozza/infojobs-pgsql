/*
 * CREACIÓN DE USUARIOS
 */
-- ************************************** "public".users_types
CREATE TYPE user_type AS ENUM ('Admin', 'Candidate', 'Employer');

CREATE TABLE "public".users_types
(
 id_user_type serial NOT NULL,
 user_type    user_type NOT NULL,
 CONSTRAINT PK_2 PRIMARY KEY ( id_user_type )
);

-- ************************************** "public".users
CREATE TYPE account_status AS ENUM ('Active', 'Suspended', 'Closed');

CREATE TABLE "public".users
(
 id_user           serial NOT NULL,
 "token"           varchar(32) NOT NULL,
 email             varchar(254) NOT NULL,
 password          text NOT NULL,
 registration_date timestamptz NOT NULL DEFAULT current_timestamp,
 name              varchar(100) NOT NULL,
 first_surname        varchar(50) NOT NULL,
 second_surname       varchar(50) NOT NULL,
 account_status    account_status NOT NULL,
 id_user_type      serial NOT NULL,
 CONSTRAINT PK_3 PRIMARY KEY ( id_user ),
 CONSTRAINT FK_1 FOREIGN KEY ( id_user_type ) REFERENCES "public".users_types ( id_user_type ),
 CONSTRAINT chk_registration_date CHECK (registration_date = current_timestamp)
);

CREATE INDEX FK_1 ON "public".users
(
 id_user_type
);

-- ************************************** "public".users_candidates
CREATE TABLE "public".users_candidates
(
 id_user      serial NOT NULL,
 phone_number varchar(20) NOT NULL,
 birth_date   date NOT NULL,
 CONSTRAINT PK_3_1 PRIMARY KEY ( id_user ),
 CONSTRAINT FK_2 FOREIGN KEY ( id_user ) REFERENCES "public".users ( id_user )
);

CREATE INDEX FK_2 ON "public".users_candidates
(
 id_user
);

-- ************************************** "public".company_type
CREATE TABLE "public".company_type
(
 id_company_type serial NOT NULL,
 company_type    varchar(50) NOT NULL,
 CONSTRAINT PK_31 PRIMARY KEY ( id_company_type )
);

-- ************************************** "public".users_employers
CREATE TABLE "public".users_employers
(
 id_user            int NOT NULL,
 company_name       varchar(100) NOT NULL,
 phone_number       varchar(20) NOT NULL,
 tax_identification varchar(15) NOT NULL,
 description        text NOT NULL,
 id_company_type    int NOT NULL,
 CONSTRAINT PK_29 PRIMARY KEY ( id_user ),
 CONSTRAINT FK_36 FOREIGN KEY ( id_user ) REFERENCES "public".users ( id_user ),
 CONSTRAINT FK_38 FOREIGN KEY ( id_company_type ) REFERENCES "public".company_type ( id_company_type )
);

CREATE INDEX FK_3 ON "public".users_employers
(
 id_user
);

CREATE INDEX FK_4 ON "public".users_employers
(
 id_company_type
);

-- ************************************** "public".users_admin
CREATE TYPE admin_role AS ENUM('SUPER_ADMIN', 'MODERATOR');

CREATE TABLE "public".users_admin
(
 id_user    int NOT NULL,
 admin_role admin_role NOT NULL,
 CONSTRAINT PK_33 PRIMARY KEY ( id_user ),
 CONSTRAINT FK_42 FOREIGN KEY ( id_user ) REFERENCES "public".users ( id_user )
);

CREATE INDEX FK_5 ON "public".users_admin
(
 id_user
);

/*
 * CREACIÓN DE ENTIDADES NETAMENTE IDENTIFICADAS POR USUARIO CANDIDATO
 */
-- ************************************** candidates_languages
CREATE TABLE candidates_languages
(
 id_languages serial NOT NULL,
 language     varchar(50) NOT NULL,
 level        varchar(10) NOT NULL,
 comments     text NOT NULL,
 id_user      int NOT NULL,
 CONSTRAINT PK_14 PRIMARY KEY ( id_languages ),
 CONSTRAINT FK_16 FOREIGN KEY ( id_user ) REFERENCES "public".users_candidates ( id_user )
);

CREATE INDEX FK_6 ON candidates_languages
(
 id_user
);

-- ************************************** "public".candidates_jobs
CREATE TABLE "public".candidates_jobs
(
 id_job          serial NOT NULL,
 company_name    varchar(255) NOT NULL,
 job_title       varchar(150) NOT NULL,
 job_description text NULL,
 start_date      date NOT NULL,
 end_date        date NULL,
 get_offers      boolean NOT NULL,
 id_user         int NOT NULL,
 CONSTRAINT PK_5 PRIMARY KEY (id_job),
 CONSTRAINT FK_4 FOREIGN KEY (id_user) REFERENCES "public".users_candidates (id_user),
 CONSTRAINT chk_end_date_jobs CHECK (end_date > start_date),
 CONSTRAINT chk_start_date_jobs CHECK (start_date <= CURRENT_DATE),
 CONSTRAINT chk_end_date_current_jobs CHECK (end_date IS NULL OR end_date <= CURRENT_DATE)
);

CREATE INDEX FK_7 ON "public".candidates_jobs
(
 id_user
);

-- ************************************** "public".jobs_skills
CREATE TABLE "public".jobs_skills
(
 id_skill   serial NOT NULL,
 skill_name varchar(150) NOT NULL,
 level      varchar(10) NOT NULL,
 id_job     int NOT NULL,
 CONSTRAINT PK_6 PRIMARY KEY ( id_skill ),
 CONSTRAINT FK_5 FOREIGN KEY ( id_job ) REFERENCES "public".candidates_jobs ( id_job )
);

CREATE INDEX FK_8 ON "public".jobs_skills
(
 id_job
);

-- ************************************** "public".candidates_formal_educations
CREATE TABLE "public".candidates_formal_educations
(
    id_title         serial NOT NULL,
    level            varchar(25) NOT NULL,
    education_center varchar(150) NULL,
    start_date       date NOT NULL,
    end_date         date NOT NULL,
    id_user          int NOT NULL,
    CONSTRAINT PK_13 PRIMARY KEY (id_title),
    CONSTRAINT FK_15 FOREIGN KEY (id_user) REFERENCES "public".users_candidates (id_user),
    CONSTRAINT chk_end_date_education CHECK (end_date >= start_date),
    CONSTRAINT chk_start_date_education CHECK (start_date <= CURRENT_DATE),
    CONSTRAINT chk_end_date_current_education CHECK (end_date <= CURRENT_DATE)
);

CREATE INDEX FK_9 ON "public".candidates_formal_educations
(
 id_user
);

-- ************************************** "public".candidates_curriculum_vitae
CREATE TABLE "public".candidates_curriculum_vitae
(
 id_cv     serial NOT NULL,
 url       text NOT NULL,
 file_type varchar(10) NOT NULL,
 id_user   int NOT NULL,
 CONSTRAINT PK_4 PRIMARY KEY (id_cv),
 CONSTRAINT FK_3 FOREIGN KEY (id_user) REFERENCES "public".users_candidates (id_user),
 CONSTRAINT chk_file_type CHECK (LOWER(file_type) IN ('pdf', 'docx', 'txt', 'rtf', 'doc')),
 CONSTRAINT chk_url_format CHECK (url ~* '^(http|https)://')
);


CREATE INDEX FK_10 ON "public".candidates_curriculum_vitae
(
 id_user
);

-- ************************************** "public".candidates_misc_information
CREATE TABLE "public".candidates_misc_information
(
 id_misc_information serial NOT NULL,
 gender              varchar(1) CHECK (gender IN ('M', 'F', 'O')) NULL,
 "is_self-employed"  boolean NULL,
 id_user             int NOT NULL UNIQUE,
 CONSTRAINT PK_20 PRIMARY KEY ( id_misc_information ),
 CONSTRAINT FK_21 FOREIGN KEY ( id_user ) REFERENCES "public".users_candidates ( id_user )
);


CREATE INDEX FK_11 ON "public".candidates_misc_information
(
 id_user
);

-- ************************************** "public".candidate_vehicle_information
CREATE TABLE "public".candidate_vehicle_information
(
 id_vehicle_information serial NOT NULL,
 has_driving_license    boolean NOT NULL,
 has_own_vehicle        boolean NOT NULL,
 id_user                int NOT NULL UNIQUE,
 CONSTRAINT PK_12 PRIMARY KEY ( id_vehicle_information ),
 CONSTRAINT FK_14 FOREIGN KEY ( id_user ) REFERENCES "public".users_candidates ( id_user )
);

CREATE INDEX FK_12 ON "public".candidate_vehicle_information
(
 id_user
);

/*
 * CREACIÓN DE LAS ENTIDADES GEOGRÁFICAS Y DE UBICACIÓN
 */
-- ************************************** "public".countries
CREATE TABLE "public".countries
(
 id_country   serial NOT NULL,
 country_name varchar(50) NOT NULL,
 CONSTRAINT PK_7 PRIMARY KEY ( id_country ),
 CONSTRAINT unique_country_name UNIQUE (country_name)
);

-- ************************************** "public".provinces
CREATE TABLE "public".provinces
(
 id_province   serial NOT NULL,
 province_name varchar(50) NOT NULL,
 id_country    int NOT NULL,
 CONSTRAINT PK_8 PRIMARY KEY ( id_province ),
 CONSTRAINT FK_6 FOREIGN KEY ( id_country ) REFERENCES "public".countries ( id_country )
);

CREATE INDEX FK_13 ON "public".provinces
(
 id_country
);

-- ************************************** "public".cities
CREATE TABLE "public".cities
(
 id_city     serial NOT NULL,
 city_name   varchar(50) NOT NULL,
 id_province int NOT NULL,
 CONSTRAINT PK_9 PRIMARY KEY ( id_city ),
 CONSTRAINT FK_7 FOREIGN KEY ( id_province ) REFERENCES "public".provinces ( id_province )
);

CREATE INDEX FK_14 ON "public".cities
(
 id_province
);

-- ************************************** "public".candidate_work_permit_countries
CREATE TABLE "public".candidate_work_permit_countries
(
 id_work_permit serial NOT NULL,
 id_country     int NOT NULL,
 id_user        int NOT NULL,
 CONSTRAINT PK_10 PRIMARY KEY ( id_work_permit ),
 CONSTRAINT FK_8 FOREIGN KEY ( id_country ) REFERENCES "public".countries ( id_country ),
 CONSTRAINT FK_9 FOREIGN KEY ( id_user ) REFERENCES "public".users_candidates ( id_user ),
 CONSTRAINT unique_user_country_work_permit UNIQUE (id_user, id_country)
);

CREATE INDEX FK_15 ON "public".candidate_work_permit_countries
(
 id_country
);

CREATE INDEX FK_16 ON "public".candidate_work_permit_countries
(
 id_user
);

-- ************************************** "public".candidate_residences
CREATE TABLE "public".candidate_residences
(
    id_residence         serial NOT NULL,
    postal_code          varchar(10) NOT NULL,
    id_user              int NOT NULL UNIQUE,
    id_birth_country     int NOT NULL,
    id_residence_country int NOT NULL,
    id_residence_city    int NOT NULL,
    CONSTRAINT PK_11 PRIMARY KEY (id_residence),
    CONSTRAINT FK_10 FOREIGN KEY (id_user) REFERENCES "public".users_candidates (id_user),
    CONSTRAINT FK_11 FOREIGN KEY (id_birth_country) REFERENCES "public".countries (id_country),
    CONSTRAINT FK_12 FOREIGN KEY (id_residence_country) REFERENCES "public".countries (id_country),
    CONSTRAINT FK_13 FOREIGN KEY (id_residence_city) REFERENCES "public".cities (id_city)
);

CREATE INDEX FK_17 ON "public".candidate_residences
(
 id_user
);

CREATE INDEX FK_18 ON "public".candidate_residences
(
 id_birth_country
);

CREATE INDEX FK_19 ON "public".candidate_residences
(
 id_residence_country
);

CREATE INDEX FK_20 ON "public".candidate_residences
(
 id_residence_city
);

-- ************************************** "public".company_facilities
CREATE TABLE "public".company_facilities
(
    id_facility serial NOT NULL,
    id_user int NOT NULL,
    id_city int NOT NULL,
    CONSTRAINT PK_32 PRIMARY KEY (id_facility),
    CONSTRAINT FK_40 FOREIGN KEY (id_user) REFERENCES "public".users_employers (id_user),
    CONSTRAINT FK_41 FOREIGN KEY (id_city) REFERENCES "public".cities (id_city)
);

CREATE INDEX FK_21 ON "public".company_facilities
(
 id_user
);

CREATE INDEX FK_22 ON "public".company_facilities
(
 id_city
);

/*
 * CREACIÓN DE ENTIDADES RELACIONADAS CON LAS OFERTAS DE EMPLEO
 */
-- ************************************** "public".vacancies_type
CREATE TABLE "public".vacancies_type
(
 id_vacancy_type serial NOT NULL,
 type            varchar(50) NOT NULL,
 CONSTRAINT PK_19 PRIMARY KEY ( id_vacancy_type )
);

-- ************************************** "public".vacancies
CREATE TYPE vacancy_status AS ENUM('Open', 'Closed');

-- ************************************** "public".vacancies
CREATE TABLE "public".vacancies
(
 id_vacancy            serial NOT NULL,
 title                 varchar(250) NOT NULL,
 description           text NOT NULL,
 open_positions        integer NOT NULL,
 publication_date      timestamptz NOT NULL DEFAULT current_timestamp,
 work_experience_years numeric NOT NULL,
 vacancy_status        vacancy_status NOT NULL,
 published_by          int NOT NULL,
 id_city               int NULL,
 CONSTRAINT PK_15 PRIMARY KEY ( id_vacancy ),
 CONSTRAINT FK_45 FOREIGN KEY ( id_city ) REFERENCES "public".cities ( id_city ),
 CONSTRAINT FK_39 FOREIGN KEY ( published_by ) REFERENCES "public".users_employers ( id_user ),
 CONSTRAINT chk_publication_date CHECK (publication_date = current_timestamp)
);

CREATE INDEX FK_23 ON "public".vacancies
(
 id_city
);

CREATE INDEX FK_24 ON "public".vacancies
(
 published_by
);

-- ************************************** "public".vacancies_workday_type
CREATE TABLE "public".vacancies_workday_type
(
 id_workday_type serial NOT NULL,
 workday_type    varchar(25)  NOT NULL,
 CONSTRAINT PK_16 PRIMARY KEY ( id_workday_type )
);

-- ************************************** "public".vacancies_contract_type
CREATE TABLE "public".vacancies_contract_type
(
 id_contract_type serial NOT NULL,
 contract_type    varchar(25) NOT NULL,
 CONSTRAINT PK_18 PRIMARY KEY ( id_contract_type )
);

-- ************************************** "public".vacancies_categories
CREATE TABLE "public".vacancies_categories
(
 id_vacancy_category serial NOT NULL,
 job_name            varchar(250) NOT NULL,
 CONSTRAINT PK_17 PRIMARY KEY ( id_vacancy_category )
);

-- ************************************** "public".vacancies_properties
CREATE TABLE "public".vacancies_properties
(
 id_vacancy          int NOT NULL,
 id_workday_type     int NOT NULL,
 id_vacancy_category int NOT NULL,
 id_contract_type    int NOT NULL,
 id_vacancy_type     int NOT NULL,
 CONSTRAINT PK_35 PRIMARY KEY ( id_vacancy ),
 CONSTRAINT FK_44 FOREIGN KEY ( id_vacancy ) REFERENCES "public".vacancies ( id_vacancy ),
 CONSTRAINT FK_41_1 FOREIGN KEY ( id_workday_type ) REFERENCES "public".vacancies_workday_type ( id_workday_type ),
 CONSTRAINT FK_42_1 FOREIGN KEY ( id_vacancy_category ) REFERENCES "public".vacancies_categories ( id_vacancy_category ),
 CONSTRAINT FK_43_1 FOREIGN KEY ( id_contract_type ) REFERENCES "public".vacancies_contract_type ( id_contract_type ),
 CONSTRAINT FK_44_1 FOREIGN KEY ( id_vacancy_type ) REFERENCES "public".vacancies_type ( id_vacancy_type )
);

CREATE INDEX FK_25 ON "public".vacancies_properties
(
 id_vacancy
);

CREATE INDEX FK_26 ON "public".vacancies_properties
(
 id_workday_type
);

CREATE INDEX FK_27 ON "public".vacancies_properties
(
 id_vacancy_category
);

CREATE INDEX FK_28 ON "public".vacancies_properties
(
 id_contract_type
);

CREATE INDEX FK_29 ON "public".vacancies_properties
(
 id_vacancy_type
);

-- ************************************** "public".vacancies_salaries
CREATE TABLE "public".vacancies_salaries
(
    id_vacancy     int NOT NULL,
    minimum_salary money NULL,
    maximum_salary money NULL,
    CONSTRAINT PK_24 PRIMARY KEY (id_vacancy),
    CONSTRAINT FK_26 FOREIGN KEY (id_vacancy) REFERENCES "public".vacancies (id_vacancy),
    CONSTRAINT chk_salary_value CHECK (minimum_salary <= maximum_salary)
);


CREATE INDEX FK_30 ON "public".vacancies_salaries
(
 id_vacancy
);

/*
 * CREACIÓN DE ENTIDADES RELACIONADAS CON LAS APLICACIONES
 * Y PREFERENCIAS DE LOS CANDIDATOS
 */
-- ************************************** "public".entry_applications
CREATE TYPE application_status AS ENUM('Waiting', 'Accepted', 'Rejected');

CREATE TABLE "public".entry_applications
(
 id_entry_application serial NOT NULL,
 applied_date         timestamptz NOT NULL DEFAULT current_timestamp,
 application_status   application_status NOT NULL,
 id_user              int NOT NULL,
 id_vacancy           int NOT NULL,
 CONSTRAINT PK_21 PRIMARY KEY ( id_entry_application ),
 CONSTRAINT FK_22 FOREIGN KEY ( id_user ) REFERENCES "public".users_candidates ( id_user ),
 CONSTRAINT FK_23 FOREIGN KEY ( id_vacancy ) REFERENCES "public".vacancies ( id_vacancy ),
 CONSTRAINT unique_user_vacancy_entry UNIQUE (id_user, id_vacancy),
 CONSTRAINT chk_applied_date CHECK (applied_date = current_timestamp)
);

CREATE INDEX FK_31 ON "public".entry_applications
(
 id_user
);

CREATE INDEX FK_32 ON "public".entry_applications
(
 id_vacancy
);

-- ************************************** "public".candidates_preferences
CREATE TABLE "public".candidates_preferences
(
 id_preference serial NOT NULL,
 salary        money NOT NULL,
 id_user       int NOT NULL,
 CONSTRAINT PK_22 PRIMARY KEY ( id_preference ),
 CONSTRAINT FK_27 FOREIGN KEY ( id_user ) REFERENCES "public".users_candidates ( id_user )
);

CREATE INDEX FK_33 ON "public".candidates_preferences
(
 id_user
);

-- ************************************** "public".candidates_preferences_categories
CREATE TABLE "public".candidates_preferences_categories
(
 id_preference_category serial NOT NULL,
 id_preference          int NOT NULL,
 id_vacancy_category    int NOT NULL,
 CONSTRAINT PK_26 PRIMARY KEY ( id_preference_category ),
 CONSTRAINT FK_30 FOREIGN KEY ( id_preference ) REFERENCES "public".candidates_preferences ( id_preference ),
 CONSTRAINT FK_31 FOREIGN KEY ( id_vacancy_category ) REFERENCES "public".vacancies_categories ( id_vacancy_category )
);

CREATE INDEX FK_34 ON "public".candidates_preferences_categories
(
 id_preference
);

CREATE INDEX FK_35 ON "public".candidates_preferences_categories
(
 id_vacancy_category
);

-- ************************************** "public".candidates_preferences_contract_type
CREATE TABLE "public".candidates_preferences_contract_type
(
 id_preference_contract_type serial NOT NULL,
 id_preference               int NOT NULL,
 id_contract_type            int NOT NULL,
 CONSTRAINT PK_27 PRIMARY KEY ( id_preference_contract_type ),
 CONSTRAINT FK_32 FOREIGN KEY ( id_preference ) REFERENCES "public".candidates_preferences ( id_preference ),
 CONSTRAINT FK_33 FOREIGN KEY ( id_contract_type ) REFERENCES "public".vacancies_contract_type ( id_contract_type )
);

CREATE INDEX FK_36 ON "public".candidates_preferences_contract_type
(
 id_preference
);

CREATE INDEX FK_37 ON "public".candidates_preferences_contract_type
(
 id_contract_type
);

-- ************************************** "public".candidates_preferences_provinces
CREATE TABLE "public".candidates_preferences_provinces
(
 id_preference_province serial NOT NULL,
 id_preference          int NOT NULL,
 id_province            int NOT NULL,
 CONSTRAINT PK_23 PRIMARY KEY ( id_preference_province ),
 CONSTRAINT FK_24 FOREIGN KEY ( id_preference ) REFERENCES "public".candidates_preferences ( id_preference ),
 CONSTRAINT FK_27_2 FOREIGN KEY ( id_province ) REFERENCES "public".provinces ( id_province )
);

CREATE INDEX FK_38 ON "public".candidates_preferences_provinces
(
 id_preference
);

CREATE INDEX FK_39 ON "public".candidates_preferences_provinces
(
 id_province
);

-- ************************************** "public".candidates_preferences_types
CREATE TABLE "public".candidates_preferences_types
(
 id_preference_type serial NOT NULL,
 id_preference      int NOT NULL,
 id_vacancy_type    int NOT NULL,
 CONSTRAINT PK_28 PRIMARY KEY ( id_preference_type ),
 CONSTRAINT FK_34 FOREIGN KEY ( id_preference ) REFERENCES "public".candidates_preferences ( id_preference ),
 CONSTRAINT FK_35 FOREIGN KEY ( id_vacancy_type ) REFERENCES "public".vacancies_type ( id_vacancy_type )
);

CREATE INDEX FK_40 ON "public".candidates_preferences_types
(
 id_preference
);

CREATE INDEX FK_41 ON "public".candidates_preferences_types
(
 id_vacancy_type
);

-- ************************************** "public".candidates_preferences_workday_type
CREATE TABLE "public".candidates_preferences_workday_type
(
 id_preference_workday_type serial NOT NULL,
 id_preference              int NOT NULL,
 id_workday_type            int NOT NULL,
 CONSTRAINT PK_25 PRIMARY KEY ( id_preference_workday_type ),
 CONSTRAINT FK_28 FOREIGN KEY ( id_preference ) REFERENCES "public".candidates_preferences ( id_preference ),
 CONSTRAINT FK_29 FOREIGN KEY ( id_workday_type ) REFERENCES "public".vacancies_workday_type ( id_workday_type )
);

CREATE INDEX FK_42 ON "public".candidates_preferences_workday_type
(
 id_preference
);

CREATE INDEX FK_43 ON "public".candidates_preferences_workday_type
(
 id_workday_type
);

/*
 * CREACIÓN DE LA TABLA PARA EMPRESAS DE RECLUTAMIENTO
 */
-- ************************************** "public".recruitment_companies
CREATE TABLE "public".recruitment_companies
(
 id_recruitment_company serial NOT NULL,
 id_user                int NOT NULL,
 CONSTRAINT PK_30 PRIMARY KEY ( id_recruitment_company ),
 CONSTRAINT FK_37 FOREIGN KEY ( id_user ) REFERENCES "public".users_employers ( id_user )
);

CREATE INDEX FK_44 ON "public".recruitment_companies
(
 id_user
);

/*
 * CREACIÓN DE LA TABLA PARA AUDITORIAS DE ADMINISTRACIÓN
 */
 -- ************************************** "public".audit_logs
CREATE TABLE "public".audit_logs
(
 id_log            serial NOT NULL,
 event_name        varchar(25) NOT NULL,
 event_description text NOT NULL,
 "table_name"      text NOT NULL,
 event_date        timestamptz NOT NULL DEFAULT current_timestamp,
 id_trigger_user   int NOT NULL,
 CONSTRAINT PK_34 PRIMARY KEY ( id_log ),
 CONSTRAINT FK_43 FOREIGN KEY ( id_trigger_user ) REFERENCES "public".users_admin ( id_user ),
 CONSTRAINT chk_event_date CHECK (event_date = current_timestamp)
);

CREATE INDEX FK_45 ON "public".audit_logs
(
 id_trigger_user
);