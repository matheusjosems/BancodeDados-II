DELETE FROM PEDIDO
WHERE MOD(NUMERO, 2) = 1      -- N�mero �mpar
  AND MATRICULA_VENDEDOR = 102 -- Matr�cula do vendedor 102
  AND ENDERECO_ENTREGA IS NOT NULL; -- Endere�o de entrega n�o nulo
  
  DELETE FROM ITEM_PRODUTO
WHERE NUMERO = (
    SELECT MIN(NUMERO)
    FROM PEDIDO
    WHERE DATA = (
        SELECT MAX(DATA)
        FROM PEDIDO
    )
);

-- Desfaz todas as opera��es de DELETE n�o confirmadas
ROLLBACK;

-- Verifica��o dos registros nas tabelas
-- Para PEDIDO 
SELECT COUNT(*) FROM PEDIDO 
WHERE MOD(NUMERO, 2) = 1 
  AND MATRICULA_VENDEDOR = 102 
  AND ENDERECO_ENTREGA IS NOT NULL;

-- Para ITEM_PRODUTO
SELECT COUNT(*) FROM ITEM_PRODUTO
WHERE NUMERO = (
    SELECT MIN(NUMERO)
    FROM PEDIDO
    WHERE DATA = (
        SELECT MAX(DATA)
        FROM PEDIDO
    )
);