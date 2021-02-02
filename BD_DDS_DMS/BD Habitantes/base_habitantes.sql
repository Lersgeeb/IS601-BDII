CREATE TABLE tblPaises(
	idPais INT PRIMARY KEY,
	nombrePais VARCHAR2(50)
);

CREATE TABLE tblDepartamentos(
	idDepartamento INT PRIMARY KEY,
	nombreDepartamento VARCHAR2(50),	
	idPais INT
);

CREATE TABLE tblMunicipios(
	idMunicipio INT PRIMARY KEY,
	nombreMunicipio VARCHAR2(50),
	idDepartamento INT
);

CREATE TABLE tblHabitantes(
	idHabitante INT PRIMARY KEY,
	nombreHabitante VARCHAR2(100),
	idMunicipio INT
);

CREATE TABLE tblHistoricoHabitantes(
	idHistoricoHab INT PRIMARY KEY,
	idHabitante INT,
	nombreHabitante VARCHAR2(100),
	idMunicipio INT
);

ALTER TABLE tblHabitantes
ADD FOREIGN KEY (idMunicipio)
REFERENCES tblMunicipios(idMunicipio);

ALTER TABLE tblMunicipios
ADD FOREIGN KEY (idDepartamento)
REFERENCES tblDepartamentos(idDepartamento);

ALTER TABLE tblDepartamentos
ADD FOREIGN KEY (idPais)
REFERENCES tblPaises(idPais);


INSERT INTO tblPaises (idPais, nombrePais) 
VALUES (1, 'Honduras');
INSERT INTO tblPaises (idPais, nombrePais) 
VALUES (2,'Nicaragua');



INSERT INTO tblDepartamentos (idDepartamento, nombreDepartamento, idPais) 
VALUES (1, 'Francisco Morazan', 1);
INSERT INTO tblDepartamentos (idDepartamento, nombreDepartamento, idPais) 
VALUES (2, 'Cortes', 1);
INSERT INTO tblDepartamentos (idDepartamento, nombreDepartamento, idPais) 
VALUES (3, 'Leon', 2);
INSERT INTO tblDepartamentos (idDepartamento, nombreDepartamento, idPais) 
VALUES (4, 'Chinandega', 2);



INSERT INTO tblMunicipios (idMunicipio, nombreMunicipio, idDepartamento) 
VALUES (1, 'Tegucigalpa', 1);
INSERT INTO tblMunicipios (idMunicipio, nombreMunicipio, idDepartamento) 
VALUES (2, 'Ojojona', 1);
INSERT INTO tblMunicipios (idMunicipio, nombreMunicipio, idDepartamento) 
VALUES (3, 'San Pedro Sula', 2);
INSERT INTO tblMunicipios (idMunicipio, nombreMunicipio, idDepartamento) 
VALUES (4, 'Choloma', 2);
INSERT INTO tblMunicipios (idMunicipio, nombreMunicipio, idDepartamento) 
VALUES (5, 'Leon', 3);
INSERT INTO tblMunicipios (idMunicipio, nombreMunicipio, idDepartamento) 
VALUES (6, 'Nagarote', 3);
INSERT INTO tblMunicipios (idMunicipio, nombreMunicipio, idDepartamento) 
VALUES (7, 'Chichigalpa', 4);
INSERT INTO tblMunicipios (idMunicipio, nombreMunicipio, idDepartamento) 
VALUES (8, 'Somotillo', 4);



INSERT INTO tblHabitantes (idHabitante, nombreHabitante, idMunicipio) 
VALUES (1, 'Roberto Bueso', 1);
INSERT INTO tblHabitantes (idHabitante, nombreHabitante, idMunicipio) 
VALUES (2, 'Julio Gonzales', 5);
INSERT INTO tblHabitantes (idHabitante, nombreHabitante, idMunicipio) 
VALUES (3, 'Allan Pineda', 1);
INSERT INTO tblHabitantes (idHabitante, nombreHabitante, idMunicipio) 
VALUES (4, 'Francisco Garcia', 1);
INSERT INTO tblHabitantes (idHabitante, nombreHabitante, idMunicipio) 
VALUES (5, 'Santiago', 3);
INSERT INTO tblHabitantes (idHabitante, nombreHabitante, idMunicipio) 
VALUES (6, 'Denis Espinoza', 5);
INSERT INTO tblHabitantes (idHabitante, nombreHabitante, idMunicipio) 
VALUES (7, 'Francis Medina', 4);
INSERT INTO tblHabitantes (idHabitante, nombreHabitante, idMunicipio) 
VALUES (8, 'Jose Mendez', 2);
INSERT INTO tblHabitantes (idHabitante, nombreHabitante, idMunicipio) 
VALUES (9, 'Saul Mendoza', 2);
INSERT INTO tblHabitantes (idHabitante, nombreHabitante, idMunicipio) 
VALUES (10, 'Karla Cerrato', 7);
INSERT INTO tblHabitantes (idHabitante, nombreHabitante, idMunicipio) 
VALUES (11, 'Allan Padilla', 8);
INSERT INTO tblHabitantes (idHabitante, nombreHabitante, idMunicipio) 
VALUES (12, 'Enid Pineda', 3);
INSERT INTO tblHabitantes (idHabitante, nombreHabitante, idMunicipio) 
VALUES (13, 'Jorge Escalante', 1);
INSERT INTO tblHabitantes (idHabitante, nombreHabitante, idMunicipio) 
VALUES (14, 'Valeria Medina', 5);
INSERT INTO tblHabitantes (idHabitante, nombreHabitante, idMunicipio) 
VALUES (15, 'Segio Padilla', 8);
INSERT INTO tblHabitantes (idHabitante, nombreHabitante, idMunicipio) 
VALUES (16, 'Waleska Rodriguez', 2);
INSERT INTO tblHabitantes (idHabitante, nombreHabitante, idMunicipio) 
VALUES (17, 'Diana Sabillon', 2);
INSERT INTO tblHabitantes (idHabitante, nombreHabitante, idMunicipio) 
VALUES (18, 'Tania Almendares', 6);
INSERT INTO tblHabitantes (idHabitante, nombreHabitante, idMunicipio) 
VALUES (19, 'Daisy Berrios', 6);
