-- a. Listar os vendedores . Mostrar: Vendedor (MATRICULA e NOME).
-- Ordenados pelo nome decrescente.
-- RESOLUÇÃO:

SELECT -- select seleciona todos os iten de uma coluna, nesse caso MATRICULA e NOME
    MATRICULA AS "Vendedor", -- "" RENOMEIA O NOME DA TABELA PARA O NOME QUE ESTA EM ASPAS
    NOME AS "Nome do Vendedor"
    
FROM VENDEDOR -- ESPECIFICA QUE OS DADOS VEM DA TABELA VEDENDOR 

ORDER BY NOME DESC;-- Ordena os resultados pelo campo NOME em ordem decrescente (Z-A)



-- b. Listar distintamente os clientes PJ. Mostrar: Nome do cliente
-- (CLIENTE), CNPJ e CIDADE onde reside. Ordenados pelo nome do cliente
-- ascendente e, dentro deste, pela cidade descendente.
-- RESOLUÇÃO:
SELECT DISTINCT -- REMOVE DUPLICATAS, MOSTRANDO APENAS COMBINAÇOES UNICAS 
    NOME AS "Cliente",
    CNPJ AS "CNPJ",
    CIDADE AS "Cidade"
FROM CLIENTE -- FROM : ESPECIFICA A TABELA DE ORIGEM 
WHERE TIPO = 'PJ' --FILTRA OS REGISTROS DO TIPO PJ 
ORDER BY NOME ASC, CIDADE DESC; --ORDENA NOME EM ORDEM CRESCENTE E DEPOOIS CIDADE EM ORDEM DECRESCENTE



-- c. Listar os vendedores e seus pedidos já realizados com total de
-- fatura entre R$ 1000,00 e R$ 5000,00, inclusive.. Mostrar: Nome do
-- vendedor (VENDEDOR), número do pedido (PEDIDO),data do pedido (DATA)
-- com a formatação 'dd/mm/yyyy'. Ordenados pelo nome do vendedor
-- descendente e, dentro deste, pela data ascendente.
-- RESOLUÇÃO:
SELECT 
    v.NOME AS "Vendedor",
    p.NUMERO AS "Numero do Pedido",
    TO_CHAR(p.DATA,'dd/mm/yyyy') AS "Data do pedido"
    
FROM VENDEDOR v 

INNER JOIN  --  INNER JOIN  (só traz registros que existem em ambas)
    PEDIDO p ON v.MATRICULA = p.MATRICULA_VENDEDOR --Junta com PEDIDO onde as matrículas coincidem
WHERE 
    p.TOTAL BETWEEN 1000 AND 5000 -- Só pedidos com valor total entre 1000 e 5000
ORDER BY --ORDENA OS RESUTADOS 
    v.NOME DESC, 
    p.DATA ASC;



