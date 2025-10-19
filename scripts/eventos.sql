USE ecommerce;

CREATE EVENT IF NOT EXISTS limpa_departamentos_antigos
ON SCHEDULE EVERY 1 MONTH
DO
  DELETE FROM Departamento WHERE cidade = 'Cidade Antiga';
