IF OBJECT_ID('sp.identificador_tarjetas', 'U') IS NULL
BEGIN
	CREATE TABLE sp.identificador_tarjetas(
		id_tarjeta INT IDENTITY(1,1) PRIMARY KEY, 
		id_cliente INT NOT NULL, 
		numero_cuenta VARCHAR(20) NOT NULL, 
		clabe VARCHAR(18) NOT NULL, 
		id_estatus INT NOT NULL, 
		CONSTRAINT fk_identificador_clientes 
			FOREIGN KEY(id_cliente) REFERENCES [usr].clientes_publico(id_cliente), 
		CONSTRAINT fk_identificador_estatus 
			FOREIGN KEY(id_estatus) REFERENCES gral.estatus(id_estatus)
	);
END


IF OBJECT_ID('sp.ventas', 'U') IS NULL
BEGIN
	CREATE TABLE sp.ventas(
		id_venta INT IDENTITY(1,1) PRIMARY KEY, 
		id_producto INT NOT NULL, 
		cantidad INT NOT NULL DEFAULT 1, 
		id_estatus INT NOT NULL DEFAULT 1, 
		CONSTRAINT fk_ventas_productos 
			FOREIGN KEY(id_producto) REFERENCES pdts.productos(id_producto), 
		CONSTRAINT fk_ventas_estatus 
			FOREIGN KEY(id_estatus) REFERENCES gral.estatus(id_estatus)
	);
END


IF OBJECT_ID('sp.recibo_ventas', 'U') IS NULL
BEGIN
	CREATE TABLE sp.recibo_ventas(
		id_recibo INT IDENTITY(1,1) PRIMARY KEY, 
		id_venta INT NOT NULL, 
		codigo_recibo VARCHAR(10) NOT NULL, 
		fecha_recibo DATE NOT NULL DEFAULT CAST(GETDATE() AS DATE), 
		hora_recibo TIME NOT NULL DEFAULT CAST(GETDATE() AS TIME), 
		id_estatus INT NOT NULL DEFAULT 1, 
		CONSTRAINT fk_recibos_ventas 
			FOREIGN KEY(id_venta) REFERENCES sp.ventas(id_venta), 
		CONSTRAINT fk_recibos_estatus 
			FOREIGN KEY(id_estatus) REFERENCES gral.estatus(id_estatus)
	);
END


IF OBJECT_ID('sp.transacciones', 'U') IS NULL
BEGIN
	CREATE TABLE sp.transacciones(
		id_transaccion INT IDENTITY(1,1) PRIMARY KEY, 
		id_recibo INT NOT NULL, 
		id_tarjeta INT NOT NULL, 
		id_tipo_transaccion INT NOT NULL, 
		monto DECIMAL(12, 2) NOT NULL DEFAULT 0, 
		fecha_transaccion DATE NOT NULL DEFAULT CAST(GETDATE() AS DATE), 
		hora_transaccion TIME NOT NULL DEFAULT CAST(GETDATE() AS TIME), 
		id_estatus_transaccion INT NOT NULL DEFAULT 1, 
		CONSTRAINT fk_transacciones_recibos 
			FOREIGN KEY(id_recibo) REFERENCES sp.recibo_ventas(id_recibo), 
		CONSTRAINT fk_transacciones_tarjetas 
			FOREIGN KEY(id_tarjeta) REFERENCES sp.identificador_tarjetas(id_tarjeta), 
		CONSTRAINT fk_transacciones_tipos_transacciones 
			FOREIGN KEY(id_tipo_transaccion) REFERENCES sp.tipos_transacciones(id_tipo_transaccion), 
		CONSTRAINT fk_transacciones_estatus 
			FOREIGN KEY(id_estatus_transaccion) REFERENCES sp.estatus_transacciones(id_estatus_transaccion)
	);
END
GO