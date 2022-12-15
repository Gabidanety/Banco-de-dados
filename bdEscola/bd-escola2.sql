CREATE DATABASE bdEscola2

USE bdEscola2

CREATE TABLE tbAluno(
	idAluno INT PRIMARY KEY IDENTITY (1,1)
	,nomeAluno VARCHAR(60) NOT NULL
	,dataNascaluno SMALLDATETIME NOT NULL
	,rgAluno CHAR(25) NOT NULL
	,naturalidadeAluno VARCHAR(3) NOT NULL
)
CREATE TABLE tbCurso(
	idCurso INT PRIMARY KEY IDENTITY (1,1)
	,nomeCurso VARCHAR(20) NOT NULL
	,cargaHorariaCurso INT NOT NULL
	,valorCurso VARCHAR(8) NOT NULL
)
CREATE TABLE tbTurma(
	idTurma INT PRIMARY KEY IDENTITY (1,1)
	,nomeTurma VARCHAR(5) NOT NULL
	,idCurso INT FOREIGN KEY REFERENCES tbCurso (idCurso)
	,horarioTurma SMALLDATETIME NOT NULL
)
CREATE TABLE tbMatricula(
	idMatricula INT PRIMARY KEY IDENTITY (1,1)
	,dataMatricula SMALLDATETIME DEFAULT GETDATE () NOT NULL
	,idAluno INT FOREIGN KEY REFERENCES tbAluno (idAluno)
	,idTurma INT FOREIGN KEY REFERENCES tbTurma (idTurma)
)
