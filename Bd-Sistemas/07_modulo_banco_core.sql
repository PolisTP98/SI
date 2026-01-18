
/* =============================================
   5. MODULO BANCO CORE (Schema: ba)
   Objetivo: Tablas transaccionales Públicas (Padres)
   ============================================= */

-- 1. Tabla de BINS (Configuración operativa)
IF OBJECT_ID('ba.bins', 'U') IS NULL
BEGIN
    CREATE TABLE ba.bins (
        id_bin INT IDENTITY(1,1) PRIMARY KEY,
        bin_inicio INT NOT NULL,
        bin_fin INT NOT NULL,
        id_red_pago int NOT NULL,
        id_banco INT NOT NULL,

        CONSTRAINT FK_bins_banco 
            FOREIGN KEY (id_banco) REFERENCES ba.bancos(id_banco)
    );
END;
GO

-- 2. TABLA PADRE: Tarjetas Público
-- Esta tabla DEBE existir antes de crear 'tarjetas_privadas' o 'identificador_tarjeta'
IF OBJECT_ID('ba.tarjetas_publico', 'U') IS NULL
BEGIN
    CREATE TABLE ba.tarjetas_publico (
        id_tarjeta INT IDENTITY(1,1) PRIMARY KEY, -- Este es el ID Maestro que compartirán las tablas hijas
        id_banco INT NOT NULL,
        id_tipo_tarjeta INT NOT NULL,
        id_marca INT NOT NULL,
        id_red INT NOT NULL,
        id_tipo_cuenta INT NOT NULL,
        id_categoria INT NOT NULL,
        saldo DECIMAL(12,2) NOT NULL DEFAULT 0,
        fecha_registro DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
        id_estatus_tarjeta INT NOT NULL DEFAULT 1,

        -- Relaciones con Catálogos (Deben existir previamente en 03_Catalogos_Banco)
        CONSTRAINT fk_tarjetas_bancos FOREIGN KEY (id_banco) REFERENCES ba.bancos(id_banco),
        CONSTRAINT fk_tarjetas_tipos_tarjetas FOREIGN KEY (id_tipo_tarjeta) REFERENCES ba.tipos_tarjetas(id_tipo_tarjeta),
        CONSTRAINT fk_tarjetas_marcas FOREIGN KEY (id_marca) REFERENCES ba.marcas_tarjetas(id_marca),
        CONSTRAINT fk_tarjetas_redes FOREIGN KEY (id_red) REFERENCES ba.redes_tarjetas(id_red),
        CONSTRAINT fk_tarjetas_tipos_cuentas FOREIGN KEY (id_tipo_cuenta) REFERENCES ba.tipos_cuentas(id_tipo_cuenta),
        CONSTRAINT fk_tarjetas_categorias FOREIGN KEY (id_categoria) REFERENCES ba.categorias_tarjetas(id_categoria),
        CONSTRAINT fk_tarjetas_estatus FOREIGN KEY (id_estatus_tarjeta) REFERENCES ba.estatus_tarjeta(id_estado)
    );
END;
GO