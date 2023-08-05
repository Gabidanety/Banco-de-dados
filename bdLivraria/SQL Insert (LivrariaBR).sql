USE bdLivrariaBrasileira

INSERT INTO tbAutor(nomeAutor)

	VALUES ('Chico Buarque')
			,('Jorge Amado')
			,('J.K. Rowling')
			,('Willian Shakespeare')
			,('Monteiro Lobato')
			,('Cora Coralina')
			,('Clarice Lispector')

INSERT INTO tbGenero (nomeGenero)
	VALUES ('Ficção')
		   ,('Romance')
		   ,('Tragedia')

INSERT INTO tbEditora (nomeEditora)
	VALUES ('Melhoramento')
		   ,('Globo')
		   ,('Atica')
		   ,('Companhia das Letras')
		   ,('Abril')

INSERT INTO tbLivro (nomeLivro,numPaginas,idGenero,idEditora,idAutor)
	VALUES ('Budapeste', 176, 2, 4, 1)
		    ,('O Bicho-da-Seda', 454, 2, 5, 3)
			,('Gabriela, Cravo e Canela', 214, 1, 2, 2)
			,('Reinações de Narizinho', 143, 2, 2, 5)
			,('Romeu e Julieta', 421, 1, 3, 4)
			,('O irmão Alemão', 478, 1, 4, 1)
			,('Terras do Sem-Fim', 125, 1, 3, 2)
			,('Animais Fantasticos e Onde Habitam', 267, 2, 4, 3)

SELECT * FROM tbAutor
SELECT * FROM tbGenero
SELECT * FROM tbEditora
SELECT * FROM tbLivro
