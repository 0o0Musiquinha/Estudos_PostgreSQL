BEGIN;

SET search_path TO extension_pgtap;
SELECT plan(3); --Quantidade de testesa a serem realizados

SELECT diag('Retorna TRUE se o PIS for válido');
SELECT is(exercicio5_hr.is_valid_pis('60920663188'), true, 'PIS válido');


SELECT diag('Retorna FALSE se a quantidade de caracteres for diferente de 11');
SELECT is(exercicio5_hr.is_valid_pis('609206631'), false, 'PIS inválido');

SELECT diag('Retorna FALSE se o PIS não tier somente números');
SELECT is(exercicio5_hr.is_valid_pis('6092a66b188'), false, 'PIS inválido');

SELECT diag('Retorna FALSE se o pis for composto inteiramente pelo mesmo caracter');
SELECT is(exercicio5_hr.is_valid_pis('77777777777'), false, 'PIS inválido');

SELECT diag('Retorna FALSE se o número identificador for diferente do calculado');
SELECT is(exercicio5_hr.is_valid_pis('298310928271'), false, 'PIS inválido');

SELECT * FROM finish();

ROLLBACK;