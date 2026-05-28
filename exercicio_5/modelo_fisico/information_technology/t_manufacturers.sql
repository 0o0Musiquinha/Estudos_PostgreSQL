CREATE TABLE IF NOT EXISTS exercicio5_it.t_manufacturers (
    id          SMALLINT        NOT NULL,
    name        VARCHAR(60)     NOT NULL,
    created_at  TIMESTAMPTZ     NOT NULL
);

ALTER TABLE exercicio5_it.t_manufacturers
    ADD CONSTRAINT exercicio5_it_t_manufacturers_pk 
    PRIMARY KEY(id);

ALTER TABLE exercicio5_it.t_manufacturers
    ADD CONSTRAINT exercicio5_it_t_manufacturers_uq_name 
    UNIQUE(name);

ALTER TABLE exercicio5_it.t_manufacturers 
    ADD CONSTRAINT exercicio5_it_t_manufacturers_ck_name
    CHECK(
        name ~* '^[^ ]{1}(?!.*  )[a-záàâãèéêìíîóòôôúùû ]{1,}[^ ]{1}$'
    );

ALTER TABLE exercicio5_it.t_manufacturers
    ALTER COLUMN created_at
        SET DEFAULT CURRENT_TIMESTAMP(0);