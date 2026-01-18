/* =============================================
   6. DETALLES SENSIBLES Y RELACIONES (Schema: ba)
   Objetivo: Tablas Hijas (Extensiones verticales con datos sensibles)
   ============================================= */

-- 1. Tarjetas Privadas (Datos sensibles PCI-DSS, Tokens, Hash)
IF OBJECT_ID('ba.tarjetas_privadas', 'U') IS NULL
BEGIN
    CREATE TABLE ba.tarjetas_privadas (
        id_tarjeta INT PRIMARY KEY, -- NO es Identity, es PK y FK al mismo tiempo
        token_pasarela VARCHAR(255) NOT NULL,
        referencia_hash VARCHAR(255),

        -- Relación 1 a 1 con la tabla pública
        CONSTRAINT FK_tarjeta_privada 
            FOREIGN KEY (id_tarjeta) REFERENCES ba.tarjetas_publico(id_tarjeta)
            ON DELETE CASCADE -- Si borras la pública, se borra la privada
    );
END;
GO

-- 2. Identificador Tarjeta (Relación Cliente - Tarjeta y datos bancarios sensibles)
IF OBJECT_ID('ba.identificador_tarjeta', 'U') IS NULL
BEGIN
    CREATE TABLE ba.identificador_tarjeta (
        id_tarjeta INT PRIMARY KEY, -- Relación 1:1 con la tarjeta física
        id_cliente INT NOT NULL,
        numero_cuenta VARCHAR(20) NOT NULL, -- Dato sensible
        clabe VARCHAR(18) NOT NULL,         -- Dato sensible
        
        -- Relación con Tarjeta Pública
        CONSTRAINT fk_tarjetas_identificador 
            FOREIGN KEY (id_tarjeta) REFERENCES ba.tarjetas_publico(id_tarjeta)
            ON DELETE CASCADE 
            ON UPDATE CASCADE,
            
        -- Relación con Cliente
        CONSTRAINT fk_identificador_clientes 
            FOREIGN KEY (id_cliente) REFERENCES usr.clientes_publico(id_cliente)
    );
END;
GO