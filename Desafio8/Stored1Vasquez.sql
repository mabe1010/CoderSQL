CREATE DEFINER=`root`@`localhost` PROCEDURE `ordenar_alumnos`(IN campo VARCHAR(255), IN tipo_ordenamiento VARCHAR(255))
BEGIN
	IF campo <> '' THEN
		SET @ordenar = CONCAT('Order By ', campo);
    ELSE 
		SET @ordenar = '';
	END IF;
    IF tipo_ordenamiento <> '' THEN
		SET @tipo = CONCAT(' ', tipo_ordenamiento);
	ELSE 
		SET @tipo = '';
	END IF;
    SET @clausula = CONCAT('SELECT * FROM colegio_pablo_neruda.dimalumnos ', @ordenar, @tipo);
    PREPARE ejecutarSQL FROM @clausula;
    EXECUTE ejecutarSQL;
    deallocate prepare ejecutarSQL;
END