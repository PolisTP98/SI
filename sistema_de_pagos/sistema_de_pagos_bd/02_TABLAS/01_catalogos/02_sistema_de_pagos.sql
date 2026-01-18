IF OBJECT_ID('sp.estatus_transacciones', 'U') IS NULL
BEGIN
	CREATE TABLE sp.estatus_transacciones(
		id_estatus_transaccion INT IDENTITY(1,1) PRIMARY KEY, 
		nombre VARCHAR(100) NOT NULL, 
		descripcion VARCHAR(255) NOT NULL DEFAULT 'S/D'
	);
END


IF OBJECT_ID('sp.tipos_transacciones', 'U') IS NULL
BEGIN
	CREATE TABLE sp.tipos_transacciones(
		id_tipo_transaccion INT IDENTITY(1,1) PRIMARY KEY, 
		nombre VARCHAR(100) NOT NULL, 
		descripcion VARCHAR(255) NOT NULL DEFAULT 'S/D'
	);
END
GO