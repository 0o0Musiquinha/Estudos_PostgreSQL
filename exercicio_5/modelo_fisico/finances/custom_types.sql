CREATE TYPE finances.payroll_status
AS ENUM(
    'pendente',
    'processado',
    'cancelado'
);

CREATE TYPE finances,reimbursement_status
AS ENUM(
    'aberta',
    'aprovada',
    'recusada',
    'paga'
);