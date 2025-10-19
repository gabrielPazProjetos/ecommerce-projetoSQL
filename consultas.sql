USE ecommerce;

SELECT d.nome, COUNT(e.id) AS total
FROM Departamento d
JOIN Empregado e ON e.departamento_id = d.id
GROUP BY d.id
ORDER BY total DESC
LIMIT 1;

SELECT cidade, GROUP_CONCAT(nome SEPARATOR ', ') AS departamentos
FROM Departamento
GROUP BY cidade;

SELECT d.nome AS departamento, e.nome AS empregado
FROM Departamento d
JOIN Empregado e ON e.departamento_id = d.id
ORDER BY d.nome;
