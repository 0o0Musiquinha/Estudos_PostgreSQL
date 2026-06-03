CREATE TABLE IF NOT EXISTS exercicio5_hr.t_employees (
    id              SMALLINT                        NOT NULL,
    employee_code   VARCHAR(11)                     NOT NULL,
    name            VARCHAR(120)                    NOT NULL,
    pis             VARCHAR(11)                     NOT NULL,
    employee_email  VARCHAR(254)                    NOT NULL,
    phonenumber     VARCHAR(11)                     NOT NULL,
    base_salary     DECIMAL(8,2)                    NOT NULL,
    status          exercicio5_hr.employee_status   NOT NULL,
    created_at      TIMESTAMPTZ                     NOT NULL,

    -- FK
    department_id   SMALLINT                        NOT NULL,
    position_id     SMALLINT                        NOT NULL

);

ALTER TABLE exercicio5_hr.t_employees
    ADD CONSTRAINT exercicio5_hr_t_employees_pk 
    PRIMARY KEY(id);

ALTER TABLE exercicio5_hr.t_employees
    ADD CONSTRAINT exercicio5_hr_t_employees_uq_employee_code
    UNIQUE(employee_code);

ALTER TABLE exercicio5_hr.t_employees
    ADD CONSTRAINT exercicio5_hr_t_employees_uq_employee_pis
    UNIQUE(pis);

ALTER TABLE exercicio5_hr.t_employees
    ADD CONSTRAINT exercicio5_hr_t_employees_uq_employee_email
    UNIQUE(employee_email);

ALTER TABLE exercicio5_hr.t_employees 
    ADD CONSTRAINT exercicio5_hr_t_employees_ck_employee_code
    CHECK(
        employee_code ~ '^[A-Z]{3}[0-9]{9}$'
    );

ALTER TABLE exercicio5_hr.t_employees 
    ADD CONSTRAINT exercicio5_hr_t_employees_ck_name
    CHECK(
        LENGTH(name) > 3 --pelo pesquisado não possui cargos menores do que 4 caracteres
        AND
        name ~* '^\S(?!.*\s{2,})[a-záàâãèéêìíîóòôôúùû ]+\S$'
    );

ALTER TABLE exercicio5_hr.t_employees 
    ADD CONSTRAINT exercicio5_hr_t_employees_ck_pis
    CHECK(
        exercicio5_hr.is_valid_pis(pis)
    );

ALTER TABLE exercicio5_hr.t_employees
    ADD CONSTRAINT exercicio5_hr_t_employees_ck_employee_email
    CHECK(
        employee_email ~ '^[^.]{1}(?!.*\.\.)[A-Za-z0-9._%+-]{0,62}[^.]{1}@(?!.*\.\.)[^._%+-]{1}[A-Za-z0-9.-]{0,190}\..*[^._%+-]{1}$'
    );

ALTER TABLE exercicio5_hr.t_employees
    ADD CONSTRAINT exercicio5_hr_t_employees_ck_phonenumber
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

ALTER TABLE exercicio5_hr.t_employees
    ADD CONSTRAINT exercicio5_hr_t_departments_ck_base_salary
    CHECK(
        base_salary >= 1621.00
    );

ALTER TABLE exercicio5_hr.t_employees
    ALTER COLUMN created_at
        SET DEFAULT CURRENT_TIMESTAMP(0);

--Relationships
    ALTER TABLE exercicio5_hr.t_employees
        ADD CONSTRAINT exercicio5_hr_t_employess_fk_position_id
        FOREIGN KEY(position_id)
            REFERENCES exercicio5_hr.t_positions(id);
    ALTER TABLE exercicio5_hr.t_employees
        ADD CONSTRAINT exercicio5_hr_t_employess_fk_department_id
        FOREIGN KEY(department_id)
            REFERENCES exercicio5_hr.t_departments(id) DEFERRABLE INITIALLY IMMEDIATE;