-- =============================================================================
--                              Andre Essing
-- -----------------------------------------------------------------------------
-- Developer.......: Andre Essing (https://github.com/aessing)
--                                (https://twitter.com/aessing)
--                                (https://www.linkedin.com/in/aessing/)
-- -----------------------------------------------------------------------------
-- File.........: DEMO04 - Database Permissions.sql
-- Summary......: Securing SQL Server databases
-- Part of......: Talk SQL Server Security
-- Date.........: 25.09.2016
-- Version......: 01.00.00
-- -----------------------------------------------------------------------------
-- THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
-- EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED
-- WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE.
-- =============================================================================


USE [SecureDB];
GO


-- ============================================================================
-- Create the reader user / group
-- ============================================================================
CREATE USER [SQLSECURITY\SQL-DB-SecureDB-R];
GO

GRANT CONNECT TO [SQLSECURITY\SQL-DB-SecureDB-R];
GRANT SELECT TO [SQLSECURITY\SQL-DB-SecureDB-R];
GO


-- ============================================================================
-- Create the editor user / group
-- ============================================================================
CREATE USER [SQLSECURITY\SQL-DB-SecureDB-E];
GO

GRANT CONNECT TO [SQLSECURITY\SQL-DB-SecureDB-E];
GRANT SELECT TO [SQLSECURITY\SQL-DB-SecureDB-E];
GRANT INSERT TO [SQLSECURITY\SQL-DB-SecureDB-E];
GRANT UPDATE TO [SQLSECURITY\SQL-DB-SecureDB-E];
GRANT DELETE TO [SQLSECURITY\SQL-DB-SecureDB-E];
GO


-- ============================================================================
-- Create the admin user / group
-- ============================================================================
CREATE USER [SQLSECURITY\SQL-DB-SecureDB-A];
GO

GRANT CONNECT TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT SELECT TO [SQLSECURITY\SQL-DB-SecureDB-A] WITH GRANT OPTION;
GRANT EXECUTE TO [SQLSECURITY\SQL-DB-SecureDB-A] WITH GRANT OPTION;
GRANT INSERT TO [SQLSECURITY\SQL-DB-SecureDB-A] WITH GRANT OPTION;
GRANT UPDATE TO [SQLSECURITY\SQL-DB-SecureDB-A] WITH GRANT OPTION;
GRANT DELETE TO [SQLSECURITY\SQL-DB-SecureDB-A] WITH GRANT OPTION;
GRANT ALTER ANY APPLICATION ROLE TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT ALTER ANY ASSEMBLY TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT ALTER ANY ASYMMETRIC KEY TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT ALTER ANY CERTIFICATE TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT ALTER ANY DATABASE DDL TRIGGER TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT ALTER ANY DATASPACE TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT ALTER ANY ROLE TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT ALTER ANY SCHEMA TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT ALTER ANY SYMMETRIC KEY TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT CREATE AGGREGATE TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT CREATE ASSEMBLY TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT CREATE ASYMMETRIC KEY TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT CREATE CERTIFICATE TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT CREATE DEFAULT TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT CREATE FUNCTION TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT CREATE PROCEDURE TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT CREATE ROLE TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT CREATE RULE TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT CREATE SCHEMA TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT CREATE SYNONYM TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT CREATE SYMMETRIC KEY TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT CREATE TABLE TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT CREATE TYPE TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT CREATE VIEW TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT CREATE XML SCHEMA COLLECTION TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT REFERENCES TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT SHOWPLAN TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT SUBSCRIBE QUERY NOTIFICATIONS TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT TAKE OWNERSHIP TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT VIEW DATABASE STATE TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT VIEW DEFINITION TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT ALTER ANY SECURITY POLICY TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT ALTER ANY MASK TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT VIEW ANY COLUMN ENCRYPTION KEY DEFINITION TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT VIEW ANY COLUMN MASTER KEY DEFINITION TO [SQLSECURITY\SQL-DB-SecureDB-A];
GRANT UNMASK TO [SQLSECURITY\SQL-DB-SecureDB-A];
GO
