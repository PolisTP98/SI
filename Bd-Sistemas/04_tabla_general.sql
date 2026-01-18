
IF OBJECT_ID('gral.divisas', 'U') IS NULL
BEGIN
    CREATE TABLE gral.divisas (
        id_divisa INT IDENTITY(1,1) PRIMARY KEY,
        codigo CHAR(3) NOT NULL,
        nombre VARCHAR(255) NOT NULL
    );
END;
GO

IF OBJECT_ID('gral.continentes', 'U') IS NULL
BEGIN
    CREATE TABLE gral.continentes (
        id_continente INT IDENTITY(1,1) PRIMARY KEY,
        nombre VARCHAR(20) NOT NULL
    );
END;
GO

IF OBJECT_ID('gral.paises', 'U') IS NULL
BEGIN
    CREATE TABLE gral.paises (
        id_pais INT IDENTITY(1,1) PRIMARY KEY,
        id_continente INT NOT NULL,
        id_divisa INT NOT NULL,
        nombre VARCHAR(100) NOT NULL,
        codigo_iso CHAR(5) NOT NULL,
        prefijo_telefonico CHAR(10) NOT NULL,
        CONSTRAINT fk_paises_continentes
            FOREIGN KEY (id_continente) REFERENCES gral.continentes(id_continente),
        CONSTRAINT fk_paises_divisas
            FOREIGN KEY (id_divisa) REFERENCES gral.divisas(id_divisa)
    );
END;
GO
