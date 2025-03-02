
/*Codigos de error Generales*/
insert into message (Cod_Msg,Type_Message,Title,Message,Data_Add) values("SUC01","Success","Solicitud Existosa","Se ah procesado la solicitud Correctamente",null);
insert into message (Cod_Msg,Type_Message,Title,Message,Data_Add) values("ERR01","Error"," Error en la Solicitud ","Error en la solicitud",null);

/* Mensajes de autenticacion*/
insert into message (Cod_Msg,Type_Message,Title,Message,Data_Add) values("SUC02","Success","ACCESS AUTHORISED","Credenciales Validas",null);
insert into message (Cod_Msg,Type_Message,Title,Message,Data_Add) values("ERR02","Error","NO AUTHORIZED ","CREDENCIALES INVALIDAS",null);
insert into message (Cod_Msg,Type_Message,Title,Message,Data_Add) values("ERR22","Error","NO AUTHORIZED ","CREDENCIALES INEXISTENTES",null);
insert into message (Cod_Msg,Type_Message,Title,Message,Data_Add) values("ERR23","Warning","Datos Vacios ","CREDENCIALES VACIAS",null);


/* Mensajes de Busquedas */
insert into message (Cod_Msg,Type_Message,Title,Message,Data_Add) values("SUC03","Success","SE ENCONTRO RESULTADO","SE HA ENCONTRADO EL RECURSO",null);
insert into message (Cod_Msg,Type_Message,Title,Message,Data_Add) values("ERR03","Error"," NO ENCOTRADO ","Recurso no Existente en BD",null);

select * from message

