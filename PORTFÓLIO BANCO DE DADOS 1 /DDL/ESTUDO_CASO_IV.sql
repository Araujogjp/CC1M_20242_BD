CREATE DATABASE ESTUDO_CASO00004;

USE ESTUDO_CASO00004;

CREATE TABLE IF NOT EXISTS ALUNOS(
ALUNO_CPF VARCHAR(20) PRIMARY KEY NOT NULL,
ALUNO_NOME VARCHAR(70) NOT NULL,
ALUNO_DATANASC DATE NOT NULL, 
ALUNO_RUA VARCHAR(40) NOT NULL, 
ALUNO_N_RUA INT,
ALUNO_BAIRRO VARCHAR(50) NOT NULL,
ALUNO_CIDADE VARCHAR(50) NOT NULL,
ALUNO_ESTADO VARCHAR(50) NOT NULL,
ALUNO_PAIS VARCHAR(50) NOT NULL,
ALUNO_MODALIDADESINTERESSE VARCHAR(100) NOT NULL
);

ALTER TABLE ALUNOS ADD ALUNOS_EMAIL VARCHAR(20) NOT NULL;
ALTER TABLE ALUNOS MODIFY COLUMN ALUNOS_EMAIL VARCHAR(50);
ALTER TABLE ALUNOS CHANGE COLUMN ALUNOS_EMAIL ALUNOS_MENSAGENS_VIRTUAIS VARCHAR(50);
ALTER TABLE ALUNOS DROP COLUMN ALUNOS_MENSAGENS_VIRTUAIS;

CREATE TABLE IF NOT EXISTS INSTRUTORES(
INSTRUTORES_ID INT PRIMARY KEY NOT NULL,
INSTRUTORES_NOME VARCHAR(70) NOT NULL,
INSTRUTORES_RUA VARCHAR(40) NOT NULL, 
INSTRUTORES_N_RUA INT,
INSTRUTORES_BAIRRO VARCHAR(50) NOT NULL,
INSTRUTORES_CIDADE VARCHAR(50) NOT NULL,
INSTRUTORES_ESTADO VARCHAR(50) NOT NULL,
INSTRUTORES_PAIS VARCHAR(50) NOT NULL
);

ALTER TABLE INSTRUTORES ADD INSTRUTORES_EMAIL VARCHAR(20) NOT NULL;
ALTER TABLE INSTRUTORES MODIFY COLUMN INSTRUTORES_EMAIL VARCHAR(50);
ALTER TABLE INSTRUTORES CHANGE COLUMN INSTRUTORES_EMAIL INSTRUTORES_MENSAGENS_VIRTUAIS VARCHAR(50);
ALTER TABLE INSTRUTORES DROP COLUMN INSTRUTORES_MENSAGENS_VIRTUAIS;

CREATE TABLE IF NOT EXISTS MODALIDADES(
MODALIDADES_ID INT PRIMARY KEY NOT NULL,
MODALIDADES_NOME VARCHAR(80) NOT NULL
);

ALTER TABLE MODALIDADES ADD MODALIDADES_TIPO VARCHAR(20) NOT NULL;
ALTER TABLE MODALIDADES MODIFY COLUMN MODALIDADES_TIPO VARCHAR(50);
ALTER TABLE MODALIDADES CHANGE COLUMN MODALIDADES_TIPO MODALIDADES_TIPAGEM VARCHAR(50);
ALTER TABLE MODALIDADES DROP COLUMN MODALIDADES_TIPAGEM;

CREATE TABLE IF NOT EXISTS INSTRUTORES_MODALIDADES(
INSTRUTORES_ID INT NOT NULL,
MODALIDADES_ID INT NOT NULL,
PRIMARY KEY (INSTRUTORES_ID, MODALIDADES_ID),
CONSTRAINT FKPK_INSTRUTORES_ID FOREIGN KEY (INSTRUTORES_ID) REFERENCES INSTRUTORES(INSTRUTORES_ID),
CONSTRAINT FKPK_MODALIDADES_ID FOREIGN KEY (MODALIDADES_ID) REFERENCES MODALIDADES(MODALIDADES_ID)
);

ALTER TABLE INSTRUTORES_MODALIDADES ADD INSTRUTORES_MODALIDADES_NOMES VARCHAR(80) NOT NULL;
ALTER TABLE INSTRUTORES_MODALIDADES MODIFY COLUMN INSTRUTORES_MODALIDADES_NOMES VARCHAR(100);
ALTER TABLE INSTRUTORES_MODALIDADES CHANGE COLUMN INSTRUTORES_MODALIDADES_NOMES INSTRUTORES_MODALIDADES_NAMES VARCHAR(100);
ALTER TABLE INSTRUTORES_MODALIDADES DROP COLUMN INSTRUTORES_MODALIDADES_NAMES;


CREATE TABLE IF NOT EXISTS PLANOSTREINAMENTO(
PLT_ID INT PRIMARY KEY NOT NULL,
PLT_ALUNO_CPF VARCHAR(20) NOT NULL,
PLT_INSTRUTORES_ID INT NOT NULL,
PLT_MODALIDADES_ID INT NOT NULL,
CONSTRAINT FK_PLT_ALUNOS_CPF FOREIGN KEY(PLT_ALUNO_CPF) REFERENCES ALUNOS(ALUNO_CPF),
CONSTRAINT FK_PLT_INSTRUTORES_ID FOREIGN KEY(PLT_INSTRUTORES_ID) REFERENCES INSTRUTORES(INSTRUTORES_ID),
CONSTRAINT FK_PLT_MODALIDADES_ID FOREIGN KEY(PLT_MODALIDADES_ID) REFERENCES MODALIDADES(MODALIDADES_ID)
);

ALTER TABLE PLANOSTREINAMENTO ADD PLT_DIA DATE NOT NULL;
ALTER TABLE PLANOSTREINAMENTO MODIFY COLUMN PLT_DIA VARCHAR(50);
ALTER TABLE PLANOSTREINAMENTO CHANGE COLUMN PLT_DIA PLT_DATA VARCHAR(50);
ALTER TABLE PLANOSTREINAMENTO DROP COLUMN PLT_DATA;


CREATE TABLE IF NOT EXISTS AULAS(
AULAS_ID INT PRIMARY KEY NOT NULL,
AULAS_HORARIO TIME NOT NULL,
AULAS_CAPACIDADE VARCHAR(80) NOT NULL,
AULAS_MODALIDADES_ID INT NOT NULL, 
AULAS_PLT_ID INT NOT NULL,
AULAS_INSTRUTORES_ID INT NOT NULL,
CONSTRAINT FK_AULAS_MODALIDADES_ID FOREIGN KEY(AULAS_MODALIDADES_ID) REFERENCES MODALIDADES(MODALIDADES_ID),
CONSTRAINT FK_AULAS_PLT_ID FOREIGN KEY (AULAS_PLT_ID) REFERENCES PLANOSTREINAMENTO(PLT_ID),
CONSTRAINT FK_AULAS_INSTRUTORES_ID FOREIGN KEY (AULAS_INSTRUTORES_ID) REFERENCES INSTRUTORES(INSTRUTORES_ID) 
);

ALTER TABLE AULAS ADD AULAS_TIPO VARCHAR(20) NOT NULL;
ALTER TABLE AULAS MODIFY COLUMN AULAS_TIPO VARCHAR(50);
ALTER TABLE AULAS CHANGE COLUMN AULAS_TIPO AULAS_TIPAGEM VARCHAR(50);
ALTER TABLE AULAS DROP COLUMN AULAS_TIPAGEM;

CREATE TABLE IF NOT EXISTS PAGAMENTOS(
PAG_ID INT PRIMARY KEY NOT NULL,
PAG_DATA DATE NOT NULL,
PAG_VALOR DECIMAL(10,2) NOT NULL,
PAG_STATUS VARCHAR(50) NOT NULL,
PAG_ALUNO_CPF VARCHAR(20) NOT NULL,
CONSTRAINT FK_PAG_ALUNO_CPF FOREIGN KEY (PAG_ALUNO_CPF) REFERENCES ALUNOS(ALUNO_CPF)
);

ALTER TABLE PAGAMENTOS ADD PAG_DESCONTO DECIMAL(10,2) NOT NULL;
ALTER TABLE PAGAMENTOS MODIFY COLUMN PAG_DESCONTO VARCHAR(50);
ALTER TABLE PAGAMENTOS CHANGE COLUMN PAG_DESCONTO PAG_ABATIMENTO VARCHAR(50);
ALTER TABLE PAGAMENTOS DROP COLUMN PAG_ABATIMENTO;


CREATE TABLE IF NOT EXISTS AULAS_ALUNOS(
AULAS_ID INT NOT NULL,
ALUNO_CPF VARCHAR(20) NOT NULL,
PRIMARY KEY (AULAS_ID, ALUNO_CPF),
CONSTRAINT FKPK_AULAS_ID FOREIGN KEY (AULAS_ID) REFERENCES AULAS(AULAS_ID),
CONSTRAINT FKPK_ALUNO_CPF FOREIGN KEY (ALUNO_CPF) REFERENCES ALUNOS(ALUNO_CPF)
);

ALTER TABLE AULAS_ALUNOS ADD AULAS_ALUNOS_NOMES VARCHAR(80) NOT NULL;
ALTER TABLE AULAS_ALUNOS MODIFY COLUMN AULAS_ALUNOS_NOMES VARCHAR(100);
ALTER TABLE AULAS_ALUNOS CHANGE COLUMN AULAS_ALUNOS_NOMES AULAS_ALUNOS_NAMES VARCHAR(100);
ALTER TABLE AULAS_ALUNOS DROP COLUMN AULAS_ALUNOS_NAMES;

CREATE TABLE IF NOT EXISTS TESTE_ESTUDO_CASO_IV(
TESTE_ID INT PRIMARY KEY NOT NULL, 
TESTE_NOME VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS TESTE_ESTUDO_CASO_IV;
