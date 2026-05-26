--t_positions
    CREATE SEQUENCE IF NOT EXISTS it.it_t_positions_id_seq
        AS INT
        START WITH 1 
        INCREMENT BY 1
        OWNED BY it.t_positions.id;

    --Define como padrão para a tabela
    ALTER TABLE it.t_positions
        ALTER COLUMN id 
            SET DEFAULT nextval('it.it_t_positions_id_seq');

--t_employees
    CREATE SEQUENCE IF NOT EXISTS it.it_t_employees_id_seq
        AS INT
        START WITH 1 
        INCREMENT BY 1
        OWNED BY it.t_employees.id;

    --Define como padrão para a tabela
    ALTER TABLE it.t_employees
        ALTER COLUMN id 
            SET DEFAULT nextval('it.it_t_employees_id_seq');

--t_departments
    CREATE SEQUENCE IF NOT EXISTS it.it_t_departments_id_seq
        AS INT
        START WITH 1 
        INCREMENT BY 1
        OWNED BY it.t_departments.id;

    --Define como padrão para a tabela
    ALTER TABLE it.t_departments
        ALTER COLUMN id 
            SET DEFAULT nextval('it.it_t_departments_id_seq');

--t_movements_history
    CREATE SEQUENCE IF NOT EXISTS it.it_t_movements_history_id_seq
        AS INT
        START WITH 1 
        INCREMENT BY 1
        OWNED BY it.t_movements_history.id;

    --Define como padrão para a tabela
    ALTER TABLE it.t_movements_history
        ALTER COLUMN id 
            SET DEFAULT nextval('it.it_t_movements_history_id_seq');