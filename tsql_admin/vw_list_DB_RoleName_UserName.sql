CREATE OR ALTER VIEW [admin].[vw_list_DB_RoleName_UserName]
AS
SELECT DP1.name                  as 'DB_RoleName' 
     , IsNull(DP2.name, '--')    as 'DB_UserName' 
FROM   sys.database_role_members as DRM           
RIGHT  JOIN                                       
       sys.database_principals   as DP1           
ON     DRM.role_principal_id = DP1.principal_id   
LEFT   JOIN                                       
       sys.database_principals   as DP2           
ON     DRM.member_principal_id = DP2.principal_id 
WHERE  DP1.type = 'R'                             
--  end VIEW
