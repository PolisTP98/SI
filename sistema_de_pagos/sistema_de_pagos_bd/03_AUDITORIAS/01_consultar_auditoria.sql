CREATE VIEW consultar_auditoria AS 
SELECT 
	event_time, 
	schema_name, 
	object_name, 
	statement, 
	server_principal_name AS usuario
FROM sys.fn_get_audit_file ('D:\GitHub\SI\sistema_de_pagos\auditorias\*', DEFAULT, DEFAULT);
GO