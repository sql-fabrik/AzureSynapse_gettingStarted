CREATE OR ALTER VIEW [admin].[vw_data_processed]
AS
----info
----https://learn.microsoft.com/en-us/azure/synapse-analytics/sql/data-processed

SELECT type
     , FORMAT( CAST( data_processed_mb as bigint )
             , '#,##0' )   as 'data_processed_mb' 
FROM   sys.dm_external_data_processed             
--  end VIEW 

