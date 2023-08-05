USE bdRecursosHumanos

--a)Criar uma viewpara exibir a quantidade de funcionários por nome de departamento;

CREATE VIEW vwQtFunci_Depart AS
SELECT nomeDepartamento, COUNT(tbFuncionario.idFuncionario) AS 'Total dos funcionarios' FROM tbDepartamento
	INNER JOIN tbFuncionario ON tbDepartamento.idDepartamento = tbFuncionario.idDepartamento
	GROUP BY nomeDepartamento

SELECT * FROM vwQtFunci_Depart
--b)Usando a viewanterior, exibir somente o nome do departamento que possui o menor número de funcionários

SELECT nomeDepartamento FROM vwQtFunci_Depart
	WHERE [Total dos funcionarios]  = (SELECT MIN ([Total dos funcionarios])  FROM vwQtFunci_Depart)

--//

--c)Criar uma viewpara exibir a soma dos salários por nome de departamento

CREATE VIEW vwSomaSalario AS
SELECT nomeDepartamento, SUM(tbFuncionario.salarioFuncionario) AS 'Salario por departamento' FROM tbDepartamento
	INNER JOIN tbFuncionario ON tbDepartamento.idDepartamento = tbFuncionario.idDepartamento
		GROUP BY nomeDepartamento

		SELECT * FROM vwSomaSalario
--d)Utilizando a viewdo exercício anterior, mostrar somente a maior soma dentre os departamentos

SELECT nomeDepartamento,[Salario por departamento] FROM vwSomaSalario
	WHERE [Salario por departamento] = (SELECT MAX([Salario por departamento]) FROM vwSomaSalario)

--//

--e)Criar uma view para exibir somente o nome dos funcionários e o nome dos departamentos daqueles  funcionários que não possuem dependentes

	CREATE VIEW vwNullDependentes 
	SELECT  nomeDepartamento,nomeFuncionario  FROM tbDepartamento
		LEFT JOIN tbFuncionario ON tbDepartamento.idDepartamento = tbFuncionario.idDepartamento
			LEFT JOIN tbDependente ON tbFuncionario.idFuncionario = tbDependente.idFuncionario
				WHERE idDependente IS NULL

				SELECT * FROM vwNullDependentes 
--//

--f)Criar uma view que exiba a quantidade de dependentes por nome de funcionário 

CREATE VIEW vwQtDeptFunc AS
SELECT nomeFuncionario, COUNT(idDependente) AS 'Total de Dependentes por funcionario' FROM tbFuncionario
	INNER JOIN tbDependente ON tbFuncionario.idFuncionario = tbDependente.idFuncionario
		GROUP BY nomeFuncionario

		SELECT * FROM vwQtDeptFunc
--g)Utilizando a view anterior, mostrar somente o nome do funcionário que possui mais dependentes

	SELECT nomeFuncionario,[Total de Dependentes por funcionario] FROM vwQtDeptFunc
		WHERE [Total de Dependentes por funcionario] IN (SELECT MAX([Total de Dependentes por funcionario]) FROM vwQtDeptFunc)

--//

--h)Criar uma view para exibir a quantidade de dependentes por departamento

CREATE VIEW vwQtDepnDepar AS
	SELECT nomeDepartamento, COUNT(idDependente) AS 'Total de Dependentes por Departamento' FROM tbDepartamento
		INNER  JOIN tbFuncionario ON tbDepartamento.idDepartamento = tbFuncionario.idDepartamento
			INNER JOIN tbDependente ON tbFuncionario.idFuncionario = tbDependente.idFuncionario
				GROUP BY nomeDepartamento

				SELECT * FROM vwQtDepnDepar
--i)Utilizando a view do exercícios anterior, apresentar a soma geral dos dependentes

	 SELECT SUM([Total de Dependentes por Departamento]) AS'Total de Dependentes' FROM vwQtDepnDepar