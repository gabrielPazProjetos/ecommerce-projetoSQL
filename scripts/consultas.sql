-- Criação do bacno de dados
CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- criação de tabela
CREATE TABLE Departamento (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100),
  cidade VARCHAR(100)
);

CREATE TABLE Empregado (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100),
  cargo VARCHAR(100),
  departamento_id INT,
  FOREIGN KEY (departamento_id) REFERENCES Departamento(id)
);

--  Inserção de dados
INSERT INTO Departamento (nome, cidade) VALUES
('Financeiro', 'Cidade A'),
('RH', 'Cidade B'),
('TI', 'Cidade A');

INSERT INTO Empregado (nome, cargo, departamento_id) VALUES
('João', 'Analista', 1),
('Maria', 'Assistente', 2),
('Carlos', 'Desenvolvedor', 3),
('Ana', 'Gerente', 1);

--  Criação de índice
CREATE INDEX idx_departamento_id ON Empregado(departamento_id);

--  Transações com controle de erro
START TRANSACTION;

UPDATE Departamento SET nome = 'Financeiro Atualizado' WHERE id = 1;
SAVEPOINT atualizacao_departamento;

UPDATE Empregado SET nome = 'João da Silva' WHERE id = 1;
ROLLBACK TO atualizacao_departamento;

COMMIT;

--  Procedure com tratamento de exceção
DELIMITER //

CREATE PROCEDURE sp_transacao_com_rollback()
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
  END;

  START TRANSACTION;

  UPDATE Empregado SET nome = 'Carlos Silva' WHERE id = 3;
  UPDATE Departamento SET cidade = 'Cidade Z' WHERE id = 3;

  COMMIT;
END //

DELIMITER ;

--  Evento agendado
CREATE EVENT limpa_departamentos_antigos
ON SCHEDULE EVERY 1 MONTH
DO
  DELETE FROM Departamento WHERE cidade = 'Cidade Antiga';

-- 8 Departamento com mais empregados
SELECT d.nome, COUNT(e.id) AS total
FROM Departamento d
JOIN Empregado e ON e.departamento_id = d.id
GROUP BY d.id
ORDER BY total DESC
LIMIT 1;

--  Departamentos agrupados por cidade
SELECT cidade, GROUP_CONCAT(nome SEPARATOR ', ') AS departamentos
FROM Departamento
GROUP BY cidade;

-- Relação de empregados por departamento
SELECT d.nome AS departamento, e.nome AS empregado
FROM Departamento d
JOIN Empregado e ON e.departamento_id = d.id
ORDER BY d.nome;

--  Recuperação do banco (simulação)
CREATE DATABASE IF NOT EXISTS ecommerce_recuperado;
USE ecommerce_recuperado;
