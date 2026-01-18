
IF EXISTS (
    SELECT 1
    FROM sys.databases
    WHERE name = 'banco'
)
BEGIN
    drop DATABASE banco;
END;
GO

