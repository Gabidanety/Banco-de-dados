USE bdEstoqueNovo

---Criar uma consulta que retorne o c�digo do produto,o nome do produto e o nome do fabricante somente daqueles produtos que custam igual ao valor mais alto;
SELECT idProduto,descProduto, nomeFabricantes FROM tbProduto
	INNER JOIN tbFabricante ON tbProduto.idFabricante =tbFabricante.idFabricante
		WHERE valorProduto = (SELECT max(valorProduto) FROM tbProduto) 

--Criar uma consulta que retorne o nome do produto e o nome do fabricante e o valor somente dos produtos que custem acima do valor m�dio dos produtos em estoque
SELECT descProduto,nomeFabricante,valorProduto FROM tbProduto
	INNER JOIN tbFabricante ON tbProduto.idFabricante =tbFabricante.idFabricante
		WHERE valorProduto  > (SELECT AVG(valorProduto) FROM tbProduto)

--Criar uma consulta que retorne o nome dos clientes que tiveram vendas com valor acima do valor m�dio das vendas
SELECT	DISTINCT nomeCliente FROM tbCliente
	INNER JOIN tbVenda ON tbCliente.idCliente=tbVenda.idCliente
		WHERE valorTotalVenda >(SELECT AVG(valorTotalVenda)FROM tbVenda)

--Criar uma consulta que retorne o nome e o pre�o dos produtos mais caros
SELECT descProduto,valorProduto AS'Valor mais caro' FROM tbProduto
	WHERE valorProduto IN (SELECT MAX(valorProduto) FROM tbProduto)

--Criar uma consulta que retorne o nome e o pre�o do produto mais barato
SELECT descProduto,valorProduto AS'Valor mais barato'FROM tbProduto
	WHERE valorProduto IN (SELECT MIN(valorProduto) FROM tbProduto)
 