DELIMITER //
create procedure Buscar_Empleado (
in Cod_Empleado varchar(10),
in Mes_query Date,
in Area varchar(50),
in Carrera varchar(50)
)
begin

Declare sqlst varchar(500);
Set sqlst ='SELECT * FROM empleados_data WHERE 1=1'; 	
if Cod_Empleado is not null then
	begin
    set sqlst=CONCAT(sqlst," AND Codigo_Personal ='",Cod_Empleado,"'");
    end;
end if;
if Mes_query is not null then
	begin
   set sqlst=CONCAT(sqlst," AND Fecha ='",Mes_query,"'");
    end;
end if;
if Area is not null then
	begin
   set sqlst=CONCAT(sqlst," AND Area ='",Area,"'");
    end;
end if;
if Carrera is not null  then
	begin
  set sqlst=CONCAT(sqlst," AND Carrera ='",Carrera,"'");
    end;
end if;

/*ejecutar la consulta*/
/*select  sqlst;*/
 set @select = sqlst;
Prepare stmt From @select;
execute stmt;
deallocate prepare stmt;

end //
DELIMITER ;