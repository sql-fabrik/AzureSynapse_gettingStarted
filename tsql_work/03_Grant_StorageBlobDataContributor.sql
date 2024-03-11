---- tsql_03_Grant_StorageBlobDataContributor

--problem:
--This problem usually happens because your Azure Active Directory identity doesn't have 
--rights to access the file. By default, serverless SQL pool is trying to access the file 
--using your Azure Active Directory identity. 

--solution:
--To resolve this issue, you need to have proper rights to access the file. 
--Easiest way is to grant yourself 'Storage Blob Data Contributor' role on the 
--storage account you're trying to query. 

https://learn.microsoft.com/en-us/answers/questions/321814/file-cannot-be-opened-because-it-does-not-exist-or
https://learn.microsoft.com/en-us/azure/synapse-analytics/sql/develop-storage-files-storage-access-control?tabs=user-identity

-- *********************************************************************************************