CREATE TABLE IF NOT EXISTS finances.t_reimbursements (
    id INT NOT NULL,
    value DECIMAL(8,2) NOT NULL,
    description VARCHAR(2000) NOT NULL,
    status reimbursement_status NOT NULL

    --FK
    employee_id INT NOT NULL,
    approver_id INT NOT NULL,
    department_id SMALLINT NOT NULL
);

ALTER TABLE finances.t_reimbursements
    ADD CONSTRAINT finances_t_reimbursements_pk 
    PRIMARY KEY(id);

ALTER TABLE finances.t_reimbursements
    ADD CONSTRAINT finances_t_reimbursements_ck_employee_id
    CHECK(
        employee_id != approver_id
    );

--Relationships
    ALTER TABLE finances.t_reimbursements
        ADD CONSTRAINT finances_t_reimbursements_fk_employee_id
        FOREIGN KEY employee_id
            REFERENCES hr.t_employees(id);
    ALTER TABLE finances.t_reimbursements
        ADD CONSTRAINT finances_t_reimbursements_fk_department_id
        FOREIGN KEY department_id
            REFERENCES hr.t_departments(id);
    ALTER TABLE finances.t_reimbursements
        ADD CONSTRAINT finances_t_reimbursements_fk_approver_id
        FOREIGN KEY approver_id
            REFERENCES hr.t_employees(id);
        