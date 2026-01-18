/* =============================================
   7. VISTAS
   ============================================= */

-- CORRECCION GENERAL DE LA VISTA:
-- Se reconstruyó el JOIN porque la tabla tarjetas_publico NO tiene id_usuario.
-- Se usa identificador_tarjeta como puente entre Cliente y Tarjeta.
CREATE VIEW ba.vista_tarjetas_usuario AS
SELECT 
    tp.id_tarjeta,
    (cli.nombre + ' ' + cli.apellido_paterno) AS nombre_cliente,
    b.nombre AS banco,
    -- Nota: tp.ultimos_4 no existe en la definición de tabla, se omite o se calcula
    RIGHT(it.numero_cuenta, 4) as ultimos_4_cuenta, 
    et.nombre AS estado
FROM ba.tarjetas_publico tp
JOIN ba.estatus_tarjeta et ON tp.id_estatus_tarjeta = et.id_estado
JOIN ba.bancos b ON tp.id_banco = b.id_banco
-- Puente hacia el usuario
JOIN ba.identificador_tarjeta it ON tp.id_tarjeta = it.id_tarjeta
JOIN usr.clientes_publico cli ON it.id_cliente = cli.id_cliente;
GO