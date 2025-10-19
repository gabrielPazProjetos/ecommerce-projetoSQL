USE ecommerce;

DELIMITER //

CREATE PROCEDURE sp_transacao_com_rollback()
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Erro detectado. Transação revertida.' AS mensagem;
    END;

    START TRANSACTION;

    SAVEPOINT ponto1;

    UPDATE Departamento SET cidade = 'Cidade Y' WHERE id = 1;

    UPDATE Empregado SET nome = 'Erro' WHERE id = 'texto';

    COMMIT;
END //

DELIMITER ;
