CREATE TYPE exercicio5_hr.department_status
AS ENUM(
    'ativo',
    'inativo'
);

CREATE TYPE exercicio5_hr.employee_status
AS ENUM(
    'ativo',
    'afastado',
    'desligado'
);

CREATE TYPE exercicio5_hr.movement_type
AS ENUM(
    'admissão',
    'promoção',
    'transferência',
    'afastamento',
    'desligamento'

);