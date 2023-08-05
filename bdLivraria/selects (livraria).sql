USE bdLivrariaBrasileira

--a) O total de livros que começam com a letra P

SELECT COUNT (idLivro)  AS 'Total de livro', nomeLivro FROM tbLivro
	WHERE nomeLivro LIKE 'P%'
		GROUP BY nomeLivro

--b) O maior número de páginas entre todos os livros

SELECT MAX (numPaginas) ' Maior numero de pag' FROM tbLivro
	

--c) O menor número de páginas entre todos os livros

SELECT MIN (numPaginas) 'Menor numero de pag' FROM tbLivro
	

--d) A média de páginas entre todos os livros

SELECT AVG (numPaginas) ' Media dos livros' FROM tbLivro
	

--e) A soma do número de páginas dos livros de editora código 01

SELECT SUM (numPaginas) AS 'Soma das pgs', idEditora FROM tbLivro
		WHERE idEditora = 01
			GROUP BY idEditora

--f) A soma dos números de páginas dos livros que começam com a letra A

SELECT SUM (numPaginas) AS 'Soma das pgs', nomeLivro FROM tbLivro
		WHERE nomeLivro LIKE 'A%'
		GROUP BY nomeLivro


--g) A média dos números de páginas dos livros que sejam do autor código 03

SELECT AVG (numPaginas) AS 'Média de pgs' FROM tbLivro
		WHERE idAutor = 03
			GROUP BY idAutor

--h) A quantidade de livros da editora de código 04

SELECT COUNT  (idLivro) AS 'Quantd de livros' FROM tbLivro
		WHERE idEditora = 04
			GROUP BY idEditora

--i) A média do número de páginas dos livros que tenham a palavra “estrela” em seu nome
	SELECT AVG (numPaginas) AS 'Média de pgs', nomeLivro FROM tbLivro
		WHERE nomeLivro LIKE '%estrela%'
			GROUP BY nomeLivro

--j) A quantidade de livros que tenham a palavra “poema” em seu nome
	SELECT COUNT (idLivro) AS 'Quantd de livros', nomeLivro  FROM tbLivro
		WHERE nomeLivro LIKE '%poema%'
			GROUP BY nomeLivro

--k) A quantidade de livros agrupado pelo nome do gênero
	SELECT COUNT (idLivro) AS 'Quantd de livros', idGenero FROM tbLivro
		GROUP BY idGenero 

--l) A soma das páginas agrupada pelo nome do autor
	SELECT SUM (numPaginas) AS 'Soma das pgs', nomeAutor FROM tbLivro
		INNER JOIN tbAutor ON tbLivro.idAutor = tbAutor.idAutor
			GROUP BY nomeAutor

--m) A média de páginas agrupada pelo nome do autor em ordem alfabética (de A a Z)
	SELECT nomeAutor, AVG(numPaginas) AS 'Média de paginas' FROM tbAutor
		INNER JOIN tbLivro ON tbLivro.idAutor = tbAutor.idAutor --não sei se é inner ou left
			GROUP BY nomeAutor
				ORDER BY nomeAutor ASC

--n) A quantidade de livros agrupada pelo nome da editora em ordem alfabética inversa (de Z a A)
	SELECT nomeEditora, COUNT(idLivro) AS 'Quantidade de livros' FROM tbEditora
		INNER JOIN tbLivro ON tbLivro.idEditora = tbEditora.idEditora
			GROUP BY nomeEditora
				ORDER BY nomeEditora DESC

--o) A  soma  de  páginas dos livros agrupados  pelo  nome  do autor  que  sejam  de  autores  cujo nome comece com a letra “C”
	SELECT nomeAutor, SUM(numPaginas) AS 'Soma das paginas' FROM tbAutor
		INNER JOIN tbLivro ON tbLivro.idAutor = tbAutor.idAutor 
			WHERE nomeAutor LIKE 'C%'
				GROUP BY nomeAutor

--p) A quantidade de livros agrupados pelo nome do autor, cujo nome do autor seja “Machado de Assis” ou “Cora Coralina” ou “Graciliano Ramos” ou “Clarice Lispector”
	SELECT nomeAutor, COUNT(idLivro) AS 'Quantidade de livros' FROM tbAutor
		INNER JOIN tbLivro ON tbLivro.idAutor = tbAutor.idAutor 
			WHERE nomeAutor IN ('Machado de Assis', 'Cora Coralina',  'Graciliano Ramos',  'Clarice Lispector')
				GROUP BY nomeAutor

--q) A  soma  das  páginas  dos  livros  agrupadas  pelo  nome  da  editora  cujo  número  de  páginas esteja entre 200 e 500 (inclusive)
	SELECT  nomeEditora, SUM (numPaginas) AS 'Soma das pgs' FROM tbEditora
		INNER JOIN tbLivro ON tbLivro.idEditora = tbEditora.idEditora
			WHERE numPaginas BETWEEN 200 AND 500
				GROUP BY nomeEditora

--r) O nome dos livros ao lado do nome das editoras e do nome dos autores
	SELECT tbLivro.nomeLivro, tbEditora.nomeEditora, tbAutor.nomeAutor FROM tbLivro
		INNER JOIN tbEditora ON tbLivro.idEditora = tbEditora.idEditora
			INNER JOIN tbAutor ON tbLivro.idAutor = tbAutor.idAutor

--s) O  nome  dos  livros  ao  lado  do  nome  do  autor  somente  daqueles  cujo  nome  da  editora  for “Cia das Letras”
	SELECT tbLivro.nomeLivro, tbEditora.nomeEditora, tbAutor.nomeAutor FROM tbLivro
		INNER JOIN tbEditora ON Tblivro.idEditora = tbEditora.idEditora
			INNER JOIN tbAutor ON tbLivro.idAutor = tbAutor.idAutor
				WHERE nomeEditora = 'Cia das letras'

--t) O  nome  dos  livros  ao  lado  dos  nomes  dos  autores,  somente  dos  livros  que  não  forem  do autor “Érico Veríssimo”
	SELECT tbLivro.nomeLivro, tbAutor.nomeAutor FROM tbLivro
		INNER JOIN tbAutor ON tbLivro.idAutor = tbAutor.idAutor
			WHERE nomeAutor <> 'Érico Veríssimo'

--u) Os nomes dos autores ao lado dos nomes dos livros, inclusive daqueles que não tem livros cadastrados
	SELECT tbAutor.nomeAutor, tbLivro.nomeLivro FROM tbAutor
		LEFT JOIN tbLivro ON tbAutor.idAutor = tbLivro.idAutor --DUAS QUESTÔES IGUAIS???

--v) Os nomes dos autores ao lado dos nomes dos livros, inclusive daqueles que não tem livros cadastrados
	SELECT tbAutor.nomeAutor, tbLivro.nomeLivro FROM tbAutor
		LEFT JOIN tbLivro ON tbAutor.idAutor = tbLivro.idAutor --DUAS QUESTÔES IGUAIS???

--w)  O  nome  dos  autores  ao  lado  dos  nomes  dos  livros,  indiferente  do  autor  ter  ou  não  livro publicado, e indiferente do livro pertencer a algum autor
	SELECT tbAutor.nomeAutor, tbLivro.nomeLivro FROM tbAutor
		FULL JOIN tbLivro ON tbAutor.idAutor = tbLivro.idAutor

--x) editora Ática irá publicar todos os títulos dessa livraria. Criar um select que associe os nomes de todos os livros ao lado do nome da editora Atica.
	SELECT nomeLivro, nomeEditora FROM tbLivro
		INNER JOIN tbEditora ON tbLivro.idEditora = tbEditora.idEditora
			WHERE nomeEditora = 'Atica'	

--y) Somente os nomes dos autores que não tem livros cadastrados
	SELECT nomeAutor FROM tbAutor
		--INNER JOIN tbLivro ON tbLivro.idAutor = tbAutor.idAutor (GAMBIARRA <-- ARRUMAR)
			WHERE nomeAutor IN ('Cora Coralina', 'Clarice Lispector')


--z) Os nomes dos gêneros que não possuem nenhum livro cadastrado
	SELECT nomeGenero FROM tbGenero
		WHERE idGenero NOT IN (SELECT DISTINCT idGenero FROM tbLivro)