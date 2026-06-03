BEGIN;

SET search_path TO extension_pgtap;
SELECT plan(3); --Quantidade de testesa a serem realizados

SET CONSTRAINTS exercicio5_hr.exercicio5_hr_t_employee_fk_department_id DEFERRED;

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
    'AUG123456789',
    'Hideo Kojima',
    '92873817246',
    'hideo.kojima@gmail.com',
    '1140028922',
    1800.00,
    'afastado',
    NULL,
    1
);

--name
SELECT throws_ok(
    $$
        INSERT INTO exercicio5_hr.t_departments(
            name,
            acronym,
            monthly_budget,
            status,
            department_head
        )
        VALUES (
            ' Recursos Humanos',
            'RH',
            10000.00,
            'ativo',
            1
        );
    $$,
    '23514',
    'new row for relation "t_departments" violates check constraint "exercicio5_hr_t_departments_ck_name"'
);

--acronym
SELECT throws_ok(
    $$
        INSERT INTO exercicio5_hr.t_departments(
            name,
            acronym,
            monthly_budget,
            status,
            department_head
        )
        VALUES (
            'Recursos Humanos',
            'R#',
            10000.00,
            'ativo',
            1
        );
    $$,
    '23514',
    'new row for relation "t_departments" violates check constraint "exercicio5_hr_t_departments_ck_acronym"'
);

--monthly_budget
SELECT throws_ok(
    $$
        INSERT INTO exercicio5_hr.t_departments(
            name,
            acronym,
            monthly_budget,
            status,
            department_head
        )
        VALUES (
            'Recursos Humanos',
            'RH',
            2000.00,
            'ativo',
            1
        );
    $$,
    '23514',
    'new row for relation "t_departments" violates check constraint "exercicio5_hr_t_departments_ck_monthly_budget"'
);

SELECT * FROM finish();

ROLLBACK;