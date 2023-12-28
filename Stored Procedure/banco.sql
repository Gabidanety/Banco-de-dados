CREATE DATABASE  bdConfeitaria
--drop database bdConfeitaria
USE bdConfeitaria

CREATE TABLE tbCliente(
	idCliente INT PRIMARY KEY IDENTITY (1,1)
	,nomeCliente VARCHAR (50) NOT NULL
	,dataNascCliente SMALLDATETIME NOT NULL
	,ruaCliente VARCHAR (50) NOT NULL
	,numCasaCliente VARCHAR (5) NOT NULL
	,cepCliente VARCHAR(10) NOT NULL
	,bairroCliente VARCHAR (30)NOT NULL
	,cidadeCliente VARCHAR (30) NOT NULL
	,estadoCliente VARCHAR (30) NOT NULL
	,cpfCliente VARCHAR (14) NOT NULL
	,sexoCliente VARCHAR (3) NOT NULL
)

CREATE TABLE tbCategoriaProduto(
	idCategoriaProduto INT PRIMARY KEY IDENTITY (1,1)
	,nomeCategoriaProduto VARCHAR (50)
)

CREATE TABLE tbEncomenda (
	idEncomenda INT PRIMARY KEY IDENTITY (1,1)
	,dataEncomenda SMALLDATETIME NOT NULL
	,idCliente  INT FOREIGN KEY REFERENCES tbCliente (idCliente)
	,valorTotalEncomenda SMALLMONEY NOT NULL
	,dataEntregaEncomenda SMALLDATETIME NOT NULL
)

CREATE TABLE tbProduto (
	idProduto INT PRIMARY KEY IDENTITY (1,1)
	,nomeProduto VARCHAR (50) NOT NULL
	,precoKiloProduto SMALLMONEY NOT NULL
	,idCategoriaProduto INT FOREIGN KEY REFERENCES tbCategoriaProduto (idCategoriaProduto)

)

CREATE TABLE tbItensEncomenda(
	idItensEncomenda INT PRIMARY KEY IDENTITY (1,1)
	,idEncomenda INT FOREIGN KEY REFERENCES tbEncomenda (idEncomenda)
	,idProduto INT FOREIGN KEY REFERENCES tbProduto (idProduto)
	,quantidadeKilosItensEncomenda DECIMAL NOT NULL
	,subTotalItensEncomenda DECIMAL NOT NULL
)

