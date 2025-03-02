create database if not exists  KARDEX_DB;
/*
BASE DE DATOS KARDEX_DB

Base de datos diseñado para Gestion y Administracion de Asistencia 
para planillas de empleados y control de ingresos y salidas
Nota : Este BD es solo uso Educativo , para implementación real consultar con su Desarrollador
Correspondiente Moises Solis Alvites.

Creado el 15/12/2024 -> fecha de finalizacion -> ...
 
_____________________________________________
crear la bd si no existe ,
Crear las tablas si no existen ,
Crear tabla login y vincular empleados y adm,
Crear la tabla De reporte Mensual,
Crear la tabla de Reporte Semanal
Nota : 
la tabla Empleados Data es el padre de todas las tablas ,debido a que desde el parte el 
codigo de cada personal clasificado entre Adms o Personal Planilla 
*/
 
create table if not exists Empleados_Data (
 Codigo_Personal varchar(10) unique primary key,
 Nombres varchar(100),
 Apellidos varchar(100),
 Edad int ,
 Sexo varchar(20),
 fecha_nacimiento date,
 Carrera varchar(100),
 Foto varchar(250)
)ENGINE =InnoDB;

create table if not exists Asistencia(
Codigo_Personal varchar(10),
Fecha date,
Area varchar(50),
Carrera varchar(50),
Turno varchar(20),
rol varchar(20),
Hora_Ing  datetime,
Sal_Break datetime,
Ret_Brike datetime,
Hora_Sal datetime,
Foreign key (Codigo_Personal) References Empleados_Data(Codigo_Personal)
)ENGINE =InnoDB;


create table if not exists Admins(
Codigo_Personal varchar(20),
User_Name varchar(100),
User_Paswword varchar(50),
Foreign key (Codigo_Personal) references Empleados_Data(Codigo_Personal) 
)ENGINE =InnoDB;
Create table if not exists Login_Adms (
Codigo_Personal varchar(20),
User_Name varchar(100),
User_Paswword varchar(50),
On_Session datetime,
Off_Session datetime,
Foreign key (Codigo_Personal) references Empleados_Data(Codigo_Personal) 
)ENGINE =InnoDB;
create table if not exists Repor_Month(
Año int,
Mes varchar(10),
Cod_Emp varchar(20),
Laborados int,
Faltante int,
Promedio varchar(10),
Categoria varchar(20)
)ENGINE =InnoDB;
create table if not exists Report_Week(
Año int,
Mes varchar(10),
Cod_Emp varchar(20),
Semana int,
Dia varchar(10),
Ingreso time,
Break time,
Salida time
)ENGINE =InnoDB;

/*Tabla Mensajes , para manejar las respuestas al backend de spring boot*/

create table if not exists Message (
Cod_Msg varchar(5) primary key,
Type_Message varchar(20) default null,
Title varchar(50),
Message varchar(100),
Data_add varchar(100)
) ENGINE =InnoDB;

create table if not exists Areas(
ID_Area INT auto_increment primary key,
Area varchar(20) 
)


