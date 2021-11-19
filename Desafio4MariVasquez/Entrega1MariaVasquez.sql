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
                    Grado VARCHAR(4) NOT NULL,
                    Grupo VARCHAR(1) NOT NULL,
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
                    EstadoPago VARCHAR(255) NOT NULL);