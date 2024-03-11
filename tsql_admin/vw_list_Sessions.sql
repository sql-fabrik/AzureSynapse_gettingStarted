CREATE OR ALTER VIEW [admin].[vw_list_Sessions]
AS
SELECT DB_NAME(database_id)  as DBName           
     , nt_user_name          as username         
     , login_name            as LoginName        
     , program_name          as ApplicationName  
     , host_name                                 
     , program_name                              
     , COUNT(*)              AS NB_Connections   
from sys.dm_exec_sessions s  
GROUP  BY 
       DB_NAME(database_id)  
     , nt_user_name          
     , login_name            
     , program_name          
     , host_name             
     , program_name          
--  end VIEW
