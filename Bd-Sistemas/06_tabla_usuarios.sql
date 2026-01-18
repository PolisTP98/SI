
CREATE TABLE usr.roles (
    id_rol INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);
GO

INSERT INTO usr.roles (nombre)
VALUES ('USUARIO'), ('ADMIN');
GO

IF OBJECT_ID('usr.clientes_publico', 'U') IS NULL
BEGIN
    CREATE TABLE usr.clientes_publico (
        id_cliente INT IDENTITY(1,1) PRIMARY KEY,
        id_pais INT NOT NULL,
        id_rol INT NOT NULL DEFAULT 1,
        nombre VARCHAR(100) NOT NULL,
        apellido_paterno VARCHAR(50) NOT NULL,
        apellido_materno VARCHAR(50) NOT NULL DEFAULT '',
        fecha_nacimiento DATE NOT NULL,
        fecha_registro DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
        id_estatus INT NOT NULL DEFAULT 1,
        CONSTRAINT fk_clientes_paises
            FOREIGN KEY (id_pais) REFERENCES gral.paises(id_pais),
        CONSTRAINT fk_clientes_roles
            FOREIGN KEY (id_rol) REFERENCES usr.roles(id_rol),
        CONSTRAINT fk_clientes_estatus
            FOREIGN KEY (id_estatus) REFERENCES gral.estatus(id_estatus)
    );
END;
GO


IF OBJECT_ID('usr.clientes_privado', 'U') IS NULL
BEGIN
    CREATE TABLE usr.clientes_privado (
        id_cliente INT PRIMARY KEY,
        telefono VARCHAR(10) NOT NULL,
        correo_electronico VARCHAR(255) NOT NULL,
        rfc VARCHAR(13) NOT NULL DEFAULT 'N/A',
        CONSTRAINT fk_clientes_publico_privado
            FOREIGN KEY (id_cliente)
            REFERENCES usr.clientes_publico(id_cliente)
            ON DELETE CASCADE
            ON UPDATE CASCADE
    );
END;
GO

IF OBJECT_ID('usr.usuarios', 'U') IS NULL
BEGIN
    CREATE TABLE usr.usuarios (
        id_usuario INT IDENTITY(1,1) PRIMARY KEY,
        id_cliente INT NOT NULL,
        contrasena VARBINARY(256) NOT NULL,
        id_estatus INT NOT NULL DEFAULT 1,
        CONSTRAINT fk_usuarios_clientes
            FOREIGN KEY (id_cliente) REFERENCES usr.clientes_publico(id_cliente),
        CONSTRAINT fk_usuarios_estatus
            FOREIGN KEY (id_estatus) REFERENCES gral.estatus(id_estatus)
    );
END;
GO


	