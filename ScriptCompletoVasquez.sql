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
                    NotaLapso DECIMAL(2,2) NOT NULL);
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
                    
INSERT INTO DimRepresentantes (`IdRepresentante`,`NombreMadre`,`NombrePadre`,`DNIMadre`,`DNIPadre`,`ProfesionMadre`,`ProfesionPadre`,`CorreoMadre`,`CorreoPadre`,`DireccionVivienda`,`LugarTrabajoMadre`,`LugarTrabajoPadre`) VALUES (1,'Laura Torres','Jose Linares',30505828,32674947,'Doctora','Mecanico','laura23@gmail.com','','Palermo 234 CABA','Hospital Italiano','Caballito Rivadavia 2333 CABA');
INSERT INTO DimRepresentantes (`IdRepresentante`,`NombreMadre`,`NombrePadre`,`DNIMadre`,`DNIPadre`,`ProfesionMadre`,`ProfesionPadre`,`CorreoMadre`,`CorreoPadre`,`DireccionVivienda`,`LugarTrabajoMadre`,`LugarTrabajoPadre`) VALUES (2,'Cecilia Rodriguez','Rodolfo Rangel',35565848,35829572,'Profesora','Ingeniero','ceciro@gmail.com','rodo@gmail.com','Julian A 1988 CABA','Colegio Independencia','Mercado Libre');
INSERT INTO DimRepresentantes (`IdRepresentante`,`NombreMadre`,`NombrePadre`,`DNIMadre`,`DNIPadre`,`ProfesionMadre`,`ProfesionPadre`,`CorreoMadre`,`CorreoPadre`,`DireccionVivienda`,`LugarTrabajoMadre`,`LugarTrabajoPadre`) VALUES (3,'Maria Tintero','Cesar Teran',32035498,45395297,'Ingeniera ','Doctor','maritintero@gmail.com','cesarto@gmail.com','Rivadavia 35 CABA','Accenture','Clinica San Jose');
INSERT INTO DimRepresentantes (`IdRepresentante`,`NombreMadre`,`NombrePadre`,`DNIMadre`,`DNIPadre`,`ProfesionMadre`,`ProfesionPadre`,`CorreoMadre`,`CorreoPadre`,`DireccionVivienda`,`LugarTrabajoMadre`,`LugarTrabajoPadre`) VALUES (4,'Andrea Soto','Francisco Miranda',55782756,54928503,'Profesora','Abogado','andto@gmail.com','miranda@gmail.com','Venezuela 544 CABA','Colegio MariaLourdes','Abogados360');
INSERT INTO DimRepresentantes (`IdRepresentante`,`NombreMadre`,`NombrePadre`,`DNIMadre`,`DNIPadre`,`ProfesionMadre`,`ProfesionPadre`,`CorreoMadre`,`CorreoPadre`,`DireccionVivienda`,`LugarTrabajoMadre`,`LugarTrabajoPadre`) VALUES (5,'Estefany Gonzalez','Gonzalo Gutierrez',45392759,42395829,'Abogada','Abogado','tefagon34@gmail.com','gonzagonz@gmail.com','Santa Fe 2222 CABA','Hermanos Asociados','Atencion legal CABA');
INSERT INTO DimRepresentantes (`IdRepresentante`,`NombreMadre`,`NombrePadre`,`DNIMadre`,`DNIPadre`,`ProfesionMadre`,`ProfesionPadre`,`CorreoMadre`,`CorreoPadre`,`DireccionVivienda`,`LugarTrabajoMadre`,`LugarTrabajoPadre`) VALUES (6,'Laura Fernandez','Wilfredo Perez',29534760,30929238,'Enfermera','Doctor','lalafe@gmail.com','wilfr@gmail.com','Honduras 245 CABA','Hospital Rivadavia','Hospital Italiano');
INSERT INTO DimRepresentantes (`IdRepresentante`,`NombreMadre`,`NombrePadre`,`DNIMadre`,`DNIPadre`,`ProfesionMadre`,`ProfesionPadre`,`CorreoMadre`,`CorreoPadre`,`DireccionVivienda`,`LugarTrabajoMadre`,`LugarTrabajoPadre`) VALUES (7,'Marisa Gutierrez','Ricardo Montaner',37850245,36593056,'Doctora','Mecanico','marisa1999@gmail.com','kkferl@gmail.com','Belgrano 345 CABA','Hominis','Renault 345 CABA');
INSERT INTO DimRepresentantes (`IdRepresentante`,`NombreMadre`,`NombrePadre`,`DNIMadre`,`DNIPadre`,`ProfesionMadre`,`ProfesionPadre`,`CorreoMadre`,`CorreoPadre`,`DireccionVivienda`,`LugarTrabajoMadre`,`LugarTrabajoPadre`) VALUES (8,'Daniela Rodriguez','Kell Fernandez',30491848,31094857,'Ingeniera ','Chofer','danirodri@gmail.com','osw@gmail.com','Palermo 4555 CABA','Mercado Libre','Cabify');
INSERT INTO DimRepresentantes (`IdRepresentante`,`NombreMadre`,`NombrePadre`,`DNIMadre`,`DNIPadre`,`ProfesionMadre`,`ProfesionPadre`,`CorreoMadre`,`CorreoPadre`,`DireccionVivienda`,`LugarTrabajoMadre`,`LugarTrabajoPadre`) VALUES (9,'Maria Marchena','Oswaldo Duval',45545989,43857927,'Vendedora','Encargado','marchena4@gmail.com','duvalos@gmail.com','Colon 565 CABA','Alto Palermo','Hells Pizza');
INSERT INTO DimRepresentantes (`IdRepresentante`,`NombreMadre`,`NombrePadre`,`DNIMadre`,`DNIPadre`,`ProfesionMadre`,`ProfesionPadre`,`CorreoMadre`,`CorreoPadre`,`DireccionVivienda`,`LugarTrabajoMadre`,`LugarTrabajoPadre`) VALUES (10,'Valentina Tillero','Ricardo Leon',56878927,56929458,'Ingeniera ','Ingeniero','valentinatille@gmail.com','leonricardo@gmail.com','Loyola 256 CABA','Accenture','Accenture');

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

