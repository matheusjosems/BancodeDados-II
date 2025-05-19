-- a. Inserir uma prateleira de código 390, descrição 'Prateleira de
-- teste' e número de seções 2.
-- RESOLUÇÃO:

INSERT INTO PRATELEIRA (CODIGO, DESCRICAO, NUM_SECOES)
VALUES
(360, 'PRATELEIRA DE TESTE', 2);


-- b. Listar as prateleiras e os respectivos produtos que podem
-- armazenar. Mostrando a frase 'sem produto' quando não se relaciona
-- com nenhum. Mostrar: Prateleira (CODIGO, DESCRICAO), descrição
-- (PRODUTO) e quantidade distinta de produtos, ordenados pela quantidade
-- de produtos decrescente.
-- RESOLUÇÃO:

 SELECT 
    p.CODIGO,
    p.DESCRICAO AS PRATELEIRA,
    NVL(PRO.DESCRICAO, 'SEM PRODUTO')AS PRODUTO,
    COUNT(DISTINCT PRO.CODGO)OVER(PARTITION BY p.CODIGO)AS QTD_PRODUTOS
FROM PRATELEIRA p
LEFT JOIN PRATELEIRA_PRODUTO pp ON p.CODIGO = pp.COD_PRATELEIRA
LEFT JOIN PRODUTO PRO ON pp.COD_PRODUTO = pp.CODIGO
ORDER BY QTD_PRODUTOS DESC;


-- c. Selecionar todos os clientes da view VIEW_CLIENTE que são PF.
-- Mostrar: CODIGO, NOME e CNPF, ordenado decrescente pelo nome do
-- cliente.
-- RESOLUÇÃO:

SELECT 
    CODIGO, 
    NOME, 
    CNPF
FROM VIEW_CLIENTE
WHERE TIPO = 'PF'
ORDER BY NOME DESC;

-- d. Listar os pedidos e seus respectivos produtos. Mostrar: numero do
-- pedido (PEDIDO), DATA do pedido, descrição do produto (PRODUTO) e
-- QUANTIDADE de produtos no pedido. Ordenado pela DATA do pedido
-- crescente e, dentro das datas, pelo produto decrescente.
-- RESOLUÇÃO:

SELECT 
    P.NUMERO AS PEDIDO,
    p.DATA,
    PROD.DESCRICAO AS PRODUTO,
    IP.QUANTIDADE
FROM PEDIDO.P
JOIN ITEM_PRODUTO IP ON p.NUMERO = IP.NUMERO
JOIN PRODUTO PROD ON IP.COD_PRODUTO = PROD.CODIGO
ORDER BY p.DATA ASC, PROD.DESCRICAO DESC;





