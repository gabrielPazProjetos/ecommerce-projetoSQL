
DROP DATABASE IF EXISTS ecommerce;
CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE Departamento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    cidade VARCHAR(100)
);

CREATE TABLE Empregado (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    departamento_id INT,
    FOREIGN KEY (departamento_id) REFERENCES Departamento(id)
);

CREATE INDEX idx_departamento_id ON Empregado(departamento_id);

INSERT INTO Departamento (nome, cidade) VALUES
('TI', 'Cidade A'),
('RH', 'Cidade B'),
('Financeiro', 'Cidade A'),
('Marketing', 'Cidade C');

INSERT INTO Empregado (nome, departamento_id) VALUES
('Empregado 1', 1),
('Empregado 2', 1),
('Empregado 3', 2),
('Empregado 4', 3),
('Empregado 5', 1),
('Empregado 6', 4),
('Empregado 7', 3);

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

-- Evento
CREATE EVENT IF NOT EXISTS limpa_departamentos_antigos
ON SCHEDULE EVERY 1 MONTH
DO
  DELETE FROM Departamento WHERE cidade = 'Cidade Antiga';
