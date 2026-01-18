IF OBJECT_ID('[usr].clientes_privado', 'U') IS NULL
BEGIN
	CREATE TABLE [usr].clientes_privado(
		id_cliente INT PRIMARY KEY, 
		telefono VARCHAR(10) NOT NULL, 
		correo_electronico VARCHAR(255) NOT NULL, 
		rfc VARCHAR(13) NOT NULL DEFAULT 'N/A', 
		CONSTRAINT fk_clientes_publico_privado 
			FOREIGN KEY(id_cliente) REFERENCES [usr].clientes_publico(id_cliente) 
				ON DELETE CASCADE 
				ON UPDATE CASCADE
	);
END
GO