create database if not exists  KARDEX_DB;

/*


BASE DE DATOS KARDEX_DB
_____________________________________________
crear la bd si no existe ,
Crear las tablas si no existen ,
Crear tabla login y vincular empleados y adm

la tabla Empleados Data es el padre de todas las tablas ,debido a que desde el parte el 
codigo de cada personal clasificado entre Adms o Personal Planilla 
*/


 
create table if not exists Empleados_Data (
 Codigo_Personal varchar(10) unique primary key,
 Nombres varchar(100),
 Apellidos varchar(100),
 Edad int ,
 Sexo varchar(20),
 fecha_nacimiento date
);

create table if not exists Personal_Planilla(
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
);


create table if not exists Admins(
Codigo_Personal varchar(20),
User_Name varchar(100),
User_Paswword varchar(50),
Foreign key (Codigo_Personal) references Empleados_Data(Codigo_Personal) 
);
Create table if not exists Login_Adms (
Codigo_Personal varchar(20),
User_Name varchar(100),
User_Paswword varchar(50),
On_Session datetime,
Off_Session datetime,
Foreign key (Codigo_Personal) references Empleados_Data(Codigo_Personal) 
);

