CREATE TABLE IF NOT EXISTS hr.t_employees (
    id              SMALLINT        NOT NULL,
    employee_code   VARCHAR(11)     NOT NULL,
    name            VARCHAR(120)    NOT NULL,
    pis             VARCHAR(11)     NOT NULL,
    employee_email  VARCHAR(254)    NOT NULL,
    phonenumber     VARCHAR(11)     NOT NULL,
    base_salary     DECIMAL(8,2)    NOT NULL,
    status          employee_status NOT NULL,
    created_at      TIMESTAMPTZ     NOT NULL,

    -- FK
    department_id   SMALLINT        NOT NULL,
    position_id     SMALLINT        NOT NULL

);

ALTER TABLE hr.t_employees
    ADD CONSTRAINT hr_t_employees_pk 
    PRIMARY KEY(id);

ALTER TABLE hr.t_employees
    ADD CONSTRAINT hr_t_employees_uq_employee_code
    UNIQUE(employee_code);

ALTER TABLE hr.t_employees
    ADD CONSTRAINT hr_t_employees_uq_employee_pis
    UNIQUE(pis);

ALTER TABLE hr.t_employees
    ADD CONSTRAINT hr_t_employees_uq_employee_email
    UNIQUE(employee_email);

ALTER TABLE hr.t_employees 
    ADD CONSTRAINT hr_t_employees_ck_name
    CHECK(
        LENGTH(name) > 3 --pelo pesquisado não possui cargos menores do que 4 caracteres
        AND
        name ~* '^[^ ]{1}(?!.*  )[a-záàâãèéêìíîóòôôúùû ]{1,}[^ ]{1}$'
    );

ALTER TABLE hr.t_employees
    ADD CONSTRAINT hr_t_employees_ck_email
    CHECK(
        email ~ '^[^.]{1}(?!.*\.\.)[A-Za-z0-9._%+-]{0,62}[^.]{1}@(?!.*\.\.)[^._%+-]{1}[A-Za-z0-9.-]{0,252}\..*[^._%+-]{1}$'
    );

ALTER TABLE hr.t_employees
    ADD CONSTRAINT hr_t_employees_ck_phonenumber
    CHECK(
        (
            LENGTH(phonenumber) = 11
            AND
            phonenumber ~ '^[1-9]{2}9[0-9]{8}$'
        )
        OR
        (
            LENGTH(phonenumber) = 10
            AND
            phonenumber ~ '^[1-9]{2}[2-5]{1}[0-9]{7}$'
        )
    );  

ALTER TABLE it.t_employees
    ALTER COLUMN created_at
        SET DEFAULT CURRENT_TIMESTAMP(0);


