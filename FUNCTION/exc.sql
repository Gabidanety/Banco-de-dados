USE bdEscola2
--1- Crie uma fun��o que informada uma data da matricula, retorne o dia da semana
CREATE FUNCTION fc_diaSemana (@Data date)
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
								SET @diaSemana = 'TER�A-FEIRA'
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
 
SELECT dataMatricula AS 'Data da Matricula', aDiaDaSemana=dbo.fc_diaSemana(dataMatricula) from tbMatricula
 
--2-Crie uma fun��o que de acordo com a carga horaria do curso exiba curso r�pido ou curso extenso.(R�pido menos 1000 horas).
ALTER FUNCTION fc_horasCurso (@cargaHora INT)
	RETURNS VARCHAR (50) 
		AS
			BEGIN 
				DECLARE @horas INT
				DECLARE @tempo VARCHAR(50)
 
				SET @horas = (SELECT cargaHorariaCurso FROM tbCurso WHERE cargaHorariaCurso LIKE @cargaHora )
 
					IF(@horas <= 1000)
						BEGIN 
							SET @tempo = ('Curso R�pido')
						END
					IF(@horas > 1000)
						BEGIN 
							SET @tempo = ('Curso Extenso')
						END

					RETURN @tempo
			END
 
SELECT nomeCurso  AS 'Nome Curso', tempoCurso = dbo.fc_horasCurso (cargaHorariaCurso) FROM tbCurso
 
 
--3- Crie uma fun��o de acordo com o valor do curso exiba curso caro ou curso barato(Curso caro acima de 400)

CREATE FUNCTION fc_valorCurso (@valor SMALLMONEY)
	RETURNS VARCHAR (50) 
		AS
			BEGIN 
				DECLARE @valorCurso SMALLMONEY
				DECLARE @Custo VARCHAR(50)
 
				SET @valorCurso = (SELECT valorCurso FROM tbCurso WHERE valorCurso = @valor) 
 
					IF(@valorCurso > 400)
						BEGIN 
							SET @Custo = ('Curso Caro')
						END
					IF(@valorCurso <= 400)
						BEGIN 
							SET @Custo  = ('Curso Barato')
						END

					RETURN @Custo 
			END
 
 SELECT nomeCurso  AS 'Nome Curso',valorCurso = dbo.fc_valorCurso (valorCurso) FROM tbCurso

--4- Criar uma fun��o que informada a data da matricula converta-a no formado dd/mm/aaaa
ALTER FUNCTION fc_dataMatricula (@data SMALLDATETIME)
	RETURNS VARCHAR (50) 

	BEGIN
			DECLARE @dataMatricula VARCHAR (10)

			SET @dataMatricula =  FORMAT(@data, 'dd/MM/yyyy', 'pt-BR')

			RETURN @dataMatricula
	END

 
 	SELECT dataMatricula AS 'Data da Matricula', dbo.fc_dataMatricula(dataMatricula) AS 'Data em PT-BR:' FROM tbMatricula
