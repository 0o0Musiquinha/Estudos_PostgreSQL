CREATE TABLE IF NOT EXISTS exercicio5_it.t_corporative_access(
    id                  INT                  NOT NULL,
    access_period       TSTZRANGE            NOT NULL,
    status              exercicio5_it.corpaccess_status    NOT NULL,
    created_at          TIMESTAMPTZ          NOT NULL,

    --FK
    employee_id         INT                  NOT NULL,
    access_profile_id    SMALLINT            NOT NULL
);

ALTER TABLE exercicio5_it.t_corporative_access
    ADD CONSTRAINT exercicio5_it_t_corporative_access_pk
    PRIMARY KEY(id);

ALTER TABLE exercicio5_it.t_corporative_access
    ADD CONSTRAINT exercicio5_it_t_corporative_access_ck_access_period
    CHECK(
        LOWER(access_period) < UPPER(access_period)
    );

ALTER TABLE exercicio5_it.t_corporative_access
    ALTER COLUMN created_at
        SET DEFAULT CURRENT_TIMESTAMP(0);

--Relationships
    ALTER TABLE exercicio5_it.t_corporative_access
        ADD CONSTRAINT exercicio5_it_t_corporative_access_fk_employee_id
        FOREIGN KEY(employee_id)
            REFERENCES exercicio5_hr.t_employees(id);
            
    ALTER TABLE exercicio5_it.t_corporative_access
        ADD CONSTRAINT exercicio5_it_t_corporative_access_fk_acces_profile_id
        FOREIGN KEY(access_profile_id)
            REFERENCES exercicio5_it.t_access_profiles(id);