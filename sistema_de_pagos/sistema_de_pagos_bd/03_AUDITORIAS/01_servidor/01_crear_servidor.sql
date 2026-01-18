USE master;
GO

-- 1) CREAR LA AUDITORÍA DEL SERVIDOR
CREATE SERVER AUDIT auditoria_sistema_de_pagos
TO FILE ( FILEPATH = 'D:\GitHub\SI\sistema_de_pagos\auditorias' );
GO

-- 2) HABILITAR LA AUDITORÍA
ALTER SERVER AUDIT auditoria_sistema_de_pagos WITH (STATE = ON);
GO