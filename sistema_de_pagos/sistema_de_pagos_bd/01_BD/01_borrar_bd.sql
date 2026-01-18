IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'sistema_de_pagos')
BEGIN
    DROP DATABASE sistema_de_pagos;
END
GO