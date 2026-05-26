CREATE TABLE IF NOT EXISTS it.t_corporative_access(
    id                  INT                  NOT NULL,
    access_period       TSTZRANGE            NOT NULL,
    status              corpaccess_status    NOT NULL,
    created_at          TIMESTAMPTZ          NOT NULL,

    --FK
    employee_id         INT                  NOT NULL,
    access_profile_id    SMALLINT            NOT NULL
);

ALTER TABLE it.t_corporative_access
    ADD CONSTRAINT it_t_corporative_access_pk
    PRIMARY KEY(id);

ALTER TABLE it.t_corporative_access
    ADD CONSTRAINT it_t_corporative_access_ck_access_period
    CHECK(
        LOWER(access_period) < UPPER(access_period)
    );

ALTER TABLE it.t_corporative_access
    ALTER COLUMN created_at
        SET DEFAULT CURRENT_TIMESTAMP(0);