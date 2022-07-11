
CREATE TABLE Persona
(
 dni VARCHAR(8) NOT NULL,
 nombre VARCHAR(50) NOT NULL,
 sexo CHAR(1) NOT NULL,
 direccion VARCHAR(200) NOT NULL,
 id_persona SERIAL NOT NULL,
 apellido VARCHAR(100) NOT NULL,
 PRIMARY KEY (id_persona),
 UNIQUE (dni)
);

CREATE TABLE Telefono
(
 celular NUMERIC(9) NOT NULL,
 id_persona INT NOT NULL,
 PRIMARY KEY (celular, id_persona),
 FOREIGN KEY (id_persona) REFERENCES Persona(id_persona)
);


CREATE TABLE Correo
(
 correo VARCHAR(70) NOT NULL,
 id_persona INT NOT NULL,
 PRIMARY KEY (correo, id_persona),
 FOREIGN KEY (id_persona) REFERENCES Persona(id_persona)
);

CREATE TABLE Area
(
 id_area NUMERIC(2) NOT NULL,
 nombre_area VARCHAR(60) NOT NULL,
 desc_area VARCHAR NOT NULL,
 PRIMARY KEY (id_area)
);


CREATE TABLE Tipo_cargo
(
 id_cargo SERIAL NOT NULL,
 nombre_cargo VARCHAR NOT NULL,
 desc_cargo VARCHAR NOT NULL,
 id_area NUMERIC(2),
 PRIMARY KEY (id_cargo),
 FOREIGN KEY (id_area) REFERENCES Area(id_area)
);

CREATE TABLE Empleado
(
 rol VARCHAR(100) NOT NULL,
 id_persona INT NOT NULL,
 id_cargo INT NOT NULL,
 PRIMARY KEY (id_persona),
 FOREIGN KEY (id_persona) REFERENCES Persona(id_persona),
 FOREIGN KEY (id_cargo) REFERENCES Tipo_cargo(id_cargo)
);

CREATE TABLE historial_experiencia
(
 id_hist_exp SERIAL NOT NULL,
 id_persona INT NOT NULL,
 fecha_inicio DATE NOT NULL,
 fecha_fin DATE,
 id_cargo INT NOT NULL,
 PRIMARY KEY (id_hist_exp, id_persona),
 FOREIGN KEY (id_persona) REFERENCES Empleado(id_persona),
 FOREIGN KEY (id_cargo) REFERENCES Tipo_cargo(id_cargo)
);


CREATE TABLE Usuario
(
 contrasenia CHAR(32) NOT NULL,
 id_persona INT NOT NULL,
 PRIMARY KEY (id_persona),
 FOREIGN KEY (id_persona) REFERENCES Empleado(id_persona)
);


CREATE TABLE Requerimiento
(
 num_vacantes NUMERIC(2) NOT NULL, --(se llena del formulario)
 estado_aprobacion VARCHAR(2), --(recien se esta llenando)
 id_requerimiento SERIAL NOT NULL, --(se genera al crear el requerimiento)
 id_cargo_requerida INT NOT NULL, --(id_tipo_cargo)
 comentarios VARCHAR, --(se llena del formulario)
 responsabilidades VARCHAR NOT NULL,
 id_solicitante INT NOT NULL, --(id usuario de conexion)
 fecha_emision DATE NOT NULL, --(fecha actual)
 experiencia NUMERIC(2) NOT NULL,--(se llena del formulario)
 PRIMARY KEY (id_requerimiento),
 FOREIGN KEY (id_cargo_requerida) REFERENCES Tipo_cargo(id_cargo),
 FOREIGN KEY (id_solicitante) REFERENCES Usuario(id_persona)
);

CREATE TABLE Revision
(
 fecha DATE NOT NULL,
 hora TIME NOT NULL,
 tipo_revision VARCHAR,
 id_persona INT NOT NULL,
 id_requerimiento INT NOT NULL,
 PRIMARY KEY (id_persona, id_requerimiento),
 FOREIGN KEY (id_persona) REFERENCES Usuario(id_persona),
 FOREIGN KEY (id_requerimiento) REFERENCES Requerimiento(id_requerimiento)
);

CREATE TABLE Tipo_reclutamiento
(
 id_tipo_reclutamiento CHAR(1) NOT NULL,
 nombre_tipo VARCHAR(20) NOT NULL,
 PRIMARY KEY (id_tipo_reclutamiento)
);

CREATE TABLE Plataforma_reclutamiento
(
 id_plataforma SERIAL NOT NULL,
 nombre VARCHAR NOT NULL,
 url_pagina VARCHAR(200) NOT NULL,
 telefono NUMERIC(9) NOT NULL,
 PRIMARY KEY (id_plataforma)
);

CREATE TABLE Empresa_externa
(
 RUC NUMERIC(11) NOT NULL,
 nombre VARCHAR(100) NOT NULL,
 telefono NUMERIC(9) NOT NULL,
 correo VARCHAR(100) NOT NULL,
 direccion VARCHAR(200) NOT NULL,
 entrega VARCHAR NOT NULL,
 PRIMARY KEY (RUC)
);

CREATE TABLE Postulante
(
 cv VARCHAR(200) NOT NULL,
 id_postulante SERIAL NOT NULL,
 id_persona INT NOT NULL,
 RUC NUMERIC(11) ,
 id_plataforma INT ,
 PRIMARY KEY (id_postulante),
 FOREIGN KEY (id_persona) REFERENCES Persona(id_persona),
 FOREIGN KEY (RUC) REFERENCES Empresa_externa(RUC),
 FOREIGN KEY (id_plataforma) REFERENCES Plataforma_reclutamiento(id_plataforma)
);

CREATE TABLE Convocatoria
(
 fecha_inicio DATE NOT NULL default current_date,
 fecha_limite DATE,
 personal_objetivo VARCHAR,
 num_convocatoria SERIAL NOT NULL,
 estado_convocatoria NUMERIC(1) NOT NULL DEFAULT 0,
 id_requerimiento INT NOT NULL,
 id_tipo_reclutamiento CHAR(1) NOT NULL,
 PRIMARY KEY (num_convocatoria),
 FOREIGN KEY (id_requerimiento) REFERENCES Requerimiento(id_requerimiento),
 UNIQUE (id_requerimiento),
 FOREIGN KEY (id_tipo_reclutamiento) REFERENCES Tipo_reclutamiento(id_tipo_reclutamiento)
);

CREATE TABLE Convocatoria_Plataforma
(
    num_convocatoria INT NOT NULL,
    id_plataforma INT NOT NULL,
    FOREIGN KEY (id_plataforma) REFERENCES plataforma_reclutamiento(id_plataforma),
    FOREIGN KEY (num_convocatoria) REFERENCES Convocatoria(num_convocatoria)
);

CREATE TABLE Convocatoria_Empresa_Externa
(
    num_convocatoria INT NOT NULL,
    ruc numeric(11) NOT NULL,
    FOREIGN KEY (num_convocatoria) REFERENCES convocatoria(num_convocatoria),
    FOREIGN KEY (ruc) REFERENCES empresa_externa(ruc)
);

CREATE TABLE Postulante_convocatoria
(
 id_postulante INT NOT NULL,
 num_convocatoria INT NOT NULL,
 PRIMARY KEY (id_postulante, num_convocatoria),
 FOREIGN KEY (id_postulante) REFERENCES Postulante(id_postulante),
 FOREIGN KEY (num_convocatoria) REFERENCES Convocatoria(num_convocatoria)
);

CREATE TABLE Empleado_convocatoria
(
 id_persona INT NOT NULL,
 num_convocatoria INT NOT NULL,
 PRIMARY KEY (id_persona, num_convocatoria),
 FOREIGN KEY (id_persona) REFERENCES Empleado(id_persona),
 FOREIGN KEY (num_convocatoria) REFERENCES Convocatoria(num_convocatoria)
);

CREATE TABLE Fase
(
 id_fase NUMERIC(1) NOT NULL,
 nombre_fase VARCHAR(60) NOT NULL,
 desc_fase VARCHAR NOT NULL,
 PRIMARY KEY (id_fase)
);

CREATE TABLE Fases_Reclutamiento_Seleccion
(
 cod_fase SERIAL NOT NULL,
 num_convocatoria INT NOT NULL,
 id_fase NUMERIC(1) NOT NULL,
 PRIMARY KEY (cod_fase),
 FOREIGN KEY (num_convocatoria) REFERENCES Convocatoria(num_convocatoria),
 FOREIGN KEY (id_fase) REFERENCES Fase(id_fase)
);

CREATE TABLE Modalidad_entrevista
(
 id_modalidadentrevista CHAR(1) NOT NULL,
 descripcion_modalidad VARCHAR(50) NOT NULL,
 PRIMARY KEY (id_modalidadentrevista)
);

CREATE TABLE Entrevista
(
 id_entrevista SERIAL NOT NULL,
 hora_inicio TIME NOT NULL,
 hora_fin TIME NOT NULL,
 fecha_entrevista DATE NOT NULL,
 cod_fase INT NOT NULL,
 id_persona INT NOT NULL,
 id_modalidadentrevista CHAR(1) NOT NULL,
 PRIMARY KEY (id_entrevista),
 FOREIGN KEY (cod_fase) REFERENCES Fases_Reclutamiento_Seleccion(cod_fase),
 FOREIGN KEY (id_persona) REFERENCES Usuario(id_persona),
 FOREIGN KEY (id_modalidadentrevista) REFERENCES Modalidad_entrevista(id_modalidadentrevista)
);

CREATE TABLE Tipo_entrevista
(
 id_tipo_entrevista SERIAL NOT NULL,
 descripcion_tipo_entrevista VARCHAR(30) NOT NULL,
 PRIMARY KEY (id_tipo_entrevista)
);

CREATE TABLE Entrevista_TipoEntrevista
(
   id_entrevista INT NOT NULL ,
   id_tipo_entrevista INT NOT NULL ,
   PRIMARY KEY (id_entrevista, id_tipo_entrevista),
   FOREIGN KEY (id_entrevista) REFERENCES Entrevista(id_entrevista),
   FOREIGN KEY (id_tipo_entrevista) REFERENCES Tipo_entrevista(id_tipo_entrevista)
);

CREATE TABLE Postulante_entrevista
(
 resultado NUMERIC(3, 1),
 ubicacion VARCHAR(50),
 id_postulante INT NOT NULL,
 id_entrevista INT NOT NULL,
 PRIMARY KEY (id_postulante, id_entrevista),
 FOREIGN KEY (id_postulante) REFERENCES Postulante(id_postulante),
 FOREIGN KEY (id_entrevista) REFERENCES Entrevista(id_entrevista)
);

CREATE TABLE Empleado_entrevista
(
 resultado NUMERIC(3, 1) NOT NULL,
 id_persona INT NOT NULL,
 id_entrevista INT NOT NULL,
 PRIMARY KEY (id_entrevista, id_persona),
 FOREIGN KEY (id_entrevista) REFERENCES Entrevista(id_entrevista),
 FOREIGN KEY (id_persona) REFERENCES Empleado(id_persona)
);

CREATE TABLE Conocimiento
(
    id_conocimiento SERIAL NOT NULL,
    descripcion VARCHAR NOT NULL,
    PRIMARY KEY (id_conocimiento)
);

CREATE TABLE Requerimiento_Conocimiento
(
    id_requerimiento INT NOT NULL,
    id_conocimiento INT NOT NULL,
    PRIMARY KEY (id_conocimiento,id_requerimiento),
    FOREIGN KEY (id_requerimiento) REFERENCES Requerimiento(id_requerimiento),
    FOREIGN KEY (id_conocimiento) REFERENCES Conocimiento(id_conocimiento)
);


--PERSONA
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('87127672','JUAN','M','MZ c LT 8','PEREZ LOPEZ');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('76726767','MARCOS','M','MZ c LT 21','ALONSO VARGAS');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('23283728','MARCELA','F','MZ c LT 305','GONZALEZ SURCO');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('87287546','MARIA','F','MZ c LT 22','GUTIERREZ SALAS');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('12328524','AXEL','M','MZ c LT 14','HERNADEZ HERNANDEZ');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('29990000','ADRIANA CAROLINA','F','Av. General Garzon N° 654 - 658 - Jesus Maria','HERNANDEZ MONTERROZA');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('69990001','ALEJANDRO','M','Jr. Hernan Velarde 275 - Lima','ABONDANO ACEVEDO');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('59990452','CAMILO','M','Jr. Amazonas 417 - Lima','RODRIGUEZ BOTERO');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('19990251','CARLOS FELIPE','M','Jr. Damaso Antunez N° 723 - Barrio de Belen - Lima','MOGOLLON PACHON');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('63993541','CAROL RUCHINA','F','Urb. Los Pinos, Manzana A2 Lote 1-Lima','GOMEZ GIANINE');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('20990201','DANIELA','F','Jr. Callao N° 226 - Lima','HERNANDEZ BRAVO');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('32990091','JUAN ESTEBAN','M','Jr. Comercio N° 629 - Lima','LANAO SANCHEZ');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('20010001','BRIGITE','F','Pasaje Tupac Amaru 121 - Lima','POLANCO RUIZ');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('40210001','MIGUEL ANGEL','M','Calle Uno Oeste N° 060, Urb. Corpac - San Isidro - Lima Peru','AMAYA CASTAÑO');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('40210002','MIGUEL ORLANDO','M','Av. Guardia Civil N° 834, San Isidro','BETANCOURT CARDONA');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('40210003','NICOLAS','M','Republica de Panama N° 3418, San Isidro','GUILLOT LECLERC');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('40210004','PATRICIA HELENA','F','Av. Sesquicentenario N° 200 Urb. Sta. Victoria-Lima','ARBELAEZ HOYOS');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('40210005','RUBY CRISTINA','F','Jr. Independencia N° 842 - Lima','POSADA DE PERDOMO');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('40210006','SOPHIE BRIGITTE','F','Pasaje Panama N° 1209','JACCARD CHENU');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('40210007','TERESA','F','Calle La Libertad N° 619 - Lima','SANTOS ROJAS');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('40210008','THIERRY RUBEN','M','Av. Martires del Periodismo N° 627, San Carlos - Lima','BRUCKNER BLEGER');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('40210009','MARYORIE ALEXANDRA','F','Av. Conde de Nieva N° 1058, Urb. Luren - Lima','CAMARENA LAZARO');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('40210010','FABIO ANDREE','M','Calle Rivera N° 611, Lima','GUTIERREZ SANCHEZ');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('40210011','ALEXANDRA EVELYN','F','Av. Petit Thouars N.º 907 con Emilio Fernández N° 316 Urb. Santa Beatriz, Cercado de Lima','ALVARADO MARQUEZ');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('40210012','SHEYLA JUDITH','F','Av. Ricardo Palma N° 288, Miraflores','LORO MALLQUI ');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('40210013','DAVID SAMUEL','M','Av. Los Postes Oeste N° 189, San Juan de Lurigancho','ABAD ROJAS');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('40210014','ANA GIANELLA','F','Av. Guillermo Billinghurst N° 1043, San Juan de Miraflores','PEREZ BENITES');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('40210015','RAÚL ANGEL','M','Jr. Bolivia 109, Cercado de Lima','HUERTA GONZALO');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('40210016','WILLIANS ALCIDES','M','Pasaje Francisco de Zela 150 Piso 10 Lima','SÁNCHEZ DÍAZ');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('40210017','DIEGO GABRIEL','M','Av. Cuba Nº 699 Jesus Maria, Lima','MAGALLANES MANTA');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('40210018','HARRY ROBOAN','M','Jr. Mariscal Miller 1153-1157 Jesus Maria, Lima','ALZAMORA ATAHUALPA');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('40210019','MARIA LUCERO','F','Av. Arequipa Nº 934 Cercado de Lima, Lima','DEL BUSTO CARRASCO');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('40210020','SIDHNEY','F','Autopista Ramiro Priale No. 210, La Atarjea, El Agustino-Lima','ORDONEZ PAREDES');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('40210021','DYLAN ALEXANDER','M',' Av. Huando S/N - Planta de Tratamiento, Lima','CAMINO VILCARINO');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('40210022','ANJELINA LUCERO','F',' Mz. A Lote 19, Avenida Condoray, Lima','FIGUEROA VARA');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('40210023','KATY MILDRE','F','Jr. Galvez Nº 640, cercado de Lima','CARRASCO CHINCHAY');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('40210024','JOSE SEBASTIAN','M','Calle A Manzana 02 Lote 3 Asociación Victor Raul Haya De La Torre. Independencia - Lima','HUAMÁN GUZMÁN');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('40210025','ADRIAN DAVID','M','CALLE 28 S/N AA.HH. JUAN PABLO I, Los Olivos - Lima','GUANILO HILARIO');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('40210026','ALEXIA','F','JR HUSARES DE JUNIN S/N - URB HUAQUILLAY, Comas, Lima','ARGUEDAS LUIS');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('40210027','DANIELA FERNANDA','F','R. ELOY ESPINOZA SALDAÑA 709, San Marin de Porres, Lima','VALLEJOS ESPINOZA');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('40210028','CÉSAR ABEL','M','CALLE LAS DALIAS Nº 171 - URB. VALDIVIEZO, San Matin de Porres, Lima','PEÑA MANRIQUE');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('40210029','DIANA BLANCA','F','AVENIDA AV ALCAZAR CUADRA 3 - URB LEONCIO PRADO, Rimac','GOMERO AQUINO');
INSERT INTO Persona ( dni, nombre, sexo, direccion, apellido)
	VALUES
('40210030','YADHIRA MARYLENE','F','AV. LOS PROCERES 1051, Rimac, Lima','QUIÑONES ALAYO');

-- TELEFONO
INSERT INTO Telefono(celular,id_persona)
	VALUES
(906017113,1);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(953528258,1);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(968761623,2);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(922033635,3);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(956822175,4);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(900836703,4);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(965177481,4);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(945390072,5);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(990890984,6);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(965941469,6);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(917392831,7);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(939168148,8);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(937593098,9);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(935266996,9);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(980473380,10);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(995019879,11);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(988012539,12);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(938857994,13);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(932352863,14);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(940769660,14);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(923746632,15);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(921855180,16);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(977751838,16);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(995787061,16);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(935977162,17);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(971718484,17);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(967436914,18);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(910993481,18);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(907464635,19);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(974831585,20);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(986658747,21);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(986206953,22);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(916964458,23);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(916034609,23);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(974283804,24);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(900732438,25);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(974725438,26);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(998846364,27);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(945195179,28);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(922210683,28);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(936016801,29);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(947902422,30);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(939961293,30);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(951664366,31);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(957001892,32);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(944348335,33);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(954889046,33);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(972178988,34);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(968383817,35);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(951107585,35);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(980037355,36);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(953060998,37);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(970935055,38);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(904353367,38);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(903628024,39);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(923841945,40);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(950031467,41);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(903514886,41);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(989081475,42);
INSERT INTO Telefono(celular,id_persona)
	VALUES
(969114217,43);

--CORREO
INSERT INTO Correo (correo, id_persona)
	VALUES
('juanperezl@esvicsac.com.pe',1);
INSERT INTO Correo (correo, id_persona)
	VALUES
('marcosalonsov@esvicsac.com.pe',2);
INSERT INTO Correo (correo, id_persona)
	VALUES
('marcelagonzalezs@esvicsac.com.pe',3);
INSERT INTO Correo (correo, id_persona)
	VALUES
('mariagutierrezs@esvicsac.com.pe',4);
INSERT INTO Correo (correo, id_persona)
	VALUES
('axelhernandezh@esvicsac.com.pe',5);
INSERT INTO Correo (correo, id_persona)
	VALUES
('adrianahernandezm@esvicsac.com.pe',6);
INSERT INTO Correo (correo, id_persona)
	VALUES
('alejandroabondanoa@esvicsac.com.pe',7);
INSERT INTO Correo (correo, id_persona)
	VALUES
('camilorodriguezb@esvicsac.com.pe',8);
INSERT INTO Correo (correo, id_persona)
	VALUES
('carlosmogollonp@esvicsac.com.pe',9);
INSERT INTO Correo (correo, id_persona)
	VALUES
('carolgomezg@esvicsac.com.pe',10);
INSERT INTO Correo (correo, id_persona)
	VALUES
('danielahernandezb@esvicsac.com.pe',11);
INSERT INTO Correo (correo, id_persona)
	VALUES
('juanlanaos@esvicsac.com.pe',12);
INSERT INTO Correo (correo, id_persona)
	VALUES
('brigitepolancor@esvicsac.com.pe',13);
INSERT INTO Correo (correo, id_persona)
	VALUES
('miguelamayal@esvicsac.com.pe',14);
INSERT INTO Correo (correo, id_persona)
	VALUES
('miguelbetancourtc@esvicsac.com.pe',15);
INSERT INTO Correo (correo, id_persona)
	VALUES
('nicolasguillotl@esvicsac.com.pe',16);
INSERT INTO Correo (correo, id_persona)
	VALUES
('patriciaarbelaezh@esvicsac.com.pe',17);
INSERT INTO Correo (correo, id_persona)
	VALUES
('rubyposadadp@esvicsac.com.pe',18);
INSERT INTO Correo (correo, id_persona)
	VALUES
('sophiejaccardc@esvicsac.com.pe',19);
INSERT INTO Correo (correo, id_persona)
	VALUES
('teresasantosr@esvicsac.com.pe',20);
INSERT INTO Correo (correo, id_persona)
	VALUES
('thierrybrucknerb@esvicsac.com.pe',21);
INSERT INTO Correo (correo, id_persona)
	VALUES
('maryoriecamarenal@esvicsac.com.pe',22);
INSERT INTO Correo (correo, id_persona)
	VALUES
('fabiogutierrezs@esvicsac.com.pe',23);
INSERT INTO Correo (correo, id_persona)
	VALUES
('alexandraalvaradom@esvicsac.com.pe',24);
INSERT INTO Correo (correo, id_persona)
	VALUES
('sheylalorom@esvicsac.com.pe',25);
INSERT INTO Correo (correo, id_persona)
	VALUES
('daviddsa@gmail.com',26);
INSERT INTO Correo (correo, id_persona)
	VALUES
('anagpbasna@gmail.com',27);
INSERT INTO Correo (correo, id_persona)
	VALUES
('angelhgr@gmail.com',28);
INSERT INTO Correo (correo, id_persona)
	VALUES
('wialsadi@hotmail.com',29);
INSERT INTO Correo (correo, id_persona)
	VALUES
('deigagds@outlook.com',30);
INSERT INTO Correo (correo, id_persona)
	VALUES
('harryaarob@gmail.com',31);
INSERT INTO Correo (correo, id_persona)
	VALUES
('lucerodbam@hotmail.com',32);
INSERT INTO Correo (correo, id_persona)
	VALUES
('sidordopa@outlook.com',33);
INSERT INTO Correo (correo, id_persona)
	VALUES
('dcamivil@outlook.com',34);
INSERT INTO Correo (correo, id_persona)
	VALUES
('figueroa3225@outlook.com',35);
INSERT INTO Correo (correo, id_persona)
	VALUES
('kmch12220@outlook.com',36);
INSERT INTO Correo (correo, id_persona)
	VALUES
('josehg009@gmail.com',37);
INSERT INTO Correo (correo, id_persona)
	VALUES
('addaguhi10@gmail.com',38);
INSERT INTO Correo (correo, id_persona)
	VALUES
('alexia001al@hotmail.com',39);
INSERT INTO Correo (correo, id_persona)
	VALUES
('dfve-684@hotmail.com',40);
INSERT INTO Correo (correo, id_persona)
	VALUES
('cesa_pema554@gmail.com',41);
INSERT INTO Correo (correo, id_persona)
	VALUES
('dibl45ga@hotmail.com',42);
INSERT INTO Correo (correo, id_persona)
	VALUES
('ymqa.5465680@outlook.com',43);

--AREA
INSERT INTO Area(id_area, nombre_area, desc_area)
	VALUES
(1,'GERENCIA GENERAL','Planificar, dirigir, organizar y controlar las actividades de la Gerencia General');
INSERT INTO Area(id_area, nombre_area, desc_area)
	VALUES
(2,'GERENCIA ADMINISTRATIVA Y FINANZAS','Planificar, organizar, dirigir y controlar la Gestión de los Recursos Humanos, Logísticos, Contables, Activos Fijos y de Finanzas');
INSERT INTO Area(id_area, nombre_area, desc_area)
	VALUES
(3,'GERENCIA DE OPERACIONES','Formular estrategias, mejorar el rendimiento, comprar material y recursos y asegurar el cumplimiento de las normas aplicables');


--TIPO CARGO
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('GERENTE GENERAL','Planifica, proponer, organizar, aprobar, coordinar y controlar las actividades administrativas, operativas, financieras y comerciales de la empresa',1);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('ASISTENTE DE GERENCIA GENERAL','Realizar labores de apoyo  a la gestion que desarrolla la Gerencia',1);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('AUXILIAR DE MESA DE PARTES','Recibir, registrar y tramitar toda la documentacion que ingresa a la empresa',1);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('JEFE DE SISTEMAS INTEGRADOS DE GESTION','Planificar, gestionar y realizar seguimiento a los procesos de la empresa a fin de mantener el SIG',1);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('ASISTENTE DE SEGURIDAD Y SALUD EN EL TRABAJO','Planificar, gestion y realizar seguimiento el SIG y Salud en el trabajo',1);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('JEFE DE CONTROL INTERNO','Controlar y evaluar internamente la estructura organizacional, los procesos, la gestion economica y administrativa',1);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('JEFE DEL DEPARTAMENTO DE ASESORIA LEGAL','Brindar asistencia legal al Directorio, Gerencia General y demas gerencias de la empresa',1);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('ASISTENTE LEGAL','Asumir la defensa de los asuntos administrativos, judiciales , civiles , penales de la empresa',1);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('AUXILIAR LEGAL','Apoyar al jefe de Departamento de Asesoria Legal en asustos administrativos',1);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('JEFE DE DEPARTAMENTO DE TECNOLOGIA DE LA INFORMACION Y COMUNICACION','Gestionar el Departamento a traves de la elaboracion, propuesta y seguimiento a la normativas, politicas y planes en materia de tecnologias de la informacion',1);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('ASISTENTE DE ANALISIS Y PROGRAMACION','Desarrollar, dar mantenimiento , coordinar e implementar los sistema de informacion de la Empresa',1);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('ASISTENTE DE SOPORTE TECNICO','Mantenimiento preventivo y correctivo de los equipos de computo de la empresa',1);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('GERENTE DE ADMINISTRACION Y FINANZAS','Planificar, dirigir y controlar el uso de los recursos de la Empresa',2);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('ASISTENTE DE GERENCIA DE ADMINISTRACION Y FINANZAS','Realizar labores de secretariado y asistencia a la Genrencia de Administracion y Finanzas',2);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('JEFE DEL DEPARTAMENTO DE RECURSOS HUMANOS','Administrar, mantener, controlar y desarrollar una fuerza laboral indentificada de la empresa',2);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('MEDICO OCUPACIONAL','Realizar la Vigilancia a la Salud de los trabajadores',2);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('ASISTENTE DE BIENESTAR SOCIAL','Programar y ejecutar las actividades de asistencia y bienestar para el personal de la empresa',2);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('ASISTENTE DE PSOCOLOGIA','Asistir y apoyar al Jefe del Dpto. Recursos Humanos en el proceso de seleccion de personal',2);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('ASISTENTE DE COMPENSACIONES','Colaborar al Jefe del Dpto. de Recursos Humanos en la ejecucion y control de pagos de personal y otros',2);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('AUXILIAR DE COMPENSACIONES','Colaborar en el proceso de abono de remuneraciones del personal de la Empresa',2);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('ASISTENTE DE CAPTACION','Asistir y apoyar al Jefe de Dpto. Recursos Humanos en todo lo relacionado a la ejecucion y control de proceos de capacitacion',2);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('ASISTENTE DE LEGAJOS','Realizar las labores de ordenamiento, archivo y conservacion de los legajos de personal de la Empresa',2);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('AUXILIAR DE LEGAJOS','Colaborar en las labores de ordenamiento, archivo y conservacion de los legajos de personal de la Empresa',2);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('ASISTENTE DE DPTO. DE RECURSOS HUMANOS','Realizar labores de apoyo a la gestion que desarrolla la Jefatura de Recursos Humanos',2);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('AUXILIAR DE PERSONAL','Colboarar con el Asistente de Personal en todo lo concerniente a la ejecucion de las actividades de registro y control propias',2);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('JEFE DE DEPARTAMENTO DE LOGISTICA','Gestionar las actividades referentes a los procesos para la adquisiciones de bienes y servicios',2);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('ASISTENTE DE ALMACEN','Planificar y controlar las actividades relacionadas con el almacenamiento y despacho de bienes adquiridos',2);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('ASISTENTE DE MANTENIMIENTO DE SEGURIDAD','Efectuar labores tecnicas referidas a los sistemas de comunicaciones y de seguridad electronica',2);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('JEFE DEL DEPARTAMENTO DE CONTABILIDAD Y PRESUPUESTO','Organizar y dirigir el proceos contable y presupuestal',2);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('JEFE DE DEPARTAMENTO DE TESORERIA','Ejecutar y controlar las actividades referentes a la administraci�n de fondos, de acuerdo a las Directivas',2);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('SUPERVISOR ESPECIAL DE INSTRUCCION','Planificar, dirigir y controlar el proceso de instruccion y capacitacion de acuerdo a los lineamientos con el cliente y SUCAMEC',3);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('INSTRUCTOR','Instruir al personal operativo, postulantes y/o clientes, en general a traves de los diferentes cursos',3);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('SUPERVISOR TRAMITES ESPECIALES','Realizar lis tramites administrativos a nivel nacional en relacion a la documentacion a entregar a la SUCAMEC',3);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('SUPERVISOR ESPECIAL DE CENTRO DE CONTROL','Organizar, dirigir y controlar las actividades del Centro de Control de la empresa',3);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('SUPERVISOR CENTRO DE CONTROL','Supervisar el relevo de los Operadores del Centro de Control y Choferes',3);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('OPERADOR CENTRO DE CONTROL','Centralizar las novedades producidas en todas las unidades a nivel nacional',3);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('CHOFER','Realizar labores de conduccion de vehiculos en apoyo a las labores operativas de campo, y/o administrativas cuando aplique',3);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('SUPERVISOR ESPECIAL CLIENTES PUBLICOS - LIMA','Recibir de manera centralizada las ocurrencias producidas en todas las unidades de los clientes a su cargo',3);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('SUPERVISOR ESPECIAL CLIENTES PRIVADOS','Recibir de manera centralizada las novedades producidas en todas las unidades de los clientes a su cargo',3);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('SUPERVISOR ESPECIAL CLIENTE ESSALUD','Recibir de manera centralizada las novedades producidas en todas las unidades de ESSALUD de Lima segun corresponda',3);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('SUPERVISOR DE CONFORMIADADES DE ESSALUD','realizar actividades de elaboracion, coordinacion y seguimiento de conformidades mensuales del cliente ESSALUD',3);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('SUPERVISOR - COORDINACION DE PROVINCIAS','Supervisar, verificar , controlar y coordinar el normal desarrollo del servicio en las unidades de provincias, de acuerdo a las necesidades del cliente',3);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('SUPERVISOR ZONAL PROVINCIA','Administrar y supervisar las operaciones de las unidades de servicio en la zona(provincia) asignada',3);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('SUPERVISOR ZONAL LIMA','Administrar y supervisar las operaciones de las unidades de servicio en Lima metropolitana y Callao segun corresponda',3);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('SUPERVISOR RESIDENTE','Asistir en la ejecucion de la supervision de las operaciones de las unidades de servicio en Lima Metropolitana y callao, y en provincias segun corresponda',3);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('JEFE DE GRUPO','Apoyar al Supervisor Residente en la supervision de las actividades operativas de la unidad asignada',3);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('RECEPCIONISTA / ORIENTADORA','Brindar servicio de recepcion en las instalaciones de los clientes, segun contrato',3);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('AGENTE DE VIGILANCIA','Brindar servicio de vigilancia a los clientes ,segun contrato',3);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('AGENTE ESPECIAL ARMADO','Brindar servicio de vigilancia con armamento a los clientes, segun contrato',3);
INSERT INTO tipo_cargo (nombre_cargo, desc_cargo, id_area)
	VALUES
('GERENTE DE OPERACIONES','Planificar, organizar, dirigir y controlar la ejecución del plan de actividades y el presupuesto de la Gerencia de Operaciones, con el fin de cumplir con los objetivos, funciones y metas asignados',3);


--EMPLEADO
INSERT INTO Empleado(rol,id_persona,id_cargo)
	VALUES
('Direccion estrategica',1,1);
INSERT INTO Empleado(rol,id_persona,id_cargo)
	VALUES
('Direccion financiera',2,13);
INSERT INTO Empleado(rol,id_persona,id_cargo)
	VALUES
('Direccion operativa',3,50);
INSERT INTO Empleado(rol,id_persona,id_cargo)
	VALUES
('Captaacion de talento',4,15);
INSERT INTO Empleado(rol,id_persona,id_cargo)
	VALUES
('Asistencia psicologica',5,18);
INSERT INTO Empleado(rol,id_persona,id_cargo)
	VALUES
('Asistencia psicologica',6,18);
INSERT INTO Empleado(rol,id_persona,id_cargo)
	VALUES
('Asistencia psicologica',7,18);
INSERT INTO Empleado(rol,id_persona,id_cargo)
	VALUES
('Asistente gerencial',8,2);
INSERT INTO Empleado(rol,id_persona,id_cargo)
	VALUES
('Auxiliar',9,3);
INSERT INTO Empleado(rol,id_persona,id_cargo)
	VALUES
('Jefatura SIG',10,4);
INSERT INTO Empleado(rol,id_persona,id_cargo)
	VALUES
('Seguimiento de seguridad',11,5);
INSERT INTO Empleado(rol,id_persona,id_cargo)
	VALUES
('Control interno',12,6);
INSERT INTO Empleado(rol,id_persona,id_cargo)
	VALUES
('Jefatura legal',13,7);
INSERT INTO Empleado(rol,id_persona,id_cargo)
	VALUES
('Defensa legal',14,8);
INSERT INTO Empleado(rol,id_persona,id_cargo)
	VALUES
('Apoyo de defensa legal',15,9);
INSERT INTO Empleado(rol,id_persona,id_cargo)
	VALUES
('Jefatura TIC',16,10);
INSERT INTO Empleado(rol,id_persona,id_cargo)
	VALUES
('Asistencia de programacion',17,11);
INSERT INTO Empleado(rol,id_persona,id_cargo)
	VALUES
('Soporte tecnico',18,12);
INSERT INTO Empleado(rol,id_persona,id_cargo)
	VALUES
('Asistencia de finanzas',19,14);
INSERT INTO Empleado(rol,id_persona,id_cargo)
	VALUES
('Vigilancia a la salud',20,16);
INSERT INTO Empleado(rol,id_persona,id_cargo)
	VALUES
('Asistencia social',21,17);
INSERT INTO Empleado(rol,id_persona,id_cargo)
	VALUES
('Control de pagos',22,19);
INSERT INTO Empleado(rol,id_persona,id_cargo)
	VALUES
('Auxiliar de control de pagos',23,20);
INSERT INTO Empleado(rol,id_persona,id_cargo)
	VALUES
('Control de capacitacion',24,21);
INSERT INTO Empleado(rol,id_persona,id_cargo)
	VALUES
('Asistencia de legajos',25,22);


--HISTORIAL EXPERIENCIA


--USUARIO
INSERT INTO Usuario(contrasenia, id_persona)
	VALUES
(MD5('gerente1234'),1);
INSERT INTO Usuario(contrasenia, id_persona)
	VALUES
(MD5('finanzas'),2);
INSERT INTO Usuario(contrasenia, id_persona)
	VALUES
(MD5('operaciones'),3);
INSERT INTO Usuario(contrasenia, id_persona)
	VALUES
(MD5('rrhhpasswordd'),4);
INSERT INTO Usuario(contrasenia, id_persona)
	VALUES
(MD5('psicologia'),5);
INSERT INTO Usuario(contrasenia, id_persona)
	VALUES
(MD5('123321'),6);
INSERT INTO Usuario(contrasenia, id_persona)
	VALUES
(MD5('contraseña'),7);


--REQUERIMIENTO
INSERT INTO Requerimiento(num_vacantes, estado_aprobacion, id_cargo_requerida, comentarios, id_solicitante, fecha_emision)
-- AGENTE DE SEGURIDAD
 VALUES (
  5,
  'Se solicita personal profesional altamente capacitado que tiene por finalidad el cumplimiento de sus funciones de protección, custodia y resguardo',
  'SI',
  49,
  'Mantener bajo control la protección, custodia y resguardo',
  '',
  3,
  '2022/04/12'
);

INSERT INTO Requerimiento(num_vacantes, estado_aprobacion, id_cargo_requerida, comentarios, id_solicitante, fecha_emision)
--OPERADOR CENTRO DE CONTROL.
VALUES (
  2,
  'Se solicita  personal con secundaria completa, herramientas de oficina a nivel usuario y deseable estudios en sistemas de seguridad integral ',
  'SI',
  36,
  'hacer seguimiento de la supervisión de las operaciones de las unidades de servicio lima y provincias',
  '',
  3,
  '2021/02/01'
);

INSERT INTO Requerimiento(num_vacantes, estado_aprobacion, id_cargo_requerida, comentarios, id_solicitante, fecha_emision)
-- SUPERVISOR TRAMITES ESPECIALES
VALUES (
  3,
 'Se solicita  personal con secundaria completa, herramientas de oficina a nivel usuarios',
  'NO',
  33,
  'Realizar trámites administrativos',
  '',
  3,
  '2021/10/09'
);

INSERT INTO Requerimiento(num_vacantes, estado_aprobacion, id_cargo_requerida, comentarios, id_solicitante, fecha_emision)
--SUPERVISOR ESPECIAL DE CENTRO  DE CONTROL
VALUES (
 3 ,
 'Se solicita personal para el levantamiento y análisis de requerimientos, desarrollo de software, construir aplicaciones y soluciones tecnológicas',
  'NO',
   34,
  'Organizar, dirigir y controlar las actividades diarias del centro de control' ,
'',
 3,
 '2022/11/02'
);

INSERT INTO Requerimiento(num_vacantes, estado_aprobacion, id_cargo_requerida, comentarios, id_solicitante, fecha_emision)
--SUPERVISOR ESPECIAL CLIENTES PÚBLICOS - LIMA
VALUES (
 1 ,
 'Se solicita personal retirado de las FF AA, policía nacional o civil con carrera profesional',
  'SI',
  38,
  'Difundir las consignas e instrucciones de la jefatura de operaciones',
'',
 3,
 '2021/08/03'
);

INSERT INTO Requerimiento(num_vacantes, estado_aprobacion, id_cargo_requerida, comentarios, id_solicitante, fecha_emision)
--SUPERVISOR ESPECIAL DE INSTRUCCIÓN
VALUES (
 1 ,
 'Se solicita personal responsable de asesorar, resolver problemas y servir de enlace entre los subordinados y la alta dirección.',
  'SI',
  31,
  'Planificar , dirigir, ejecutar y controlar el proceso de instrucción y capacitación.' ,
'',
3,
'2021/03/19'
);

INSERT INTO Requerimiento(num_vacantes, estado_aprobacion, id_cargo_requerida, comentarios, id_solicitante, fecha_emision)
--INSTRUCTOR
VALUES (
 2 ,
 'Se solicita profesional con estudios superiores u oficial en situación de retiro de las FF. AA.',
  'SI',
  32,
  'Instruir al personal operativo , postulantes y/o clientes ',
'',
3,
'2022/05/18'
);

INSERT INTO Requerimiento(num_vacantes, estado_aprobacion, id_cargo_requerida, comentarios, id_solicitante, fecha_emision)
-- CHOFER
VALUES (
 5,
 'Se solicita personal con estudio de secundaria completa con conocimientos basicos de mecanica y electricidad automotriz.',
  'SI',
  37,
  'Realizar labores de conducción de vehículos en apoyo a los labores operativas de campo' ,
'',
3,
'2022/04/13'
);


INSERT INTO Requerimiento(num_vacantes, estado_aprobacion, id_cargo_requerida, comentarios, id_solicitante, fecha_emision)
--RECEPCIONISTA U ORIENTADORA
VALUES (
 1,
 'Se solicita personal con estudio de secundaria completa con conocimientos básicos de secretaria y habilidades blandas.',
  'NO',
  47,
  'Brindar servicio de recepción en las instalaciones de los clientes, según contrato' ,
'',
3,
'2021/06/03'
);

INSERT INTO Requerimiento(num_vacantes, perfil_usuario, estado_aprobacion, id_cargo_requerida, desc_funciones, comentarios, id_solicitante, fecha_emision)
-- SUPERVISOR ESPECIAL CLIENTE ESSALUD
VALUES (
 2,
 'Se solicita personal con carrera tecnica afin a la gestión empresarial.',
  'NO',
  40,
  'Realizar actividades de elaboración, coordinación y seguimiento de conformidades' ,
'',
3,
'2022/03/03'
);


--DESCRIPCION_REQUERIMIENTO
INSERT INTO Descripcion_requerimiento(tipo, id_requerimiento)
--AGENTE DE SEGURIDAD
VALUES(
'Cargo de planta',
1
  );
INSERT INTO Descripcion_requerimiento(tipo, id_requerimiento)
--OPERADOR CENTRO DE CONTROL.
VALUES(
'Cargo transitorio',
2
  );

INSERT INTO Descripcion_requerimiento(tipo, id_requerimiento)
-- SUPERVISOR TRAMITES ESPECIALES
VALUES(
'Cargo transitorio',
3
  );
INSERT INTO Descripcion_requerimiento(tipo, id_requerimiento)
--SUPERVISOR ESPECIAL DE CENTRO  DE CONTROL
VALUES(
'Cargo planta',
4
  );

INSERT INTO Descripcion_requerimiento(tipo, id_requerimiento)
--SUPERVISOR ESPECIAL CLIENTES PÚBLICOS - LIMA
VALUES(
'Cargo planta',
5
  );
INSERT INTO Descripcion_requerimiento(tipo, id_requerimiento)
--SUPERVISOR ESPECIAL DE INSTRUCCIÓN
VALUES(
'Cargo planta',
6
  );

INSERT INTO Descripcion_requerimiento(tipo, id_requerimiento)
--INSTRUCTOR
VALUES(
'Cargo planta',
7
  );

INSERT INTO Descripcion_requerimiento(tipo, id_requerimiento)
--CHOFER
VALUES(
'Cargo planta',
8
  );
INSERT INTO Descripcion_requerimiento(tipo, id_requerimiento)
--RECEPCIONISTA U ORIENTADORA
VALUES(
'Cargo transitorio',
9
  );

INSERT INTO Descripcion_requerimiento(tipo, id_requerimiento)
-- SUPERVISOR ESPECIAL CLIENTE ESSALUD
VALUES(
'Cargo planta',
10
  );

--USUARIO_REQURIMIENTO


--TIPO_RECLUTAMIENTO
INSERT INTO Tipo_reclutamiento (id_tipo_reclutamiento, nombre_tipo)
  VALUES
('1','Interno');
INSERT INTO Tipo_reclutamiento (id_tipo_reclutamiento, nombre_tipo)
  VALUES
('2','Externo'); --(uso de plataformas)
INSERT INTO Tipo_reclutamiento (id_tipo_reclutamiento, nombre_tipo)
  VALUES
('3','Tercerizado'); --(contratar a otra empresa)


--PLATAFORMA_RECLUTAMIENTO
INSERT INTO Plataforma_reclutamiento (nombre, url_pagina, telefono, id_tipo_reclutamiento)
	VALUES
('Computrabajo', 'https://www.computrabajo.com.pe/', 934731049, 2);
INSERT INTO Plataforma_reclutamiento (nombre, url_pagina, telefono, id_tipo_reclutamiento)
	VALUES
('Bumeran', 'https://www.bumeran.com.pe/', 999532511, 2);
INSERT INTO Plataforma_reclutamiento (nombre, url_pagina, telefono, id_tipo_reclutamiento)
	VALUES
('Laborum', 'https://laborum.pe/', 926762141, 2);
INSERT INTO Plataforma_reclutamiento (nombre, url_pagina, telefono, id_tipo_reclutamiento)
	VALUES
('Indeed', 'https://pe.indeed.com/', 914581346, 2);
INSERT INTO Plataforma_reclutamiento (nombre, url_pagina, telefono, id_tipo_reclutamiento)
	VALUES
('Infoempleo', 'https://www.infoempleo.com/', 973245129, 2);
INSERT INTO Plataforma_reclutamiento (nombre, url_pagina, telefono, id_tipo_reclutamiento)
	VALUES
('Jooble', 'https://pe.jooble.org/', 977764283, 2);
INSERT INTO Plataforma_reclutamiento (nombre, url_pagina, telefono, id_tipo_reclutamiento)
	VALUES
('Empleos Peru', 'https://www.empleosperu.gob.pe/', 964781249, 2);


--EMPRESA EXTERNA
INSERT INTO Empresa_externa (RUC, nombre, telefono, correo, direccion, entrega, id_tipo_reclutamiento)
	VALUES
(13245682530,'BuckPeru',970521564,'contacto@buck.pe','AV. GONZALES PRADA 458 - 460','Textual',3);
INSERT INTO Empresa_externa (RUC, nombre, telefono, correo, direccion, entrega, id_tipo_reclutamiento)
	VALUES
(13245682521,'Etalentum',980521546,'contacto@etalentum.pe','AV. BRASIL Nº 515 - 519 - Lima','Textual',3);
INSERT INTO Empresa_externa (RUC, nombre, telefono, correo, direccion, entrega, id_tipo_reclutamiento)
	VALUES
(13245682900,'HeddhuntingPe',990421552,'manpower@manpower.es','JR. BUENAVENTURA AGUIRRE 398 -Lima','Textual',3);
INSERT INTO Empresa_externa (RUC, nombre, telefono, correo, direccion, entrega, id_tipo_reclutamiento)
	VALUES
(13245999562,'Adecco Peru',970221566,'servicios.peru@adecco.com','JR. GERONIMO DE ALIAGA NORTE 136 VALLE HERMOSA I ETAPA SURCO','Textual',3);
INSERT INTO Empresa_externa (RUC, nombre, telefono, correo, direccion, entrega, id_tipo_reclutamiento)
	VALUES
(57958556910,'Michael Page',978000209,'contacto.peru@michaelpage.com','Calle Las Orquídeas 675, Piso 5, Lima','Textual',3);
INSERT INTO Empresa_externa (RUC, nombre, telefono, correo, direccion, entrega, id_tipo_reclutamiento)
	VALUES
(68745259940,'RSM Peru',933698798,'contacto.peru@rsm.com','Av. De la Floresta 497, Urb. Chacarilla del Estanque, San Borja','Textual',3);


--CONVOCATORIA
INSERT INTO Convocatoria(fecha_inicio, fecha_limite, estado_convocatoria,id_requerimiento,id_tipo_reclutamiento)
-- AGENTE DE SEGURIDAD
	VALUES
('2022-04-14-','2022-04-17',0,1,'3');
INSERT INTO Convocatoria(fecha_inicio, fecha_limite, estado_convocatoria,id_requerimiento,id_tipo_reclutamiento)
--OPERADOR CENTRO DE CONTROL.
	VALUES
('2021-02-04','2021-02-16',0,2,'2');
INSERT INTO Convocatoria(fecha_inicio, fecha_limite, estado_convocatoria,id_requerimiento,id_tipo_reclutamiento)
--SUPERVISOR ESPECIAL CLIENTES PÚBLICOS - LIMA
	VALUES
('2021-03-12','2021-03-23',0,5,'2');
INSERT INTO Convocatoria(fecha_inicio, fecha_limite, estado_convocatoria,id_requerimiento,id_tipo_reclutamiento)
--SUPERVISOR ESPECIAL DE INSTRUCCIÓN
	VALUES
('2021-03-21','2021-03-28',0,6,'1');
INSERT INTO Convocatoria(fecha_inicio, fecha_limite, estado_convocatoria,id_requerimiento,id_tipo_reclutamiento)
--INSTRUCTOR
	VALUES
('2022-05-21','2022-06-04',0,7,'2');
INSERT INTO Convocatoria(fecha_inicio, fecha_limite, estado_convocatoria,id_requerimiento,id_tipo_reclutamiento)
-- CHOFER
	VALUES
('2022-04-15','2022-04-18',0,8,'3');


--POSTULANTE
INSERT INTO Postulante(cv, id_persona, RUC)
	VALUES
('https://empresa/cv/1',26,13245682530);
INSERT INTO Postulante(cv, id_persona, RUC)
	VALUES
('https://empresa/cv/2',27,13245682530);
INSERT INTO Postulante(cv, id_persona, RUC)
	VALUES
('https://empresa/cv/3',28,13245682530);
INSERT INTO Postulante(cv, id_persona, RUC)
	VALUES
('https://empresa/cv/4',29,13245682530);
INSERT INTO Postulante(cv, id_persona, RUC)
	VALUES
('https://empresa/cv/5',30,13245682530);
INSERT INTO Postulante(cv, id_persona, id_plataforma)
	VALUES
('https://empresa/cv/6',31,1);
INSERT INTO Postulante(cv, id_persona, id_plataforma)
	VALUES
('https://empresa/cv/7',32,1);
INSERT INTO Postulante(cv, id_persona, id_plataforma)
	VALUES
('https://empresa/cv/8',33,2);
INSERT INTO Postulante(cv, id_persona, id_plataforma)
	VALUES
('https://empresa/cv/9',34,3);
INSERT INTO Postulante(cv, id_persona, id_plataforma)
	VALUES
('https://empresa/cv/10',35,4);
INSERT INTO Postulante(cv, id_persona, id_plataforma)
	VALUES
('https://empresa/cv/11',36,5);
INSERT INTO Postulante(cv, id_persona, id_plataforma)
	VALUES
('https://empresa/cv/12',37,6);
INSERT INTO Postulante(cv, id_persona, id_plataforma)
	VALUES
('https://empresa/cv/13',38,7);
INSERT INTO Postulante(cv, id_persona, RUC)
	VALUES
('https://empresa/cv/14',39,13245999562);
INSERT INTO Postulante(cv, id_persona, RUC)
	VALUES
('https://empresa/cv/15',40,13245999562);
INSERT INTO Postulante(cv, id_persona, RUC)
	VALUES
('https://empresa/cv/16',41,13245999562);
INSERT INTO Postulante(cv, id_persona, RUC)
	VALUES
('https://empresa/cv/17',42,13245999562);
INSERT INTO Postulante(cv, id_persona, RUC)
	VALUES
('https://empresa/cv/18',43,13245999562);

--POSTULANTE_CONVOCATORIA
INSERT INTO Postulante_convocatoria(id_postulante, num_convocatoria)
	VALUES
(1,1);
INSERT INTO Postulante_convocatoria(id_postulante, num_convocatoria)
	VALUES
(2,1);
INSERT INTO Postulante_convocatoria(id_postulante, num_convocatoria)
	VALUES
(3,1);
INSERT INTO Postulante_convocatoria(id_postulante, num_convocatoria)
	VALUES
(4,1);
INSERT INTO Postulante_convocatoria(id_postulante, num_convocatoria)
	VALUES
(5,1);
INSERT INTO Postulante_convocatoria(id_postulante, num_convocatoria)
	VALUES
(6,2);
INSERT INTO Postulante_convocatoria(id_postulante, num_convocatoria)
	VALUES
(7,2);
INSERT INTO Postulante_convocatoria(id_postulante, num_convocatoria)
	VALUES
(8,2);
INSERT INTO Postulante_convocatoria(id_postulante, num_convocatoria)
	VALUES
(9,3);
INSERT INTO Postulante_convocatoria(id_postulante, num_convocatoria)
	VALUES
(10,3);
INSERT INTO Postulante_convocatoria(id_postulante, num_convocatoria)
	VALUES
(11,5);
INSERT INTO Postulante_convocatoria(id_postulante, num_convocatoria)
	VALUES
(12,5);
INSERT INTO Postulante_convocatoria(id_postulante, num_convocatoria)
	VALUES
(13,5);
INSERT INTO Postulante_convocatoria(id_postulante, num_convocatoria)
	VALUES
(14,6);
INSERT INTO Postulante_convocatoria(id_postulante, num_convocatoria)
	VALUES
(15,6);
INSERT INTO Postulante_convocatoria(id_postulante, num_convocatoria)
	VALUES
(16,6);
INSERT INTO Postulante_convocatoria(id_postulante, num_convocatoria)
	VALUES
(17,6);
INSERT INTO Postulante_convocatoria(id_postulante, num_convocatoria)
	VALUES
(18,6);

--EMPLEADO_CONVOCATORIA
INSERT INTO Empleado_convocatoria(id_persona, num_convocatoria)
	VALUES
(24,4);

--FASE
INSERT INTO fase (id_fase, nombre_fase, desc_fase)
	values
(1,'Entrevista Comportamiento', 'Se pretende conocer acerca del estilo de trabajo del entrevistado y como enfrenta ciertas situaciones');
INSERT INTO fase (id_fase, nombre_fase, desc_fase)
	values
(2,'Entrevista Presentacion', 'Se realiza preguntas sobre el entrevistado sobre el mismo ,experiencia laboral y sobre la vacante');
INSERT INTO fase (id_fase, nombre_fase, desc_fase)
	values
(3,'Entrevista Tecnica', 'Un representante del equipo o departamento relacionado al puesto de la vacante , realizara preguntas sobre sobre el puesto a nivel tecnico');
INSERT INTO fase (id_fase, nombre_fase, desc_fase)
	values
(4,'Entrevista Final', 'El entrevistado tendra la oportunidad de realizar preguntas al entrevistador');

--FASES_RECLUTAMIENTO_SELECCION

--MODALIDAD_ENTREVISTA
INSERT INTO Modalidad_entrevista(id_modalidadentrevista, descripcion_modalidad)
  VALUES
('1','Telefonica');
INSERT INTO Modalidad_entrevista(id_modalidadentrevista, descripcion_modalidad)
  VALUES
('2','Presencial');
INSERT INTO Modalidad_entrevista(id_modalidadentrevista, descripcion_modalidad)
  VALUES
('3','virtual');


--ENTREVISTA


--TIPO_ENTREVISTA (NO EJECUTADA POR AHORA)
INSERT INTO tipo_entrevista (descripcion_tipo_entrevista)
	VALUES
('Preselección');
INSERT INTO tipo_entrevista (descripcion_tipo_entrevista)
	VALUES
('Selección');
INSERT INTO tipo_entrevista (descripcion_tipo_entrevista)
	VALUES
('Entrevista final');
INSERT INTO tipo_entrevista (descripcion_tipo_entrevista)
	VALUES
('Individual');
INSERT INTO tipo_entrevista (descripcion_tipo_entrevista)
	VALUES
('Grupo');
INSERT INTO tipo_entrevista (descripcion_tipo_entrevista)
	VALUES
('Panel');
INSERT INTO tipo_entrevista (descripcion_tipo_entrevista)
	VALUES
('Estructurada');
INSERT INTO tipo_entrevista (descripcion_tipo_entrevista)
	VALUES
('No estructurada');
INSERT INTO tipo_entrevista (descripcion_tipo_entrevista)
	VALUES
('Mixta');
INSERT INTO tipo_entrevista (descripcion_tipo_entrevista)
	VALUES
('Conductual');
INSERT INTO tipo_entrevista (descripcion_tipo_entrevista)
	VALUES
('Provocación de tensión');


--ENTREVISTA_TIPOENTREVISTA


--POSTULANTE_ENTREVISTA


--EMPLEADO_ENTREVISTA