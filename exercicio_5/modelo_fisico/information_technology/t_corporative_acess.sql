CREATE TABLE IF NOT EXISTS it.t_corporative_access(
    id                  INT                 NOT NULL,
    activation_date     TIMESTAMPTZ         NOT NULL,
    expiration_date     TIMESTAMPTZ         NOT NULL,
    status              corpaccess_status    NOT NULL,
    created_at          TIMESTAMPTZ         NOT NULL,

    --FK
    employee_id         INT                 NOT NULL,
    access_profile_id    SMALLINT            NOT NULL
);