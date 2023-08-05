USE bdLivrariaBrasileira

--a) O total de livros que come�am com a letra P

SELECT COUNT (idLivro)  AS 'Total de livro', nomeLivro FROM tbLivro
	WHERE nomeLivro LIKE 'P%'
		GROUP BY nomeLivro

--b) O maior n�mero de p�ginas entre todos os livros

SELECT MAX (numPaginas) ' Maior numero de pag' FROM tbLivro
	

--c) O menor n�mero de p�ginas entre todos os livros

SELECT MIN (numPaginas) 'Menor numero de pag' FROM tbLivro
	

--d) A m�dia de p�ginas entre todos os livros

SELECT AVG (numPaginas) ' Media dos livros' FROM tbLivro
	

--e) A soma do n�mero de p�ginas dos livros de editora c�digo 01

SELECT SUM (numPaginas) AS 'Soma das pgs', idEditora FROM tbLivro
		WHERE idEditora = 01
			GROUP BY idEditora

--f) A soma dos n�meros de p�ginas dos livros que come�am com a letra A

SELECT SUM (numPaginas) AS 'Soma das pgs', nomeLivro FROM tbLivro
		WHERE nomeLivro LIKE 'A%'
		GROUP BY nomeLivro


--g) A m�dia dos n�meros de p�ginas dos livros que sejam do autor c�digo 03

SELECT AVG (numPaginas) AS 'M�dia de pgs' FROM tbLivro
		WHERE idAutor = 03
			GROUP BY idAutor

--h) A quantidade de livros da editora de c�digo 04

SELECT COUNT  (idLivro) AS 'Quantd de livros' FROM tbLivro
		WHERE idEditora = 04
			GROUP BY idEditora

--i) A m�dia do n�mero de p�ginas dos livros que tenham a palavra �estrela� em seu nome
	SELECT AVG (numPaginas) AS 'M�dia de pgs', nomeLivro FROM tbLivro
		WHERE nomeLivro LIKE '%estrela%'
			GROUP BY nomeLivro

--j) A quantidade de livros que tenham a palavra �poema� em seu nome
	SELECT COUNT (idLivro) AS 'Quantd de livros', nomeLivro  FROM tbLivro
		WHERE nomeLivro LIKE '%poema%'
			GROUP BY nomeLivro

--k) A quantidade de livros agrupado pelo nome do g�nero
	SELECT COUNT (idLivro) AS 'Quantd de livros', idGenero FROM tbLivro
		GROUP BY idGenero 

--l) A soma das p�ginas agrupada pelo nome do autor
	SELECT SUM (numPaginas) AS 'Soma das pgs', nomeAutor FROM tbLivro
		INNER JOIN tbAutor ON tbLivro.idAutor = tbAutor.idAutor
			GROUP BY nomeAutor

--m) A m�dia de p�ginas agrupada pelo nome do autor em ordem alfab�tica (de A a Z)
	SELECT nomeAutor, AVG(numPaginas) AS 'M�dia de paginas' FROM tbAutor
		INNER JOIN tbLivro ON tbLivro.idAutor = tbAutor.idAutor --n�o sei se � inner ou left
			GROUP BY nomeAutor
				ORDER BY nomeAutor ASC

--n) A quantidade de livros agrupada pelo nome da editora em ordem alfab�tica inversa (de Z a A)
	SELECT nomeEditora, COUNT(idLivro) AS 'Quantidade de livros' FROM tbEditora
		INNER JOIN tbLivro ON tbLivro.idEditora = tbEditora.idEditora
			GROUP BY nomeEditora
				ORDER BY nomeEditora DESC

--o) A  soma  de  p�ginas dos livros agrupados  pelo  nome  do autor  que  sejam  de  autores  cujo nome comece com a letra �C�
	SELECT nomeAutor, SUM(numPaginas) AS 'Soma das paginas' FROM tbAutor
		INNER JOIN tbLivro ON tbLivro.idAutor = tbAutor.idAutor 
			WHERE nomeAutor LIKE 'C%'
				GROUP BY nomeAutor

--p) A quantidade de livros agrupados pelo nome do autor, cujo nome do autor seja �Machado de Assis� ou �Cora Coralina� ou �Graciliano Ramos� ou �Clarice Lispector�
	SELECT nomeAutor, COUNT(idLivro) AS 'Quantidade de livros' FROM tbAutor
		INNER JOIN tbLivro ON tbLivro.idAutor = tbAutor.idAutor 
			WHERE nomeAutor IN ('Machado de Assis', 'Cora Coralina',  'Graciliano Ramos',  'Clarice Lispector')
				GROUP BY nomeAutor

--q) A  soma  das  p�ginas  dos  livros  agrupadas  pelo  nome  da  editora  cujo  n�mero  de  p�ginas esteja entre 200 e 500 (inclusive)
	SELECT  nomeEditora, SUM (numPaginas) AS 'Soma das pgs' FROM tbEditora
		INNER JOIN tbLivro ON tbLivro.idEditora = tbEditora.idEditora
			WHERE numPaginas BETWEEN 200 AND 500
				GROUP BY nomeEditora

--r) O nome dos livros ao lado do nome das editoras e do nome dos autores
	SELECT tbLivro.nomeLivro, tbEditora.nomeEditora, tbAutor.nomeAutor FROM tbLivro
		INNER JOIN tbEditora ON tbLivro.idEditora = tbEditora.idEditora
			INNER JOIN tbAutor ON tbLivro.idAutor = tbAutor.idAutor

--s) O  nome  dos  livros  ao  lado  do  nome  do  autor  somente  daqueles  cujo  nome  da  editora  for �Cia das Letras�
	SELECT tbLivro.nomeLivro, tbEditora.nomeEditora, tbAutor.nomeAutor FROM tbLivro
		INNER JOIN tbEditora ON Tblivro.idEditora = tbEditora.idEditora
			INNER JOIN tbAutor ON tbLivro.idAutor = tbAutor.idAutor
				WHERE nomeEditora = 'Cia das letras'

--t) O  nome  dos  livros  ao  lado  dos  nomes  dos  autores,  somente  dos  livros  que  n�o  forem  do autor ��rico Ver�ssimo�
	SELECT tbLivro.nomeLivro, tbAutor.nomeAutor FROM tbLivro
		INNER JOIN tbAutor ON tbLivro.idAutor = tbAutor.idAutor
			WHERE nomeAutor <> '�rico Ver�ssimo'

--u) Os nomes dos autores ao lado dos nomes dos livros, inclusive daqueles que n�o tem livros cadastrados
	SELECT tbAutor.nomeAutor, tbLivro.nomeLivro FROM tbAutor
		LEFT JOIN tbLivro ON tbAutor.idAutor = tbLivro.idAutor --DUAS QUEST�ES IGUAIS???

--v) Os nomes dos autores ao lado dos nomes dos livros, inclusive daqueles que n�o tem livros cadastrados
	SELECT tbAutor.nomeAutor, tbLivro.nomeLivro FROM tbAutor
		LEFT JOIN tbLivro ON tbAutor.idAutor = tbLivro.idAutor --DUAS QUEST�ES IGUAIS???

--w)  O  nome  dos  autores  ao  lado  dos  nomes  dos  livros,  indiferente  do  autor  ter  ou  n�o  livro publicado, e indiferente do livro pertencer a algum autor
	SELECT tbAutor.nomeAutor, tbLivro.nomeLivro FROM tbAutor
		FULL JOIN tbLivro ON tbAutor.idAutor = tbLivro.idAutor

--x) editora �tica ir� publicar todos os t�tulos dessa livraria. Criar um select que associe os nomes de todos os livros ao lado do nome da editora Atica.
	SELECT nomeLivro, nomeEditora FROM tbLivro
		INNER JOIN tbEditora ON tbLivro.idEditora = tbEditora.idEditora
			WHERE nomeEditora = 'Atica'	

--y) Somente os nomes dos autores que n�o tem livros cadastrados
	SELECT nomeAutor FROM tbAutor
		--INNER JOIN tbLivro ON tbLivro.idAutor = tbAutor.idAutor (GAMBIARRA <-- ARRUMAR)
			WHERE nomeAutor IN ('Cora Coralina', 'Clarice Lispector')


--z) Os nomes dos g�neros que n�o possuem nenhum livro cadastrado
	SELECT nomeGenero FROM tbGenero
		WHERE idGenero NOT IN (SELECT DISTINCT idGenero FROM tbLivro)