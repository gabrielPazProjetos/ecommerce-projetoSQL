CREATE DATABASE IF NOT EXISTS ecommerce;
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
