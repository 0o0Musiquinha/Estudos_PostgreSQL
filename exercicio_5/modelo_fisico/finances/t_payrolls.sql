CREATE TABLE IF NOT EXISTS exercicio5_finances.t_payrolls(
    id              INT                                 NOT NULL,
    employee_title  VARCHAR(60)                         NOT NULL,
    payment_day     TIMESTAMPTZ                         NOT NULL,
    gross_salary    DECIMAL(8,2)                        NOT NULL,
    deduction       DECIMAL(8,2)                        NOT NULL,
    net_salary      DECIMAL(8,2)                        NOT NULL    GENERATED ALWAYS AS (
        gross_salary - deduction
    ) STORED, -- possibilidade: GENERATED ALWAYS AS (gross_salary - deduction),
    status          exercicio5_finances.payroll_status  NOT NULL,
    created_at      TIMESTAMPTZ                         NOT NULL,

    --FK
    employee_id     INT                                 NOT NULL
);

ALTER TABLE exercicio5_finances.t_payrolls
    ADD CONSTRAINT exercicio5_finances_t_payrolls_pk 
    PRIMARY KEY(id);

ALTER TABLE exercicio5_finances.t_payrolls
    ADD CONSTRAINT exercicio5_finances_t_payrolls_ck_employee_title
    CHECK(
        employee_title ~* '^\S(?!.*\s{2,})[a-záàâãèéêìíîóòôôúùû ]+\S$'
    );

ALTER TABLE exercicio5_finances.t_payrolls
    ADD CONSTRAINT exercicio5_finances_t_payrolls_ck_payment_day
    CHECK(
        payment_day >= CURRENT_TIMESTAMP(0)
    );

ALTER TABLE exercicio5_finances.t_payrolls
    ADD CONSTRAINT exercicio5_finances_t_payrolls_ck_gross_salary
    CHECK(
        gross_salary >= 1621.00
    );

ALTER TABLE exercicio5_finances.t_payrolls
    ADD CONSTRAINT exercicio5_finances_t_payrolls_ck_deduction
    CHECK(
        deduction >= 0
    );

ALTER TABLE exercicio5_finances.t_payrolls
    ALTER COLUMN created_at
        SET DEFAULT CURRENT_TIMESTAMP(0);

--Relationships
    ALTER TABLE exercicio5_finances.t_payrolls
        ADD CONSTRAINT exercicio5_finances_t_payrolls_fk_employee_id 
        FOREIGN KEY(employee_id)
            REFERENCES exercicio5_hr.t_employees(id);