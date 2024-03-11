CREATE OR ALTER VIEW [admin].[vw_connections_per_Application]
AS
Select DB_NAME(s.database_id)   as 'DBName'             
     , COUNT(s.database_id)     as 'NumberOfConnections'
     , s.nt_user_name           as 'UserName'           
     , s.login_name             as 'LoginName'          
     , s.program_name           as 'ApplicationName'    
FROM   sys.dm_exec_requests r     
JOIN   sys.dm_exec_sessions s     
ON     r.session_id = s.session_id
GROUP  BY 
       s.database_id 
     , s.nt_user_name
     , s.login_name  
     , s.program_name
--  end VIEW         

