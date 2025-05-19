SELECT 
    constraint_name AS "CONSTRAINT",
    constraint_type AS "TIPO",
    search_condition AS "CONDICAO"
FROM 
    user_constraints
WHERE 
    table_name = 'ITEM_PRODUTO'
ORDER BY 
    constraint_name;
    
    
    
CREATE OR REPLACE VIEW VIEW_CLIENTE AS
SELECT 
    c.CODIGO,
    c.NOME,
    c.RUA,
    c.NR,
    c.BAIRRO,
    c.COMPLEMENTO,
    c.CIDADE,
    c.UF,
    c.CEP,
    p.CPF,
    p.RG,
    p.DT_NASCIMENTO,
    j.CNPJ,
    j.INSCRICAO_ESTADUAL,
    j.DT_FUNDACAO,
    CASE 
        WHEN p.CPF IS NOT NULL THEN 'PF'
        ELSE 'PJ'
    END AS TIPO_CLIENTE
FROM 
    CLIENTE c
LEFT JOIN 
    PF p ON c.CODIGO = p.CODIGO_CLI
LEFT JOIN 
    PJ j ON c.CODIGO = j.CODIGO_CLI;