﻿USE bdEscola2


--Crie uma visão “Preço_Baixo” que exiba o código, nome do curso, carga horária e o valor do curso de todos os cursos que tenha preço inferior ao preço médio.​
CREATE VIEW vwPreco_Baixo AS 
SELECT idCurso,nomeCurso,cargaHorariaCurso,valorCurso FROM tbCurso
WHERE valorCurso < (SELECT AVG(valorCurso) FROM tbCurso)

SELECT * FROM vwPreco_Baixo
	
--Usando a visão “Preço_Baixo”, mostre todos os cursos ordenados por carga horária.​
SELECT * FROM vwPreco_Baixo
	ORDER BY cargaHorariaCurso


--Crie uma visão “Alunos_Turma” que exiba o curso e a quantidade de alunos por turma.
CREATE VIEW vwAluno_Turma AS 
SELECT  nomeCurso, COUNT(tbMatricula.idAluno) AS'total de Alunos' FROM tbCurso
	INNER JOIN tbTurma ON tbCurso.idCurso = tbTurma.idCurso
	INNER JOIN  tbMatricula ON tbTurma.idTurma = tbMatricula.idTurma
	INNER JOIN tbAluno ON tbMatricula.idAluno = tbAluno.idAluno
	GROUP BY nomeCurso
	SELECT * FROM vwAluno_Turma


		

--Usando a visão “Alunos_Turma” exiba a turma com maior número de alunos.​

--Crie uma visão “Turma_Curso que exiba o curso e a quantidade de turmas.​

--Usando a visão “Turma_Curso exiba o curso com menor número de turmas.​
