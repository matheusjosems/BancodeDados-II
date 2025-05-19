-- a. Query de consulta no dicion�rio de dados (cat�logo). Selecionar
-- todas as tabelas do seu usu�rio (projeto). Mostrar: nome da tabela
-- (TABELA) ordenado crescente.
-- RESOLU��O:

SELECT 
    TABLE_NAME AS "TABELA"
FROM
    USER_TABLES
ORDER BY
    TABLE_NAME ASC;
    
-- b. Fazer uma query para recuperar todos os pedidos cujo total da fatura
-- seja maior do que R$ 2000,00. Mostrar: numero do pedido (PEDIDO),
-- DATA, total da fatura (TOTAL), ordenado decrescente pela data do
-- pedido.
-- RESOLU��O:

SELECT
    p.NUMEROS AS "PEDIDO",
    p.DATA AS "DATA",
    SUM(ip.QUANTIDADE * ip.PRECO_UNITARIO)AS "TOTAL"
FROM 
    PEDIDO p
JOIN 
    ITEM_PRODUTO ip ON p.NUMERO = ip.NUMERO_PED
GROUP BY
    p.NUMERO, p.DATA
HAVING
    SUM (ip.QUANTIDADE * ip.PRECO_UNITARIO) > 2000
ORDER BY
    P.DATA DESC;
    
-- c. Fazer uma query para recuperar todos os pedidos cujo total da fatura
-- seja maior do que R$ 2000,00. Mostrar: nome cliente (CLIENTE), numero
-- do pedido (PEDIDO),DATA, total da fatura (TOTAL), ordenado crescente
-- pelo nome do cliente.
-- RESOLU��O:

SELECT 
    c.NOME AS "CLIENTE",
    p.NUMERO AS "PEDIDO",
    p.DATA AS "DATA",
    SUM(ip.QUANTIDADE * ip.PRECO_UNITARIO) AS "TOTAL"
FROM
    PEDIDO p
JOIN 
    ITEM_PRODUTO ip ON p.NUMERO = ip.NUMERO_PED
JOIN
    CLIENTE c ON p.CODIGO_CLI = c.CODIGO
GROUP BY 
    c.NOME, p.NUMERO, p.DATA
HAVING
    SUM (iP.QUANTIDADE * ip.PRECO_UNITARIO) > 2000
ORDER BY
    c.NOME ASC;
    
