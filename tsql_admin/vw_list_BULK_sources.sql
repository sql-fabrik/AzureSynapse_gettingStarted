CREATE OR ALTER VIEW [admin].[vw_list_BULK_sources]
AS
SELECT Row_Number() over(Order by Substring( definition, CHARINDEX('BULK', definition), 50 ) ) as 'rowNr'       
     , Substring( definition, CHARINDEX('BULK', definition), 50 )                              as 'BULK_source' 
     , definition                                                                                               
FROM   sys.                             
WHERE  definition like '%OPENROWSET%'   
  and  definition like '%BULK%'         
  and  definition NOT like '%vw_list_BULK_sources%'

--  end VIEW

