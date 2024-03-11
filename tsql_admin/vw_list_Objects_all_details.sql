CREATE OR ALTER VIEW [admin].[vw_list_Objects_all_details]
AS
SELECT ROW_NUMBER() over(Order by s.name, o.name) as 'rowNr'
     , s.name  as 'schema_name'                             
     , o.*                                                  
FROM   sys.objects o                                        
join   sys.schemas s                                        
ON     o.schema_id = s.schema_id                            
WHERE  type not in ('S', 'IT')                              
--  end VIEW
