
CREATE TABLE ba.bancos (
    id_banco INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    codigo VARCHAR(20) NOT NULL UNIQUE
);
GO

CREATE TABLE ba.bins (
    id_bin INT IDENTITY(1,1) PRIMARY KEY,
    bin_inicio INT NOT NULL,
    bin_fin INT NOT NULL,
    id_red_pago int NOT NULL,
    id_banco INT NOT NULL,

    CONSTRAINT FK_bins_banco 
        FOREIGN KEY (id_banco) REFERENCES ba.bancos(id_banco)
	
);
GO

CREATE TABLE ba.estatus_tarjeta (
    id_estado INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(255)
);
GO

INSERT INTO ba.estatus_tarjeta (nombre, descripcion) VALUES
('PENDIENTE', 'Tarjeta registrada pero no validada'),
('ACTIVA', 'Tarjeta disponible para pagos'),
('BLOQUEADA', 'Bloqueo por seguridad'),
('VENCIDA', 'Tarjeta expirada'),
('CANCELADA', 'Tarjeta cancelada definitivamente');
GO

IF OBJECT_ID('ba.tarjetas_publico', 'U') IS NULL
BEGIN
    CREATE TABLE ba.tarjetas_publico (
        id_tarjeta INT IDENTITY(1,1) PRIMARY KEY,
        id_banco INT NOT NULL,
        id_tipo_tarjeta INT NOT NULL,
        id_marca INT NOT NULL,
        id_red INT NOT NULL,
        id_tipo_cuenta INT NOT NULL,
        id_categoria INT NOT NULL,
        saldo DECIMAL(12,2) NOT NULL DEFAULT 0,
        fecha_registro DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
        id_estatus_tarjeta INT NOT NULL DEFAULT 1,
        CONSTRAINT fk_tarjetas_bancos
            FOREIGN KEY (id_banco) REFERENCES ba.bancos(id_banco),
        CONSTRAINT fk_tarjetas_tipos_tarjetas
            FOREIGN KEY (id_tipo_tarjeta) REFERENCES ba.tipos_tarjetas(id_tipo_tarjeta),
        CONSTRAINT fk_tarjetas_marcas
            FOREIGN KEY (id_marca) REFERENCES ba.marcas_tarjetas(id_marca),
        CONSTRAINT fk_tarjetas_redes
            FOREIGN KEY (id_red) REFERENCES ba.redes_tarjetas(id_red),
        CONSTRAINT fk_tarjetas_tipos_cuentas
            FOREIGN KEY (id_tipo_cuenta) REFERENCES ba.tipos_cuentas(id_tipo_cuenta),
        CONSTRAINT fk_tarjetas_categorias
            FOREIGN KEY (id_categoria) REFERENCES ba.categorias_tarjetas(id_categoria),
        CONSTRAINT fk_tarjetas_estatus
            FOREIGN KEY (id_estatus_tarjeta) REFERENCES ba.estatus_tarjetas(id_estatus_tarjeta)
    );
END;
GO

CREATE TABLE ba.tarjetas_privadas (
    id_tarjeta INT PRIMARY KEY,
    token_pasarela VARCHAR(255) NOT NULL,
    referencia_hash VARCHAR(255),

    CONSTRAINT FK_tarjeta_privada
        FOREIGN KEY (id_tarjeta) REFERENCES ba.tarjetas_publicas(id_tarjeta)
);
GO

IF OBJECT_ID('ba.identificador_tarjeta', 'U') IS NULL
BEGIN
    CREATE TABLE ba.identificador_tarjeta (
        id_tarjeta INT PRIMARY KEY,
        id_cliente INT NOT NULL,
        numero_cuenta VARCHAR(20) NOT NULL,
        clabe VARCHAR(18) NOT NULL,
        CONSTRAINT fk_tarjetas_identificador
            FOREIGN KEY (id_tarjeta)
            REFERENCES ba.tarjetas_publico(id_tarjeta)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
        CONSTRAINT fk_identificador_clientes
            FOREIGN KEY (id_cliente)
            REFERENCES usr.clientes_publico(id_cliente)
    );
END;
GO
