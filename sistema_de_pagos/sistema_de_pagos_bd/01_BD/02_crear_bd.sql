IF NOT EXISTS (SELECT 1 FROM sys.databases WHERE name = 'sistema_de_pagos')
BEGIN
    CREATE DATABASE sistema_de_pagos;
END
GO

USE sistema_de_pagos;
GO