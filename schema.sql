-- Crear la base de datos
CREATE DATABASE tripAdvisor;

-- Usar la base de datos
USE tripAdvisor;

-- Crear la tabla USUARIO
CREATE TABLE USUARIO (
    email VARCHAR(150) PRIMARY KEY,
    nombres VARCHAR(150),
    apellidos VARCHAR(150),
    contraseña VARCHAR(150)
);

DELIMITER //
CREATE PROCEDURE InsertUsuario(
    IN p_email VARCHAR(150),
    IN p_nombres VARCHAR(150),
    IN p_apellidos VARCHAR(150),
    IN p_contrasena VARCHAR(150)
)
BEGIN
    INSERT INTO USUARIO(email, nombres, apellidos, contraseña)
    VALUES (p_email, p_nombres, p_apellidos, p_contrasena);
END;
//

CREATE PROCEDURE UpdateUsuario(
    IN p_email VARCHAR(150),
    IN p_nombres VARCHAR(150),
    IN p_apellidos VARCHAR(150),
    IN p_contrasena VARCHAR(150)
)
BEGIN
    UPDATE USUARIO
    SET nombres = p_nombres,
        apellidos = p_apellidos,
        contraseña = p_contrasena
    WHERE email = p_email;
END;
//

CREATE PROCEDURE DeleteUsuario(
    IN p_email VARCHAR(150)
)
BEGIN
    START TRANSACTION;
    DELETE FROM OPINION
    WHERE autor = p_email;
    DELETE FROM LIKES
    WHERE usuario_id = p_email;
    DELETE FROM RESERVAS
    WHERE id_usuario = p_email;
    DELETE FROM VUELO
    WHERE usuario = p_email;
    DELETE FROM USUARIO
    WHERE email = p_email;
    COMMIT;
END;
//
DELIMITER ;

INSERT INTO USUARIO (email, nombres, apellidos, contraseña)
VALUES
    ('msgalvez@espol.edu.ec', 'Maria Soledad', 'Galvez', 'pass123'),
    ('kemeroca@espol.edu.ec', 'Kennet', 'Mejillon', 'pass456'),
    ('jlopez@gmail.com', 'José', 'López', 'abc123'),
    ('mmartinez@hotmail.com', 'María', 'Martínez', 'def456'),
    ('acastillo@hotmail.com', 'Andrea', 'Castillo', 'ghi789'),
    ('rfernandez@gmail.com', 'Roberto', 'Fernández', 'jkl012'),
    ('mmontoya@espol.edu.ec', 'Mariana', 'Montoya', 'mno345'),
    ('jjimenez@espol.edu.ec', 'Juan', 'Jiménez', 'pqr678'),
    ('cmorales@hotmail.com', 'Carla', 'Morales', 'stu901'),
    ('rsanchez@gmail.com', 'Ricardo', 'Sánchez', 'vwx234'),
    ('jgonzalez@gmail.com', 'Julia', 'González', 'yz567'),
    ('faguilar@hotmail.com', 'Fernando', 'Aguilar', 'pass890'),
    ('ecastro@espol.edu.ec', 'Elena', 'Castro', 'pasabc'),
	('jrodriguez@gmail.com', 'Javier', 'Rodríguez', 'pass123'),
    ('mlopez@hotmail.com', 'Mónica', 'López', 'pass456'),
    ('pgarcia@gmail.com', 'Pedro', 'García', 'pass789');

CREATE TABLE VUELO (
    numero INT PRIMARY KEY,
    areolinea VARCHAR(100),
    destino VARCHAR(100),
    origen VARCHAR(100),
    fechaPartida VARCHAR(50),
    fechaLlegada VARCHAR(50),
    usuario VARCHAR(150),
    FOREIGN KEY (usuario) REFERENCES USUARIO(email)
);

DELIMITER //
CREATE PROCEDURE InsertVuelo(
    IN p_numero INT,
    IN p_aerolinea VARCHAR(100),
    IN p_destino VARCHAR(100),
    IN p_origen VARCHAR(100),
    IN p_fechaPartida VARCHAR(50),
    IN p_fechaLlegada VARCHAR(50),
    IN p_usuario VARCHAR(150)
)
BEGIN
    INSERT INTO VUELO(numero, areolinea, destino, origen, fechaPartida, fechaLlegada, usuario)
    VALUES (p_numero, p_aerolinea, p_destino, p_origen, p_fechaPartida, p_fechaLlegada, p_usuario);
END;
//

CREATE PROCEDURE UpdateVuelo(
    IN p_numero INT,
    IN p_aerolinea VARCHAR(100),
    IN p_destino VARCHAR(100),
    IN p_origen VARCHAR(100),
    IN p_fechaPartida VARCHAR(50),
    IN p_fechaLlegada VARCHAR(50),
    IN p_usuario VARCHAR(150)
)
BEGIN
    UPDATE VUELO
    SET areolinea = p_aerolinea,
        destino = p_destino,
        origen = p_origen,
        fechaPartida = p_fechaPartida,
        fechaLlegada = p_fechaLlegada,
        usuario = p_usuario
    WHERE numero = p_numero;
END;
//

CREATE PROCEDURE DeleteVuelo(
    IN p_numero INT
)
BEGIN
    DELETE FROM VUELO
    WHERE numero = p_numero;
END;
//
DELIMITER ;


INSERT INTO VUELO (numero, areolinea, destino, origen, fechaPartida, fechaLlegada, usuario)
VALUES
    (37, 'American Airlines', 'Ciudad de México', 'Nueva York', '2023-08-03', '2023-08-07', 'msgalvez@espol.edu.ec'),
    (51, 'Delta Air Lines', 'Londres', 'Atlanta', '2023-08-04', '2023-08-08', 'kemeroca@espol.edu.ec'),
    (62, 'United Airlines', 'Tokio', 'Chicago', '2023-08-05', '2023-08-09', 'jlopez@gmail.com'),
    (13, 'British Airways', 'Sídney', 'Londres', '2023-08-06', '2023-08-10', 'mmartinez@hotmail.com'),
    (86, 'Lufthansa', 'París', 'Fráncfort', '2023-08-07', '2023-08-11', 'acastillo@hotmail.com'),
    (45, 'Emirates', 'Dubái', 'Nueva York', '2023-08-08', '2023-08-12', 'rfernandez@gmail.com'),
    (77, 'Qatar Airways', 'Hong Kong', 'Doha', '2023-08-09', '2023-08-13', 'mmontoya@espol.edu.ec'),
    (92, 'Singapore Airlines', 'Sídney', 'Singapur', '2023-08-10', '2023-08-14', 'jjimenez@espol.edu.ec'),
    (25, 'Cathay Pacific', 'Londres', 'Hong Kong', '2023-08-11', '2023-08-15', 'cmorales@hotmail.com'),
    (18, 'Air France', 'Nueva York', 'París', '2023-08-12', '2023-08-16', 'rsanchez@gmail.com'),
    (96, 'KLM Royal Dutch Airlines', 'Ámsterdam', 'Bogotá', '2023-08-13', '2023-08-17', 'jgonzalez@gmail.com'),
    (10, 'Qantas', 'Melbourne', 'Sídney', '2023-08-14', '2023-08-18', 'faguilar@hotmail.com'),
    (42, 'Turkish Airlines', 'Estambul', 'Madrid', '2023-08-15', '2023-08-19', 'ecastro@espol.edu.ec'),
    (29, 'Copa Airlines', 'Ciudad de Panamá', 'Ciudad de México', '2023-08-16', '2023-08-20', 'jrodriguez@gmail.com'),
    (57, 'Avianca', 'Bogotá', 'Lima', '2023-08-17', '2023-08-21', 'mlopez@hotmail.com');

CREATE TABLE RESERVAS (
    id VARCHAR(25) PRIMARY KEY,
    fecha VARCHAR(50),
    nombres VARCHAR(150),
    id_usuario VARCHAR(150),
    FOREIGN KEY (id_usuario) REFERENCES USUARIO(email)
);

CREATE VIEW ReservasUsuarioView AS
SELECT
    R.id AS reserva_id,
    R.fecha,
    R.nombres AS reserva_nombres,
    R.id_usuario,
    U.nombres AS usuario_nombres,
    U.apellidos,
    U.contraseña
FROM
    RESERVAS R
JOIN
    USUARIO U ON R.id_usuario = U.email;

CREATE USER 'reseusu'@'localhost' IDENTIFIED BY 'reseusu123';
GRANT SELECT ON tripAdvisor.ReservasUsuarioView TO 'reseusu'@'localhost';

DELIMITER //

CREATE PROCEDURE InsertReserva(
    IN p_id VARCHAR(25),
    IN p_fecha VARCHAR(50),
    IN p_nombres VARCHAR(150),
    IN p_id_usuario VARCHAR(150)
)
BEGIN
    INSERT INTO RESERVAS(id, fecha, nombres, id_usuario)
    VALUES (p_id, p_fecha, p_nombres, p_id_usuario);
END;
//

CREATE PROCEDURE UpdateReserva(
    IN p_id VARCHAR(25),
    IN p_fecha VARCHAR(50),
    IN p_nombres VARCHAR(150)
)
BEGIN
    UPDATE RESERVAS
    SET fecha = p_fecha,
        nombres = p_nombres
    WHERE id = p_id;
END;
//

CREATE PROCEDURE DeleteReserva(
    IN p_id VARCHAR(25)
)
BEGIN
    DELETE FROM RESERVAS
    WHERE id = p_id;
END;
//

DELIMITER ;


INSERT INTO RESERVAS (id, fecha, nombres, id_usuario)
VALUES
    ('reserva1', '2023-08-01', 'Reserva1', 'msgalvez@espol.edu.ec'),
    ('reserva2', '2023-08-02', 'Reserva2', 'kemeroca@espol.edu.ec'),
    ('reserva3', '2023-08-03', 'Reserva3', 'jlopez@gmail.com'),
    ('reserva4', '2023-08-04', 'Reserva4', 'mmartinez@hotmail.com'),
    ('reserva5', '2023-08-05', 'Reserva5', 'acastillo@hotmail.com'),
    ('reserva6', '2023-08-06', 'Reserva6', 'rfernandez@gmail.com'),
    ('reserva7', '2023-08-07', 'Reserva7', 'mmontoya@espol.edu.ec'),
    ('reserva8', '2023-08-08', 'Reserva8', 'jjimenez@espol.edu.ec'),
    ('reserva9', '2023-08-09', 'Reserva9', 'cmorales@hotmail.com'),
    ('reserva10', '2023-08-10', 'Reserva10', 'rsanchez@gmail.com'),
    ('reserva11', '2023-08-11', 'Reserva11', 'jgonzalez@gmail.com'),
    ('reserva12', '2023-08-12', 'Reserva12', 'faguilar@hotmail.com'),
    ('reserva13', '2023-08-13', 'Reserva13', 'ecastro@espol.edu.ec'),
    ('reserva14', '2023-08-14', 'Reserva14', 'jrodriguez@gmail.com'),
    ('reserva15', '2023-08-15', 'Reserva15', 'mlopez@hotmail.com');

CREATE TABLE SERVICIO (
    id VARCHAR(25) PRIMARY KEY,
    nombre VARCHAR(150),
    ubicacion VARCHAR(150),
    sitioWeb VARCHAR(250),
    tipo ENUM('HOTEL', 'THING')
);

CREATE UNIQUE INDEX idx_unique_nombre ON SERVICIO(nombre);

INSERT INTO SERVICIO (id, nombre, ubicacion, sitioWeb, tipo)
VALUES
    ('servicio1', 'Hotel Hilton', 'Nueva York', 'www.hotelhilton.com', 'HOTEL'),
    ('servicio2', 'Tour Central Park', 'Nueva York', 'www.tourcentralpark.com', 'THING'),
    ('servicio3', 'Hotel Marriott', 'Los Ángeles', 'www.hotelmarriott.com', 'HOTEL'),
    ('servicio4', 'Tour Estudio Hollywood', 'Los Ángeles', 'www.tourestudiohollywood.com', 'THING'),
    ('servicio5', 'Hotel Ritz-Carlton', 'París', 'www.hotelritzcarlton.com', 'HOTEL'),
    ('servicio6', 'Experiencia Torre Eiffel', 'París', 'www.experienciatorreeiffel.com', 'THING'),
    ('servicio7', 'Hotel The Savoy', 'Londres', 'www.hotelthesavoy.com', 'HOTEL'),
    ('servicio8', 'Tour Museo Británico', 'Londres', 'www.tourmuseobritanico.com', 'THING'),
    ('servicio9', 'Hotel Hilton Tokio', 'Tokio', 'www.hotelhiltontokio.com', 'HOTEL'),
    ('servicio10', 'Excursión Senderismo Monte Fuji', 'Tokio', 'www.excursionsenderismomontefuji.com', 'THING'),
    ('servicio11', 'Hotel Ópera Sídney', 'Sídney', 'www.hoteloperasydney.com', 'HOTEL'),
    ('servicio12', 'Snorkeling Gran Barrera de Coral', 'Sídney', 'www.snorkelinggranbarreradecoral.com', 'THING'),
    ('servicio13', 'Resort Playa Barcelona', 'Barcelona', 'www.resortplayabarcelona.com', 'HOTEL'),
    ('servicio14', 'Tour Sagrada Familia', 'Barcelona', 'www.toursagradafamilia.com', 'THING'),
    ('servicio15', 'Hotel de Lujo Dubái', 'Dubái', 'www.hoteldelujodubai.com', 'HOTEL'),
    ('servicio16', 'Aventura Safari en el Desierto', 'Dubái', 'www.aventurasafarieneldesierto.com', 'THING'),
    ('servicio17', 'Hotel Riverside Ámsterdam', 'Ámsterdam', 'www.hotelriversideamsterdam.com', 'HOTEL'),
    ('servicio18', 'Tour Museo Van Gogh', 'Ámsterdam', 'www.tourmuseovanGogh.com', 'THING'),
    ('servicio19', 'Resort Playa Río de Janeiro', 'Río de Janeiro', 'www.resortplayariodejaneiro.com', 'HOTEL'),
    ('servicio20', 'Visita Cristo Redentor', 'Río de Janeiro', 'www.visitacristoredentor.com', 'THING');

CREATE TABLE OPINION (
    id VARCHAR(25) PRIMARY KEY,
    calificacion FLOAT,
    fecha TIMESTAMP,
    resena VARCHAR(255),
    compania VARCHAR(150),
    autor VARCHAR(150),
    servicio_id VARCHAR(25),
    FOREIGN KEY (autor) REFERENCES USUARIO(email),
    FOREIGN KEY (servicio_id) REFERENCES SERVICIO(id)
);

DELIMITER //
CREATE TRIGGER opinion_fecha_tgr
BEFORE INSERT ON OPINION
FOR EACH ROW
BEGIN
    SET NEW.fecha = NOW();
END;
//
DELIMITER ;


INSERT INTO OPINION (id, calificacion, fecha, resena, compania, autor, servicio_id)
VALUES
    ('opinion1', 4.5, '2023-08-01', 'Excelente servicio, personal amable y atento.', 'Hotel Hilton', 'msgalvez@espol.edu.ec', 'servicio1'),
    ('opinion2', 3.8, '2023-08-02', 'El tour fue interesante, pero hubo un poco de desorganización.', 'Tour Central Park', 'kemeroca@espol.edu.ec', 'servicio2'),
    ('opinion3', 4.2, '2023-08-03', 'Gran experiencia en el hotel, definitivamente regresaré.', 'Hotel Marriott', 'jlopez@gmail.com', 'servicio3'),
    ('opinion4', 4.0, '2023-08-04', 'El tour por Hollywood fue muy divertido.', 'Tour Estudio Hollywood', 'mmartinez@hotmail.com', 'servicio4'),
    ('opinion5', 4.7, '2023-08-05', 'El servicio en el hotel fue excelente y la ubicación es perfecta.', 'Hotel Ritz-Carlton', 'acastillo@hotmail.com', 'servicio5'),
    ('opinion6', 4.6, '2023-08-06', 'La experiencia en la Torre Eiffel fue impresionante.', 'Experiencia Torre Eiffel', 'rfernandez@gmail.com', 'servicio6'),
    ('opinion7', 4.3, '2023-08-07', 'Disfrutamos mucho nuestra estadía en el hotel.', 'Hotel The Savoy', 'mmontoya@espol.edu.ec', 'servicio7'),
    ('opinion8', 4.1, '2023-08-08', 'El tour por el Museo Británico fue muy informativo.', 'Tour Museo Británico', 'jjimenez@espol.edu.ec', 'servicio8'),
    ('opinion9', 4.9, '2023-08-09', 'Increíble servicio en el hotel, altamente recomendado.', 'Hotel Hilton Tokio', 'cmorales@hotmail.com', 'servicio9'),
    ('opinion10', 3.5, '2023-08-10', 'El senderismo en el Monte Fuji fue agotador pero valió la pena.', 'Excursión Senderismo Monte Fuji', 'rsanchez@gmail.com', 'servicio10'),
    ('opinion11', 4.4, '2023-08-11', 'La ubicación del hotel es perfecta y el personal es amable.', 'Hotel Ópera Sídney', 'jgonzalez@gmail.com', 'servicio11'),
    ('opinion12', 4.8, '2023-08-12', 'El snorkeling en la Gran Barrera de Coral fue una experiencia única.', 'Snorkeling Gran Barrera de Coral', 'faguilar@hotmail.com', 'servicio12'),
    ('opinion13', 4.2, '2023-08-13', 'El resort en la playa de Barcelona es encantador.', 'Resort Playa Barcelona', 'ecastro@espol.edu.ec', 'servicio13'),
    ('opinion14', 4.6, '2023-08-14', 'El tour por la Sagrada Familia fue impresionante.', 'Tour Sagrada Familia', 'jrodriguez@gmail.com', 'servicio14'),
    ('opinion15', 3.9, '2023-08-15', 'El hotel en Dubái tiene instalaciones de lujo.', 'Hotel de Lujo Dubái', 'mlopez@hotmail.com', 'servicio15'),
    ('opinion16', 4.3, '2023-08-16', 'El safari en el desierto fue emocionante y divertido.', 'Aventura Safari en el Desierto', 'msgalvez@espol.edu.ec', 'servicio16'),
    ('opinion17', 4.0, '2023-08-17', 'La ubicación del hotel en Ámsterdam es perfecta.', 'Hotel Riverside Ámsterdam', 'kemeroca@espol.edu.ec', 'servicio17'),
    ('opinion18', 3.7, '2023-08-18', 'El tour por el Museo Van Gogh fue interesante.', 'Tour Museo Van Gogh', 'jlopez@gmail.com', 'servicio18'),
    ('opinion19', 4.8, '2023-08-19', 'El resort en la playa de Río de Janeiro es hermoso.', 'Resort Playa Río de Janeiro', 'mmartinez@hotmail.com', 'servicio19'),
    ('opinion20', 4.5, '2023-08-20', 'La visita al Cristo Redentor fue emocionante.', 'Visita Cristo Redentor', 'msgalvez@espol.edu.ec', 'servicio20'),
    ('opinion21', 3.6, '2023-08-21', 'El hotel en Nueva York es cómodo pero necesita renovación.', 'Hotel Hilton', 'kemeroca@espol.edu.ec', 'servicio1'),
    ('opinion22', 4.1, '2023-08-22', 'El tour por Central Park fue informativo.', 'Tour Central Park', 'jlopez@gmail.com', 'servicio2'),
    ('opinion23', 4.7, '2023-08-23', 'El servicio en el hotel de Los Ángeles fue excelente.', 'Hotel Marriott', 'mmartinez@hotmail.com', 'servicio3'),
    ('opinion24', 3.9, '2023-08-24', 'El tour por Hollywood fue entretenido pero corto.', 'Tour Estudio Hollywood', 'acastillo@hotmail.com', 'servicio4'),
    ('opinion25', 4.3, '2023-08-25', 'El hotel en París tiene una vista impresionante.', 'Hotel Ritz-Carlton', 'rfernandez@gmail.com', 'servicio5');


CREATE TABLE THING_TO_DO (
    servicio_id VARCHAR(25),
    tipo VARCHAR(120),
    precio FLOAT,
    duracion VARCHAR(10),
    PRIMARY KEY (servicio_id),
    FOREIGN KEY (servicio_id) REFERENCES SERVICIO(id)
);


INSERT INTO THING_TO_DO (servicio_id, tipo, precio, duracion)
VALUES
    ('servicio2', 'Visita Guiada', 25.99, '2 horas'),
    ('servicio4', 'Paseo en Bicicleta', 12.50, '1 hora'),
    ('servicio6', 'Espectáculo de Luces', 15.75, '1 hora'),
    ('servicio8', 'Tour Histórico', 20.00, '2 horas'),
    ('servicio10', 'Recorrido en Barco', 30.50, '3 horas'),
    ('servicio12', 'Observación de Estrellas', 8.25, '1 hora'),
    ('servicio14', 'Taller de Cocina', 35.00, '3 horas'),
    ('servicio16', 'Clase de Arte', 18.75, '2 horas'),
    ('servicio18', 'Paseo en Globo', 40.50, '4 horas'),
    ('servicio20', 'Cata de Vinos', 22.25, '1.5 horas');


CREATE TABLE HOTEL (
    servicio_id VARCHAR(25) PRIMARY KEY,
    telefono VARCHAR(20),
    incluyeDesayuno BOOLEAN,
    FOREIGN KEY (servicio_id) REFERENCES SERVICIO(id)
);

INSERT INTO HOTEL (servicio_id, telefono, incluyeDesayuno)
VALUES
    ('servicio1', '123-456-7890', TRUE),
    ('servicio3', '987-654-3210', FALSE),
    ('servicio5', '555-123-4567', TRUE),
    ('servicio7', '777-888-9999', TRUE),
    ('servicio9', '111-222-3333', FALSE),
    ('servicio11', '444-555-6666', TRUE),
    ('servicio13', '999-888-7777', FALSE),
    ('servicio14', '222-333-4444', TRUE);

CREATE TABLE LIKES (
    usuario_id VARCHAR(150),
    servicio_id VARCHAR(25),
    fecha TIMESTAMP,
    PRIMARY KEY (usuario_id, servicio_id),
    FOREIGN KEY (usuario_id) REFERENCES USUARIO(email),
    FOREIGN KEY (servicio_id) REFERENCES SERVICIO(id)
);


DELIMITER //
CREATE TRIGGER likes_fecha_tgr
BEFORE INSERT ON LIKES
FOR EACH ROW
BEGIN
    SET NEW.fecha = NOW();
END;
//
DELIMITER ;

INSERT INTO LIKES (usuario_id, servicio_id)
VALUES
    ('msgalvez@espol.edu.ec', 'servicio2'),
    ('kemeroca@espol.edu.ec', 'servicio5'),
    ('jlopez@gmail.com', 'servicio7'),
    ('mmartinez@hotmail.com', 'servicio10'),
    ('acastillo@hotmail.com', 'servicio13'),
    ('rfernandez@gmail.com', 'servicio16'),
    ('mmontoya@espol.edu.ec', 'servicio19'),
    ('jjimenez@espol.edu.ec', 'servicio1'),
    ('cmorales@hotmail.com', 'servicio4'),
    ('rsanchez@gmail.com', 'servicio6'),
    ('jgonzalez@gmail.com', 'servicio9'),
    ('faguilar@hotmail.com', 'servicio12'),
    ('ecastro@espol.edu.ec', 'servicio15'),
    ('jrodriguez@gmail.com', 'servicio18'),
    ('mlopez@hotmail.com', 'servicio20'),
    ('pgarcia@gmail.com', 'servicio3');

--PROCEDIMIENTOS
--procedimiento 1
DELIMITER //
CREATE PROCEDURE OBTENER_USUAR(in nombres char(150)) BEGIN
SELECT * FROM USUARIO u
WHERE u.nombres = nombres; END
// DELIMITER ;
--procedimiento 2
DELIMITER //
CREATE PROCEDURE ClientePorReserva(in nombreservicio CHAR(150), OUT cliente CHAR(150))
BEGIN
SELECT u.nombres into cliente
FROM USUARIO u JOIN likes l on u.email= l.usuario_id LEFT JOIN SERVICIO s on
Tripadvisor
   s.id=l.servicio_id
WHERE s.nombre= nombreservicio;
END
// DELIMITER ;

--procedimiento 3
DELIMITER //
CREATE PROCEDURE cuantasopiniones(in autornombre CHAR(150),out conteo INT) BEGIN
SELECT COUNT(u.email) into conteo
FROM usuario u JOIN OPINION o on u.email=o.autor WHERE u.nombres= autornombre;
END
// DELIMITER ;

--procedimiento 4
DELIMITER //
CREATE PROCEDURE SPinsert(id CHAR(25),servicionuevo CHAR(150), ubic CHAR(150), sitio CHAR(250), tipo ENUM('HOTEL', 'THING'))
BEGIN
SET @nuevo=(SELECT s.nombre FROM servicio s WHERE s.nombre= servicionuevo); IF @nuevo='hotel' THEN
INSERT INTO SERVICIO VALUES (id, servicionuevo, ubic, sitio, tipo); ELSE
SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT= 'Servicio no se puede
agregar';
END IF ;
END
// DELIMITER ;

--VISTAS
--Vista 1: Usuarios con Reservas Pendientes
CREATE VIEW UsuariosConReservasPendientes AS
SELECT U.email, U.nombres, U.apellidos
FROM USUARIO U
LEFT JOIN SOLICITUD_RESERVA SR ON U.email = SR.id_usuario
LEFT JOIN OPINION O ON U.email = O.autor
WHERE O.id IS NULL;

--Vista 2: Hoteles con IncluyeDesayuno
CREATE VIEW HotelesConIncluyeDesayuno AS
SELECT S.nombre AS NombreHotel, S.ubicacion AS Ubicacion, H.telefono AS Telefono, H.incluyeDesayuno
FROM SERVICIO S
JOIN HOTEL H ON S.id = H.servicio_id
WHERE S.tipo = 'HOTEL';




--Vista 3: Reseñas de Servicios con Calificación Alta
CREATE VIEW ResenasDeServiciosConCalificacionAlta AS
SELECT O.calificacion, O.resena, O.compania, S.nombre AS NombreServicio, S.ubicacion AS Ubicacion
FROM OPINION O
JOIN SERVICIO S ON O.servicio_id = S.id
WHERE O.calificacion >= 4;

--Vista 4: Servicios más Gustados por Usuarios
CREATE VIEW ServiciosMasGustados AS
SELECT S.nombre AS NombreServicio, S.ubicacion AS Ubicacion, COUNT(L.servicio_id) AS MeGusta
FROM SERVICIO S
JOIN LIKES L ON S.id = L.servicio_id
GROUP BY S.id
ORDER BY MeGusta DESC;

--INDICES

CREATE UNIQUE INDEX idx_email ON USUARIO (email);
CREATE INDEX idx_usuario ON VUELO (usuario);
CREATE INDEX idx_servicio_id ON OPINION (servicio_id);
CREATE UNIQUE INDEX idx_likes ON LIKES (usuario_id, servicio_id);
CREATE UNIQUE INDEX idx_solicitud_reserva ON SOLICITUD_RESERVA (id_usuario, id_reserva);
