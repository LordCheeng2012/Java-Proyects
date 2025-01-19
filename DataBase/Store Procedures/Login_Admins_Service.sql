DELIMITER //

CREATE PROCEDURE Login_Service (
    IN USERNAME VARCHAR(200),
    IN U_Password VARCHAR(10),
    OUT isVerific VARCHAR(20),
    OUT msg VARCHAR(250)
)
BEGIN
    -- Declarar variables locales al inicio
    DECLARE RESULT int;

    IF USERNAME = '' AND U_Password = '' THEN
        SET isVerific = 'FALSE';
        SET msg = 'Credenciales Vacías';
    ELSE 
        SELECT COUNT(*) INTO RESULT 
        FROM admins
        WHERE 
            User_Name = TRIM(USERNAME) AND 
            User_Paswword = TRIM(U_Password);

        
        IF RESULT = 0 THEN
         SELECT 'Se obtuvo 0 resultado';
            SET isVerific = 'FALSE';
            SET msg = 'Usuario y Contraseña Incorrectos o Inexistentes';
        ELSEIF RESULT = 1 THEN
         SELECT 'Se obtuvo 1 resultado';
            SET isVerific = 'TRUE';
            SET msg = 'Accedió al Sistema';
             begin
            
            declare codigo_adm varchar(30);
            /*
            obtener el codigo del admin
            */
            /*insertar registro de login*/
            select Codigo_Personal into codigo_adm from 
            admins where User_Name = TRIM(USERNAME) AND 
            User_Paswword = TRIM(U_Password);
            /*intertar con el codigo al registro de sessiones*/
            insert into login_adms (Codigo_Personal,User_Name
            ,User_Paswword,On_Session,off_Session)
            values(codigo_adm,USERNAME,U_Password,NOW(),null);
            end;
            
            
            
            
        END IF;
    END IF; 
END //

DELIMITER ;

