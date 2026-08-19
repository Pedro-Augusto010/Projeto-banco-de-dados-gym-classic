CREATE TABLE Aluno (
    id_aluno INT PRIMARY KEY,
    nome VARCHAR(100),
    cpf CHAR(11) UNIQUE,
    idade INT,
    peso DECIMAL(5,2),
    altura INT,
    fk_Plano_id_plano INT,
    fk_Objetivo_id_objetivo INT
);

CREATE TABLE Plano (
    id_plano INT PRIMARY KEY,
    nome_plano VARCHAR(50),
    valor DECIMAL(10,2),
    duracao_meses INT
);

CREATE TABLE Objetivo (
    id_objetivo INT PRIMARY KEY,
    nome_objetivo VARCHAR(50)
);

CREATE TABLE Entidade_Associativa_Agendamento (
    id_agendamento INT PRIMARY KEY,
    data_inscricao DATE,
    fk_Status_id_status INT,
    fk_Aula_id_aula INT,
    fk_Aluno_id_aluno INT
);

CREATE TABLE Aula (
    id_aula INT PRIMARY KEY,
    nome_aula VARCHAR(100),
    horario DATETIME,
    duracao INT,
    fk_Sala_id_sala INT,
    fk_Professor_id_professor INT
);

CREATE TABLE Status (
    id_status INT PRIMARY KEY,
    nome_status VARCHAR(30)
);

CREATE TABLE Sala (
    id_sala INT PRIMARY KEY,
    nome_da_sala VARCHAR(50),
    capacidade_maxima INT
);

CREATE TABLE Professor (
    id_professor INT PRIMARY KEY,
    nome VARCHAR(100),
    cpf CHAR(11) UNIQUE,
    cref VARCHAR(20) UNIQUE,
    telefone VARCHAR(20),
    fk_Especialidade_id_especialidade INT
);

CREATE TABLE Especialidade (
    id_especialidade INT PRIMARY KEY,
    nome_especialidade VARCHAR(50)
);

ALTER TABLE Aluno ADD CONSTRAINT FK_Aluno_2
    FOREIGN KEY (fk_Plano_id_plano)
    REFERENCES Plano (id_plano)
    ON DELETE RESTRICT;

ALTER TABLE Aluno ADD CONSTRAINT FK_Aluno_3
    FOREIGN KEY (fk_Objetivo_id_objetivo)
    REFERENCES Objetivo (id_objetivo)
    ON DELETE RESTRICT;

ALTER TABLE Entidade_Associativa_Agendamento ADD CONSTRAINT FK_Entidade_Associativa_Agendamento_2
    FOREIGN KEY (fk_Status_id_status)
    REFERENCES Status (id_status)
    ON DELETE RESTRICT;

ALTER TABLE Entidade_Associativa_Agendamento ADD CONSTRAINT FK_Entidade_Associativa_Agendamento_3
    FOREIGN KEY (fk_Aula_id_aula)
    REFERENCES Aula (id_aula);

ALTER TABLE Entidade_Associativa_Agendamento ADD CONSTRAINT FK_Entidade_Associativa_Agendamento_4
    FOREIGN KEY (fk_Aluno_id_aluno)
    REFERENCES Aluno (id_aluno);

ALTER TABLE Aula ADD CONSTRAINT FK_Aula_2
    FOREIGN KEY (fk_Sala_id_sala)
    REFERENCES Sala (id_sala)
    ON DELETE RESTRICT;

ALTER TABLE Aula ADD CONSTRAINT FK_Aula_3
    FOREIGN KEY (fk_Professor_id_professor)
    REFERENCES Professor (id_professor)
    ON DELETE RESTRICT;

ALTER TABLE Professor ADD CONSTRAINT FK_Professor_2
    FOREIGN KEY (fk_Especialidade_id_especialidade)
    REFERENCES Especialidade (id_especialidade)
    ON DELETE RESTRICT;