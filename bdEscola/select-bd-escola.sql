use bdEscola2

--Listar o nome, rg e data de aniversário dos alunos nascidos em SP
SELECT nomeAluno AS 'Nome', rgAluno AS 'RG' FROM tbAluno
	WHERE naturalidadeAluno LIKE 'S%'

--Listar o nome e o rg dos alunos com o nome começado com P
SELECT nomeAluno AS 'Nome', rgAluno AS 'RG' FROM tbAluno
	WHERE nomeAluno LIKE 'P%'

--Listar o nome dos cursos cuja carga horária seja superior a 2000 horas
SELECT nomeCurso AS 'Nome do curso', cargaHorariaCurso AS 'Carga Horaria' FROM tbCurso
	WHERE cargaHorariaCurso>2000

--Listar o nome e o rgde todos os alunos que possuem o sobrenome Silva
SELECT nomeAluno AS 'Nome', rgAluno AS 'RG' FROM tbAluno
	WHERE nomeAluno LIKE '%Silva%'

--Listar o nome dos alunos e a data de nascimento que fazem aniversário em março
SELECT nomeAluno AS 'Nome', dataNascAluno AS 'Data de Nascimento' FROM tbAluno /*Arrumasr o a do nascAluno*/
	WHERE datepart(MONTH, dataNascAluno ) = 03

--Listar o código dos alunos e a data de matrícula dos alunos matriculados em maio de qualquer ano
SELECT  idAluno AS 'Codigo do Aluno' , dataMatricula 'Data da Matricula' FROM tbMatricula
      WHERE MONTH (dataMatricula) = 5

--Listar o código dos alunos matriculados no curso de inglês
SELECT  idAluno  AS 'Codigo do Curso' FROM tbMatricula, tbCurso
	WHERE (idCurso) = 1
 
--Listar o código dos alunos matriculados na turma 1AA
SELECT idAluno AS 'Código do aluno' FROM tbMatricula 
	WHERE (idTurma) = 3

--Listar todos os dados de todos os alunos
SELECT * FROM tbAluno

--Listar todos os dados de todas as turmas
SELECT * FROM tbturma