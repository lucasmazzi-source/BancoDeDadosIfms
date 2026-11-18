DROP TABLE IF EXISTS Consulta, Medico, Paciente, Ambulatorio CASCADE;

CREATE TABLE Ambulatorio (
    nroa INT PRIMARY KEY,
    andar INT NOT NULL,
    capacidade INT NOT NULL
);

CREATE TABLE Medico (
    codm INT PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    idade INT NOT NULL,
    especialidade VARCHAR(20) NOT NULL,
    CPF VARCHAR(11) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    nroa INT,
    FOREIGN KEY (nroa) REFERENCES Ambulatorio(nroa)
);

CREATE TABLE Paciente (
    codp INT PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    idade INT NOT NULL,
    cidade VARCHAR(30),
    CPF VARCHAR(11),
    doenca VARCHAR(40) NOT NULL
);

CREATE TABLE Consulta (
    codm INT,
    codp INT,
    data_consulta DATE,
    hora_consulta TIME,
    PRIMARY KEY (codm, codp, data_consulta, hora_consulta),
    FOREIGN KEY (codm) REFERENCES Medico(codm),
    FOREIGN KEY (codp) REFERENCES Paciente(codp)
);

INSERT INTO Ambulatorio (nroa, andar, capacidade) VALUES
(1, 1, 30),
(2, 2, 25);

INSERT INTO Medico (codm, nome, idade, especialidade, CPF, cidade, nroa) VALUES
(1, 'Carlos Eduardo Lima', 45, 'ortopedista', '12345678901', 'Campo Grande', 1),
(2, 'Ana Beatriz Rocha', 38, 'cardiologista', '98765432100', 'Campo Grande', 2);

INSERT INTO Paciente (codp, nome, idade, cidade, CPF, doenca) VALUES
(1, 'João da Silva', 29, 'Campo Grande', '11122233344', 'Fratura no braço'),
(2, 'Maria Oliveira', 54, 'Dourados', '55566677788', 'Hipertensão');

INSERT INTO Consulta (codm, codp, data_consulta, hora_consulta) VALUES
(1, 1, '2026-10-10', '08:30:00'),
(1, 1, '2026-10-20', '09:00:00'),
(2, 2, '2026-10-15', '14:00:00');
SELECT capacidade
FROM Ambulatorio
WHERE andar = 1;

SELECT CPF, nome
FROM Medico
ORDER BY nome ASC;

SELECT COUNT(*) AS quantidade_ambulatorio
FROM Ambulatorio;
SELECT codm, COUNT(*) AS total_consultas
FROM Consulta
GROUP BY codm
HAVING COUNT(*) > 1
ORDER BY codm ASC;

UPDATE Medico
SET nome = 'Marcos Paulo de Souza',
    idade = 30
WHERE especialidade = 'ortopedista';

DELETE FROM Consulta;
DELETE FROM Medico;
DELETE FROM Paciente;
DELETE FROM Ambulatorio;