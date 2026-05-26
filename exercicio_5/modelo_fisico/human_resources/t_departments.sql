CREATE TABLE IF NOT EXISTS ht.t_departments (
    id              SMALLINT            NOT NULL,
    name            VARCHAR(60)         NOT NULL,
    acronym         VARCHAR(10)         NOT NULL,
    monthly_budget  DECIMAL(11,2)       NOT NULL,
    status          department_status   NOT NULL,
    created_at      TIMESTAMPTZ         NOT NULL,
    
    --FK
    department_head INT                 NOT NULL

);