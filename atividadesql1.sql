-- Criar e remover o banco de dados (no PostgreSQL, o comando DROP DATABASE 
-- geralmente precisa ser executado fora de uma transação ou conectado a outro banco)
-- CREATE DATABASE JogosOlimpicos1215;
-- DROP DATABASE IF EXISTS JogosOlimpicos1215;

-- 1. Tabela Pais
CREATE TABLE Pais (
    codigo INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    PRIMARY KEY (codigo)
);

-- 2. Tabela Pessoa
CREATE TABLE Pessoa (
    codigo INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    CPF CHAR(14) NOT NULL,
    sexo CHAR(1) NOT NULL,
    PRIMARY KEY (codigo)
);

-- 3. Tabela Modalidade
CREATE TABLE Modalidade (
    codigo INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(100),
    PRIMARY KEY (codigo)
);

-- 4. Tabela Atleta
CREATE TABLE Atleta (
    codigo INT NOT NULL,
    salario REAL NOT NULL,
    codigo_pais INT NOT NULL,
    codigo_pessoa INT NOT NULL,
    PRIMARY KEY (codigo),
    FOREIGN KEY (codigo_pais) REFERENCES Pais(codigo),
    FOREIGN KEY (codigo_pessoa) REFERENCES Pessoa(codigo)
);

-- 5. Tabela Atleta_Modalidade (Relacionamento N para N)
CREATE TABLE Atleta_Modalidade (
    codigo_atleta INT NOT NULL,
    codigo_modalidade INT NOT NULL,
    nivel VARCHAR(14) NOT NULL,
    PRIMARY KEY (codigo_atleta, codigo_modalidade),
    FOREIGN KEY (codigo_atleta) REFERENCES Atleta(codigo),
    FOREIGN KEY (codigo_modalidade) REFERENCES Modalidade(codigo)
);