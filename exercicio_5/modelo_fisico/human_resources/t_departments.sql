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

ALTER TABLE hr.t_departments
        ADD CONSTRAINT hr_t_departments_pk 
        PRIMARY KEY(id);

ALTER TABLE hr.t_departments
        ADD CONSTRAINT hr_t_departments_uq_name
        UNIQUE(name);

ALTER TABLE hr.t_departments
        ADD CONSTRAINT hr_t_departments_uq_acronym
        UNIQUE(acronym);

ALTER TABLE hr.t_departments
        ADD CONSTRAINT hr_t_departments_check_name
        CHECK(
            LENGTH(name) > 3 --pelo pesquisado não possui cargos menores do que 4 caracteres
            AND
            name ~* '^[^ ]{1}(?!.*  )[a-záàâãèéêìíîóòôôúùû ]{1,}[^ ]{1}$'
        );

ALTER TABLE hr.t_departments
        ADD CONSTRAINT hr_t_departments_check_name
        CHECK(
            LENGTH(name) > 3 --pelo pesquisado não possui cargos menores do que 4 caracteres
            AND
            name ~* '^[^ ]{1}(?!.*  )[a-záàâãèéêìíîóòôôúùû ]{1,}[^ ]{1}$'
        );

ALTER TABLE it.t_departments
        ALTER COLUMN created_at
            SET DEFAULT CURRENT_TIMESTAMP(0);

--Relationships
        ALTER TABLE hr.t_departments
                ADD CONSTRAINT hr_t_departments_fk_department_head
                FOREIGN KEY(department_head)
                        REFERENCES hr.t_employees(id) DEFERRABLE INITIALLY IMMEDIATE
                        --QUESTIONAR SOBRE O USO DO '...IMMEDIATE' e do '...DEFERRABLE'