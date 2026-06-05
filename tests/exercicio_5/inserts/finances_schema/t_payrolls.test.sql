BEGIN;

SET search_path TO extension_pgtap;
SELECT plan(4); --Quantidade de testesa a serem realizados

SET CONSTRAINTS exercicio5_hr.exercicio5_hr_t_employees_fk_department_id DEFERRED;

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

--employee_title
SELECT throws_ok(
    $$
        INSERT INTO exercicio5_hr.t_payrolls(
            employee_title,
            payment_day,
            gross_salary,
            deduction,
            status,
            employee_id
        )
        VALUES (
            'cara  bacana',
            CURRENT_TIMESTAMP(0),
            1800.00,
            90,
            'pendente',
            1
        );
    $$,
    '23514',
    'new row for relation "t_payrolls" violates check constraint "exercicio5_hr_t_payrolls_ck_employee_title"'
);

--payment_day
SELECT throws_ok(
    $$
        INSERT INTO exercicio5_hr.t_payrolls(
            employee_title,
            payment_day,
            gross_salary,
            deduction,
            status,
            employee_id
        )
        VALUES (
            'cara bacana',
            '2026-04-25 15:30:00-03',
            1800.00,
            90,
            'pendente',
            1
        );
    $$,
    '23514',
    'new row for relation "t_payrolls" violates check constraint "exercicio5_hr_t_payrolls_ck_payment_day"'
);

--gross_salary
SELECT throws_ok(
    $$
        INSERT INTO exercicio5_hr.t_payrolls(
            employee_title,
            payment_day,
            gross_salary,
            deduction,
            status,
            employee_id
        )
        VALUES (
            'cara bacana',
            CURRENT_TIMESTAMP(0),
            1200.00,
            90,
            'processado',
            1
        );
    $$,
    '23514',
    'new row for relation "t_payrolls" violates check constraint "exercicio5_hr_t_payrolls_ck_gross_salary"'
);

--deduction
SELECT throws_ok(
    $$
        INSERT INTO exercicio5_hr.t_payrolls(
            employee_title,
            payment_day,
            gross_salary,
            deduction,
            status,
            employee_id
        )
        VALUES (
            'cara bacana',
            CURRENT_TIMESTAMP(0),
            2000.00,
            -300,
            'cancelado',
            1
        );
    $$,
    '23514',
    'new row for relation "t_payrolls" violates check constraint "exercicio5_hr_t_payrolls_ck_deduction"'
);

SELECT * FROM finish();

ROLLBACK;