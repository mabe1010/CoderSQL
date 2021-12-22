CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar y agregar valores en dimempleados`(IN IdEmpleado INT)
BEGIN
INSERT INTO colegio_pablo_neruda.dimempleados (Nombre, Apellido, DNI, Edad, Correo, Telefono, Direccion, EstadoCivil, Cargo, FechaIngreso, FechaEgreso)
VALUES ('Ana', 'Soledad', 96545263, 26, 'anasole@gmail.com', 1154896578, 'Lavalleja 105', 'Soltera', 'Secretaria Control Estudio', '2021-11-14', NULL);
DELETE FROM colegio_pablo_neruda.dimempleados
WHERE IdEmpleado = IdEmpleado;
END
