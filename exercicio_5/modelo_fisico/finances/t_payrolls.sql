CREATE TABLE IF NOT EXISTS finances.t_payrolls(
    id              INT             NOT NULL,
    employee_title  VARCHAR(60)     NOT NULL,
    payment_day     TIMESTAMPTZ     NOT NULL,
    gross_salary    DECIMAL(8,2)    NOT NULL,
    deduction       DECIMAL(8,2)    NOT NULL,
    net_salary      DECIMAL(8,2)    NOT NULL,
    status          payroll_status  NOT NULL,
    created_at      TIMESTAMPTZ     NOT NULL,

    --FK
    employee_id     INT             NOT NULL
);