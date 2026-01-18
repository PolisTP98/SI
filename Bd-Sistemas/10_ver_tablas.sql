
PRINT '=== TABLAS GENERALES ==='
SELECT 'gral.estatus' AS Tabla, * FROM gral.estatus;
SELECT 'gral.divisas' AS Tabla, * FROM gral.divisas;
SELECT 'gral.continentes' AS Tabla, * FROM gral.continentes;
SELECT 'gral.paises' AS Tabla, * FROM gral.paises;

PRINT '=== CATALOGOS BANCARIOS ==='
SELECT 'ba.bancos' AS Tabla, * FROM ba.bancos;
SELECT 'ba.tipos_tarjetas' AS Tabla, * FROM ba.tipos_tarjetas;
SELECT 'ba.marcas_tarjetas' AS Tabla, * FROM ba.marcas_tarjetas;
SELECT 'ba.redes_tarjetas' AS Tabla, * FROM ba.redes_tarjetas;
SELECT 'ba.tipos_cuentas' AS Tabla, * FROM ba.tipos_cuentas;
SELECT 'ba.categorias_tarjetas' AS Tabla, * FROM ba.categorias_tarjetas;
SELECT 'ba.estatus_tarjeta' AS Tabla, * FROM ba.estatus_tarjeta;
SELECT 'ba.bins' AS Tabla, * FROM ba.bins;

PRINT '=== USUARIOS ==='
SELECT 'usr.roles' AS Tabla, * FROM usr.roles;
SELECT 'usr.clientes_publico' AS Tabla, * FROM usr.clientes_publico;
SELECT 'usr.clientes_privado' AS Tabla, * FROM usr.clientes_privado;
SELECT 'usr.usuarios' AS Tabla, * FROM usr.usuarios;

PRINT '=== CORE BANCARIO (TARJETAS) ==='
SELECT 'ba.tarjetas_publico' AS Tabla, * FROM ba.tarjetas_publico;
SELECT 'ba.tarjetas_privadas' AS Tabla, * FROM ba.tarjetas_privadas;
SELECT 'ba.identificador_tarjeta' AS Tabla, * FROM ba.identificador_tarjeta;
GO