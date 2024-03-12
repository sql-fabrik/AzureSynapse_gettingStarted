CREATE OR ALTER PROC [dbo].[usp_cetas_from_VIEW]
                      @currDatetime datetime  -- =  GetDate()
                    , @viewName     sysname   -- = 'zpassdemo.Table_csv__Ort'
AS
BEGIN
----
DECLARE @StorageAccount  sysname  = 'testfabrikpassdemo'
      , @Container       sysname  = 'testfabrikfilesystem'

DECLARE @sqlCmd nvarchar(4000)
        --SELECT  @currDatetime  -- sys.time_zone_info --> UTC
----
SET @sqlCmd = '
IF EXISTS (select * from sys.objects where object_id = OBJECT_ID(N''' + Replace( @viewName, 'Table', 'cetas' ) + ''') )
                                               DROP EXTERNAL TABLE  ' + Replace( @viewName, 'Table', 'cetas' ) + ';    
' --
--select @sqlCmd
EXEC sp_executesql @sqlCmd 

SET @sqlCmd = N'
CREATE EXTERNAL TABLE ' + Replace( 'zpassdemo.Table_csv__Ort', 'Table', 'cetas' ) +'
WITH
(
  LOCATION    = ''/report/' + Format( @currDatetime, 'yyyy/MM/dd/HHmm__' ) + Replace( Replace( 'zpassdemo.Table_csv__Ort', 'Table', 'cetas' )
                                                                                             , 'zpassdemo.', '' ) 
                                                                           +'.parquet''  -- plus appropriate fileExtension   
, DATA_SOURCE = eds_' + @StorageAccount + '_' + @Container + '
, FILE_FORMAT = ParquetFileFormat                             
)
AS
SELECT *
FROM   ' + 'zpassdemo.Table_csv__Ort' + ';
' -- 
--select @sqlCmd
EXEC sp_executesql @sqlCmd 

--END  -- end PROC

