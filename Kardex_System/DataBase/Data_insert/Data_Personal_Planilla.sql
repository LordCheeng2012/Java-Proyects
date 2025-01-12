
/*insercion de datos en mysql*/

INSERT INTO Empleados_Data (Codigo_Personal, Nombres, Apellidos, Edad, Sexo, fecha_nacimiento) VALUES
('MSA458', 'Moises Fabrizio', 'Solis Alvites', 30, 'Masculino', '1993-05-14'),
('AHB723', 'Alejandra Helena', 'Vilma Barrios', 28, 'Femenino', '1995-08-22'),
('MDL814', 'Manuel Daniel', 'Gallagher Rodriguez', 35, 'Masculino', '1988-02-10'),
('LGP974', 'Luis Hector', 'Peralta Gustavo', 40, 'Masculino', '1983-11-05');

/*
mas registros
*/
INSERT INTO Empleados_Data (Codigo_Personal, Nombres, Apellidos, Edad, Sexo, fecha_nacimiento) VALUES
('OPF716', 'Olenka Maria', 'Santillan Valbuena', 29, 'Femenino', '1994-01-15'),
('JNU489', 'Juan Norberto', 'Huaman Estrada', 32, 'Masculino', '1992-04-27'),
('GTR103', 'Gabriel Teodoro', 'Terrones Ramirez', 28, 'Masculino', '1996-07-12'),
('DOH670', 'Daniel Omero', 'Herrera Contreras', 34, 'Masculino', '1990-11-23'),
('TED412', 'Teodoro Pedro', 'Hernandez Marin', 40, 'Masculino', '1984-03-30');


/* insert admins*/

insert into admins (codigo_Personal,User_Name,User_Paswword)
values('MSA458','MoisesSolis@UL.com.pe','901263455');
