/* =============================================
   3. CATALOGOS BANCARIOS (Schema: ba)
   ============================================= */

-- CORRECCION: Tablas creadas para satisfacer las Foreign Keys de tarjetas_publico
IF OBJECT_ID('ba.tipos_tarjetas', 'U') IS NULL 
    CREATE TABLE ba.tipos_tarjetas (id_tipo_tarjeta INT IDENTITY(1,1) PRIMARY KEY, nombre VARCHAR(50));

IF OBJECT_ID('ba.marcas_tarjetas', 'U') IS NULL 
    CREATE TABLE ba.marcas_tarjetas (id_marca INT IDENTITY(1,1) PRIMARY KEY, nombre VARCHAR(50));

IF OBJECT_ID('ba.redes_tarjetas', 'U') IS NULL 
    CREATE TABLE ba.redes_tarjetas (id_red INT IDENTITY(1,1) PRIMARY KEY, nombre VARCHAR(50));

IF OBJECT_ID('ba.tipos_cuentas', 'U') IS NULL 
    CREATE TABLE ba.tipos_cuentas (id_tipo_cuenta INT IDENTITY(1,1) PRIMARY KEY, nombre VARCHAR(50));

IF OBJECT_ID('ba.categorias_tarjetas', 'U') IS NULL 
    CREATE TABLE ba.categorias_tarjetas (id_categoria INT IDENTITY(1,1) PRIMARY KEY, nombre VARCHAR(50));
GO

-- Tabla Estatus Tarjeta (Ya existía, pero la moví aquí por orden)
IF OBJECT_ID('ba.estatus_tarjeta', 'U') IS NULL
BEGIN
    CREATE TABLE ba.estatus_tarjeta (
        id_estado INT IDENTITY(1,1) PRIMARY KEY,
        nombre VARCHAR(50) NOT NULL UNIQUE,
        descripcion VARCHAR(255)
    );
    
    INSERT INTO ba.estatus_tarjeta (nombre, descripcion) VALUES
    ('PENDIENTE', 'Tarjeta registrada pero no validada'),
    ('ACTIVA', 'Tarjeta disponible para pagos'),
    ('BLOQUEADA', 'Bloqueo por seguridad'),
    ('VENCIDA', 'Tarjeta expirada'),
    ('CANCELADA', 'Tarjeta cancelada definitivamente');
END;
GO

-- Tabla Bancos (Es un catálogo principal)
IF OBJECT_ID('ba.bancos', 'U') IS NULL
BEGIN
    CREATE TABLE ba.bancos (
        id_banco INT IDENTITY(1,1) PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL UNIQUE,
        codigo VARCHAR(20) NOT NULL UNIQUE
    );
END;
GO