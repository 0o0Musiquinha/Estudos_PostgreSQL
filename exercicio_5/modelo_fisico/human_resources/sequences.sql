--t_positions
    CREATE SEQUENCE IF NOT EXISTS exercicio5_hr.exercicio5_hr_t_positions_id_seq
        AS INT
        START WITH 1 
        INCREMENT BY 1
        OWNED BY exercicio5_hr.t_positions.id;

    --Define como padrão para a tabela
    ALTER TABLE exercicio5_hr.t_positions
        ALTER COLUMN id 
            SET DEFAULT nextval('exercicio5_hr.exercicio5_hr_t_positions_id_seq');

--t_employees
    CREATE SEQUENCE IF NOT EXISTS exercicio5_hr.exercicio5_hr_t_employees_id_seq
        AS INT
        START WITH 1 
        INCREMENT BY 1
        OWNED BY exercicio5_hr.t_employees.id;

    --Define como padrão para a tabela
    ALTER TABLE exercicio5_hr.t_employees
        ALTER COLUMN id 
            SET DEFAULT nextval('exercicio5_hr.exercicio5_hr_t_employees_id_seq');

--t_departments
    CREATE SEQUENCE IF NOT EXISTS exercicio5_hr.exercicio5_hr_t_departments_id_seq
        AS INT
        START WITH 1 
        INCREMENT BY 1
        OWNED BY exercicio5_hr.t_departments.id;

    --Define como padrão para a tabela
    ALTER TABLE exercicio5_hr.t_departments
        ALTER COLUMN id 
            SET DEFAULT nextval('exercicio5_hr.exercicio5_hr_t_departments_id_seq');

--t_movements_history
    CREATE SEQUENCE IF NOT EXISTS exercicio5_hr.exercicio5_hr_t_movements_history_id_seq
        AS INT
        START WITH 1 
        INCREMENT BY 1
        OWNED BY exercicio5_hr.t_movements_history.id;

    --Define como padrão para a tabela
    ALTER TABLE exercicio5_hr.t_movements_history
        ALTER COLUMN id 
            SET DEFAULT nextval('exercicio5_hr.exercicio5_hr_t_movements_history_id_seq');