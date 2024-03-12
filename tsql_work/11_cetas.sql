CREATE EXTERNAL TABLE zpassdemo.cetas_csv__Ort  
WITH   
     ( LOCATION    = '/report/2024/03/12/cetas_csv__Ort.parquet'  -- plus appropriate fileExtension     
     , DATA_SOURCE = eds_testfabrikpassdemo_testfabrikfilesystem                                        
     , FILE_FORMAT = ParquetFileFormat                                                                  
     ) 
AS     
SELECT *                          
FROM   zpassdemo.Table_csv__Ort;  

