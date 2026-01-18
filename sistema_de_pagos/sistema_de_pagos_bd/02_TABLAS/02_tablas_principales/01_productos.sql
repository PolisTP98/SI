IF OBJECT_ID('pdts.productos', 'U') IS NULL
BEGIN
	CREATE TABLE pdts.productos(
		id_producto INT IDENTITY(1,1) PRIMARY KEY, 
		marca VARCHAR(50) NOT NULL DEFAULT 'S/M', 
		nombre VARCHAR(100) NOT NULL, 
		precio DECIMAL(12, 2) NOT NULL, 
		stock INT NOT NULL DEFAULT 0, 
		id_estatus INT NOT NULL DEFAULT 1, 
		CONSTRAINT fk_productos_estatus FOREIGN KEY(id_estatus) REFERENCES gral.estatus(id_estatus)
	);
END
GO