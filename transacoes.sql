USE ecommerce;

START TRANSACTION;

UPDATE Departamento SET cidade = 'Cidade X' WHERE id = 2;

SAVEPOINT antes_erro;

ROLLBACK TO antes_erro;

UPDATE Empregado SET nome = 'Empregado 3 Atualizado' WHERE nome = 'Empregado 3';

COMMIT;
