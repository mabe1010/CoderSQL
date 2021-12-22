CREATE DEFINER=`root`@`localhost` FUNCTION `PromedioNotaPorAlumno`(Id INT, Lapso INT, Anio YEAR) RETURNS int
    READS SQL DATA
BEGIN
	DECLARE SumaLapso INT;
    DECLARE Resultado INT;
    SET SumaLapso = (SELECT SUM(NotaLapso) AS NotaPromedio FROM colegio_pablo_neruda.factregistronotas WHERE IdAlumno = Id AND Lapso = Lapso AND Anio = Anio);
	SET Resultado = SumaLapso DIV 9;
RETURN Resultado;
END