-- ============================================================================
--                               Andre Essing
-- ----------------------------------------------------------------------------
--
-- Developer.......: Andre Essing (https://github.com/aessing)
--                                (https://twitter.com/aessing)
--                                (https://www.linkedin.com/in/aessing/)
--
-- Summary......: T-SQL demo script for talk
--                SQL Server on Azure - Best Practices für den DB Server in der Cloud
-- Date.........: 18.11.2015
-- Version......: 01.00.00
--
-- ----------------------------------------------------------------------------
--
-- Copyright (C) 2015 Andre Essing. All rights reserverd.
--
-- For more scripts and sample code, check out http://www.andreessing.de/
--
-- You may alter this code for your own 'non-commercial' purposes. You may
-- republish altered code as long as you include this copyright and give due
-- credit.
--
-- THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
-- EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED
-- WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE.
--
-- ----------------------------------------------------------------------------
--
-- Changes:
-- DD.MM.YYYY    Developer       Version     Reason
-- 18.11.2015    Andre Essing    01.00.00    Initial Release
--
-- ============================================================================



USE master;
GO



-- ######### DEMO 2 ###########################################################
-- Create credentials for database files on Azure
CREATE CREDENTIAL [https://passteststore01.blob.core.windows.net/databases]
	WITH IDENTITY = 'Shared Access Signature',
	SECRET = 'sv=2015-04-05&sr=c&si=passtestaccesspolicy&sig=x0amgHCDdBoOcXIddxbbfLHC%2FcgQlLnGY2CJnqoSNUo%3D';
GO

SELECT * FROM sys.credentials WHERE name = 'https://passteststore01.blob.core.windows.net/databases';
GO

-- Create the test database with files in the cloud
CREATE DATABASE [CloudDatabase]
ON
   ( NAME = DATA01, FILENAME = 'https://passteststore01.blob.core.windows.net/databases/data01.mdf', SIZE = 1GB, FILEGROWTH = 256MB, MAXSIZE = 1TB )
 , ( NAME = DATA02, FILENAME = 'https://passteststore01.blob.core.windows.net/databases/data02.ndf', SIZE = 1GB, FILEGROWTH = 256MB, MAXSIZE = 1TB )
 , ( NAME = DATA03, FILENAME = 'https://passteststore01.blob.core.windows.net/databases/data03.ndf', SIZE = 1GB, FILEGROWTH = 256MB, MAXSIZE = 1TB )
 , ( NAME = DATA04, FILENAME = 'https://passteststore01.blob.core.windows.net/databases/data04.ndf', SIZE = 1GB, FILEGROWTH = 256MB, MAXSIZE = 1TB )
LOG ON 
   ( NAME = TLOG01, FILENAME = 'https://passteststore01.blob.core.windows.net/databases/tlog01.ldf', SIZE = 1GB, FILEGROWTH = 256MB, MAXSIZE = 1TB );
GO

SELECT * FROM sys.databases WHERE name = 'CloudDatabase';
GO

-- The journey continues in PowerShell script - 0001 - SQL Server on Azure.ps1



-- ######### DEMO 5 ###########################################################
-- Create credentials for Azure Backup
CREATE CREDENTIAL [cred-azure-passteststore01] WITH IDENTITY =
    N'passteststore01', SECRET =
    N'fbqR7q6+TikeckXSEliH21F5KK4nzqlvN0gv5LX/dG3DoRqFgTDMDEi243zJaqE1qZySX4xI1dpXbJxWWj8oGA==';
GO

SELECT * FROM sys.credentials WHERE name = 'cred-azure-passteststore01';
GO

-- Backup database to Azure
BACKUP DATABASE [TVDTools]
TO URL = 'https://passteststore01.blob.core.windows.net/sqlbackups/TVDTools.bak'
	WITH CREDENTIAL = 'cred-azure-passteststore01' 
	,STATS = 5;
GO

-- Restore Database from Azure to new database with other name
RESTORE DATABASE [TVDTools_Restore]
FROM URL = N'https://passteststore01.blob.core.windows.net/sqlbackups/TVDTools.bak'
	WITH CREDENTIAL = N'cred-azure-passteststore01' 
	   , MOVE N'TVDTools_Primary' TO N'E:\DSQL012\DATA01\MSSQL\TVDTools_Restore_data.mdf'
	   , MOVE N'TVDTools_Log' TO N'E:\DSQL012\TLOG01\MSSQL\TVDTools_Restore_log.ldf'
	   , STATS = 5;
GO

SELECT * FROM sys.databases WHERE name = 'TVDTools_Restore';
GO



-- ######### Clean up devils kitchen #############################################
DROP DATABASE [CloudDatabase];
DROP DATABASE [TVDTools_Restore];
DROP CREDENTIAL [https://passteststore01.blob.core.windows.net/databases];
DROP CREDENTIAL [cred-azure-passteststore01];
GO

-- The journey continues in PowerShell script - 0001 - SQL Server on Azure.ps1
