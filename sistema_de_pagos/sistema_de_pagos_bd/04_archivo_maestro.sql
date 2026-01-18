-- \|01_BD|
	-- \01_borrar_bd.sql -> borrar la bd en caso de ser necesario
	:r "D:\GitHub\SI\sistema_de_pagos\sistema_de_pagos_bd\01_BD\01_borrar_bd.sql"
	-- \02_crear_bd.sql -> crear la base de datos de la aplicación web
	:r "D:\GitHub\SI\sistema_de_pagos\sistema_de_pagos_bd\01_BD\02_crear_bd.sql"
	-- \03_crear_esquemas.sql -> crear los esquemas de la base de datos
	:r "D:\GitHub\SI\sistema_de_pagos\sistema_de_pagos_bd\01_BD\03_crear_esquemas.sql"


-- \|02_TABLAS|
	-- \|01_catalogos|
		-- \01_general.sql -> crear los catálogos generales
		:r "D:\GitHub\SI\sistema_de_pagos\sistema_de_pagos_bd\02_TABLAS\01_catalogos\01_general.sql"
		-- \02_sistema_de_pagos.sql -> crear los catálogos del sistema de pagos
		:r "D:\GitHub\SI\sistema_de_pagos\sistema_de_pagos_bd\02_TABLAS\01_catalogos\02_sistema_de_pagos.sql"
		-- \03_usuarios.sql -> crear los catálogos de los usuarios
		:r "D:\GitHub\SI\sistema_de_pagos\sistema_de_pagos_bd\02_TABLAS\01_catalogos\03_usuarios.sql"
	-- \|02_tablas_principales|
		-- \01_productos.sql -> crear las tablas de los productos
		:r "D:\GitHub\SI\sistema_de_pagos\sistema_de_pagos_bd\02_TABLAS\02_tablas_principales\01_productos.sql"
		-- \02_usuarios.sql -> crear las tablas de los usuarios
		:r "D:\GitHub\SI\sistema_de_pagos\sistema_de_pagos_bd\02_TABLAS\02_tablas_principales\02_usuarios.sql"
		-- \03_usuarios_privado.sql -> crear las tablas privadas de los usuarios
		:r "D:\GitHub\SI\sistema_de_pagos\sistema_de_pagos_bd\02_TABLAS\02_tablas_principales\03_usuarios_privado.sql"
		-- \04_sistema_de_pagos.sql -> crear las tablas del sistema de pagos
		:r "D:\GitHub\SI\sistema_de_pagos\sistema_de_pagos_bd\02_TABLAS\02_tablas_principales\04_sistema_de_pagos.sql"


-- \|03_AUDITORIAS|
	-- \|01_servidor|
		-- \01_crear_servidor.sql -> crear el servidor para la auditoria de la base de datos
		:r "D:\GitHub\SI\sistema_de_pagos\sistema_de_pagos_bd\03_AUDITORIAS\01_SERVIDOR\01_crear_servidor.sql"
	-- \|02_bd|
		-- \01_crear_bd.sql -> crear la base de datos de tipo auditoría para almacenar los registros
		:r "D:\GitHub\SI\sistema_de_pagos\sistema_de_pagos_bd\03_AUDITORIAS\02_BD\01_crear_bd.sql"
	-- 01_consultar_auditoria.sql -> crear la vista para consultar los datos de la auditoría
	:r "D:\GitHub\SI\sistema_de_pagos\sistema_de_pagos_bd\03_AUDITORIAS\01_consultar_auditoria.sql"
