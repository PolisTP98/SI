
IF NOT EXISTS (
    SELECT 1
    FROM sys.databases
    WHERE name = 'banco'
)
BEGIN
    CREATE DATABASE banco;
END;
GO

USE Banco;
GO
