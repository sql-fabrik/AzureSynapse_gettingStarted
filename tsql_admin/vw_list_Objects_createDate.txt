CREATE OR ALTER VIEW [admin].[vw_list_Objects_createDate]   
AS
SELECT ROW_NUMBER() over(Order by s.name, o.name) as 'rowNr'
     , s.name + '.' + o.name  as 'Object_Name'              
     , o.type                                               
     , o.type_desc                                          
     , o.create_date                                        
     , o.modify_date                                        
FROM   sys.objects o                                        
join   sys.schemas s                                        
ON     o.schema_id = s.schema_id                            
WHERE  o.type not in ('S', 'IT', 'D', 'SQ')                 
--  end VIEW
