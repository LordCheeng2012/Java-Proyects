/*Procedure para Consulta de Reporte Semanal o Mensual*/
/*
Instrucciones de consumo:
Flujo de consumo (
 Ingresa Tipo de Consulta :
 Mes o Semanal -> indica que tipo de consulta desea realizar 
un reporte mensual sobre un empleado o todos , un reporte Semanal 
sobre un empleado segun el mes de consulta o todos 
)
Parametro Requerido (
Tipo de consulta: indica el tipo de reporte 
)
Parametro Opcionales (
Codigo de empleado : Indica el codigo identificativo del empleado
¡De no especificar un codigo de empleado retornara todos los resultados
segun el mes actual o seleccionado¡
Mes : indica el mes de busqueda del registro
Año : indica el año de consulta 
)
Este es un funcion protegida por : ULTIMATE2012.
*/

// DELIMITER 

Create procedure Reporte_Asistency (
IN Type_Report varchar(20),
IN Code_Emp varchar(20)


)

DELIMITER ;

