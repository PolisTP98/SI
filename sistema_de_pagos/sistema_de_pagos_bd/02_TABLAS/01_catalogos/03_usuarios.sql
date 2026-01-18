IF OBJECT_ID('[usr].roles', 'U') IS NULL
BEGIN
	CREATE TABLE [usr].roles(
		id_rol INT IDENTITY(1,1) PRIMARY KEY,
		nombre VARCHAR(50) NOT NULL
	);
END
GO