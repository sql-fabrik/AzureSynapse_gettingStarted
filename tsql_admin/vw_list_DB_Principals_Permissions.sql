CREATE OR ALTER VIEW [admin].[vw_list_DB_Principals_Permissions]
AS
SELECT d.NAME              as 'principal_Name'       
     , d.type_desc         as 'principal_type_desc'  
     , o.NAME              as 'object_Name'          
     , p.permission_name                             
     , p.state_desc        as 'permission_state_desc'
FROM   sys.database_permissions p                    
left   join                                          
       sys.all_objects o                             
on     p.major_id = o.OBJECT_ID                      
inner  join                                          
       sys.database_principals d                     
on     p.grantee_principal_id = d.principal_id       
--  end VIEW
