-- Crear la base de datos
CREATE DATABASE tripAdvisor;

-- Usar la base de datos
USE tripAdvisor;

-- Crear la tabla USUARIO
CREATE TABLE USUARIO (
    email CHAR(150) PRIMARY KEY,
    nombres CHAR(150),
    apellidos CHAR(150),
    contraseña CHAR(25)
);

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
    areolinea CHAR(100),
    destino CHAR(100),
    origen CHAR(100),
    fechaPartida CHAR(50),
    fechaLlegada CHAR(50),
    usuario CHAR(150),
    FOREIGN KEY (usuario) REFERENCES USUARIO(email)
);


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
    id CHAR(25) PRIMARY KEY,
    fecha CHAR(50),
    nombres CHAR(150)
);


INSERT INTO RESERVAS (id, fecha, nombres)
VALUES
    ('reserva1', '2023-08-01', 'Reserva1'),
    ('reserva2', '2023-08-02', 'Reserva2'),
    ('reserva3', '2023-08-03', 'Reserva3'),
    ('reserva4', '2023-08-04', 'Reserva4'),
    ('reserva5', '2023-08-05', 'Reserva5'),
    ('reserva6', '2023-08-06', 'Reserva6'),
    ('reserva7', '2023-08-07', 'Reserva7'),
    ('reserva8', '2023-08-08', 'Reserva8'),
    ('reserva9', '2023-08-09', 'Reserva9'),
    ('reserva10', '2023-08-10', 'Reserva10'),
    ('reserva11', '2023-08-11', 'Reserva11'),
    ('reserva12', '2023-08-12', 'Reserva12'),
    ('reserva13', '2023-08-13', 'Reserva13'),
    ('reserva14', '2023-08-14', 'Reserva14'),
    ('reserva15', '2023-08-15', 'Reserva15');


CREATE TABLE SOLICITUD_RESERVA (
    id_usuario CHAR(150),
    id_reserva CHAR(25),
    PRIMARY KEY (id_usuario, id_reserva),
    FOREIGN KEY (id_usuario) REFERENCES USUARIO(email),
    FOREIGN KEY (id_reserva) REFERENCES RESERVAS(id)
);
INSERT INTO SOLICITUD_RESERVA (id_usuario, id_reserva)
VALUES
    ('msgalvez@espol.edu.ec', 'reserva1'),
    ('kemeroca@espol.edu.ec', 'reserva2'),
    ('jlopez@gmail.com', 'reserva3'),
    ('mmartinez@hotmail.com', 'reserva4'),
    ('acastillo@hotmail.com', 'reserva5'),
    ('rfernandez@gmail.com', 'reserva6'),
    ('mmontoya@espol.edu.ec', 'reserva7'),
    ('jjimenez@espol.edu.ec', 'reserva8'),
    ('cmorales@hotmail.com', 'reserva9'),
    ('rsanchez@gmail.com', 'reserva10'),
    ('jgonzalez@gmail.com', 'reserva11'),
    ('faguilar@hotmail.com', 'reserva12'),
    ('ecastro@espol.edu.ec', 'reserva13'),
    ('jrodriguez@gmail.com', 'reserva14'),
    ('mlopez@hotmail.com', 'reserva15');

CREATE TABLE SERVICIO (
    id CHAR(25) PRIMARY KEY,
    nombre CHAR(150),
    ubicacion CHAR(150),
    sitioWeb CHAR(250),
    tipo ENUM('HOTEL', 'THING')
);


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
    id CHAR(25) PRIMARY KEY,
    calificacion FLOAT,
    fecha CHAR(50),
    resena CHAR(255),
    compania CHAR(150),
    autor CHAR(150),
    servicio_id CHAR(25),
    FOREIGN KEY (autor) REFERENCES USUARIO(email),
    FOREIGN KEY (servicio_id) REFERENCES SERVICIO(id)
);


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
    servicio_id CHAR(25),
    tipo CHAR(120),
    precio FLOAT,
    duracion CHAR(10),
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
    servicio_id CHAR(25) PRIMARY KEY,
    telefono CHAR(20),
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
    usuario_id CHAR(150),
    servicio_id CHAR(25),
    PRIMARY KEY (usuario_id, servicio_id),
    FOREIGN KEY (usuario_id) REFERENCES USUARIO(email),
    FOREIGN KEY (servicio_id) REFERENCES SERVICIO(id)
);

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