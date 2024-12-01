
# Estrutura e Funcionalidade do Código SQL

Este documento descreve a estrutura e funcionalidade do código SQL fornecido, que define um banco de dados chamado `PROJETO_FORTES` com diversas tabelas relacionadas a funcionários, donatários e processos administrativos. 

## Criação do Banco de Dados
```sql
CREATE DATABASE IF NOT EXISTS PROJETO_FORTES;
USE PROJETO_FORTES;
```
- O banco de dados `PROJETO_FORTES` é criado caso ainda não exista.
- Em seguida, ele é selecionado para ser utilizado como o banco de dados ativo.

---

## Tabela FUNCIONARIOS
```sql
CREATE TABLE IF NOT EXISTS FUNCIONARIOS(
    ID_FUNCIONARIO INT PRIMARY KEY NOT NULL, 
    NOME_FUNCIONARIO VARCHAR(70) NOT NULL,
    EMAIL_FUNCIONARIO VARCHAR(70) NOT NULL,
    CARGO_FUNCIONARIO VARCHAR(20) NOT NULL,
    DATANASC_FUNCIONARIO DATE NOT NULL,
    RG_FUNCIONARIO VARCHAR(20) NOT NULL,
    CPF_FUNCIONARIO VARCHAR(20) NOT NULL
);
```
- Esta tabela armazena informações sobre os funcionários.
- **Colunas importantes:**
  - `ID_FUNCIONARIO`: Identificador único para cada funcionário.
  - `NOME_FUNCIONARIO`: Nome completo.
  - `EMAIL_FUNCIONARIO`: Endereço de e-mail.
  - `CARGO_FUNCIONARIO`: Cargo ocupado.
  - `DATANASC_FUNCIONARIO`: Data de nascimento.

---

## Tabela DONATARIOS
```sql
CREATE TABLE IF NOT EXISTS DONATARIOS(
    ID_DONATARIO INT PRIMARY KEY NOT NULL,
    CNPJ_DONATARIO VARCHAR(40) NOT NULL,
    PESSOACONTATO_DONATARIO VARCHAR(50) NOT NULL,
    NOME_DONATARIO VARCHAR(70) NOT NULL,
    CPF_DONATARIO VARCHAR(20) NOT NULL
);
```
- Registra informações dos donatários (pessoas ou organizações que recebem benefícios).
- **Colunas importantes:**
  - `CNPJ_DONATARIO`: Cadastro Nacional da Pessoa Jurídica.
  - `PESSOACONTATO_DONATARIO`: Nome do responsável pela comunicação.

---

## Tabela EDITAL
```sql
CREATE TABLE IF NOT EXISTS EDITAL(
    ID_EDITAL INT PRIMARY KEY NOT NULL,
    INICIO_EDITAL DATE NOT NULL,
    FIM_EDITAL DATE NOT NULL,
    TEMATICA_EDITAL VARCHAR(45) NOT NULL,
    ID_DONATARIO_EDITAL INT NOT NULL,
    ID_FUNCIONARIO_EDITAL INT NOT NULL,
    CONSTRAINT FK_ID_DONATARIO FOREIGN KEY (ID_DONATARIO_EDITAL) REFERENCES DONATARIOS(ID_DONATARIO),
    CONSTRAINT FK_ID_FUNCIONARIO FOREIGN KEY (ID_FUNCIONARIO_EDITAL) REFERENCES FUNCIONARIOS(ID_FUNCIONARIO)
);
```
- Representa editais emitidos e associados a funcionários e donatários.
- Inclui chaves estrangeiras que criam relações com as tabelas `DONATARIOS` e `FUNCIONARIOS`.

---

## Tabela VISTORIA
```sql
CREATE TABLE IF NOT EXISTS VISTORIA(
    ID_VISTORIA INT PRIMARY KEY NOT NULL,
    DOC_VISTORIA VARCHAR(45) NOT NULL,
    STATUS_VISTORIA TEXT NOT NULL,
    ID_DONATARIO_VISTORIA INT NOT NULL,
    ID_FUNCIONARIO_VISTORIA INT NOT NULL,
    CONSTRAINT FK_ID_DONATARIO_VISTORIA FOREIGN KEY (ID_DONATARIO_VISTORIA) REFERENCES DONATARIOS(ID_DONATARIO),
    CONSTRAINT FK_ID_FUNCIONARIO_VISTORIA FOREIGN KEY (ID_FUNCIONARIO_VISTORIA) REFERENCES FUNCIONARIOS(ID_FUNCIONARIO)
);
```
- Armazena informações sobre inspeções realizadas, como o documento e status da vistoria.

---

## Tabela RELATORIOS
```sql
CREATE TABLE IF NOT EXISTS RELATORIOS(
    ID_RELATORIOS INT PRIMARY KEY NOT NULL,
    DATA_RELATORIO DATE NOT NULL,
    GASTOS_RELATORIO DECIMAL(10,2) NOT NULL,
    ID_VISTORIA_RELATORIO INT NOT NULL,
    CONSTRAINT FK_ID_VISTORIA_RELATORIO FOREIGN KEY (ID_VISTORIA_RELATORIO) REFERENCES VISTORIA(ID_VISTORIA)
);
```
- Contém os relatórios financeiros e operacionais relacionados às vistorias.

---

## Tabela REUNIOES
```sql
CREATE TABLE IF NOT EXISTS REUNIOES(
    ID_REUNIAO INT PRIMARY KEY NOT NULL,
    DATA_REUNIAO DATE NOT NULL,
    HORA_REUNIAO TIME NOT NULL,
    ID_VISTORIA_REUNIAO INT NOT NULL,  
    CONSTRAINT FK_ID_VISTORIA_REUNIAO FOREIGN KEY (ID_VISTORIA_REUNIAO) REFERENCES VISTORIA(ID_VISTORIA)  	
);
```
- Registro de reuniões associadas a uma vistoria específica.

---

## Tabela ENDERECOS
```sql
CREATE TABLE IF NOT EXISTS ENDERECOS(
    N_RUA_END INT,
    RUA_END VARCHAR(45) NOT NULL,
    BAIRRO_END VARCHAR(45) NOT NULL,
    CIDADE_END VARCHAR(45) NOT NULL,
    ESTADO_END VARCHAR(45) NOT NULL,
    PAIS_END VARCHAR(45) NOT NULL,
    ID_DONATARIO_END INT NOT NULL,
    ID_FUNCIONARIO_END INT NOT NULL,
    CONSTRAINT FK_ID_DONATARIO_END FOREIGN KEY (ID_DONATARIO_END) REFERENCES DONATARIOS(ID_DONATARIO),
    CONSTRAINT FK_ID_FUNCIONARIO_END FOREIGN KEY (ID_FUNCIONARIO_END) REFERENCES FUNCIONARIOS(ID_FUNCIONARIO) 
);
```
- Registra endereços relacionados a donatários e funcionários.

---

## Tabela TELEFONES
```sql
CREATE TABLE IF NOT EXISTS TELEFONES(
    DDI_TEL VARCHAR(4) NOT NULL,
    DDD_TEL VARCHAR(4) NOT NULL,
    NUMERO_TEL VARCHAR(15),
    ID_DONATARIO_TEL INT NOT NULL,
    ID_FUNCIONARIO_TEL INT NOT NULL,
    CONSTRAINT FK_ID_DONATARIO_TEL FOREIGN KEY(ID_DONATARIO_TEL) REFERENCES DONATARIOS(ID_DONATARIO),
    CONSTRAINT FK_ID_FUNCIONARIO_TEL FOREIGN KEY(ID_FUNCIONARIO_TEL) REFERENCES FUNCIONARIOS(ID_FUNCIONARIO)
);
```
- Armazena números de telefone relacionados a donatários e funcionários.

---

## Resumo
Este banco de dados organiza informações administrativas relacionadas a uma instituição que gerencia editais, vistorias, relatórios e reuniões. Ele utiliza chaves primárias e estrangeiras para garantir a integridade e relacionamento entre os dados.
