--t_payrolls
    CREATE SEQUENCE IF NOT EXISTS exercicio5_finances.exercicio5_finances_t_payrolls_id_seq
        AS INT
        START WITH 1 
        INCREMENT BY 1
        OWNED BY exercicio5_finances.t_payrolls.id;

    --Define como padrão para a tabela
    ALTER TABLE exercicio5_finances.t_payrolls
        ALTER COLUMN id 
            SET DEFAULT nextval('exercicio5_finances.exercicio5_finances_t_payrolls_id_seq');

--t_reimbursements
    CREATE SEQUENCE IF NOT EXISTS exercicio5_finances.exercicio5_finances_t_reimbursements_id_seq
        AS INT
        START WITH 1 
        INCREMENT BY 1
        OWNED BY exercicio5_finances.t_reimbursements.id;

    --Define como padrão para a tabela
    ALTER TABLE exercicio5_finances.t_reimbursements
        ALTER COLUMN id 
            SET DEFAULT nextval('exercicio5_finances.exercicio5_finances_t_reimbursements_id_seq');