--DROP DATABASE bdEstoque

CREATE DATABASE bdEstoque

USE bdEstoque

CREATE TABLE tbFabricante (
	codFabricante INT PRIMARY KEY IDENTITY (1,1)
	,nomeFabricante VARCHAR (30) 
)
CREATE TABLE tbFornecedor (
	codFornecedor INT PRIMARY KEY IDENTITY (1,1)
	,nomeFornecedor VARCHAR (30)
	,contatoFornecedor VARCHAR (14)
)
CREATE TABLE tbProduto (
	codProduto INT PRIMARY KEY IDENTITY (1,1)
	,descricaoProduto VARCHAR (50)
	,valorProduto SMALLMONEY NOT NULL
	,quantidadeProduto INT
	,codFabricante INT FOREIGN KEY REFERENCES tbFabricante (codFabricante)
	,codFornecedor INT FOREIGN KEY REFERENCES tbFornecedor (codFornecedor)
)
CREATE TABLE tbCliente (
	codCliente INT PRIMARY KEY IDENTITY (1,1)
	,nomeCliente VARCHAR (30)
	,cpfCliente CHAR (14)
	,emailCliente VARCHAR (50)
	,sexoCliente CHAR (1)
	,dataNascimentoCliente SMALLDATETIME DEFAULT '09/09/2022'
)
CREATE TABLE tbVenda (
	codVenda INT PRIMARY KEY IDENTITY (1,1)
	,dataVenda SMALLDATETIME DEFAULT GETDATE ()
	,valorTotalVenda INT
	,codCliente INT FOREIGN KEY REFERENCES tbCliente (codCliente)
)
CREATE TABLE tbItensVenda (
	codItensVenda INT PRIMARY KEY IDENTITY (1,1)
	,codVenda INT FOREIGN KEY REFERENCES tbVenda (codVenda)
	,codProduto INT FOREIGN KEY REFERENCES tbProduto (codProduto)
	,quantidadeItensVenda INT
	,subTotalItensVenda INT
)
