
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `Quit_Session`(
IN USER_Code varchar(200),
OUT RESULT varchar(300)
)
BEGIN

  IF (USER_Code = '' or USER_Code  is null ) THEN
  
	SET RESULT = 'No se encontro Usuario, o usuario desconocido';
    ELSE
            UPDATE login_adms SET Off_Session = Now()
            WHERE Codigo_Personal = trim(USER_Code) ;
			/*
            se actualizo el registro existente de la session
            */
            /*registrar el mensaje*/
           SET   RESULT = 'Cerrado Session Correctamente...' ;
      END IF;
 
END //
DELIMITER ;