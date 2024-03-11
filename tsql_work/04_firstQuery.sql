-- tsql_04_firstQuery
SELECT *
FROM   OPENROWSET ( BULK '/Verlag/Autoren.txt'
                  , DATA_SOURCE = 'eds_testfabrikpassdemo_testfabrikfilesystem'
                  , FORMAT      = 'CSV'
                  , FIELDTERMINATOR = ';'
                  --, ROWTERMINATOR = '\n'
                  , PARSER_VERSION = '2.0'   
                  , HEADER_ROW = TRUE
                  -- [ <reject_options> ]
                  ) 
             WITH
                  (
                    AutorenID        int
                  , AutorenName      nvarchar(50)
                  , AutorenVorname   nvarchar(50)
                  )
                    as [t]


-- *********************************************************************************************
