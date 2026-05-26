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