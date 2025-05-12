SHOW USER;
DESC USER_TABLES;

--1) Selecionar os metadados das tabelas criadas pelo usuário logado.
SELECT 
    TABLE_NAME AS "Nome da Tabela",
    TABLESPACE_NAME AS "Tablespace",
    NUM_ROWS AS "Número de Linhas",
    AVG_ROW_LEN AS "Tamanho Médio da Linha (bytes)",
    TO_CHAR (last_analyzed, 'DD/MM/YYYY HH24:MI:SS') AS "Ultima analise",
    PARTITIONED AS "Particionada?",
    TEMPORARY AS "TEMPORARIA?"
FROM 
    USER_TABLES
ORDER BY
    TABLE_NAME;
    
    
--2) Selecionar os metadados das colunas das tabelas criadas pelo usuário logado.
SELECT 
    TABLE_NAME AS "Nome da Tabela",
    COLUMN_NAME AS "Nome da Coluna",
    DATA_TYPE AS "Tipo de Dado",
    DATA_LENGTH AS "Tamanho",
    DATA_PRECISION AS "Precisão (NUMBER)",
    DATA_SCALE AS "Escala (NUMBER)",
    NULLABLE AS "Permite Nulos?",
    COLUMN_ID AS "Ordem na Tabela"
FROM 
    USER_TAB_COLUMNS
ORDER BY 
    TABLE_NAME, 
    COLUMN_ID;

--3) Selecionar os metadados das regras (constraints) implementadas nas tabelas criadas pelo usuário logado.
SELECT 
    TABLE_NAME AS "Nome da Tabela",
    CONSTRAINT_NAME AS "Nome da Constraint",
    CASE CONSTRAINT_TYPE
        WHEN 'P' THEN 'PRIMARY KEY'
        WHEN 'R' THEN 'FOREIGN KEY'
        WHEN 'U' THEN 'UNIQUE'
        WHEN 'C' THEN 'CHECK'
        WHEN 'O' THEN 'READ ONLY'
        ELSE CONSTRAINT_TYPE
    END AS "Tipo de Constraint",
    SEARCH_CONDITION AS "Condição",
    R_CONSTRAINT_NAME AS "Constraint Referenciada",
    DELETE_RULES AS "Regra de Deleção",
    STATUS AS "Status"
FROM 
    USER_CONSTRAINTS
ORDER BY 
    TABLE_NAME, 
    CONSTRAINT_NAME;


--4) Selecionar os metadados das regras (constraints) implementadas nas colunas das tabelas criadas pelo usuário logado.
SELECT 
    c.TABLE_NAME AS "Nome da Tabela",
    c.CONSTRAINT_NAME AS "Nome da Constraint",
    cc.COLUMN_NAME AS "Nome da Coluna",
    cc.position AS "Posição",
    CASE c.CONSTRAINT_TYPE
        WHEN 'P' THEN 'PRIMARY KEY'
        WHEN 'R' THEN 'FOREIGN KEY'
        WHEN 'U' THEN 'UNIQUE'
        WHEN 'C' THEN 'CHECK'
        WHEN 'O' THEN 'READ ONLY'
        ELSE c.CONSTRAINT_TYPE
    END AS "Tipo de Constraint"
FROM 
    USER_CONSTRAINTS c
JOIN 
    USER_CONS_COLUMNS cc ON c.CONSTRAINT_NAME = cc.CONSTRAINT_NAME
ORDER BY 
    c.TABLE_NAME, 
    c.CONSTRAINT_NAME, 
    cc.POSITION;

