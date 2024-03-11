CREATE OR ALTER VIEW [admin].[vw_connections]
AS
SELECT c.session_id                
     , s.host_name                 
     , s.program_name              
     , s.nt_domain                 
     , s.login_name                
     , c.connect_time              
     , s.last_request_end_time     
FROM   sys.dm_exec_sessions AS s   
JOIN   sys.dm_exec_connections AS c
ON     s.session_id = c.session_id;
--  end VIEW

