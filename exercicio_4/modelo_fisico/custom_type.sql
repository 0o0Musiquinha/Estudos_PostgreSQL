--guardian
CREATE TYPE exercicio4.guardian_status 
    AS ENUM (
        'ativo', 
        'bloqueado', 
        'inativo'
    );

--veterinarian
CREATE TYPE exercicio4.veterinarian_status 
    AS ENUM (
        'ativo', 
        'afastado', 
        'desligado'
    );

--animal
CREATE TYPE exercicio4.animal_status 
    AS ENUM (
        'ativo', 
        'tratamento', 
        'óbito'
    );
CREATE TYPE exercicio4.animal_sex 
    AS ENUM (
        'M', 
        'F'
    );

--appointment
CREATE TYPE exercicio4.appointment_status 
    AS ENUM(
        'agendamento', 
        'concluído', 
        'cancelado'
    );