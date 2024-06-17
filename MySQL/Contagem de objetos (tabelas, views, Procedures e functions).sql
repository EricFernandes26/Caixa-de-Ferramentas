SET @database_name := 'sakila';

SELECT 
    table_type tipo,
    COUNT(*) AS quantidade 
FROM 
    information_schema.tables 
WHERE 
    table_schema = @database_name group by 1

UNION ALL

SELECT 
    'Stored Procedure' AS tipo, 
    COUNT(*) AS quantidade 
FROM 
    information_schema.routines 
WHERE 
    routine_type = 'PROCEDURE' 
    AND routine_schema = @database_name

UNION ALL

SELECT 
    'Function' AS tipo, 
    COUNT(*) AS quantidade 
FROM 
    information_schema.routines 
WHERE 
    routine_type = 'FUNCTION' 
    AND routine_schema = @database_name;


