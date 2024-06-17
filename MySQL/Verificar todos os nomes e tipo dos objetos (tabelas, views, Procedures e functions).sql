use <NAME DATABASE>;

SELECT 
    case table_type when 'VIEW' then 'View' else 'Tabela'end tipo,
    table_name
FROM 
    information_schema.tables 
WHERE 
    table_schema = @database_name 
UNION ALL
SELECT 
    'Procedure' tipo,
    routine_name
FROM 
    information_schema.routines 
WHERE 
    routine_type = 'PROCEDURE' 
    AND routine_schema = @database_name
UNION ALL
SELECT 
    'Funcao' tipo,
    routine_name
FROM 
    information_schema.routines 
WHERE 
    routine_type = 'FUNCTION' 
    AND routine_schema = @database_name order by 1,2;
    
    
    