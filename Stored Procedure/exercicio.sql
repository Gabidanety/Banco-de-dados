USE bdConfeitaria


--A Criar uma StoredProcedure para inserir as categorias de produto conforme abaixo:

CREATE PROCEDURE spInsereCategoria
	@nomeCategoria VARCHAR (50)

AS
	DECLARE @idCategoriaProduto INT
		IF EXISTS (SELECT idCategoriaProduto FROM tbCategoriaProduto
			WHERE nomeCategoriaProduto LIKE @nomeCategoria)
				BEGIN 
					PRINT ('Não foi foi possivel cadastrar, categoria ja existe')
				END
		ELSE 
				BEGIN
					INSERT INTO tbCategoriaProduto (nomeCategoriaProduto)
							VALUES (@nomeCategoria)
								PRINT ( @nomeCategoria + ' cadastrado com sucesso' )
				END

EXEC spInsereCategoria 'Salgado'

EXEC spInsereCategoria 'Bolo Festa'

EXEC spInsereCategoria 'Bolo simples'

EXEC spInsereCategoria 'Torta'


SELECT * FROM tbCategoriaProduto

-- B Criar  uma  Stored Procedure  para  inserir os  produtos abaixo,  sendo  que,  a  procedure  deverá antes de inserir verificar se o nome do produto já existe, evitando assim que um produto seja duplicado:

ALTER PROCEDURE spInsereProduto
	@nomeProduto VARCHAR (50)
	,@precoKilo SMALLMONEY
	,@idCategoriaProduto INT

AS
 
	IF NOT EXISTS (SELECT idCategoriaProduto FROM tbCategoriaProduto WHERE idCategoriaProduto = @idCategoriaProduto)
		BEGIN
			PRINT ('Não foi foi possivel cadastrar, categoria do Produto nao existe')
		END

	ELSE 
		BEGIN
			IF EXISTS (SELECT nomeProduto FROM tbProduto WHERE nomeProduto LIKE @nomeProduto)
				BEGIN 
					PRINT ('Não foi foi possivel cadastrar, categoria ja existe')
				END
			ELSE 
				BEGIN
					INSERT INTO tbProduto (nomeProduto, precoKiloProduto, idCategoriaProduto)
							VALUES (@nomeProduto, @precoKilo, @idCategoriaProduto)
						
								PRINT ( @nomeProduto + 'que custa R$ '+CONVERT(VARCHAR(5),@precoKilo) + ' cadastrado com sucesso' )
				END
			END


	 
EXEC spInsereProduto 'Bolo Floresta Negra ', 42.0,1
EXEC spInsereProduto 'Bolo Prestigio',43.0,1
EXEC spInsereProduto 'Bolo NUtella',44,1
EXEC spInsereProduto 'Bolo Formigueiro',17.0,2
EXEC spInsereProduto 'Bolo de Cenoura',19,2
EXEC spInsereProduto 'Torta de Palmito',45,3
EXEC spInsereProduto 'Torta de Frango e catupiry',47,3
EXEC spInsereProduto 'Torta de Escarola',44,3
EXEC spInsereProduto 'Coxinha frango',25,4
 EXEC spInsereProduto 'Esfiha carne',27,4
EXEC spInsereProduto 'Folha queijo',31,4
EXEC spInsereProduto 'Risoles misto',29,4

EXEC spInsereProduto 'Pastel',7.6,5 --produto nao exixte


SELECT * FROM tbProduto


--c)Criar uma stored procedure para cadastrar os clientes abaixo relacionados, sendo que deverão ser feitas duas validações:

CREATE PROCEDURE spCadsCliente
	@nomeCliente VARCHAR (50)
	,@dataNascCliente SMALLDATETIME
	,@ruaCliente VARCHAR (50)
	,@numCasaCliente VARCHAR (5)
	,@cepCliente VARCHAR (10)
	,@bairroCliente VARCHAR(30)
	,@cidadeCliente VARCHAR (30)
	,@estadoCliente VARCHAR (30)
	,@cpfCliente VARCHAR (14)
	,@sexoCliente VARCHAR(3)
AS 
	DECLARE @idCliente INT
		IF EXISTS (SELECT idCliente FROM tbCliente WHERE cpfCliente LIKE @cpfCliente)
			BEGIN 
				PRINT ('Não foi possivel cadastrar! Cliente com cpf '+ @cpfCliente + ' ja cadastrado')
			END
		ELSE IF  (@bairroCliente LIKE 'Guaianazes' OR @bairroCliente LIKE 'Itaquera')
			BEGIN 
				INSERT INTO tbCliente (nomeCliente, dataNascCliente,ruaCliente,numCasaCliente,cepCliente,bairroCliente,cidadeCliente,estadoCliente,cpfCliente,sexoCliente)
						VALUES (@nomeCliente, @dataNascCliente, @ruaCliente,@numCasaCliente,@cepCliente,@bairroCliente,@cidadeCliente,@estadoCliente,@cpfCliente,@sexoCliente)
							PRINT ( 'Cliente '+@nomeCliente+' Cadastrado com sucesso' )
			END
		ELSE 
			BEGIN
				PRINT ('Não foi possivel cadastrar o cliente cpf '+@cpfCliente+' pois o bairro '+@bairroCliente+' não é atendido pela confeitaria')
			END
		

EXEC spCadsCliente
	'Samirra', '05/05/1990', 'Rua Aguapeí','1000','08.090.000','Guaianazes','SP','SP','1234567890', 'Fem'
EXEC spCadsCliente
	'Celia Nogueira','06/06/1992','Rua Andes','234','08.456-090','Guaianazes','SP','SP','0987654321','Fem'	
EXEC spCadsCliente
	'Paulo Cesar Siqueira','09/04/1998','Rua Castelo do Piaui','232','08.109-000','Itaquera','SP','SP','45962314624','Mas'	
EXEC spCadsCliente
	'Rodrigo Favaroni','04/04/1991','Rua Sansao Castelo Branco','10','08.431-090','Guaianazes','SP','SP','78325614967','Mas'	
EXEC spCadsCliente
	'Flavia Regina Bito','22/04/1992','Rua Mariano Moro','300','08.200-123','Itaquera','SP','SP','54245935418','Fem'	
EXEC spCadsCliente
	'Juliana Casé','05/10/1998','Rua Luciano Freiras','34B','25.275-132','Itaquera','SP','SP','25687435','Fem'	

EXEC spCadsCliente -- teste do bairro
	'Regina Tobi','25/05/1995','Rua Mariano Moro','300','08.200-123','Sâo Miguel','SP','SP','4785963256','Fem'	


SELECT * FROM tbCliente

--d)Criar via stored procedure as encomendas abaixo relacionadas, fazendo as verificações
ALTER PROCEDURE spEncomendas
	@dataEncomenda SMALLDATETIME
	,@idCliente INT
	,@valorTotalEncomenda SMALLMONEY
	,@dataEntregaEncomenda SMALLDATETIME
	,@cpfCliente VARCHAR (14)
	
AS
	DECLARE @idEncomenda INT

		IF EXISTS (SELECT idCliente FROM tbCliente WHERE cpfCliente LIKE @cpfCliente)
			BEGIN 
				INSERT INTO tbEncomenda (dataEncomenda, idCliente, valorTotalEncomenda,dataEntregaEncomenda)
						VALUES (@dataEncomenda, @idCliente, @valorTotalEncomenda,@dataEntregaEncomenda)
						
						PRINT ('Encomenda '+CONVERT(VARCHAR(11),@dataEncomenda)+' para o cliente cpf '+@cpfCliente +' foi fetuada com sucesso')
			END
		ELSE 
			BEGIN
				PRINT ('não foi possível efetivar a encomenda pois o cliente cpf '+@cpfCliente +' não está cadastrado')	   
			END
	

EXEC spEncomendas
'08/08/2015',1,450,'15/08/2015','1234567890' 
EXEC spEncomendas
'10/10/2015',2,200,'15/10/2015','0987654321'
EXEC spEncomendas
'10/10/2015',3,150,'10/12/2015','45962314624'
EXEC spEncomendas
'06/10/2015',1,250,'12/10/2015','1234567890'
EXEC spEncomendas
'05/10/2015',4,150,'12/10/2015','78325614967'

EXEC spEncomendas --cliente ao existe
'05/10/2015',4,150,'12/10/2015','78325614953'

SELECT * FROM tbEncomenda


--e) Ao adicionar a encomenda, criar uma Stored procedure, para que sejam inseridos os itens da encomenda conforme tabela a seguir. 

ALTER PROCEDURE spItensEncomenda
	@idEncomenda INT
	,@idProduto INT 
	,@quantKIlos DECIMAL
	,@subTotal DECIMAL

AS
		IF NOT EXISTS (SELECT idEncomenda FROM tbEncomenda WHERE idEncomenda = @idEncomenda)
			BEGIN
				PRINT ('Não foi foi possivel cadastrar, Encomenda nao existe')
			END
		ELSE 
			BEGIN
				IF NOT EXISTS (SELECT idProduto FROM tbProduto WHERE idProduto = @idProduto)
					BEGIN
						PRINT ('Não foi foi possivel cadastrar, Produto nao existe')
					END
				ELSE 
					BEGIN
						INSERT INTO tbItensEncomenda (idEncomenda, idProduto,quantidadeKilosItensEncomenda,subTotalItensEncomenda)
							VALUES (@idEncomenda, @idProduto,@quantKIlos,@subTotal)
							DECLARE @id INT
								SET @id = (SELECT MAX(idItensEncomenda) FROM tbItensEncomenda)
									PRINT ('Itens da Encomenda cadastrado com sucesso')
					 END
			END

EXEC spItensEncomenda
	1,1,2.5,105
EXEC spItensEncomenda
	1,10,2.6,70
EXEC spItensEncomenda
	1,9,6,150
EXEC spItensEncomenda
	1,12,4.3,125
EXEC spItensEncomenda
	2,9,8,200
EXEC spItensEncomenda
	3,11,3.2,100
EXEC spItensEncomenda
	3,9,2,50
EXEC spItensEncomenda
	4,2,3.5,150
EXEC spItensEncomenda
	4,3,2.2,100
EXEC spItensEncomenda
	5,6,3.4,150

EXEC spItensEncomenda --encomenda nao existe
	10,3,2.2,100

EXEC spItensEncomenda -- produto nao existe
	7,18,3.4,150



SELECT * FROM tbItensEncomenda
SELECT * FROM tbEncomenda



--f)Após todos os cadastros, criar Storedprocedurespara alterar o que se pede:

CREATE PROCEDURE spAlteraProdutos

	AS

		BEGIN
--BOLO DE FESTA
			UPDATE tbProduto 
				SET precokiloProduto = precoKiloProduto - (precoKiloProduto*10/100)
					WHERE idCategoriaProduto = 2
--BOLO SIMPLES
		UPDATE tbProduto 
				SET precokiloProduto = precoKiloProduto - (precoKiloProduto*20/100)
					WHERE idCategoriaProduto = 3
--TORTA
	 UPDATE tbProduto 
				SET precokiloProduto = precoKiloProduto - (precoKiloProduto*25/100)
					WHERE idCategoriaProduto = 4
--SALGADO
		UPDATE tbProduto 
				SET precokiloProduto = precoKiloProduto - (precoKiloProduto*20/100)
					WHERE idCategoriaProduto = 1

		END	

EXEC spAlteraProdutos

SELECT * FROM tbProduto


--g)Criar uma procedure para excluir clientes pelo CPF 

ALTER PROCEDURE spDeleteCliente
	@cpfCliente VARCHAR (14)

AS
	DECLARE @nomeCliente VARCHAR (50)
		IF EXISTS (SELECT idCliente FROM tbCliente WHERE cpfCliente LIKE @cpfCliente)
			BEGIN
			 	
				SELECT @nomeCliente = (SELECT nomeCliente FROM tbCliente WHERE cpfCliente LIKE @cpfCliente )

					IF NOT EXISTS (SELECT cpfCliente FROM tbEncomenda
							LEFT JOIN tbCliente ON tbCliente.idCliente = tbEncomenda.idCliente
									WHERE cpfCliente LIKE @cpfCliente)

						BEGIN
							DELETE FROM tbCliente WHERE cpfCliente = @cpfCliente
								PRINT('Cliente '+@nomeCliente+' removido com sucesso')
						END
					ELSE 
						BEGIN 
							PRINT('Impossível  remover  esse  cliente  pois  o cliente '+ @nomeCliente +' possui encomendas')
						END
			 END
		ELSE
			BEGIN
				PRINT('Cpf '+@cpfCliente+' nao cadastrado')
			END

EXEC spDeleteCliente '25687435' --Cliente sem Encomenda
EXEC spDeleteCliente '0987654321' -- Cliente com encomenda

SELECT * FROM tbCliente

--h) Criar uma procedure que permita excluir qualquer item de uma encomenda que exista. Para tal o cliente deverá fornecer o código da encomenda e o código do produto que será excluído da encomenda. A procedure deverá remover o item e atualizar o valor total da encomenda, do qual deverá ser subtraído o valor do item a ser removido. A procedure poderá remover apenas um item da encomenda de cada vez.
ALTER PROCEDURE spDeleteItensEncomenda
	@idEncomenda INT
	,@idProduto INT

AS
	IF NOT EXISTS (SELECT idEncomenda FROM tbItensEncomenda WHERE idEncomenda = @idEncomenda)
		BEGIN
			PRINT('Encomenda nao existe')
		END
	ELSE
		BEGIN
			IF NOT EXISTS (SELECT idProduto FROM tbItensEncomenda WHERE idProduto = @idProduto)
				BEGIN
					PRINT('Produto nao existe')
				END
			ELSE
				BEGIN
					IF EXISTS (SELECT idItensEncomenda,idEncomenda,idProduto FROM tbItensEncomenda WHERE idEncomenda = @idEncomenda AND idProduto =@idProduto )
						BEGIN
							DECLARE @idItens INT
								SET @idItens =(SELECT idItensEncomenda FROM tbItensEncomenda WHERE idProduto = @idProduto AND idEncomenda = @idEncomenda)

							DECLARE @ValorProduto SMALLMONEY
									SET @ValorProduto = (SELECT precoKiloProduto FROM tbProduto WHERE idProduto = @idProduto)

								UPDATE tbItensEncomenda
									SET idProduto = NULL WHERE idItensEncomenda = @idItens 

								UPDATE tbItensEncomenda
									SET subTotalItensEncomenda = (subTotalItensEncomenda - @ValorProduto)
										WHERE idItensEncomenda = @idItens
										
									PRINT('Produto:'+CONVERT(VARCHAR(11),@idProduto)+' Deletado com sucesso  e SubTotalAtualizado ')
							END
					ELSE
							BEGIN
							PRINT('Impossivel executar')
							END	 
				END
		END

EXEC spDeleteItensEncomenda --teste 1
4,2

EXEC spDeleteItensEncomenda --teste 2
1,12

SELECT * FROM tbItensEncomenda


--i)Criar  uma  stored  procedure  que  receba  o  cpf  de  um  cliente  e  a  data  de  entrega  de  uma encomenda e exclua essa encomenda feita para esse cliente. Para tal a stored procedure terá que:

ALTER PROCEDURE spDeleteEncomenda
@cpfCliente VARCHAR (14)
,@dataEntrega SMALLDATETIME
AS
--a.Verificar se o cliente existe no banco de dados
		IF NOT EXISTS (SELECT cpfCliente FROM tbCliente WHERE cpfCliente = @cpfCliente)
			BEGIN
				PRINT ('Cliente Não cadastrado!')
			END
		ELSE
			BEGIN
		--b.Verificar se o cliente possui encomenda na data solicitada

				DECLARE @idCliente int
				SET @idCliente = (SELECT idCliente FROM tbCliente WHERE cpfCliente = @cpfCliente ) 

					IF NOT EXISTS(SELECT idCliente FROM tbEncomenda WHERE idCliente = @idCliente AND dataEntregaEncomenda LIKE @dataEntrega)
					
						BEGIN 
						--c.Em caso negativo (não existe cliente ou não existe encomenda) para ambos os casos enviar mensagem informando a situação

							PRINT ('Cliente nao possue encomenda para esta data  de entrega '+CONVERT(VARCHAR(11),@dataEntrega))
						END 
					ELSE
				--d.Em caso positivo (existe cliente e existe encomenda) excluir a encomenda e todos os seus itens do banco de dados

						BEGIN
							DECLARE @idEncomenda INT
							SET @idEncomenda = (SELECT idEncomenda FROM tbEncomenda WHERE idCliente = @idCliente AND dataEntregaEncomenda LIKE @dataEntrega)

							DELETE FROM tbItensEncomenda	WHERE idEncomenda = @idEncomenda
							DELETE FROM tbEncomenda WHERE idEncomenda = @idEncomenda
						END
					

				END

EXEC spDeleteEncomenda
'1234567890','15/08/2015'

EXEC spDeleteEncomenda
'2563987452','10/12/2015' --Cliente nao exixte

EXEC spDeleteEncomenda
'0987654321','03/08/2015' --Cliente nao possue encomenda nesta data
	
SELECT * FROM tbEncomenda
SELECT * FROM tbItensEncomenda


--j)Criar uma stored procedure que receba uma data de entrega e que liste todas as encomendas e itens que deverão ser entregues na referida data
ALTER PROCEDURE spConsultaEncomenda 
@dataEntrega SMALLDATETIME
AS

	IF EXISTS (SELECT idEncomenda FROM tbEncomenda WHERE dataEntregaEncomenda LIKE @dataEntrega) 
		BEGIN
		  SELECT DataEntregaEncomenda as 'Data de Entrega',idItensEncomenda ,NomeProduto AS 'Nome do Produto'
				,quantidadeKilosItensEncomenda AS 'Quantidade de Kg',subTotalItensEncomenda AS 'SubTotal' FROM tbEncomenda

					INNER JOIN tbItensEncomenda ON tbItensEncomenda.idEncomenda = tbEncomenda.idEncomenda
						INNER JOIN tbProduto ON tbProduto.idProduto = tbItensEncomenda.idProduto
							WHERE dataEntregaEncomenda LIKE @dataEntrega 
		END
	ELSE 
		BEGIN
			PRINT('Não exixte nenhuma encomenda com esta data: '+CONVERT(VARCHAR(11),@dataEntrega))
		END

EXEC spConsultaEncomenda '2015/10/12'	

EXEC spConsultaEncomenda '2015/08/12'	--nao existe encomenda

SELECT * FROM tbEncomenda
SELECT * FROM tbItensEncomenda