USE bdEstoque



--Exercicio 2 bdEstoque
--1- Criar uma função que retorne o dia da semana da venda (no formato segunda, terça, etc) ao lado do código da venda, valor total da venda e sua data
 
 CREATE FUNCTION fc_diaVenda (@Data date)
	
	RETURNS VARCHAR (40)
		AS
			BEGIN 
				DECLARE @diaSemana VARCHAR(40)
				DECLARE @dia INT
					SET @dia = DATEPART (dw,@Data)
						IF @Dia =1
							BEGIN 
								SET @diaSemana = 'DOMINGO'
							END
						IF @Dia =2
							BEGIN 
								SET @diaSemana = 'SEGUNDA-FEIRA'
							END
						IF @Dia =3
							BEGIN 
								SET @diaSemana = 'TERÇA-FEIRA'
							END	
						IF @Dia =4
							BEGIN 
								SET @diaSemana = 'QUARTA-FEIRA'
							END		
						IF @Dia =5
							BEGIN 
								SET @diaSemana = 'QUINTA-FEIRA'
							END	
						IF @Dia =6
							BEGIN 
								SET @diaSemana = 'SEXTA-FEIRA'
							END
						IF @Dia =7
							BEGIN 
								SET @diaSemana = 'SABADO'
							END
						RETURN @diaSemana
				END

SELECT dataVenda AS 'Data da Venda', DiaVenda=dbo.fc_diaVenda(dataVenda) from tbVenda

--2- Criar uma função que receba o código do cliente e retorne o total de vendas que o cliente ja realizou
 CREATE FUNCTION fc_ttVendas (@idCliente INT)
		RETURNS INT 

		BEGIN

			--	!!! mudar cod para id !!!!
				DECLARE @vendas INT

				SET @vendas = (SELECT COUNT(idCliente) FROM tbVenda WHERE idCliente = @idCliente)

				RETURN @vendas

		END

		SELECT idCliente AS 'Código do Cliente',  totalVendas  = dbo.fc_ttVendas  (idCliente)  FROM tbCliente
		SELECT * FROM tbVenda


--3- Criar uma função que receba o código de um vendedor e o mês e informe o total de vendas do vendedor no mês informado
 
	ALTER FUNCTION fc_ttVendasVendedor (@idVendedor INT,@mes SMALLMONEY)
  		RETURNS SMALLMONEY
		
		BEGIN
			DECLARE @total INT

			SET @total = (SELECT SUM(valorTotalVenda) FROM tbVenda
							WHERE codCliente = @idVendedor AND MONTH(dataVenda) =@mes) 

				RETURN @total

		END

DECLARE @idFornecedor INT
DECLARE @mes INT
SET @idFornecedor = 1 -- Substitua 2 pelo código do fornecedor desejado
SET @mes = 2 -- Substitua 2 pelo mês desejado

SELECT dbo.fc_ttVendasVendedor(@idFornecedor, @mes) AS TotalVendasNoMes

SELECT * FROM tbVenda
SELECT * FROM tbProduto
SELECT * FROM tbItensVenda

--4- Criar uma função queusando o bdEstoque diga se o cpf do cliente é ou não valido
ALTER FUNCTION CPF_VALIDO(@CPF VARCHAR(11))
	RETURNS CHAR(1)
	AS
		BEGIN
			DECLARE @INDICE INT,
			@SOMA INT,
			@DIG1 INT,
			@DIG2 INT,
			@CPF_TEMP VARCHAR(11),
			@DIGITOS_IGUAIS CHAR(1),
			@RESULTADO CHAR(1)
			SET @RESULTADO = 'Nao'


			SET @CPF_TEMP = SUBSTRING(@CPF,1,1)
			SET @INDICE = 1
			SET @DIGITOS_IGUAIS = 'Sim'
				WHILE (@INDICE <= 11)
					BEGIN
						IF SUBSTRING(@CPF,@INDICE,1) <> @CPF_TEMP
						SET @DIGITOS_IGUAIS = 'Nao'
						SET @INDICE = @INDICE + 1
					END;
				IF @DIGITOS_IGUAIS = 'Nao'
				BEGIN
				
					SET @SOMA = 0
					SET @INDICE = 1
				WHILE (@INDICE <= 9)
					BEGIN
						SET @Soma = @Soma + CONVERT(INT,SUBSTRING(@CPF,@INDICE,1)) * (11 - @INDICE);
						SET @INDICE = @INDICE + 1
					END
				SET @DIG1 = 11 - (@SOMA % 11)

				IF @DIG1 > 9
					SET @DIG1 = 0;
					SET @SOMA = 0
					SET @INDICE = 1
				WHILE (@INDICE <= 10)
					BEGIN
						SET @Soma = @Soma + CONVERT(INT,SUBSTRING(@CPF,@INDICE,1)) * (12 - @INDICE);
						SET @INDICE = @INDICE + 1
					END
						SET @DIG2 = 11 - (@SOMA % 11)
					IF @DIG2 > 9
						SET @DIG2 = 0;
					
					IF (@DIG1 = SUBSTRING(@CPF,LEN(@CPF)-1,1)) AND (@DIG2 =
						SUBSTRING(@CPF,LEN(@CPF),1))
						SET @RESULTADO = 'Sim'
					ELSE
						SET @RESULTADO = 'Nao'
					END

				RETURN @RESULTADO
		END

DECLARE @cpf VARCHAR(11)
SET @cpf = '45909824805'

SELECT  @cpf AS CPF, dbo.CPF_VALIDO(@cpf) AS Validade