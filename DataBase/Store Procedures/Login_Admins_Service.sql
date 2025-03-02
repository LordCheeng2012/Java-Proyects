
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Login_Service`(
    IN USERNAME VARCHAR(200),
    IN U_Password VARCHAR(10)
)
BEGIN
    -- Declarar variables locales al inicio
    DECLARE RESULT int;

    IF USERNAME = '' AND U_Password = '' or isnull(USERNAME) AND isnull(U_Password) THEN
       select Cod_Msg, Type_Message, Title, Message from Message where Cod_Msg ='ERR23';
    ELSE 
        SELECT COUNT(*) INTO RESULT 
        FROM admins
        WHERE 
            User_Name = TRIM(USERNAME) AND 
            User_Paswword = TRIM(U_Password);
        IF RESULT = 0 THEN		
            select Cod_Msg, Type_Message, Title, Message from Message where Cod_Msg ='ERR22';
            
        ELSEIF RESULT = 1 THEN
           
             begin
            declare codigo_adm varchar(30);
            /*
            obtener el codigo del admin
            */
            /*obtener el codigo del usuario*/
            select Codigo_Personal into codigo_adm from 
            admins where User_Name = TRIM(USERNAME) AND 
            User_Paswword = TRIM(U_Password);
            /*intertar con el codigo al registro de sessiones*/
            insert into login_adms (Codigo_Personal,User_Name
            ,User_Paswword,On_Session,off_Session)
            values(codigo_adm,USERNAME,U_Password,NOW(),null);
            /*mandarle como dato adicional el codigo del admin*/
            update message set Data_Add=codigo_adm where Cod_Msg='SUC02';
            
			select Cod_Msg, Type_Message, Title, Message,Data_Add from Message where Cod_Msg ='SUC02';
            end;
       
        END IF;
    END IF; 
END //
DELIMITER ;
