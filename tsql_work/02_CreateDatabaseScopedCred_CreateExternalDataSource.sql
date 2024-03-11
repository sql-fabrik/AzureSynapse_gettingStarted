---- tsql_02_CreateDatabaseScopedCred & CreateExternalDataSource

DECLARE @StorageAccount  sysname       = 'testfabrikpassdemo'
      , @Container       sysname       = 'testfabrikfilesystem'
      , @SAS_token       nvarchar(400) = 'sp=racwdlmeo&st=2024-03-08T10:15:36Z&se=2025-01-30T18:15:36Z&spr=https&sv=2022-11-02&sr=c&sig=US9aN1dXd%2................FKUYXnR%2Fs%3D'

----
--DECLARE @sqlCmd    nvarchar(4000)
--      , @sigValue  nvarchar(400)
--	  , @seValue   nvarchar(400)
--
--SET @sigValue = TRIM( SUBSTRING( @SAS_token, CHARINDEX( 'sig=', @SAS_token ) +4 , 100 ))
--SET @seValue  = TRIM( SUBSTRING( @SAS_token, CHARINDEX( 'se=' , @SAS_token ) +3 ,  10 ))

---- select @seValue, @sigValue
-------------------------------
--DROP DATABASE SCOPED CREDENTIAL cred2Blob_passdemo_filecontainer__exp20250130

CREATE DATABASE SCOPED CREDENTIAL cred2Blob_testfabrikpassdemo_testfabrikfilesystem___exp20250130
WITH IDENTITY = 'SHARED ACCESS SIGNATURE',
SECRET = 'US9aN1dXd%2................FKUYXnR%2Fs%3D' ;

-- *********************************************************************************************

--DROP EXTERNAL DATA SOURCE [eds_passdemo_filecontainer] 

CREATE EXTERNAL DATA SOURCE [eds_testfabrikpassdemo_testfabrikfilesystem] 
WITH 
    ( LOCATION = N'https://testfabrikpassdemo.blob.core.windows.net/testfabrikfilesystem'
    , CREDENTIAL = [cred2Blob_testfabrikpassdemo_testfabrikfilesystem___exp20250130]
    )

-- *********************************************************************************************