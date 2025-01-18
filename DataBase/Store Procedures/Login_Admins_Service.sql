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
            SET isVerific = 'FALSE';
            SET msg = 'Usuario y Contraseña Incorrectos o Inexistentes';
        ELSEIF RESULT = 1 THEN
            SET isVerific = 'TRUE';
            SET msg = 'Accedió al Sistema';
        END IF;
    END IF; 
END //

DELIMITER ;

