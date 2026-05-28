CREATE TYPE exercicio5_finances.payroll_status
AS ENUM(
    'pendente',
    'processado',
    'cancelado'
);

CREATE TYPE exercicio5_finances.reimbursement_status
AS ENUM(
    'aberta',
    'aprovada',
    'recusada',
    'paga'
);