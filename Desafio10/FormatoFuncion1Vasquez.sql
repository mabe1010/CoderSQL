CREATE DEFINER=`root`@`localhost` FUNCTION `Ingresos`(Mes ENUM("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"), Anio YEAR) RETURNS float
    READS SQL DATA
BEGIN
	DECLARE Total FLOAT;
    SET Total = (SELECT SUM(Deposito) AS TotalIngresoMes FROM colegio_pablo_neruda.factmensualidad);
RETURN Total;
END