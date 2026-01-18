IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'gral') EXEC('CREATE SCHEMA gral');
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'sp') EXEC('CREATE SCHEMA sp');
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'usr') EXEC('CREATE SCHEMA [usr]');
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'pdts') EXEC('CREATE SCHEMA pdts');
GO