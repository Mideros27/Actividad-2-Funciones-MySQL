-- Procedimiento Almacenado Canal
DELIMITER // 
CREATE  PROCEDURE sp_select_Canal()
BEGIN
    select can_id_canal,can_nombre,can_tipo
    from canal;
END//
DELIMITER ; 

-- INSERT
DELIMITER //
CREATE PROCEDURE  sp_insert_canal(IN p_can_nombre VARCHAR(80),IN p_tipo VARCHAR(15))
BEGIN
    insert into canal(can_nombre,can_tipo)
    values(p_can_nombre,p_tipo);
END//

DELIMITER ; 

-- UPDATE
DELIMITER //
CREATE PROCEDURE sp_update_canal(IN p_can_id INT,IN p_can_nombre VARCHAR(80), IN p_can_tipo VARCHAR(15))
BEGIN
    update canal
    set can_nombre= p_can_nombre, can_tipo = p_can_tipo
    where can_id_canal = p_can_id;
END//
DELIMITER ;

-- DELETE
DELIMITER //
CREATE PROCEDURE sp_delete_canal(IN p_can_id INT)
BEGIN
delete from canal 
where can_id_canal = p_can_id;
END//
DELIMITER ;

-- Contar los canales
DELIMITER //
CREATE PROCEDURE sp_count_canal(OUT p_quantity INT)
BEGIN 
    select count(can_id_canal) into p_quantity
    from canal;
END//
DELIMITER ;

-- Declarar una variable para guardar el resultado 
CALL sp_count_canal(@quantity);
-- Obtener el valor almacenado en la variable @quantity
select @quantity;

-- Ejecuta junto
-- Si me funciona la consulta puedo seguir con la uniones de las tablas
select cam.cam_nombre,cam.cam_presupuesto,cam.cam_fecha_inicio,cam.cam_fecha_final,canal.can_nombre
from canal
-- Uniones de tablas
-- as sirve para apodar o renombrar
inner join campania as cam 
on canal.can_id_canal = cam.canal_can_id_canal;

-- FUNCION RIGHT PARA CANAL
DELIMITER //
CREATE PROCEDURE sp_funcion_right_canal()
BEGIN
    -- Extrae los últimos 4 caracteres del nombre del canal
    SELECT can_nombre AS Original, 
           RIGHT(can_nombre, 4) AS Resultado_Right 
    FROM canal LIMIT 5;
END//
DELIMITER ;

-- FUNCION UPPER PARA CANAL
DELIMITER //
CREATE PROCEDURE sp_funcion_upper_canal()
BEGIN
    -- Convierte el tipo de canal (ej. Social, Buscador) a mayúsculas sostenidas
    SELECT can_tipo AS Original, 
           UPPER(can_tipo) AS Resultado_Upper 
    FROM canal LIMIT 5;
END//
DELIMITER ;

-- FUNCION FIELD PARA CANAL
DELIMITER //
CREATE PROCEDURE sp_funcion_field_canal()
BEGIN
    -- Busca la posición del tipo de canal dentro de esta lista específica
    SELECT can_tipo AS Tipo_Canal, 
           FIELD(can_tipo, 'Social', 'Buscador', 'Email') AS Posicion_Field 
    FROM canal LIMIT 5;
END//
DELIMITER ;

-- FUNCION REPEAT PARA CANAL
DELIMITER //
CREATE PROCEDURE sp_funcion_repeat_canal()
BEGIN
    -- Agrega una repetición visual de 5 asteriscos para destacar el canal
    SELECT can_nombre, 
           CONCAT(REPEAT('*', 5), ' ', can_nombre) AS Resultado_Repeat 
    FROM canal LIMIT 5;
END//
DELIMITER ;


--
--
--


-- Procedimiento Almacenado campania
DELIMITER // 
CREATE  PROCEDURE sp_select_campania()
BEGIN
    select cam_id_campania,cam_nombre,cam_presupuesto,
    cam_fecha_inicio,cam_fecha_final,canal_can_id_canal
    from campania;
END//
DELIMITER ; 

-- INSERT
DELIMITER //
CREATE PROCEDURE sp_insert_campania(IN p_cam_nombre VARCHAR(120),IN p_cam_presupuesto DECIMAL(10,2),
    IN p_cam_fecha_inicio DATE,IN p_cam_fecha_final DATE,IN p_canal_can_id_canal INT)
BEGIN
    INSERT INTO campania (cam_nombre, cam_presupuesto, cam_fecha_inicio, cam_fecha_final, canal_can_id_canal)
    VALUES (p_cam_nombre, p_cam_presupuesto, p_cam_fecha_inicio, p_cam_fecha_final, p_canal_can_id_canal);
END//
DELIMITER ;

-- UPDATE
DELIMITER //
CREATE PROCEDURE sp_update_campania(
    IN p_cam_id_campania INT,
    IN p_cam_nombre VARCHAR(120),
    IN p_cam_presupuesto DECIMAL(10,2),
    IN p_cam_fecha_inicio DATE,
    IN p_cam_fecha_final DATE,
    IN p_canal_can_id_canal INT
)
BEGIN
    UPDATE campania
    SET cam_nombre = p_cam_nombre,
        cam_presupuesto = p_cam_presupuesto,
        cam_fecha_inicio = p_cam_fecha_inicio,
        cam_fecha_final = p_cam_fecha_final,
        canal_can_id_canal = p_canal_can_id_canal
    WHERE cam_id_campania = p_cam_id_campania;
END//
DELIMITER ;

-- DELETE
DELIMITER //
CREATE PROCEDURE sp_delete_campania(IN p_cam_id INT)
BEGIN
    DELETE FROM campania 
    WHERE cam_id_campania = p_cam_id;
END//
DELIMITER ;

-- FUNCION REVERSE PARA CAMPANIA
DELIMITER //
CREATE PROCEDURE sp_funcion_reverse_campania()
BEGIN
    -- Invierte el orden de los caracteres del nombre de la campaña
    SELECT cam_nombre AS Original, 
           REVERSE(cam_nombre) AS Resultado_Reverse 
    FROM campania LIMIT 5;
END//
DELIMITER ;


-- FUNCIONES  LOWER EN CAMPANIA
DELIMITER //
CREATE PROCEDURE sp_funcion_lower_campania()
BEGIN
    -- Convierte el nombre de la campaña completamente a minúsculas
    SELECT cam_nombre AS Original, 
           LOWER(cam_nombre) AS Resultado_Lower 
    FROM campania LIMIT 5;
END//
DELIMITER ;

-- FUNCION LCASE PARA CAMPANIA
DELIMITER //
CREATE PROCEDURE sp_funcion_lcase_campania()
BEGIN
    -- Convierte el nombre de la campaña completamente a minúsculas
    SELECT cam_nombre AS Original, 
           LCASE(cam_nombre) AS Resultado_Lcase
    FROM campania LIMIT 5;
END//
DELIMITER ;

-- FUNCION LENGTH
DELIMITER //
CREATE PROCEDURE sp_funcion_length_campania()
BEGIN
    -- Cuenta la cantidad de bytes/caracteres del nombre de la campaña
    SELECT cam_nombre AS Original, 
           LENGTH(cam_nombre) AS Resultado_Length 
    FROM campania LIMIT 5;
END//
DELIMITER ;


--
--
--


-- Procedimiento Almacenado cliente
DELIMITER // 
CREATE  PROCEDURE sp_select_cliente()
BEGIN
    select cli_id_cliente,cli_nombre,cli_apellido,cli_correo,
    cli_telefono,cli_ciudad,cli_fecha_registro
    from cliente;
END//
DELIMITER ; 

-- INSERT
DELIMITER //
CREATE PROCEDURE sp_insert_cliente(IN p_cli_nombre VARCHAR(100),IN p_cli_apellido VARCHAR(100),IN p_cli_correo VARCHAR(100),
    IN p_cli_telefono VARCHAR(25),IN p_cli_ciudad VARCHAR(45),IN p_cli_fecha_registro DATE)
BEGIN
    INSERT INTO cliente (cli_nombre, cli_apellido, cli_correo, cli_telefono, cli_ciudad, cli_fecha_registro)
    VALUES (p_cli_nombre, p_cli_apellido, p_cli_correo, p_cli_telefono, p_cli_ciudad, p_cli_fecha_registro);
END//
DELIMITER ;

-- UPDATE
DELIMITER //
CREATE PROCEDURE sp_update_cliente(IN p_cli_id_cliente INT,
    IN p_cli_nombre VARCHAR(100),
    IN p_cli_apellido VARCHAR(100),
    IN p_cli_correo VARCHAR(100),
    IN p_cli_telefono VARCHAR(25),
    IN p_cli_ciudad VARCHAR(45),
    IN p_cli_fecha_registro DATE
)
BEGIN
    UPDATE cliente
    SET cli_nombre = p_cli_nombre,
        cli_apellido = p_cli_apellido,
        cli_correo = p_cli_correo,
        cli_telefono = p_cli_telefono,
        cli_ciudad = p_cli_ciudad,
        cli_fecha_registro = p_cli_fecha_registro
    WHERE cli_id_cliente = p_cli_id_cliente;
END//
DELIMITER ;

-- DELETE
DELIMITER //
CREATE PROCEDURE sp_delete_cliente(IN p_cli_id INT)
BEGIN
    DELETE FROM cliente 
    WHERE cli_id_cliente = p_cli_id;
END//
DELIMITER ;

-- FUNCION REPLACE PARA CLIENTE
DELIMITER //
CREATE PROCEDURE sp_funcion_replace_cliente()
BEGIN
    -- Muestra cómo reemplazar parte de un texto (ej: cambiar un dominio)
    SELECT cli_correo AS Original, 
           REPLACE(cli_correo, '.com', '.org') AS Resultado_Replace 
    FROM cliente LIMIT 5;
END//
DELIMITER ;

-- FUNCION SUBSTR_SUBSTRING
DELIMITER //
CREATE PROCEDURE sp_funcion_substring()
BEGIN
    -- Extrae 3 caracteres del teléfono empezando desde la posición 1
    SELECT cli_telefono AS Original, 
           SUBSTR(cli_telefono, 1, 3) AS Resultado_Substr,
           SUBSTRING(cli_telefono, 1, 3) AS Resultado_Substring 
    FROM cliente LIMIT 5;
END//
DELIMITER ;




--
--
--


-- Procedimiento Almacenado conversion
DELIMITER // 
CREATE  PROCEDURE sp_select_conversion()
BEGIN
    select con_id_conversion,con_tipo,con_valor,
    con_fecha,cliente_cli_id_cliente
    from conversion;
END//
DELIMITER ; 

-- INSERT
DELIMITER //
CREATE PROCEDURE sp_insert_conversion(IN p_con_tipo VARCHAR(50), IN p_con_valor DECIMAL(10,2),
    IN p_con_fecha DATE,
    IN p_cliente_cli_id_cliente INT)
BEGIN
    INSERT INTO conversion (con_tipo, con_valor, con_fecha, cliente_cli_id_cliente)
    VALUES (p_con_tipo, p_con_valor, p_con_fecha, p_cliente_cli_id_cliente);
END//
DELIMITER ;

-- UPDATE
DELIMITER //
CREATE PROCEDURE sp_update_conversion(
    IN p_con_id_conversion INT,
    IN p_con_tipo VARCHAR(50), 
    IN p_con_valor DECIMAL(10,2),
    IN p_con_fecha DATE,
    IN p_cliente_cli_id_cliente INT
)
BEGIN
    UPDATE conversion
    SET con_tipo = p_con_tipo,
        con_valor = p_con_valor,
        con_fecha = p_con_fecha,
        cliente_cli_id_cliente = p_cliente_cli_id_cliente
    WHERE con_id_conversion = p_con_id_conversion;
END//
DELIMITER ;

-- DELETE 
DELIMITER //
CREATE PROCEDURE sp_delete_conversion(IN p_con_id INT)
BEGIN
    DELETE FROM conversion 
    WHERE con_id_conversion = p_con_id;
END//
DELIMITER ;

-- FUNCION RIGHT PARA CONVERSION
DELIMITER //
CREATE PROCEDURE sp_funcion_space_conversion()
BEGIN
    -- Genera 5 espacios en blanco entre el tipo de conversión y el valor
    SELECT con_tipo, con_valor, 
           CONCAT(con_tipo, SPACE(5), con_valor) AS Resultado_Space 
    FROM conversion LIMIT 5;
END//
DELIMITER ;

-- FUNCION FORMAT PARA CONVERSION
DELIMITER //
CREATE PROCEDURE sp_funcion_format_conversion()
BEGIN
    -- Da formato de miles y 2 decimales al valor de la conversión
    SELECT con_tipo, con_valor AS Original, 
           FORMAT(con_valor, 2) AS Resultado_Format 
    FROM conversion LIMIT 5;
END//
DELIMITER ;



--
--
--


-- Procedimiento Almacenado interaccion
DELIMITER // 
CREATE  PROCEDURE sp_select_interaccion()
BEGIN
    select int_id_interaccion,int_tipo,int_fecha,
    campania_cam_id_campania,cliente_cli_id_cliente
    from interaccion;
END//
DELIMITER ; 

-- INSERT
DELIMITER //
CREATE PROCEDURE sp_insert_interaccion(IN p_int_tipo VARCHAR(50),IN p_int_fecha DATE,
IN p_campania_cam_id_campania INT,
IN p_cliente_cli_id_cliente INT)
BEGIN
    INSERT INTO interaccion (int_tipo, int_fecha, campania_cam_id_campania, cliente_cli_id_cliente)
    VALUES (p_int_tipo, p_int_fecha, p_campania_cam_id_campania, p_cliente_cli_id_cliente);
END//
DELIMITER ;

-- UPDATE
DELIMITER //
CREATE PROCEDURE sp_update_interaccion(
    IN p_int_id_interaccion INT,
    IN p_int_tipo VARCHAR(50),
    IN p_int_fecha DATE,
    IN p_campania_cam_id_campania INT,
    IN p_cliente_cli_id_cliente INT
)
BEGIN
    UPDATE interaccion
    SET int_tipo = p_int_tipo,
        int_fecha = p_int_fecha,
        campania_cam_id_campania = p_campania_cam_id_campania,
        cliente_cli_id_cliente = p_cliente_cli_id_cliente
    WHERE int_id_interaccion = p_int_id_interaccion;
END//
DELIMITER ;

-- DELETE
DELIMITER //
CREATE PROCEDURE sp_delete_interaccion(IN p_int_id INT)
BEGIN
    DELETE FROM interaccion 
    WHERE int_id_interaccion = p_int_id;
END//
DELIMITER ;

-- FUNCION CONCAT PARA INTERACCION
DELIMITER //
CREATE PROCEDURE sp_funcion_concat_interaccion()
BEGIN
    -- Une el tipo de interacción y la fecha con un guion
    SELECT int_tipo, int_fecha, 
           CONCAT(int_tipo, ' - ', int_fecha) AS Resultado_Concat 
    FROM interaccion LIMIT 5;
END//
DELIMITER ;

-- FUNCION LEFT PARA INTERACION
DELIMITER //
CREATE PROCEDURE sp_funcion_left_interaccion()
BEGIN
    -- Extrae las primeras 3 letras del tipo de interacción
    SELECT int_tipo AS Original, 
           LEFT(int_tipo, 3) AS Resultado_Left 
    FROM interaccion LIMIT 5;
END//
DELIMITER ;