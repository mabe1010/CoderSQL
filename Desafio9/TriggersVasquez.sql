CREATE DATABASE Colegio_Pablo_Neruda;
USE Colegio_Pablo_Neruda;
CREATE TABLE IF NOT EXISTS DimRepresentantes(
					IdRepresentante INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                    NombreMadre VARCHAR(255) NOT NULL,
                    NombrePadre VARCHAR(255) NOT NULL,
                    DNIMadre BIGINT,
                    DNIPadre BIGINT,
                    ProfesionMadre VARCHAR(255),
                    ProfesionPadre VARCHAR(255),
                    CorreoMadre VARCHAR(255),
                    CorreoPadre VARCHAR(255),
                    DireccionVivienda VARCHAR(255) NOT NULL,
                    LugarTrabajoMadre VARCHAR(255),
                    LugarTrabajoPadre VARCHAR(255));
CREATE TABLE IF NOT EXISTS DimSecciones(
					IdSeccion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                    Grado ENUM("1","2","3","4","5") NOT NULL,
                    Grupo ENUM("A","B") NOT NULL,
                    CapacidadAlumnos INT NOT NULL);
CREATE TABLE IF NOT EXISTS DimAlumnos(
					IdAlumno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                    Nombre VARCHAR(255) NOT NULL,
                    Apellido VARCHAR(255) NOT NULL,
                    DNI BIGINT NOT NULL,
                    Edad INT NOT NULL,
                    Correo VARCHAR(255),
                    Direccion VARCHAR(255) NOT NULL,
                    FechaIngreso DATE NOT NULL,
                    FechaEgreso DATE,
                    IdRepresentante INT NOT NULL,
                    FOREIGN KEY(IdRepresentante) REFERENCES DimRepresentantes(IdRepresentante),
                    IdSeccion INT NOT NULL,
                    FOREIGN KEY(IdSeccion) REFERENCES DimSecciones(IdSeccion));
CREATE TABLE IF NOT EXISTS DimEmpleados(
					IdEmpleado INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                    Nombre VARCHAR(255) NOT NULL,
                    Apellido VARCHAR(255) NOT NULL,
                    DNI BIGINT NOT NULL,
                    Edad INT NOT NULL,
                    Correo VARCHAR(255),
                    Telefono BIGINT NOT NULL,
                    Direccion VARCHAR(255) NOT NULL,
                    EstadoCivil VARCHAR(255) NOT NULL,
                    Cargo VARCHAR(255) NOT NULL,
                    FechaIngreso DATE NOT NULL,
                    FechaEgreso DATE);
CREATE TABLE IF NOT EXISTS DimMaterias(
					IdMateria INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                    Descripcion VARCHAR(255) NOT NULL,
                    IdEmpleado INT NOT NULL,
                    FOREIGN KEY (IdEmpleado) REFERENCES DimEmpleados(IdEmpleado));
CREATE TABLE IF NOT EXISTS FactRegistroNotas(
					IdNotaFinal INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                    Anio YEAR NOT NULL,
                    IdAlumno INT NOT NULL,
                    FOREIGN KEY(IdAlumno) REFERENCES DimAlumnos(IdAlumno),
                    IdMateria INT NOT NULL,
                    FOREIGN KEY(IdMateria) REFERENCES DimMaterias(IdMateria),
                    Lapso INT NOT NULL,
                    NotaLapso INT NOT NULL);
CREATE TABLE IF NOT EXISTS FactNomina(
					IdNomina INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                    IdEmpleado INT NOT NULL,
                    FOREIGN KEY(IdEmpleado) REFERENCES DimEmpleados(IdEmpleado),
                    Sueldo DECIMAL(10,2) NOT NULL,
                    FechaPago DATE NOT NULL,
                    Anio YEAR NOT NULL,
                    Mes ENUM("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre") NOT NULL, 
                    CuentaDeposito BIGINT NOT NULL,
                    Banco VARCHAR(255) NOT NULL);
CREATE TABLE IF NOT EXISTS FactMensualidad(
					idIngreso INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                    IdAlumno INT NOT NULL,
                    FOREIGN KEY(IdAlumno) REFERENCES DimAlumnos(IdAlumno),
                    FechaPago DATE NOT NULL,
                    Anio YEAR NOT NULL,
                    Mes ENUM("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre") NOT NULL, 
                    Deposito DECIMAL(10,2) NOT NULL,
                    MedioPago VARCHAR(255) NOT NULL,
                    EstadoPago BOOLEAN NOT NULL);
                    
INSERT INTO DimEmpleados (`IdEmpleado`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Telefono`,`Direccion`,`EstadoCivil`,`Cargo`,`FechaIngreso`,`FechaEgreso`) VALUES (1,'Jose ','Salcedo',56938503,40,'josesalce@gmail.com',1134593475,'Lavarden 274','Casado','Prof. Matematica','2018-07-23',NULL);
INSERT INTO DimEmpleados (`IdEmpleado`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Telefono`,`Direccion`,`EstadoCivil`,`Cargo`,`FechaIngreso`,`FechaEgreso`) VALUES (2,'Maria','Gonzalez',68735834,33,'Mariagon@gmail.com',1195730456,'Julian Alvarez 3455','Divorciado','Prof. Castellano','2016-09-24',NULL);
INSERT INTO DimEmpleados (`IdEmpleado`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Telefono`,`Direccion`,`EstadoCivil`,`Cargo`,`FechaIngreso`,`FechaEgreso`) VALUES (3,'Laura','Gonzalez',89583593,28,'jai@gmail.com',1134598753,'Tolon 485','Soltero','Prof. Ingles','2021-02-13',NULL);
INSERT INTO DimEmpleados (`IdEmpleado`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Telefono`,`Direccion`,`EstadoCivil`,`Cargo`,`FechaIngreso`,`FechaEgreso`) VALUES (4,'Maria','Martelli',95235866,25,'marialou@gmail.com',1122222242,'Rivadavia 34','Soltero','Prof. Quimica y Biologia','2020-07-26',NULL);
INSERT INTO DimEmpleados (`IdEmpleado`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Telefono`,`Direccion`,`EstadoCivil`,`Cargo`,`FechaIngreso`,`FechaEgreso`) VALUES (5,'Eduardo','Zabaleta',35684563,45,NULL,1185734956,'Loyola 345','Viuda','Prof. Ciencias Tierra','2019-06-27',NULL);
INSERT INTO DimEmpleados (`IdEmpleado`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Telefono`,`Direccion`,`EstadoCivil`,`Cargo`,`FechaIngreso`,`FechaEgreso`) VALUES (6,'Roymer ','Dias',56935375,39,NULL,1194735632,'Av Santa Fe 345','Divorciado','Prof. Deporte','2019-01-28',NULL);
INSERT INTO DimEmpleados (`IdEmpleado`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Telefono`,`Direccion`,`EstadoCivil`,`Cargo`,`FechaIngreso`,`FechaEgreso`) VALUES (7,'Ana','Abaham',94759335,49,'anabran@gmail.com',1124595344,'Loyola 100','Soltero','Prof. Fisica','2019-09-18',NULL);
INSERT INTO DimEmpleados (`IdEmpleado`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Telefono`,`Direccion`,`EstadoCivil`,`Cargo`,`FechaIngreso`,`FechaEgreso`) VALUES (8,'Laura','Jimenez',50545829,48,NULL,1145938573,'Av Estado Israel 2400','Casada','Prof. Historia','2015-07-30',NULL);
INSERT INTO DimEmpleados (`IdEmpleado`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Telefono`,`Direccion`,`EstadoCivil`,`Cargo`,`FechaIngreso`,`FechaEgreso`) VALUES (9,'Ana','Lugo',96464718,60,'analug@gmail.com',1123098358,'Echeverria 1401','Soltero','Directora General','2000-03-10',NULL);
INSERT INTO DimEmpleados (`IdEmpleado`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Telefono`,`Direccion`,`EstadoCivil`,`Cargo`,`FechaIngreso`,`FechaEgreso`) VALUES (10,'Zaisd','Lugo',94827583,57,'zadl@gmail.com',1174928548,'Av Santa Fe 512','Casado','Director Administrativo','2000-03-10',NULL);
INSERT INTO DimEmpleados (`IdEmpleado`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Telefono`,`Direccion`,`EstadoCivil`,`Cargo`,`FechaIngreso`,`FechaEgreso`) VALUES (11,'Adriana','Reins',93485935,56,NULL,1123405845,'Lavalleja 1010','Divorciado','Secretaria','2015-08-02',NULL);
INSERT INTO DimEmpleados (`IdEmpleado`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Telefono`,`Direccion`,`EstadoCivil`,`Cargo`,`FechaIngreso`,`FechaEgreso`) VALUES (12,'Hector','Gomez',43058302,40,NULL,1158305534,'Humbolt 1654','Viudo','Coordinador','2015-08-03',NULL);
INSERT INTO DimEmpleados (`IdEmpleado`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Telefono`,`Direccion`,`EstadoCivil`,`Cargo`,`FechaIngreso`,`FechaEgreso`) VALUES (13,'Jose ','Alvarez',49274592,38,NULL,1130593808,'Gorriti 2500','Soltero','Seguridad','2015-08-04',NULL);
INSERT INTO DimEmpleados (`IdEmpleado`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Telefono`,`Direccion`,`EstadoCivil`,`Cargo`,`FechaIngreso`,`FechaEgreso`) VALUES (14,'Yasneri','Lugo',39583956,48,'yasne@gmail.com',1149305864,'Soler 930','Divorciado','Control de estudio','2015-08-05',NULL);

INSERT INTO DimSecciones (`IdSeccion`,`Grado`,`Grupo`,`CapacidadAlumnos`) VALUES (1,'1','A',25);
INSERT INTO DimSecciones (`IdSeccion`,`Grado`,`Grupo`,`CapacidadAlumnos`) VALUES (2,'1','B',26);
INSERT INTO DimSecciones (`IdSeccion`,`Grado`,`Grupo`,`CapacidadAlumnos`) VALUES (3,'2','A',30);
INSERT INTO DimSecciones (`IdSeccion`,`Grado`,`Grupo`,`CapacidadAlumnos`) VALUES (4,'2','B',31);
INSERT INTO DimSecciones (`IdSeccion`,`Grado`,`Grupo`,`CapacidadAlumnos`) VALUES (5,'3','A',30);
INSERT INTO DimSecciones (`IdSeccion`,`Grado`,`Grupo`,`CapacidadAlumnos`) VALUES (6,'3','B',30);
INSERT INTO DimSecciones (`IdSeccion`,`Grado`,`Grupo`,`CapacidadAlumnos`) VALUES (7,'4','A',30);
INSERT INTO DimSecciones (`IdSeccion`,`Grado`,`Grupo`,`CapacidadAlumnos`) VALUES (8,'4','B',32);
INSERT INTO DimSecciones (`IdSeccion`,`Grado`,`Grupo`,`CapacidadAlumnos`) VALUES (9,'5','A',34);
INSERT INTO DimSecciones (`IdSeccion`,`Grado`,`Grupo`,`CapacidadAlumnos`) VALUES (10,'5','B',29);

INSERT INTO DimMaterias (`IdMateria`,`Descripcion`,`IdEmpleado`) VALUES (1,'Castellano',2);
INSERT INTO DimMaterias (`IdMateria`,`Descripcion`,`IdEmpleado`) VALUES (2,'Matematica',1);
INSERT INTO DimMaterias (`IdMateria`,`Descripcion`,`IdEmpleado`) VALUES (3,'Ingles',3);
INSERT INTO DimMaterias (`IdMateria`,`Descripcion`,`IdEmpleado`) VALUES (4,'Quimica',4);
INSERT INTO DimMaterias (`IdMateria`,`Descripcion`,`IdEmpleado`) VALUES (5,'Biologia',4);
INSERT INTO DimMaterias (`IdMateria`,`Descripcion`,`IdEmpleado`) VALUES (6,'Ciencia Tierra',5);
INSERT INTO DimMaterias (`IdMateria`,`Descripcion`,`IdEmpleado`) VALUES (7,'Deporte',6);
INSERT INTO DimMaterias (`IdMateria`,`Descripcion`,`IdEmpleado`) VALUES (8,'Fisica',7);
INSERT INTO DimMaterias (`IdMateria`,`Descripcion`,`IdEmpleado`) VALUES (9,'Historia',8);

INSERT INTO FactNomina (`IdNomina`,`IdEmpleado`,`Sueldo`,`FechaPago`,`Anio`,`Mes`,`CuentaDeposito`,`Banco`) VALUES (1,1,65000.00,'2021-11-05',2021,'Noviembre',88888888889,'Galicia');
INSERT INTO FactNomina (`IdNomina`,`IdEmpleado`,`Sueldo`,`FechaPago`,`Anio`,`Mes`,`CuentaDeposito`,`Banco`) VALUES (2,2,83500.45,'2021-11-05',2021,'Noviembre',77777777779,'Santander');
INSERT INTO FactNomina (`IdNomina`,`IdEmpleado`,`Sueldo`,`FechaPago`,`Anio`,`Mes`,`CuentaDeposito`,`Banco`) VALUES (3,3,48510.00,'2021-11-05',2021,'Noviembre',66666666669,'HSBC');
INSERT INTO FactNomina (`IdNomina`,`IdEmpleado`,`Sueldo`,`FechaPago`,`Anio`,`Mes`,`CuentaDeposito`,`Banco`) VALUES (4,4,48510.01,'2021-11-05',2021,'Noviembre',55555555559,'ICBC');
INSERT INTO FactNomina (`IdNomina`,`IdEmpleado`,`Sueldo`,`FechaPago`,`Anio`,`Mes`,`CuentaDeposito`,`Banco`) VALUES (5,5,53299.86,'2021-11-05',2021,'Noviembre',11111111119,'Macro');
INSERT INTO FactNomina (`IdNomina`,`IdEmpleado`,`Sueldo`,`FechaPago`,`Anio`,`Mes`,`CuentaDeposito`,`Banco`) VALUES (6,6,58700.00,'2021-11-05',2021,'Noviembre',33333333339,'Patagonia');
INSERT INTO FactNomina (`IdNomina`,`IdEmpleado`,`Sueldo`,`FechaPago`,`Anio`,`Mes`,`CuentaDeposito`,`Banco`) VALUES (7,7,58700.00,'2021-11-05',2021,'Noviembre',44444444449,'HSBC');
INSERT INTO FactNomina (`IdNomina`,`IdEmpleado`,`Sueldo`,`FechaPago`,`Anio`,`Mes`,`CuentaDeposito`,`Banco`) VALUES (8,8,68700.00,'2021-11-05',2021,'Noviembre',22222222229,'Santander');
INSERT INTO FactNomina (`IdNomina`,`IdEmpleado`,`Sueldo`,`FechaPago`,`Anio`,`Mes`,`CuentaDeposito`,`Banco`) VALUES (9,9,135500.00,'2021-11-05',2021,'Noviembre',99999999999,'Santander');
INSERT INTO FactNomina (`IdNomina`,`IdEmpleado`,`Sueldo`,`FechaPago`,`Anio`,`Mes`,`CuentaDeposito`,`Banco`) VALUES (10,10,135500.00,'2021-11-05',2021,'Noviembre',12121212129,'Galicia');
INSERT INTO FactNomina (`IdNomina`,`IdEmpleado`,`Sueldo`,`FechaPago`,`Anio`,`Mes`,`CuentaDeposito`,`Banco`) VALUES (11,11,71050.00,'2021-11-05',2021,'Noviembre',23232323239,'Macro');
INSERT INTO FactNomina (`IdNomina`,`IdEmpleado`,`Sueldo`,`FechaPago`,`Anio`,`Mes`,`CuentaDeposito`,`Banco`) VALUES (12,12,88600.00,'2021-11-05',2021,'Noviembre',34343434349,'BBVA');
INSERT INTO FactNomina (`IdNomina`,`IdEmpleado`,`Sueldo`,`FechaPago`,`Anio`,`Mes`,`CuentaDeposito`,`Banco`) VALUES (13,13,53000.00,'2021-11-05',2021,'Noviembre',56565656569,'BBVA');
INSERT INTO FactNomina (`IdNomina`,`IdEmpleado`,`Sueldo`,`FechaPago`,`Anio`,`Mes`,`CuentaDeposito`,`Banco`) VALUES (14,14,81000.00,'2021-11-05',2021,'Noviembre',76767676679,'Naranja');
INSERT INTO FactNomina (`IdNomina`,`IdEmpleado`,`Sueldo`,`FechaPago`,`Anio`,`Mes`,`CuentaDeposito`,`Banco`) VALUES (15,1,65000.00,'2021-12-05',2021,'Diciembre',88888888889,'Galicia');
INSERT INTO FactNomina (`IdNomina`,`IdEmpleado`,`Sueldo`,`FechaPago`,`Anio`,`Mes`,`CuentaDeposito`,`Banco`) VALUES (16,2,83500.45,'2021-12-05',2021,'Diciembre',77777777779,'Santander');
INSERT INTO FactNomina (`IdNomina`,`IdEmpleado`,`Sueldo`,`FechaPago`,`Anio`,`Mes`,`CuentaDeposito`,`Banco`) VALUES (17,3,48510.00,'2021-12-05',2021,'Diciembre',66666666669,'HSBC');
INSERT INTO FactNomina (`IdNomina`,`IdEmpleado`,`Sueldo`,`FechaPago`,`Anio`,`Mes`,`CuentaDeposito`,`Banco`) VALUES (18,4,48510.01,'2021-12-05',2021,'Diciembre',55555555559,'ICBC');
INSERT INTO FactNomina (`IdNomina`,`IdEmpleado`,`Sueldo`,`FechaPago`,`Anio`,`Mes`,`CuentaDeposito`,`Banco`) VALUES (19,5,53299.86,'2021-12-05',2021,'Diciembre',11111111119,'Macro');
INSERT INTO FactNomina (`IdNomina`,`IdEmpleado`,`Sueldo`,`FechaPago`,`Anio`,`Mes`,`CuentaDeposito`,`Banco`) VALUES (20,6,58700.00,'2021-12-05',2021,'Diciembre',33333333339,'Patagonia');
INSERT INTO FactNomina (`IdNomina`,`IdEmpleado`,`Sueldo`,`FechaPago`,`Anio`,`Mes`,`CuentaDeposito`,`Banco`) VALUES (21,7,58700.00,'2021-12-05',2021,'Diciembre',44444444449,'HSBC');
INSERT INTO FactNomina (`IdNomina`,`IdEmpleado`,`Sueldo`,`FechaPago`,`Anio`,`Mes`,`CuentaDeposito`,`Banco`) VALUES (22,8,68700.00,'2021-12-05',2021,'Diciembre',22222222229,'Santander');
INSERT INTO FactNomina (`IdNomina`,`IdEmpleado`,`Sueldo`,`FechaPago`,`Anio`,`Mes`,`CuentaDeposito`,`Banco`) VALUES (23,9,135500.00,'2021-12-05',2021,'Diciembre',99999999999,'Santander');
INSERT INTO FactNomina (`IdNomina`,`IdEmpleado`,`Sueldo`,`FechaPago`,`Anio`,`Mes`,`CuentaDeposito`,`Banco`) VALUES (24,10,135500.00,'2021-12-05',2021,'Diciembre',12121212129,'Galicia');
INSERT INTO FactNomina (`IdNomina`,`IdEmpleado`,`Sueldo`,`FechaPago`,`Anio`,`Mes`,`CuentaDeposito`,`Banco`) VALUES (25,11,71050.00,'2021-12-05',2021,'Diciembre',23232323239,'Macro');
INSERT INTO FactNomina (`IdNomina`,`IdEmpleado`,`Sueldo`,`FechaPago`,`Anio`,`Mes`,`CuentaDeposito`,`Banco`) VALUES (26,12,88600.00,'2021-12-05',2021,'Diciembre',34343434349,'BBVA');
INSERT INTO FactNomina (`IdNomina`,`IdEmpleado`,`Sueldo`,`FechaPago`,`Anio`,`Mes`,`CuentaDeposito`,`Banco`) VALUES (27,13,53000.00,'2021-12-05',2021,'Diciembre',56565656569,'BBVA');
INSERT INTO FactNomina (`IdNomina`,`IdEmpleado`,`Sueldo`,`FechaPago`,`Anio`,`Mes`,`CuentaDeposito`,`Banco`) VALUES (28,14,81000.00,'2021-12-05',2021,'Diciembre',76767676679,'Naranja');

INSERT INTO DimRepresentantes (`IdRepresentante`,`NombreMadre`,`NombrePadre`,`DNIMadre`,`DNIPadre`,`ProfesionMadre`,`ProfesionPadre`,`CorreoMadre`,`CorreoPadre`,`DireccionVivienda`,`LugarTrabajoMadre`,`LugarTrabajoPadre`) VALUES (1,'Laura Torres','Jose Linares',30505828,32674947,'Doctora','Mecanico','laura23@gmail.com',NULL,'Palermo 234 CABA','Hospital Italiano','Caballito Rivadavia 2333 CABA');
INSERT INTO DimRepresentantes (`IdRepresentante`,`NombreMadre`,`NombrePadre`,`DNIMadre`,`DNIPadre`,`ProfesionMadre`,`ProfesionPadre`,`CorreoMadre`,`CorreoPadre`,`DireccionVivienda`,`LugarTrabajoMadre`,`LugarTrabajoPadre`) VALUES (2,'Cecilia Rodriguez','Rodolfo Rangel',35565848,35829572,'Profesora','Ingeniero','ceciro@gmail.com','rodo@gmail.com','Julian A 1988 CABA','Colegio Independencia','Mercado Libre');
INSERT INTO DimRepresentantes (`IdRepresentante`,`NombreMadre`,`NombrePadre`,`DNIMadre`,`DNIPadre`,`ProfesionMadre`,`ProfesionPadre`,`CorreoMadre`,`CorreoPadre`,`DireccionVivienda`,`LugarTrabajoMadre`,`LugarTrabajoPadre`) VALUES (3,'Maria Tintero','Cesar Teran',32035498,45395297,'Ingeniera ','Doctor','maritintero@gmail.com','cesarto@gmail.com','Rivadavia 35 CABA','Accenture','Clinica San Jose');
INSERT INTO DimRepresentantes (`IdRepresentante`,`NombreMadre`,`NombrePadre`,`DNIMadre`,`DNIPadre`,`ProfesionMadre`,`ProfesionPadre`,`CorreoMadre`,`CorreoPadre`,`DireccionVivienda`,`LugarTrabajoMadre`,`LugarTrabajoPadre`) VALUES (4,'Andrea Soto','Francisco Miranda',55782756,54928503,'Profesora','Abogado','andto@gmail.com','miranda@gmail.com','Venezuela 544 CABA','Colegio MariaLourdes','Abogados360');
INSERT INTO DimRepresentantes (`IdRepresentante`,`NombreMadre`,`NombrePadre`,`DNIMadre`,`DNIPadre`,`ProfesionMadre`,`ProfesionPadre`,`CorreoMadre`,`CorreoPadre`,`DireccionVivienda`,`LugarTrabajoMadre`,`LugarTrabajoPadre`) VALUES (5,'Estefany Gonzalez','Gonzalo Gutierrez',45392759,42395829,'Abogada','Abogado','tefagon34@gmail.com','gonzagonz@gmail.com','Santa Fe 2222 CABA','Hermanos Asociados','Atencion legal CABA');
INSERT INTO DimRepresentantes (`IdRepresentante`,`NombreMadre`,`NombrePadre`,`DNIMadre`,`DNIPadre`,`ProfesionMadre`,`ProfesionPadre`,`CorreoMadre`,`CorreoPadre`,`DireccionVivienda`,`LugarTrabajoMadre`,`LugarTrabajoPadre`) VALUES (6,'Laura Fernandez','Wilfredo Perez',29534760,30929238,'Enfermera','Doctor','lalafe@gmail.com','wilfr@gmail.com','Honduras 245 CABA','Hospital Rivadavia','Hospital Italiano');
INSERT INTO DimRepresentantes (`IdRepresentante`,`NombreMadre`,`NombrePadre`,`DNIMadre`,`DNIPadre`,`ProfesionMadre`,`ProfesionPadre`,`CorreoMadre`,`CorreoPadre`,`DireccionVivienda`,`LugarTrabajoMadre`,`LugarTrabajoPadre`) VALUES (7,'Marisa Gutierrez','Ricardo Montaner',37850245,36593056,'Doctora','Mecanico','marisa1999@gmail.com','kkferl@gmail.com','Belgrano 345 CABA','Hominis','Renault 345 CABA');
INSERT INTO DimRepresentantes (`IdRepresentante`,`NombreMadre`,`NombrePadre`,`DNIMadre`,`DNIPadre`,`ProfesionMadre`,`ProfesionPadre`,`CorreoMadre`,`CorreoPadre`,`DireccionVivienda`,`LugarTrabajoMadre`,`LugarTrabajoPadre`) VALUES (8,'Daniela Rodriguez','Kell Fernandez',30491848,31094857,'Ingeniera ','Chofer','danirodri@gmail.com','osw@gmail.com','Palermo 4555 CABA','Mercado Libre','Cabify');
INSERT INTO DimRepresentantes (`IdRepresentante`,`NombreMadre`,`NombrePadre`,`DNIMadre`,`DNIPadre`,`ProfesionMadre`,`ProfesionPadre`,`CorreoMadre`,`CorreoPadre`,`DireccionVivienda`,`LugarTrabajoMadre`,`LugarTrabajoPadre`) VALUES (9,'Maria Marchena','Oswaldo Duval',45545989,43857927,'Vendedora','Encargado','marchena4@gmail.com','duvalos@gmail.com','Colon 565 CABA','Alto Palermo','Hells Pizza');
INSERT INTO DimRepresentantes (`IdRepresentante`,`NombreMadre`,`NombrePadre`,`DNIMadre`,`DNIPadre`,`ProfesionMadre`,`ProfesionPadre`,`CorreoMadre`,`CorreoPadre`,`DireccionVivienda`,`LugarTrabajoMadre`,`LugarTrabajoPadre`) VALUES (10,'Valentina Tillero','Ricardo Leon',56878927,56929458,'Ingeniera ','Ingeniero','valentinatille@gmail.com','leonricardo@gmail.com','Loyola 256 CABA','Accenture','Accenture');
INSERT INTO DimRepresentantes (`IdRepresentante`,`NombreMadre`,`NombrePadre`,`DNIMadre`,`DNIPadre`,`ProfesionMadre`,`ProfesionPadre`,`CorreoMadre`,`CorreoPadre`,`DireccionVivienda`,`LugarTrabajoMadre`,`LugarTrabajoPadre`) VALUES (11,'Angelica Fuentes','Gabriel Phyllis ',39666824,48496737,'Ingeniera ','Ingeniero',NULL,NULL,'Lavalleja 2510 CABA','Litora Torquent LLC','Libero Integer PC');
INSERT INTO DimRepresentantes (`IdRepresentante`,`NombreMadre`,`NombrePadre`,`DNIMadre`,`DNIPadre`,`ProfesionMadre`,`ProfesionPadre`,`CorreoMadre`,`CorreoPadre`,`DireccionVivienda`,`LugarTrabajoMadre`,`LugarTrabajoPadre`) VALUES (12,'Risa Newman','Hedley Hawkins',21556536,29401635,'Abogada','Ingeniero',NULL,'risi@gmail.com','Valle 200 CABA','Tristique Asociados','Penatibus PC');
INSERT INTO DimRepresentantes (`IdRepresentante`,`NombreMadre`,`NombrePadre`,`DNIMadre`,`DNIPadre`,`ProfesionMadre`,`ProfesionPadre`,`CorreoMadre`,`CorreoPadre`,`DireccionVivienda`,`LugarTrabajoMadre`,`LugarTrabajoPadre`) VALUES (13,'Gloria Martina','Victor Morales',42892493,49369889,'Vendedora','Comerciante',NULL,'glr@gmail.com','Echeverria 1200 CABA','Mollis Dui LLC','Duis At LLC');
INSERT INTO DimRepresentantes (`IdRepresentante`,`NombreMadre`,`NombrePadre`,`DNIMadre`,`DNIPadre`,`ProfesionMadre`,`ProfesionPadre`,`CorreoMadre`,`CorreoPadre`,`DireccionVivienda`,`LugarTrabajoMadre`,`LugarTrabajoPadre`) VALUES (14,'Ann Isabella','no tiene',23829399,NULL,'Analista',NULL,'an@gmail.com',NULL,'Gascon 1500 CABA','Lectus Corp.',NULL);
INSERT INTO DimRepresentantes (`IdRepresentante`,`NombreMadre`,`NombrePadre`,`DNIMadre`,`DNIPadre`,`ProfesionMadre`,`ProfesionPadre`,`CorreoMadre`,`CorreoPadre`,`DireccionVivienda`,`LugarTrabajoMadre`,`LugarTrabajoPadre`) VALUES (15,'Camila Garrett ','Vernon Diaz',30727203,47682129,'Economista','Telefonista',NULL,'ve@gmail.com','Rivadavia 345 CABA','Telefonica','Telefonica');
INSERT INTO DimRepresentantes (`IdRepresentante`,`NombreMadre`,`NombrePadre`,`DNIMadre`,`DNIPadre`,`ProfesionMadre`,`ProfesionPadre`,`CorreoMadre`,`CorreoPadre`,`DireccionVivienda`,`LugarTrabajoMadre`,`LugarTrabajoPadre`) VALUES (16,'no tiene','Luis Inez ',NULL,49113665,NULL,'Economista',NULL,'lus@gmail.com','Mario Bravo 1110 CABA',NULL,'Galicia');
INSERT INTO DimRepresentantes (`IdRepresentante`,`NombreMadre`,`NombrePadre`,`DNIMadre`,`DNIPadre`,`ProfesionMadre`,`ProfesionPadre`,`CorreoMadre`,`CorreoPadre`,`DireccionVivienda`,`LugarTrabajoMadre`,`LugarTrabajoPadre`) VALUES (17,'Norman Silva','Len Torres',27887446,18994961,'Ambiental','Ingeniero','ja@gmail.com',NULL,'Scalabrini Ortiz 2500 CABA','Jardin Japones','Consultora EY');
INSERT INTO DimRepresentantes (`IdRepresentante`,`NombreMadre`,`NombrePadre`,`DNIMadre`,`DNIPadre`,`ProfesionMadre`,`ProfesionPadre`,`CorreoMadre`,`CorreoPadre`,`DireccionVivienda`,`LugarTrabajoMadre`,`LugarTrabajoPadre`) VALUES (18,'Sandra Pascal','no tiene',50489875,39258573,'Jardinera','Mesero','hag@gmail.com',NULL,'Aguirre 100 CABA','Jardin Botanico','La Clotilde');
INSERT INTO DimRepresentantes (`IdRepresentante`,`NombreMadre`,`NombrePadre`,`DNIMadre`,`DNIPadre`,`ProfesionMadre`,`ProfesionPadre`,`CorreoMadre`,`CorreoPadre`,`DireccionVivienda`,`LugarTrabajoMadre`,`LugarTrabajoPadre`) VALUES (19,'Keelie Soto','Erich Garcia',35595348,36114212,'Chef','Profesor','rg@gmail.com',NULL,'Juan B Justo 1100 CABA','Hard Rock','Colegio Maria Auxiliadora');
INSERT INTO DimRepresentantes (`IdRepresentante`,`NombreMadre`,`NombrePadre`,`DNIMadre`,`DNIPadre`,`ProfesionMadre`,`ProfesionPadre`,`CorreoMadre`,`CorreoPadre`,`DireccionVivienda`,`LugarTrabajoMadre`,`LugarTrabajoPadre`) VALUES (20,'Catalina Keefe ',' Juan Lucius',17469452,42171944,'Masajista','Profesor','tgv@gmail.com',NULL,'Soler 502 CABA','Espacio Glam','Colegio Maria Auxiliadora');
INSERT INTO DimRepresentantes (`IdRepresentante`,`NombreMadre`,`NombrePadre`,`DNIMadre`,`DNIPadre`,`ProfesionMadre`,`ProfesionPadre`,`CorreoMadre`,`CorreoPadre`,`DireccionVivienda`,`LugarTrabajoMadre`,`LugarTrabajoPadre`) VALUES (21,'Valeria Echeverria','Gonzalo Zapata',23333333,43333333,'Doctora','Doctor','doct@gmail.com',NULL,'Guatemala 5500 CABA','Hospital Britanico','Clinica San Jose');
INSERT INTO DimRepresentantes (`IdRepresentante`,`NombreMadre`,`NombrePadre`,`DNIMadre`,`DNIPadre`,`ProfesionMadre`,`ProfesionPadre`,`CorreoMadre`,`CorreoPadre`,`DireccionVivienda`,`LugarTrabajoMadre`,`LugarTrabajoPadre`) VALUES (22,'Nancy Jimenez','Jesus Sirverg',77777777,55555555,'Coordinadora Eventos','Freelance',NULL,NULL,'Honduras 4500 CABA','Eventos Loyola',NULL);

INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (1,'Edgar ','Amaya ',56938503,11,'ed@gmail.com','Rivadavia 35 CABA','2020-07-21','2021-11-28',3,1);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (2,'Aaron','Arenas ',56938504,11,'ar@gmail.com','Venezuela 544 CABA','2020-07-22',NULL,4,1);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (3,'Marcos','Carrasco ',56938505,11,NULL,'Santa Fe 2222 CABA','2020-07-23',NULL,5,1);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (4,'Luis Alejandro','Cianci ',56938506,11,NULL,'Honduras 245 CABA','2020-07-24',NULL,6,1);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (5,'Valeri','Rodriguez',56938507,11,NULL,'Belgrano 345 CABA','2020-07-25',NULL,7,2);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (6,'Sofia ','Santeliz ',56938508,12,NULL,'Palermo 4555 CABA','2020-07-26',NULL,8,2);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (7,'Maria ','Sira ',56938509,11,NULL,'Colon 565 CABA','2020-07-27',NULL,9,2);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (8,'Esther ','Rodriguez',56938510,11,NULL,'Loyola 256 CABA','2020-07-28',NULL,10,2);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (9,'Marcello',' Giovanni ',56938511,12,NULL,'Lavalleja 2510 CABA','2020-07-29',NULL,11,2);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (10,'Enrique','Sosa',56938512,12,NULL,'Valle 200 CABA','2020-07-30',NULL,12,3);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (11,'Valentina','Guerra',56938513,12,'valen@gmail.com','Echeverria 1200 CABA','2020-07-31',NULL,13,3);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (12,'Jose','Hernandez',56938514,12,'josejose@gmail.com','Gascon 1500 CABA','2020-08-01',NULL,14,3);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (13,'Katerine','Marcano ',56938515,11,NULL,'Rivadavia 345 CABA','2020-08-02',NULL,15,3);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (14,'Gabriela','Lopez',56938516,11,NULL,'Mario Bravo 1110 CABA','2020-08-03',NULL,16,4);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (15,'Fabiana Gabriela','Castillo ',56938517,11,NULL,'Scalabrini Ortiz 2500 CABA','2020-08-04',NULL,17,4);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (16,'Valeria','Gimenez',56938518,11,NULL,'Aguirre 100 CABA','2020-08-05',NULL,18,4);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (17,' Isaac','Rujano',56938519,11,NULL,'Juan B Justo 1100 CABA','2020-08-06',NULL,19,4);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (18,'Daniela','Torres',56938520,11,NULL,'Soler 502 CABA','2020-08-07',NULL,20,4);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (19,' Alejando','Pacheco',56938521,11,NULL,'Guatemala 5500 CABA','2020-08-08',NULL,21,5);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (20,'Maira Alejandra','Amaya ',56938522,11,NULL,'Honduras 4500 CABA','2020-08-09',NULL,3,5);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (21,'Carlos Augusto','Alvarez ',56938523,11,NULL,'Palermo 234 CABA','2020-08-10',NULL,1,5);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (22,'Sandra','Barilot',56938524,11,NULL,'Julian A 1988 CABA','2020-08-11',NULL,2,5);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (23,'Luis','Mendez ',56938525,11,NULL,'Rivadavia 35 CABA','2020-08-12',NULL,3,6);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (24,'Manuel','Gonzalez',56938526,11,NULL,'Venezuela 544 CABA','2020-08-13',NULL,4,6);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (25,'Leonardo','Torres',56938527,11,NULL,'Colon 565 CABA','2020-08-14',NULL,20,6);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (26,'Fernanda','Vargas',56938528,12,NULL,'Loyola 256 CABA','2020-08-15',NULL,18,6);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (27,'Danniela','Yepez',56938529,12,NULL,'Lavalleja 2510 CABA','2020-08-16',NULL,19,6);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (28,'Andres','Castillo ',56938530,12,NULL,'Valle 200 CABA','2020-08-17',NULL,15,7);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (29,'Mario','Rodriguez',56938531,11,NULL,'Echeverria 1200 CABA','2020-08-18',NULL,4,7);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (30,'Sofia ','Torres',56938532,12,NULL,'Gascon 1500 CABA','2020-08-19',NULL,5,7);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (31,'Valentina','Gonzalez',56938533,11,NULL,'Rivadavia 345 CABA','2020-08-20',NULL,6,7);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (32,'Alejandra','Colmenarez',56938534,11,NULL,'Mario Bravo 1110 CABA','2020-08-21',NULL,7,7);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (33,'Luis','Cordero',56938535,11,NULL,'Scalabrini Ortiz 2500 CABA','2020-08-22',NULL,8,7);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (34,'Gabriela','Palacio',56938536,11,NULL,'Aguirre 100 CABA','2020-08-23',NULL,9,8);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (35,'Gaston','Papaleo',56938537,11,NULL,'Juan B Justo 1100 CABA','2020-08-24',NULL,10,8);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (36,'Amanda','Yepez',56938538,11,NULL,'Soler 502 CABA','2020-08-25',NULL,11,8);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (37,'Natalia','Garcia',56938539,11,NULL,'Mario Bravo 1110 CABA','2020-08-26',NULL,12,8);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (38,'Javier','Castillo ',56938540,11,NULL,'Venezuela 544 CABA','2020-08-26',NULL,17,9);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (39,'Samuel','Gimenez',56938541,11,NULL,'Colon 565 CABA','2020-08-27',NULL,18,9);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (40,'Naomi','Rujano',56938542,11,NULL,'Loyola 256 CABA','2020-08-28',NULL,19,9);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (41,'Pedro','Torres',56938543,11,NULL,'Lavalleja 2510 CABA','2020-08-29',NULL,20,9);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (42,'Avril','Pacheco',56938544,11,NULL,'Valle 200 CABA','2020-08-30',NULL,21,9);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (43,'Marcela','Amaya ',56938545,11,NULL,'Echeverria 1200 CABA','2020-08-31',NULL,3,10);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (44,'Daniel ','Alvarez ',56938546,11,NULL,'Gascon 1500 CABA','2020-08-07',NULL,1,10);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (45,'Alejandro','Barilot',56938547,11,NULL,'Rivadavia 345 CABA','2020-08-08',NULL,2,10);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (46,'David','Mendez ',56938548,11,NULL,'Mario Bravo 1110 CABA','2020-08-09',NULL,3,10);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (47,'Andres','Gonzalez',56938549,11,NULL,'Scalabrini Ortiz 2500 CABA','2020-08-10',NULL,4,10);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (48,'Eduardo','Torres',56938550,11,NULL,'Aguirre 100 CABA','2020-08-11',NULL,20,10);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (49,'Antonella','Palacio',56938551,11,NULL,'Juan B Justo 1100 CABA','2020-08-12',NULL,9,10);
INSERT INTO DimAlumnos (`IdAlumno`,`Nombre`,`Apellido`,`DNI`,`Edad`,`Correo`,`Direccion`,`FechaIngreso`,`FechaEgreso`,`IdRepresentante`,`IdSeccion`) VALUES (50,'Samuel','Papaleo',56938552,11,NULL,'Soler 502 CABA','2020-08-13',NULL,10,10);

INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (1,2021,1,1,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (2,2021,1,2,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (3,2021,1,3,1,9);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (4,2021,1,4,1,7);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (5,2021,1,5,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (6,2021,1,6,1,8);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (7,2021,1,7,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (8,2021,1,8,1,6);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (9,2021,1,9,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (10,2021,2,1,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (11,2021,2,2,1,9);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (12,2021,2,3,1,7);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (13,2021,2,4,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (14,2021,2,5,1,8);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (15,2021,2,6,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (16,2021,2,7,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (17,2021,2,8,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (18,2021,2,9,1,9);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (19,2021,3,1,1,7);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (20,2021,3,2,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (21,2021,3,3,1,8);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (22,2021,3,4,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (23,2021,3,5,1,6);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (24,2021,3,6,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (25,2021,3,7,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (26,2021,3,8,1,9);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (27,2021,3,9,1,7);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (28,2021,4,1,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (29,2021,4,2,1,8);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (30,2021,4,3,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (31,2021,4,4,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (32,2021,4,5,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (33,2021,4,6,1,9);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (34,2021,4,7,1,7);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (35,2021,4,8,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (36,2021,4,9,1,8);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (37,2021,5,1,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (38,2021,5,2,1,6);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (39,2021,5,3,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (40,2021,5,4,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (41,2021,5,5,1,9);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (42,2021,5,6,1,7);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (43,2021,5,7,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (44,2021,5,8,1,8);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (45,2021,5,9,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (46,2021,6,1,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (47,2021,6,2,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (48,2021,6,3,1,9);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (49,2021,6,4,1,7);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (50,2021,6,5,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (51,2021,6,6,1,8);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (52,2021,6,7,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (53,2021,6,8,1,6);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (54,2021,6,9,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (55,2021,7,1,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (56,2021,7,2,1,9);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (57,2021,7,3,1,7);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (58,2021,7,4,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (59,2021,7,5,1,8);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (60,2021,7,6,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (61,2021,7,7,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (62,2021,7,8,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (63,2021,7,9,1,9);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (64,2021,8,1,1,7);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (65,2021,8,2,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (66,2021,8,3,1,8);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (67,2021,8,4,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (68,2021,8,5,1,6);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (69,2021,8,6,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (70,2021,8,7,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (71,2021,8,8,1,9);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (72,2021,8,9,1,7);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (73,2021,9,1,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (74,2021,9,2,1,8);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (75,2021,9,3,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (76,2021,9,4,1,7);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (77,2021,9,5,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (78,2021,9,6,1,8);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (79,2021,9,7,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (80,2021,9,8,1,6);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (81,2021,9,9,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (82,2021,10,1,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (83,2021,10,2,1,9);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (84,2021,10,3,1,7);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (85,2021,10,4,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (86,2021,10,5,1,8);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (87,2021,10,6,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (88,2021,10,7,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (89,2021,10,8,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (90,2021,10,9,1,9);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (91,2021,11,1,1,7);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (92,2021,11,2,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (93,2021,11,3,1,8);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (94,2021,11,4,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (95,2021,11,5,1,6);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (96,2021,11,6,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (97,2021,11,7,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (98,2021,11,8,1,9);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (99,2021,11,9,1,7);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (100,2021,12,1,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (101,2021,12,2,1,8);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (102,2021,12,3,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (103,2021,12,4,1,7);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (104,2021,12,5,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (105,2021,12,6,1,8);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (106,2021,12,7,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (107,2021,12,8,1,6);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (108,2021,12,9,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (109,2021,13,1,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (110,2021,13,2,1,9);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (111,2021,13,3,1,7);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (112,2021,13,4,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (113,2021,13,5,1,8);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (114,2021,13,6,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (115,2021,13,7,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (116,2021,13,8,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (117,2021,13,9,1,9);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (118,2021,14,1,1,7);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (119,2021,14,2,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (120,2021,14,3,1,8);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (121,2021,14,4,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (122,2021,14,5,1,6);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (123,2021,14,6,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (124,2021,14,7,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (125,2021,14,8,1,9);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (126,2021,14,9,1,7);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (127,2021,15,1,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (128,2021,15,2,1,8);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (129,2021,15,3,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (130,2021,15,4,1,7);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (131,2021,15,5,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (132,2021,15,6,1,8);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (133,2021,15,7,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (134,2021,15,8,1,6);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (135,2021,15,9,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (136,2021,16,1,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (137,2021,16,2,1,9);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (138,2021,16,3,1,7);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (139,2021,16,4,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (140,2021,16,5,1,8);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (141,2021,16,6,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (142,2021,16,7,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (143,2021,16,8,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (144,2021,16,9,1,9);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (145,2021,17,1,1,7);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (146,2021,17,2,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (147,2021,17,3,1,8);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (148,2021,17,4,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (149,2021,17,5,1,6);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (150,2021,17,6,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (151,2021,17,7,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (152,2021,17,8,1,9);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (153,2021,17,9,1,7);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (154,2021,18,1,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (155,2021,18,2,1,8);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (156,2021,18,3,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (157,2021,18,4,1,7);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (158,2021,18,5,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (159,2021,18,6,1,8);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (160,2021,18,7,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (161,2021,18,8,1,6);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (162,2021,18,9,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (163,2021,19,1,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (164,2021,19,2,1,9);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (165,2021,19,3,1,7);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (166,2021,19,4,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (167,2021,19,5,1,8);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (168,2021,19,6,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (169,2021,19,7,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (170,2021,19,8,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (171,2021,19,9,1,9);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (172,2021,20,1,1,7);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (173,2021,20,2,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (174,2021,20,3,1,8);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (175,2021,20,4,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (176,2021,20,5,1,6);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (177,2021,20,6,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (178,2021,20,7,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (179,2021,20,8,1,9);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (180,2021,20,9,1,7);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (181,2021,21,1,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (182,2021,21,2,1,8);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (183,2021,21,3,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (184,2021,21,4,1,7);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (185,2021,21,5,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (186,2021,21,6,1,8);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (187,2021,21,7,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (188,2021,21,8,1,6);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (189,2021,21,9,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (190,2021,22,1,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (191,2021,22,2,1,9);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (192,2021,22,3,1,7);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (193,2021,22,4,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (194,2021,22,5,1,8);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (195,2021,22,6,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (196,2021,22,7,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (197,2021,22,8,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (198,2021,22,9,1,9);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (199,2021,23,1,1,7);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (200,2021,23,2,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (201,2021,23,3,1,8);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (202,2021,23,4,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (203,2021,23,5,1,6);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (204,2021,23,6,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (205,2021,23,7,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (206,2021,23,8,1,9);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (207,2021,23,9,1,7);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (208,2021,24,1,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (209,2021,24,2,1,8);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (210,2021,24,3,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (211,2021,24,4,1,5);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (212,2021,24,5,1,3);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (213,2021,24,6,1,10);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (214,2021,24,7,1,6);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (215,2021,24,8,1,7);
INSERT INTO FactRegistroNotas (`IdNotaFinal`,`Anio`,`IdAlumno`,`IdMateria`,`Lapso`,`NotaLapso`) VALUES (216,2021,24,9,1,8);

INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (1,1,'2021-11-05',2021,'Noviembre',20000.00,'Efectivo',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (2,2,'2021-11-06',2021,'Noviembre',20000.00,'Efectivo',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (3,3,'2021-11-07',2021,'Noviembre',20000.00,'Efectivo',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (4,4,'2021-11-08',2021,'Noviembre',20000.00,'Efectivo',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (5,5,'2021-11-09',2021,'Noviembre',19000.00,'Efectivo',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (6,6,'2021-11-10',2021,'Noviembre',20000.00,'Efectivo',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (7,7,'2021-11-11',2021,'Noviembre',20000.00,'Efectivo',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (8,8,'2021-11-12',2021,'Noviembre',20000.00,'Efectivo',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (9,9,'2021-11-13',2021,'Noviembre',20000.00,'Efectivo',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (10,10,'2021-11-14',2021,'Noviembre',20000.00,'Efectivo',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (11,11,'2021-11-15',2021,'Noviembre',20000.00,'Efectivo',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (12,12,'2021-11-16',2021,'Noviembre',18000.00,'Efectivo',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (13,13,'2021-11-17',2021,'Noviembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (14,14,'2021-11-18',2021,'Noviembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (15,15,'2021-11-19',2021,'Noviembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (16,16,'2021-11-20',2021,'Noviembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (17,17,'2021-11-21',2021,'Noviembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (18,18,'2021-11-22',2021,'Noviembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (19,19,'2021-11-23',2021,'Noviembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (20,20,'2021-11-24',2021,'Noviembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (21,21,'2021-11-25',2021,'Noviembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (22,22,'2021-11-26',2021,'Noviembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (23,23,'2021-11-27',2021,'Noviembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (24,24,'2021-11-28',2021,'Noviembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (25,25,'2021-11-29',2021,'Noviembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (26,26,'2021-11-30',2021,'Noviembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (27,27,'2021-12-01',2021,'Diciembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (28,28,'2021-12-02',2021,'Diciembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (29,29,'2021-12-03',2021,'Diciembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (30,30,'2021-12-04',2021,'Diciembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (31,31,'2021-12-05',2021,'Diciembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (32,32,'2021-12-06',2021,'Diciembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (33,33,'2021-12-07',2021,'Diciembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (34,34,'2021-12-08',2021,'Diciembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (35,35,'2021-12-09',2021,'Diciembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (36,36,'2021-12-10',2021,'Diciembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (37,37,'2021-12-11',2021,'Diciembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (38,38,'2021-12-12',2021,'Diciembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (39,39,'2021-12-13',2021,'Diciembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (40,40,'2021-12-14',2021,'Diciembre',30000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (41,41,'2021-12-15',2021,'Diciembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (42,42,'2021-12-16',2021,'Diciembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (43,43,'2021-12-17',2021,'Diciembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (44,44,'2021-12-18',2021,'Diciembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (45,45,'2021-12-19',2021,'Diciembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (46,46,'2021-12-20',2021,'Diciembre',15000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (47,47,'2021-12-21',2021,'Diciembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (48,48,'2021-12-22',2021,'Diciembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (49,49,'2021-12-23',2021,'Diciembre',20000.00,'Tarjeta ',1);
INSERT INTO FactMensualidad (`idIngreso`,`IdAlumno`,`FechaPago`,`Anio`,`Mes`,`Deposito`,`MedioPago`,`EstadoPago`) VALUES (50,50,'2021-12-24',2021,'Diciembre',0.00,'',0);

CREATE VIEW alumnos_aplazados AS
SELECT IdAlumno, IdMateria, NotaLapso
FROM FactRegistroNotas
WHERE NotaLapso < 6;

CREATE VIEW EmpleadosProximosAJubilar AS
SELECT IdEmpleado, FechaIngreso, Edad
FROM DimEmpleados
WHERE Edad > 50;

CREATE VIEW AlumnoPorRepresentante AS
SELECT 
	DimAlumnos.IdAlumno,
    DimRepresentantes.IdRepresentante
FROM
DimRepresentantes
JOIN DimAlumnos
ON
DimAlumnos.IdRepresentante = DimRepresentantes.IdRepresentante;
	
CREATE VIEW Deudores AS
SELECT IdAlumno, Mes, Anio, EstadoPago
FROM FactMensualidad
WHERE EstadoPago = 0;

CREATE VIEW OrganigramaDirectivos AS
SELECT IdEmpleado, Cargo
FROM DimEmpleados
WHERE Cargo LIKE 'Director%'; 

-- Creacion de Stored para ordenar la tabla de alumnos por el campo que se desee 
DELIMITER //
CREATE PROCEDURE `ordenar_alumnos`(IN campo VARCHAR(255), IN tipo_ordenamiento VARCHAR(255))
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
END//
DEMILITER;

-- Creación de stored para insertar valor nuevo en empleados y también eliminar por Id del empleado
DELIMITER //
CREATE PROCEDURE `eliminar y agregar valores en dimempleados`(IN IdEmpleado INT)
BEGIN
INSERT INTO colegio_pablo_neruda.dimepleados (Nombre, Apellido, DNI, Edad, Correo, Telefono, Direccion, EstadoCivil, Cargo, FechaIngreso, FechaEgreso)
VALUES ('Ana', 'Soledad', 96545263, 26, 'anasole@gmail.com', 1154896578, 'Lavalleja 105', 'Soltera', 'Secretaria Control Estudio', 2021-11-14, NULL);
DELETE FROM colegio_pablo_neruda.dimepleados
WHERE IdEmpleado = IdEmpleado;
END//
DELIMITER ;

-- Se crea tabla de movimientos para registrar despues del pago la auditoria de movimiento de pagos, tener registro de quién hizo el pago, día, monto:
CREATE TABLE colegio_pablo_neruda.Movimiento_Nomina(
				IdMovimiento INT AUTO_INCREMENT PRIMARY KEY,
                Fecha DATE NOT NULL,
                Hora VARCHAR(255) NOT NULL,
                Usuario_Id VARCHAR(255),
                IdNomina INT,
                IdEmpleado INT, 
                Sueldo DECIMAL(10,2),
                Tipo_Operacion VARCHAR(255));
	USE colegio_pablo_neruda;
	CREATE TRIGGER `Aft_Ins_FactNomina`
    AFTER INSERT ON `FactNomina` FOR EACH ROW
    INSERT INTO `Movimiento_Nomina` (Fecha, Hora, Usuario_Id, IdNomina, IdEmpleado, Sueldo, Tipo_Operacion)
    VALUES (CURDATE(), CURTIME(), USER(), NEW.IdNomina, NEW.IdEmpleado, NEW.Sueldo, 'INSERT');
    INSERT INTO FactNomina(IdEmpleado, Sueldo, FechaPago, Anio, Mes, CuentaDeposito, Banco)
    VALUES(13, 53000.00, '2021-10-05', 2021, 'Octubre', 56565656569, 'BBVA');
    
-- Se crea trigger para capturar antes si se realizó actualizaciones en la nomina  de los empleados en su registro de pago:                
CREATE TRIGGER `Bef_Update_FactNomina`
BEFORE UPDATE ON `FactNomina` FOR EACH ROW
INSERT INTO `Movimiento_Nomina` (Fecha, Hora, Usuario_Id, IdNomina, IdEmpleado, Sueldo, Tipo_Operacion)
VALUES (CURDATE(), CURTIME(), USER(), NEW.IdNomina, NEW.IdEmpleado, NEW.Sueldo, 'UPDATE');

UPDATE FactNomina
SET Banco = 'Galicia'
WHERE IdNomina = 29;

-- Se crea tabla de movimiento para registrar después de cada recepcion de pagos en una tabla nueva para el registro y monitoreo de los directivos:
CREATE TABLE colegio_pablo_neruda.RecepcionPagos(
				IdRecepcion INT AUTO_INCREMENT PRIMARY KEY,
                Fecha DATE NOT NULL,
                Hora VARCHAR(255) NOT NULL,
                Usuario_Id VARCHAR(255),
                IdIngreso INT, 
                Deposito DECIMAL(10,2),
                Tipo_Operacion VARCHAR(255));
	USE colegio_pablo_neruda;
	CREATE TRIGGER `Aft_Ins_FactMensualidad`
    AFTER INSERT ON `FactMensualidad` FOR EACH ROW
    INSERT INTO `RecepcionPagos` (Fecha, Hora, Usuario_Id, IdIngreso, Deposito, Tipo_Operacion)
    VALUES (CURDATE(), CURTIME(), USER(), NEW.IdIngreso, NEW.Deposito, 'INSERT');
    INSERT INTO FactMensualidad(IdAlumno, FechaPago, Anio, Mes, Deposito, MedioPago, EstadoPago)
    VALUES(5, '2021-12-16', 2021, 'Noviembre', 1000.00, 'Tarjeta', 1);

-- Se crea trigger para actualizar la tabla de recepción de pagos antes de que se registre una actualización en lo registrado en la base dato del registro de mensualidades:
	CREATE TRIGGER `Bef_Upd_FactMensualidad`
    BEFORE UPDATE ON `FactMensualidad` FOR EACH ROW
    INSERT INTO `RecepcionPagos` (Fecha, Hora, Usuario_Id, IdIngreso, Deposito, Tipo_Operacion)
    VALUES (CURDATE(), CURTIME(), USER(), NEW.IdIngreso, NEW.Deposito, 'UPDATE');
    
    UPDATE FactMensualidad
	SET MedioPago = 'Efectivo'
	WHERE IdIngreso = 51;
