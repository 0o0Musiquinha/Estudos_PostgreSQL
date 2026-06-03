BEGIN;

SET search_path TO extension_pgtap;
SELECT plan(6); --Quantidade de testesa a serem realizados

SET CONSTRAINTS exercicio5_hr.exercicio5_hr_t_departments_fk_department_head DEFERRED;

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
    NULL
);

--employee_id
SELECT throws_ok(
    $$
        INSERT INTO exercicio5_hr.t_employees(
            employee_code,
            name,
            pis,
            employee_email,
            phonenumber,
            base_salary,
            status,
            department_id,
            position_id
        )
        VALUES (
            'A2G12345678',
            'Hideo Kojima',
            '60920663188',
            'hideo.kojima@gmail.com',
            '1140028922',
            2000.00,
            'ativo',
            1,
            1
        );
    $$,
    '23514',
    'new row for relation "t_employees" violates check constraint "exercicio5_hr_t_employees_ck_employee_code"'
);

--name
SELECT throws_ok(
    $$
        INSERT INTO exercicio5_hr.t_employees(
            employee_code,
            name,
            pis,
            employee_email,
            phonenumber,
            base_salary,
            status,
            department_id,
            position_id
        )
        VALUES (
            'AUG12345678',
            'Hideo  Kojima',
            '60920663188',
            'hideo.kojima@gmail.com',
            '1140028922',
            2000.00,
            'afastado',
            1,
            1
        );
    $$,
    '23514',
    'new row for relation "t_employees" violates check constraint "exercicio5_hr_t_employees_ck_name"'
);

--pis
SELECT throws_ok(
    $$
        INSERT INTO exercicio5_hr.t_employees(
            employee_code,
            name,
            pis,
            employee_email,
            phonenumber,
            base_salary,
            status,
            department_id,
            position_id
        )
        VALUES (
            'AUG12345678',
            'Hideo Kojima',
            '92873817246',
            'hideo.kojima@gmail.com',
            '1140028922',
            2000.00,
            'desligado',
            1,
            1
        );
    $$,
    '23514',
    'new row for relation "t_employees" violates check constraint "exercicio5_hr_t_employees_ck_pis"'
);

--employee_email
SELECT throws_ok(
    $$
        INSERT INTO exercicio5_hr.t_employees(
            employee_code,
            name,
            pis,
            employee_email,
            phonenumber,
            base_salary,
            status,
            department_id,
            position_id
        )
        VALUES (
            'AUG12345678',
            'Hideo Kojima',
            '92873817246',
            'hideo..kojima@gmail.com',
            '1140028922',
            2000.00,
            'ativo',
            1,
            1
        );
    $$,
    '23514',
    'new row for relation "t_employees" violates check constraint "exercicio5_hr_t_employees_ck_employee_email"'
);

--phonenumber
SELECT throws_ok(
    $$
        INSERT INTO exercicio5_hr.t_employees(
            employee_code,
            name,
            pis,
            employee_email,
            phonenumber,
            base_salary,
            status,
            department_id,
            position_id
        )
        VALUES (
            'AUG12345678',
            'Hideo Kojima',
            '92873817246',
            'hideo.kojima@gmail.com',
            '11400289220',
            2000.00,
            'desligado',
            1,
            1
        );
    $$,
    '23514',
    'new row for relation "t_employees" violates check constraint "exercicio5_hr_t_employees_ck_phonenumber"'
);

--base_salary
SELECT throws_ok(
    $$
        INSERT INTO exercicio5_hr.t_employees(
            employee_code,
            name,
            pis,
            employee_email,
            phonenumber,
            base_salary,
            status,
            department_id,
            position_id
        )
        VALUES (
            'AUG12345678',
            'Hideo Kojima',
            '92873817246',
            'hideo.kojima@gmail.com',
            '1140028922',
            1200.00,
            'afastado',
            1,
            1
        );
    $$,
    '23514',
    'new row for relation "t_employees" violates check constraint "exercicio5_hr_t_employees_ck_base_salary"'
);

SELECT * FROM finish();

ROLLBACK;