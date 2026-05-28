--t_manufacturers
    CREATE SEQUENCE IF NOT EXISTS exercicio5_it.exercicio5_it_t_manufacturers_id_seq
        AS SMALLINT
        START WITH 1 
        INCREMENT BY 1
        OWNED BY exercicio5_it.t_manufacturers.id;

    --Define como padrão para a tabela
    ALTER TABLE exercicio5_it.t_manufacturers
        ALTER COLUMN id 
            SET DEFAULT nextval('exercicio5_it.exercicio5_it_t_manufacturers_id_seq');

--t_access_profiles
    CREATE SEQUENCE IF NOT EXISTS exercicio5_it.exercicio5_it_t_access_profiles_id_seq
        AS INT
        START WITH 1 
        INCREMENT BY 1
        OWNED BY exercicio5_it.t_access_profiles.id;

    --Define como padrão para a tabela
    ALTER TABLE exercicio5_it.t_access_profiles
        ALTER COLUMN id 
            SET DEFAULT nextval('exercicio5_it.exercicio5_it_t_access_profiles_id_seq');

--t_corporative_access
    CREATE SEQUENCE IF NOT EXISTS exercicio5_it.exercicio5_it_t_corporative_access_id_seq
        AS INT
        START WITH 1 
        INCREMENT BY 1
        OWNED BY exercicio5_it.t_corporative_access.id;

    --Define como padrão para a tabela
    ALTER TABLE exercicio5_it.t_corporative_access
        ALTER COLUMN id 
            SET DEFAULT nextval('exercicio5_it.exercicio5_it_t_corporative_access_id_seq');

--t_equipments
    CREATE SEQUENCE IF NOT EXISTS exercicio5_it.exercicio5_it_t_equipments_id_seq
        AS INT
        START WITH 1 
        INCREMENT BY 1
        OWNED BY exercicio5_it.t_equipments.id;

    --Define como padrão para a tabela
    ALTER TABLE exercicio5_it.t_equipments
        ALTER COLUMN id 
            SET DEFAULT nextval('exercicio5_it.exercicio5_it_t_equipments_id_seq');

--t_equipments_allocation
    CREATE SEQUENCE IF NOT EXISTS exercicio5_it.exercicio5_it_t_equipments_allocations_id_seq
        AS INT
        START WITH 1 
        INCREMENT BY 1
        OWNED BY exercicio5_it.t_equipments_allocations.id;

    --Define como padrão para a tabela
    ALTER TABLE exercicio5_it.t_equipments_allocations
        ALTER COLUMN id 
            SET DEFAULT nextval('exercicio5_it.exercicio5_it_t_equipments_allocations_id_seq');
