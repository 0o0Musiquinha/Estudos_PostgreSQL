CREATE TABLE IF NOT EXISTS finances.t_reimbursements (
    id INT NOT NULL,
    value DECIMAL(8,2) NOT NULL,
    description VARCHAR(2000) NOT NULL,
    status reimbursement_status NOT NULL
);