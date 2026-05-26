--t_payrolls
    CREATE SEQUENCE IF NOT EXISTS it.it_t_payrolls_id_seq
        AS INT
        START WITH 1 
        INCREMENT BY 1
        OWNED BY it.t_payrolls.id;

    --Define como padrão para a tabela
    ALTER TABLE it.t_payrolls
        ALTER COLUMN id 
            SET DEFAULT nextval('it.it_t_payrolls_id_seq');

--t_reimbursements
    CREATE SEQUENCE IF NOT EXISTS it.it_t_reimbursements_id_seq
        AS INT
        START WITH 1 
        INCREMENT BY 1
        OWNED BY it.t_reimbursements.id;

    --Define como padrão para a tabela
    ALTER TABLE it.t_reimbursements
        ALTER COLUMN id 
            SET DEFAULT nextval('it.it_t_reimbursements_id_seq');