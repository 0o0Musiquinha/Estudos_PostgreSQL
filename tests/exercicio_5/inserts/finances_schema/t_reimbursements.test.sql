BEGIN;

SET search_path TO extension_pgtap;
SELECT plan(4); --Quantidade de testesa a serem realizados

SET CONSTRAINTS exercicio5_hr.exercicio5_hr_t_employees_fk_department_id, exercicio5_hr.exercicio5_hr_t_departments_fk_department_head  DEFERRED;

INSERT INTO exercicio5_hr.t_positions(
    id,
    name,
    description
) OVERRIDING SYSTEM VALUE 
VALUES(
    1,
    'Cargo legal',
    'Cargo designado para pessoas legais com acessos legais para atividades legais'
);

INSERT INTO exercicio5_hr.t_employees(
    id,
    employee_code,
    name,
    pis,
    employee_email,
    phonenumber,
    base_salary,
    status,
    department_id,
    position_id
) OVERRIDING SYSTEM VALUE
VALUES (
    1,
    'AUG12345678',
    'Hideo Kojima',
    '60920663188',
    'hideo.kojima@gmail.com',
    '1140028922',
    1800.00,
    'afastado',
    1,
    1
);

INSERT INTO exercicio5_hr.t_employees(
    id,
    employee_code,
    name,
    pis,
    employee_email,
    phonenumber,
    base_salary,
    status,
    department_id,
    position_id
) OVERRIDING SYSTEM VALUE
VALUES (
    2,
    'HID83729182',
    'Hidetaka Kamiya',
    '68230439224',
    'hidetaka.kamiya@gmail.com',
    '11998172261',
    1800.00,
    'afastado',
    1,
    1
);

INSERT INTO exercicio5_hr.t_departments(
    id,
    name,
    acronym,
    monthly_budget,
    status,
    department_head
) OVERRIDING SYSTEM VALUE
VALUES(
    1,
    'Departamento dos Bacanas',
    'DB',
    200000.00,
    'ativo',
    1
);

--value
SELECT throws_ok(
    $$
        INSERT INTO exercicio5_finances.t_reimbursements(
            value,
            description,
            status,
            employee_id,
            approver_id,
            department_id
        )
        VALUES (
            0,
            'Uma descrição interessante para a sua vida olha que legal',
            'aberta',
            1,
            2,
            1
        );
    $$,
    '23514',
    'new row for relation "t_reimbursements" violates check constraint "exercicio5_finances_t_reimbursements_ck_value"'
);

--description
SELECT throws_ok(
    $$
        INSERT INTO exercicio5_finances.t_reimbursements(
            value,
            description,
            status,
            employee_id,
            approver_id,
            department_id
        )
        VALUES (
            200.40,
            'Uma descrição$ interessante para a sua vida olha que legal',
            'paga',
            1,
            2,
            1
        );
    $$,
    '23514',
    'new row for relation "t_reimbursements" violates check constraint "exercicio5_finances_t_reimbursements_ck_description"'
);

--description
SELECT throws_ok(
    $$
        INSERT INTO exercicio5_finances.t_reimbursements(
            value,
            description,
            status,
            employee_id,
            approver_id,
            department_id
        )
        VALUES (
            200.40,
            'Uma descrição interessante para a sua vida olha que legal',
            'recusada',
            1,
            1,
            1
        );
    $$,
    '23514',
    'new row for relation "t_reimbursements" violates check constraint "exercicio5_finances_t_reimbursements_ck_employee_id"'
);

SELECT * FROM finish();

ROLLBACK;