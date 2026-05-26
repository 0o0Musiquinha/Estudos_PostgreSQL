CREATE TABLE IF NOT EXISTS finances.t_payrolls(
    id              INT             NOT NULL,
    employee_title  VARCHAR(60)     NOT NULL,
    payment_day     TIMESTAMPTZ     NOT NULL,
    gross_salary    DECIMAL(8,2)    NOT NULL,
    deduction       DECIMAL(8,2)    NOT NULL,
    net_salary      DECIMAL(8,2)    NOT NULL -- possibilidade: GENERATED ALWAYS AS (gross_salary - deduction),
    status          payroll_status  NOT NULL,
    created_at      TIMESTAMPTZ     NOT NULL,

    --FK
    employee_id     INT             NOT NULL
);

ALTER TABLE finances.t_payrolls
    ADD CONSTRAINT finances_t_payrolls_pk 
    PRIMARY KEY(id);

ALTER TABLE finances.t_payrolls
    ADD CONSTRAINT finances_t_payrolls_ck_employee_title
    CHECK(
        name ~* '^[^ ]{1}(?!.*  )[a-záàâãèéêìíîóòôôúùû ]{1,}[^ ]{1}$'
    );

ALTER TABLE finances.t_payrolls
        ALTER COLUMN created_at
            SET DEFAULT CURRENT_TIMESTAMP(0);