CREATE TABLE IF NOT EXISTS hr.t_positions(
    id          SMALLINT            NOT NULL,
    name        VARCHAR(60)         NOT NULL,
    description VARCHAR(2000)       NOT NULL
    created_at  TIMESTAMPTZ         NOT NULL
);

ALTER TABLE hr.t_positions 
        ADD CONSTRAINT hr_t_positions_pk 
        PRIMARY KEY(id);

ALTER TABLE hr.t_positions 
        ADD CONSTRAINT hr_t_positions_uq_name 
        UNIQUE(name);

ALTER TABLE hr.t_positions 
        ADD CONSTRAINT hr_t_positions_check_name 
        CHECK(
            LENGTH(name) > 3 --pelo pesquisado não possui cargos menores do que 4 caracteres
            AND
            name ~* '^[^ ]{1}(?!.*  )[a-záàâãèéêìíîóòôôúùû ]{1,}[^ ]{1}$'
        );

ALTER TABLE hr.t_positions
        ALTER COLUMN created_at
            SET DEFAULT CURRENT_TIMESTAMP(0);
