CREATE DATABASE bdLivrariaBrasileira

USE bdLivrariaBrasileira

CREATE TABLE tbAutor(
	idAutor INT PRIMARY KEY IDENTITY (1,1)
	,nomeAutor VARCHAR (50) NOT NULL
)
CREATE TABLE tbEditora(
	idEditora INT PRIMARY KEY IDENTITY (1,1)
	,nomeEditora VARCHAR (50) NOT NULL
)
CREATE TABLE tbGenero(
	idGenero INT PRIMARY KEY IDENTITY (1,1)	
	,nomeGenero VARCHAR (50) NOT NULL
)
CREATE TABLE tbLivro(us
	idLivro INT PRIMARY KEY IDENTITY (1,1)
	,nomeLivro VARCHAR (50) NOT NULL
	,numPaginas INT NOT NULL
	,idGenero INT FOREIGN KEY REFERENCES tbGenero (idGenero)
	,idAutor INT FOREIGN KEY REFERENCES tbAutor (idAutor)
	,idEditora INT FOREIGN KEY REFERENCES tbEditora (idEditora)
)
