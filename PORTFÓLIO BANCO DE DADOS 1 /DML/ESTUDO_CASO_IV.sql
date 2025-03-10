USE ESTUDO_CASO0000004;
SHOW COLUMNS FROM ALUNOS;

INSERT INTO ALUNOS (ALUNO_CPF, ALUNO_NOME, ALUNO_DATANASC, ALUNO_RUA, ALUNO_N_RUA, ALUNO_BAIRRO, ALUNO_CIDADE, ALUNO_ESTADO, ALUNO_PAIS, ALUNO_MODALIDADESINTERESSE)
VALUES
('123.456.789-01', 'João Silva', '1995-07-20', 'Rua A', 123, 'Centro', 'São Paulo', 'SP', 'Brasil', 'Futebol, Vôlei'),
('234.567.890-12', 'Maria Oliveira', '1992-10-15', 'Rua B', 456, 'Jardim das Flores', 'Rio de Janeiro', 'RJ', 'Brasil', 'Natação, Ginástica'),
('345.678.901-23', 'Pedro Souza', '1998-03-10', 'Rua C', 789, 'Vila Nova', 'Belo Horizonte', 'MG', 'Brasil', 'Ciclismo, Corrida'),
('456.789.012-34', 'Ana Costa', '2000-01-05', 'Rua D', 101, 'Praia Grande', 'Salvador', 'BA', 'Brasil', 'Futebol, Natação'),
('567.890.123-45', 'Carlos Lima', '1997-08-25', 'Rua E', 202, 'Bairro Alto', 'Curitiba', 'PR', 'Brasil', 'Vôlei, Futebol');

UPDATE ALUNOS SET ALUNO_NOME = 'João Silva Oliveira', ALUNO_PAIS = 'Argentina' WHERE ALUNO_CPF = '123.456.789-01';
UPDATE ALUNOS SET ALUNO_BAIRRO = 'Nova Vila', ALUNO_CIDADE = 'São Paulo' WHERE ALUNO_CPF = '234.567.890-12';
DELETE FROM PLANOSTREINAMENTO WHERE PLT_ALUNO_CPF = '123.456.789-01';
DELETE FROM ALUNOS WHERE ALUNO_CPF = '123.456.789-01';

INSERT INTO INSTRUTORES (INSTRUTORES_ID, INSTRUTORES_NOME, INSTRUTORES_RUA, INSTRUTORES_N_RUA, INSTRUTORES_BAIRRO, INSTRUTORES_CIDADE, INSTRUTORES_ESTADO, INSTRUTORES_PAIS)
VALUES
(1, 'Ricardo Silva', 'Rua X', 100, 'Centro', 'São Paulo', 'SP', 'Brasil'),
(2, 'Fernanda Souza', 'Rua Y', 200, 'Jardim das Flores', 'Rio de Janeiro', 'RJ', 'Brasil'),
(3, 'Marcelo Lima', 'Rua Z', 300, 'Vila Nova', 'Belo Horizonte', 'MG', 'Brasil'),
(4, 'Patrícia Costa', 'Rua W', 400, 'Praia Grande', 'Salvador', 'BA', 'Brasil'),
(5, 'Eduardo Oliveira', 'Rua V', 500, 'Bairro Alto', 'Curitiba', 'PR', 'Brasil');

UPDATE INSTRUTORES SET INSTRUTORES_NOME = 'Ricardo Silva Santos', INSTRUTORES_ESTADO = 'MG' WHERE INSTRUTORES_ID = 1;
UPDATE INSTRUTORES SET INSTRUTORES_CIDADE = 'Porto Alegre', INSTRUTORES_PAIS = 'Argentina' WHERE INSTRUTORES_ID = 2;
DELETE FROM INSTRUTORES WHERE INSTRUTORES_ID = 2;

INSERT INTO MODALIDADES (MODALIDADES_ID, MODALIDADES_NOME)
VALUES
(1, 'Futebol'),
(2, 'Natação'),
(3, 'Vôlei'),
(4, 'Ciclismo'),
(5, 'Ginástica');

UPDATE MODALIDADES SET MODALIDADES_NOME = 'Futsal' WHERE MODALIDADES_ID = 1;
UPDATE MODALIDADES SET MODALIDADES_NOME = 'Maratona' WHERE MODALIDADES_ID = 3;

DELETE FROM MODALIDADES WHERE MODALIDADES_ID = 3;

INSERT INTO INSTRUTORES_MODALIDADES (INSTRUTORES_ID, MODALIDADES_ID)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

UPDATE INSTRUTORES_MODALIDADES SET MODALIDADES_ID = 2 WHERE INSTRUTORES_ID = 1 AND MODALIDADES_ID = 1;
UPDATE INSTRUTORES_MODALIDADES SET INSTRUTORES_ID = 4 WHERE MODALIDADES_ID = 5 AND INSTRUTORES_ID = 5;
DELETE FROM INSTRUTORES_MODALIDADES WHERE INSTRUTORES_ID = 1 AND MODALIDADES_ID = 1;

INSERT INTO PLANOSTREINAMENTO (PLT_ID, PLT_ALUNO_CPF, PLT_INSTRUTORES_ID, PLT_MODALIDADES_ID)
VALUES
(1, '123.456.789-01', 1, 1),
(2, '234.567.890-12', 2, 2),
(3, '345.678.901-23', 3, 3),
(4, '456.789.012-34', 4, 4),
(5, '567.890.123-45', 5, 5);

UPDATE PLANOSTREINAMENTO SET PLT_MODALIDADES_ID = 2, PLT_INSTRUTORES_ID = 3 WHERE PLT_ID = 1;
UPDATE PLANOSTREINAMENTO SET PLT_ALUNO_CPF = '789.012.345-67', PLT_MODALIDADES_ID = 4 WHERE PLT_ID = 3;
DELETE FROM PLANOSTREINAMENTO WHERE PLT_ID = 2;

INSERT INTO AULAS (AULAS_ID, AULAS_HORARIO, AULAS_CAPACIDADE, AULAS_MODALIDADES_ID, AULAS_PLT_ID, AULAS_INSTRUTORES_ID)
VALUES
(1, '08:00:00', '30', 1, 1, 1),
(2, '10:00:00', '25', 2, 2, 2),
(3, '14:00:00', '20', 3, 3, 3),
(4, '16:00:00', '35', 4, 4, 4),
(5, '18:00:00', '40', 5, 5, 5);

UPDATE AULAS SET AULAS_HORARIO = '09:00:00', AULAS_CAPACIDADE = '40' WHERE AULAS_ID = 1;
UPDATE AULAS SET AULAS_HORARIO = '15:00:00', AULAS_CAPACIDADE = '30' WHERE AULAS_ID = 3;
DELETE FROM AULAS WHERE AULAS_ID = 4;

INSERT INTO PAGAMENTOS (PAG_ID, PAG_DATA, PAG_VALOR, PAG_STATUS, PAG_ALUNO_CPF)
VALUES
(1, '2024-10-01', 150.00, 'Pago', '123.456.789-01'),
(2, '2024-10-05', 120.00, 'Pago', '234.567.890-12'),
(3, '2024-10-10', 100.00, 'Pendente', '345.678.901-23'),
(4, '2024-10-15', 130.00, 'Pago', '456.789.012-34'),
(5, '2024-10-20', 140.00, 'Pendente', '567.890.123-45');

UPDATE PAGAMENTOS SET PAG_STATUS = 'Pendente', PAG_VALOR = 200.00 WHERE PAG_ID = 3;
UPDATE PAGAMENTOS SET PAG_DATA = '2024-11-01', PAG_VALOR = 190.00 WHERE PAG_ID = 5;
DELETE FROM PAGAMENTOS WHERE PAG_ID = 3;


INSERT INTO AULAS_ALUNOS (AULAS_ID, ALUNO_CPF)
VALUES
(1, '123.456.789-01'),
(2, '234.567.890-12'),
(3, '345.678.901-23'),
(4, '456.789.012-34'),
(5, '567.890.123-45');

UPDATE AULAS_ALUNOS SET AULAS_ID = 4 WHERE ALUNO_CPF = '123.456.789-01' AND AULAS_ID = 1;
UPDATE AULAS_ALUNOS SET AULAS_ID = 5 WHERE ALUNO_CPF = '234.567.890-12' AND AULAS_ID = 2;
DELETE FROM AULAS_ALUNOS WHERE ALUNO_CPF = '567.890.123-45' AND AULAS_ID = 5;



