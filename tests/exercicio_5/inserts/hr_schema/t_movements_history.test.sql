BEGIN;

SET search_path TO extension_pgtap;
SELECT plan(2); --Quantidade de testesa a serem realizados

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
    'HID12345678',
    'Hideo Kojima',
    '92873817246',
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
    '92873817246',
    'hidetaka.kamiya@gmail.com',
    '11998172261',
    1800.00,
    'afastado',
    1,
    1
);

--description
SELECT throws_ok(
    $$
        INSERT INTO exercicio5_hr.t_movements_history(
            movement_type,
            description,
            employee_id,
            responsable_id
        )
        VALUES (
            'admissão',
            'É com imensa  satisfação que comunicamos por meio desta carta de admissão que o funcionario "Hideki Kamiya" está conosco nesta maravilhosa empresa',
            1,
            2
        );
    $$,
    '23514',
    'new row for relation "t_movements_history" violates check constraint "exercicio5_hr_t_movements_history_ck_description"'
);

--employee_id != responsable_id
SELECT throws_ok(
    $$
        INSERT INTO exercicio5_hr.t_movements_history(
            movement_type,
            description,
            employee_id,
            responsable_id
        )
        VALUES (
            'admissão',
            'É com imensa satisfação que comunicamos por meio desta carta de admissão que o funcionario "Hideki Kamiya" está conosco nesta maravilhosa empresa',
            1,
            1
        );
    $$,
    '23514',
    'new row for relation "t_movements_history" violates check constraint "exercicio5_hr_t_movements_history_ck_employee_id_c_responsable_"'
);

SELECT * FROM finish();

ROLLBACK;