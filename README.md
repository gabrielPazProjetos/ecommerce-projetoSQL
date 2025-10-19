--- AVISO ---
Os arquivos foram separados por etapa para facilitar a leitura e avaliação, em meu repositorio deste projeto contém o backup completo, e o recover.sql simula a restauração do banco em outro ambiente.

--- Projeto de Banco de Dados: E-commerce ---

Este projeto simula um sistema de banco de dados para uma empresa fictícia de e-commerce, com foco em operações de transação, procedimentos armazenados, backup e recuperação.

--- Objetivos do Projeto ---

- Criar e estruturar tabelas com relacionamentos
- Executar transações com controle de erro usando SAVEPOINT e ROLLBACK
- Criar procedures com tratamento de exceções
- Agendar eventos automáticos no banco
- Realizar backup completo do banco
- Simular recuperação do banco a partir do backup
- Executar consultas analíticas com JOIN, GROUP BY, ORDER BY

--- Arquivos incluídos ---

| Arquivo | Descrição |

| estrutura_e_dados.sql | Criação das tabelas Departamento e Empregado, com inserção de dados iniciais |
| transacoes.sql | Transações com START TRANSACTION, SAVEPOINT, ROLLBACK, COMMIT |
| procedure_transacao.sql | Procedure com controle de erro e rollback parcial |
| evento.sql | Evento agendado que limpa departamentos antigos |
| consultas.sql | Consultas analíticas sobre departamentos e empregados |
| ecommerce_backup.sql | Backup completo do banco: estrutura, dados, procedures e eventos |
| recover.sql | Script para recriar o banco e restaurar o backup |

--- Como usar ---

1. Abra um ambiente MySQL local (como Workbench, DBeaver ou terminal)
2. Execute os arquivos na seguinte ordem:
   - estrutura_e_dados.sql
   - transacoes.sql
   - procedure_transacao.sql
   - evento.sql
   - consultas.sql
3. Para restaurar o banco em outro ambiente:
   - Execute recuover.sql
   - Em seguida, rode SOURCE ecommerce_backup.sql` para importar o backup

--- Observações ---

- O backup pode ser usado como base para recuperação em qualquer ambiente MySQL
- Todas as funcionalidades exigidas pelo desafio foram implementadas
