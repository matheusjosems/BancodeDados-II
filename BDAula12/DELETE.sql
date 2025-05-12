DELETE FROM PEDIDO
WHERE MOD(NUMERO, 2) = 1      -- Número ímpar
  AND MATRICULA_VENDEDOR = 102 -- Matrícula do vendedor 102
  AND ENDERECO_ENTREGA IS NOT NULL; -- Endereço de entrega não nulo
  
  DELETE FROM ITEM_PRODUTO
WHERE NUMERO = (
    SELECT MIN(NUMERO)
    FROM PEDIDO
    WHERE DATA = (
        SELECT MAX(DATA)
        FROM PEDIDO
    )
);

-- Desfaz todas as operações de DELETE não confirmadas
ROLLBACK;

-- Verificação dos registros nas tabelas
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