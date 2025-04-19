
-- Criação do banco de dados
CREATE DATABASE faculdade;
USE faculdade;

-- Tabela de Alunos
CREATE TABLE Aluno (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    data_nascimento DATE
);

-- Tabela de Professores
CREATE TABLE Professor (
    id_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    especialidade VARCHAR(100)
);

-- Tabela de Cursos
CREATE TABLE Curso (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL
);

-- Tabela de Disciplinas
CREATE TABLE Disciplina (
    id_disciplina INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL,
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

-- Tabela de Turmas
CREATE TABLE Turma (
    id_turma INT PRIMARY KEY AUTO_INCREMENT,
    semestre VARCHAR(10),
    ano INT,
    id_disciplina INT,
    id_professor INT,
    FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id_disciplina),
    FOREIGN KEY (id_professor) REFERENCES Professor(id_professor)
);

-- Tabela de Matrículas
CREATE TABLE Matricula (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT,
    id_turma INT,
    data_matricula DATE,
    nota DECIMAL(5,2),
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (id_turma) REFERENCES Turma(id_turma)
);
