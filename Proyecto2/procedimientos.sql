DELIMITER //
CREATE PROCEDURE AGREGAR_ROL_USUARIO(IN NOMBRE VARCHAR(45))
BEGIN
INSERT INTO Rol_Usuario(Nombre) values(NOMBRE);
END//

--LOGIN USUARIO
DELIMITER //
CREATE PROCEDURE LOGIN_USUARIO(IN USER INTEGER, IN PASS VARCHAR(50))
BEGIN
SELECT *FROM usuario 
WHERE Usuario = USER
and Password = PASS;
END//

--call LOGIN_USUARIO(100, '123');

-- OBTENER EL ID DEL ROL_USUARIO POR NOMBRE	
DELIMITER //
CREATE PROCEDURE ID_ROL_USUARIO(IN NOMBRE_ROL VARCHAR(50))
BEGIN
SELECT R.ROL_USUARIO FROM ROL_USUARIO R 
WHERE R.NOMBRE = NOMBRE_ROL;
END//
-- CALL ID_ROL_USUARIO('Administrador'); DEVUELVE 1


DROP FUNCTION ID_ROL_USUARIO;
--FUNCION QUE ME DEVUELVE EL ID DE UN ROL EN BASE A SU NOMBRE
DELIMITER //
CREATE FUNCTION ID_ROL_USUARIO(NOMBRE_ROL VARCHAR(45))
RETURNS INT(11)
BEGIN
	DECLARE ID INT DEFAULT -1;
	SELECT R.ROL_USUARIO INTO ID FROM ROL_USUARIO R
	WHERE R.NOMBRE = NOMBRE_ROL;
	RETURN ID;
END//

DROP FUNCTION EXISTE_USUARIO;
-- FUNCION QUE ME DEVUELVE -1 SI EL USUARIO NO EXISTE, SI EXISTE ME DEVUELVE SU USUARIO
DELIMITER //
CREATE FUNCTION EXISTE_USUARIO(USUARIO_ID INTEGER)
RETURNS INT(11)
BEGIN
	DECLARE VALOR INT DEFAULT -1;
	SELECT U.USUARIO INTO VALOR FROM USUARIO U
	WHERE U.USUARIO = USUARIO_ID;
	RETURN VALOR;
END//

DROP PROCEDURE CREAR_USUARIO;
-- PROCEDIMIENTO PARA CREAR USUARIO (YA VALIDO QUE NO EXISTA)
DELIMITER //
CREATE PROCEDURE CREAR_USUARIO(NOMBRE_P VARCHAR(100), DIRECCION_P VARCHAR(250), TELEFONO_P VARCHAR(15), CORREO_P VARCHAR(100), USUARIO_P INTEGER, PASSWORD_P VARCHAR(250), ROL_USUARIO_P VARCHAR(45))
BEGIN
	DECLARE ROL_USUARIO_ID INTEGER DEFAULT 0;
	DECLARE EXISTE INTEGER;
    DECLARE RESULTADO INTEGER DEFAULT 0;
    SET EXISTE = EXISTE_USUARIO(USUARIO_P);
    IF EXISTE = -1 THEN
		SET ROL_USUARIO_ID = ID_ROL_USUARIO(ROL_USUARIO_P);
		INSERT INTO USUARIO(USUARIO, NOMBRE, DIRECCION, TELEFONO, CORREO, PASSWORD, ROL_USUARIO)
        VALUES (USUARIO_P, NOMBRE_P, DIRECCION_P, TELEFONO_P, CORREO_P, PASSWORD_P, ROL_USUARIO_ID);
        SET RESULTADO = 1;
	END IF;
    SELECT RESULTADO;
END//


DELIMITER $$
USE `proyecto2bases1`$$
CREATE PROCEDURE CREAR_CAJA (IN CAJA INT,IN MONTO INT)
BEGIN
	INSERT INTO caja(Caja,Monto,Estado) VALUES(CAJA,MONTO,0);
END$$

DELIMITER //
CREATE PROCEDURE CAJA_ABRIR()
BEGIN
	SELECT * FROM caja WHERE caja.Estado = 0;
END//

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ABRIR_CAJA`(IN CAJA INT,IN USUARIO INT)
BEGIN
	SELECT @MONTO := caja.Monto 
    FROM caja 
    WHERE caja.Caja = 1;
    
    UPDATE caja 
    SET Estado = 1 
    WHERE caja.Caja = CAJA;
	
    INSERT INTO abrir_caja(Fecha_Hora,Monto,Usuario,Caja)
    VALUES(CURRENT_TIMESTAMP(),@MONTO,USUARIO,CAJA);
END//