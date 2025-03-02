/*Relaciones de tablas */

/*Empleados Data -> Personal_Planilla
Clave : Codigo_Personal 
Descripcion : Empleados data proporciona toda la informacion base de cada empleado
Relacion : Segun su CODEMP , Indexa toda la asistencia que hay en Personal Planilla
*/

Alter table empleados_data add foreign key (Codigo_Personal) references personal_planilla (Codigo_Personal); 
