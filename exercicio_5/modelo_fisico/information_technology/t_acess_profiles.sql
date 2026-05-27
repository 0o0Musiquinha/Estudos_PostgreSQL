CREATE TABLE IF NOT EXISTS it.t_access_profiles (
    id          SMALLINT        NOT NULL,
    name        VARCHAR(30)     NOT NULL,
    access_level SMALLINT        NOT NULL,
    description VARCHAR(2000)   NOT NULL,
    status      accesspro_status NOT NULL,
    created_at  TIMESTAMPTZ     NOT NULL
);
ALTER TABLE it.t_access_profiles
    ADD CONSTRAINT it_t_access_profiles_pk
    PRIMARY KEY(id);

ALTER TABLE it.t_access_profiles
    ADD CONSTRAINT it_t_access_profiles_uq_name
    UNIQUE(name);

ALTER TABLE it.t_access_profiles
    ADD CONSTRAINT it_t_access_profiles_ck_name
    CHECK(
        name ~* '^[^ ]{1}(?!.*  )[a-záàâãèéêìíîóòôôúùû ]{1,}[^ ]{1}$'
    );

ALTER TABLE it.t_access_profiles
    ALTER COLUMN created_at
        SET DEFAULT CURRENT_TIMESTAMP(0);