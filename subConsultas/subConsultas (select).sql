use bdEscolaIdioma
--a)Criar uma consulta que retorne o nome e o preço dos cursos que custem abaixo do valor médio
	SELECT nomeCurso,valorCurso  FROM tbCurso
		WHERE valorCurso <(SELECT AVG(valorCurso) FROM tbCurso)
		
--b)Criar uma consulta que retorne o nome e o rg do aluno mais novo
SELECT nomeAluno,rgAluno,dataNascimento AS'Datade nascimento' FROM tbAluno 
	WHERE dataNascimento =(select min(dataNascimento) FROM tbAluno)

--c)Criar uma consulta que retorne o nome do aluno mais velho
	SELECT nomeAluno,dataNascimento AS'Datade nascimento'  FROM tbAluno 
		WHERE dataNascimento = (Select Max(dataNascimento) FROM tbAluno)

--d)Criar uma consulta que retorne o nome e o valor do curso mais caro
	SELECT nomeCurso,valorCurso AS'Curso mais caro' FROM tbCurso
		WHERE valorCurso = (Select Max(valorCurso) FROM tbCurso)

--e)Criar uma consulta que retorne o nome do aluno e o nome do curso, do aluno que fez a última matrícula
		SELECT nomeAluno,NomeCurso,dataMatricula AS'Data da matricula' FROM tbAluno
			INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
				INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
						INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
							WHERE dataMatricula = (SELECT MAX(dataMatricula) FROM tbMatricula)


--f)Criar uma consulta que retorne o nome do primeiro aluno a ser matriculado na escola de Idiomas
		SELECT nomeAluno,dataMatricula AS'Data da matricula' FROM tbAluno
			INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
							WHERE dataMatricula = (SELECT MIN(dataMatricula) FROM tbMatricula)
	
--g)Criar uma consulta que retorne o nome, rge data de nascimento de todos os alunos que estejam matriculados no curso de inglês
		SELECT nomeAluno,rgAluno,dataNascimento,nomeCurso FROM tbAluno
			INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
				INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
						INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
							WHERE nomeCurso IN (SELECT nomeCurso='INGLÊS' FROM tbCurso)



















