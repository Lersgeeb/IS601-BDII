CREATE TABLE alimentos (
  alimentoId VARCHAR2(20) PRIMARY KEY,
  nombre VARCHAR2(50) DEFAULT '' NOT NULL,
  costo NUMERIC(10) DEFAULT 0 NOT NULL
  );

CREATE TABLE dieta (
  dietaId VARCHAR2(20) PRIMARY KEY,
  descripcion VARCHAR2(500)
);

CREATE TABLE alimentosxdieta (
  alimentoId VARCHAR2(20),
  dietaId VARCHAR2(20),
  cantidad NUMERIC(10) DEFAULT 0 NOT NULL,
  PRIMARY KEY(alimentoId, dietaId),
  CONSTRAINT FK_alimentosxdieta_2 FOREIGN KEY (alimentoId) REFERENCES alimentos (alimentoId) ON DELETE CASCADE,
  CONSTRAINT FK_alimentosxdieta_1 FOREIGN KEY (dietaId) REFERENCES dieta (dietaId) ON DELETE CASCADE
) ;

CREATE TABLE animales (
  animalId VARCHAR2(20) PRIMARY KEY,
  especie VARCHAR2(50) DEFAULT '' NOT NULL,
  nombre VARCHAR2(50) DEFAULT '' NOT NULL,
  peso NUMERIC(10) DEFAULT 0 NOT NULL,
  fechaNacimiento date NOT NULL,
  lugarCodigo VARCHAR2(20) DEFAULT '' NOT NULL
);

CREATE TABLE animalxdieta (
  animalId VARCHAR2(20),
  dietaId VARCHAR2(20),
  fechaInicio date NOT NULL,
  fechaFinal date NOT NULL,
  PRIMARY KEY (animalId, dietaId),
  CONSTRAINT FK_animalxdieta_2 FOREIGN KEY (dietaId) REFERENCES dieta (dietaId) ON DELETE CASCADE,
  CONSTRAINT FK_animalxdieta_1 FOREIGN KEY (animalId) REFERENCES animales (animalId) ON DELETE CASCADE
);

CREATE TABLE nutriente (
  nutrienteId VARCHAR2(20) PRIMARY KEY,
  nombre VARCHAR2(50) NOT NULL
);

CREATE TABLE nutrientesxalimento (
  alimentoId VARCHAR2(20),
  nutrienteId VARCHAR2(20),
  cantidad NUMERIC(10) DEFAULT 0 NOT NULL,
  PRIMARY KEY(alimentoId, nutrienteId),
  CONSTRAINT FK_nutrientesxalimento_2 FOREIGN KEY (nutrienteId) REFERENCES nutriente (nutrienteId) ON DELETE CASCADE,
  CONSTRAINT FK_nutrientesxalimento_1 FOREIGN KEY (alimentoId) REFERENCES alimentos (alimentoId) ON DELETE CASCADE
);

CREATE TABLE tomas (
  tomaId VARCHAR2(20) PRIMARY KEY,
  hora TIMESTAMP NOT NULL ,
  fecha date NOT NULL,
  animalId VARCHAR2(20) NOT NULL,
  dietaId VARCHAR2(20) NOT NULL,
  CONSTRAINT FK_tomas_1 FOREIGN KEY (animalId, dietaId) REFERENCES animalxdieta (animalId, dietaId) ON DELETE CASCADE
);

INSERT INTO alimentos (alimentoId,nombre,costo) VALUES  ('145813','Alimento 5',110);
INSERT INTO alimentos (alimentoId,nombre,costo) VALUES ('49183MJ','Alimento 3',225);
INSERT INTO alimentos (alimentoId,nombre,costo) VALUES  ('ASADA','Alimento 7',345);
INSERT INTO alimentos (alimentoId,nombre,costo) VALUES  ('FDFSFS','Avena',50);
INSERT INTO alimentos (alimentoId,nombre,costo) VALUES  ('GKFJKAJ','Alimento 2',400);
INSERT INTO alimentos (alimentoId,nombre,costo) VALUES  ('KFS91049','Alimento 1',120);
INSERT INTO alimentos (alimentoId,nombre,costo) VALUES  ('MNKJA','Alimento 6',234);
INSERT INTO alimentos (alimentoId,nombre,costo) VALUES  ('QDSAS','Alimento 8',450);
INSERT INTO alimentos (alimentoId,nombre,costo) VALUES  ('SFSGS1','Alimento 4',370);

INSERT INTO dieta (dietaId,descripcion) VALUES ('134134','Dieta diseñada para eliminar la carencia de Riboflavina');
INSERT INTO dieta (dietaId,descripcion) VALUES ('342567','Dieta diseñada para eliminar la carencia de Vitamina A');
INSERT INTO dieta (dietaId,descripcion) VALUES ('423872','Dieta diseñada para eliminar la carencia de Vitamina C');
INSERT INTO dieta (dietaId,descripcion) VALUES ('521413','Dieta diseñada para eliminar la carencia de Carbohidratos');

INSERT INTO alimentosxdieta (alimentoId,dietaId,cantidad) VALUES ('145813','134134',10);
INSERT INTO alimentosxdieta (alimentoId,dietaId,cantidad) VALUES ('145813','521413',6);
INSERT INTO alimentosxdieta (alimentoId,dietaId,cantidad) VALUES ('49183MJ','342567',3);
INSERT INTO alimentosxdieta (alimentoId,dietaId,cantidad) VALUES ('49183MJ','423872',4);
INSERT INTO alimentosxdieta (alimentoId,dietaId,cantidad) VALUES ('FDFSFS','423872',4);
INSERT INTO alimentosxdieta (alimentoId,dietaId,cantidad) VALUES ('FDFSFS','521413',3);
INSERT INTO alimentosxdieta (alimentoId,dietaId,cantidad) VALUES ('GKFJKAJ','134134',12);
INSERT INTO alimentosxdieta (alimentoId,dietaId,cantidad) VALUES ('GKFJKAJ','521413',3);
INSERT INTO alimentosxdieta (alimentoId,dietaId,cantidad) VALUES ('KFS91049','342567',5);
INSERT INTO alimentosxdieta (alimentoId,dietaId,cantidad) VALUES ('KFS91049','423872',2);
INSERT INTO alimentosxdieta (alimentoId,dietaId,cantidad) VALUES ('SFSGS1','342567',7);
INSERT INTO alimentosxdieta (alimentoId,dietaId,cantidad) VALUES ('SFSGS1','521413',8);

INSERT INTO animales (animalId,especie,nombre,peso,fechaNacimiento,lugarCodigo) VALUES ('A-01-D1','mamifero','Caballo',500,TO_DATE('2000-01-01','YYYY-MM-DD'),'Lomo');
INSERT INTO animales (animalId,especie,nombre,peso,fechaNacimiento,lugarCodigo) VALUES ('D-DA-12','mamifero','Vaca',550,TO_DATE('2002-12-24','YYYY-MM-DD'),'Lomo');
INSERT INTO animales (animalId,especie,nombre,peso,fechaNacimiento,lugarCodigo) VALUES ('F-11-KL','mamifero','Cordero',31,TO_DATE('1999-04-05','YYYY-MM-DD'),'Lomo');
INSERT INTO animales (animalId,especie,nombre,peso,fechaNacimiento,lugarCodigo) VALUES ('F-12-FS','mamifero','Cordero',34,TO_DATE('1999-01-10','YYYY-MM-DD'),'Oreja');
INSERT INTO animales (animalId,especie,nombre,peso,fechaNacimiento,lugarCodigo) VALUES ('G-12-AA','mamifero','Vaca',550,TO_DATE('2003-10-24','YYYY-MM-DD'),'Lomo');
INSERT INTO animales (animalId,especie,nombre,peso,fechaNacimiento,lugarCodigo) VALUES ('K-12-DA','mamifero','Caballo',590,TO_DATE('2001-02-28','YYYY-MM-DD'),'Oreja');
INSERT INTO animales (animalId,especie,nombre,peso,fechaNacimiento,lugarCodigo) VALUES ('L-03-D8','mamifero','Vaca',600,TO_DATE('1990-10-23','YYYY-MM-DD'),'Oreja');

INSERT INTO animalxdieta (animalId,dietaId,fechaInicio,fechaFinal) VALUES ('A-01-D1','134134',TO_DATE('2003-11-15','YYYY-MM-DD'),TO_DATE('2003-11-28','YYYY-MM-DD'));
INSERT INTO animalxdieta (animalId,dietaId,fechaInicio,fechaFinal) VALUES ('D-DA-12','342567',TO_DATE('1999-01-01','YYYY-MM-DD'),TO_DATE('1999-02-01','YYYY-MM-DD'));
INSERT INTO animalxdieta (animalId,dietaId,fechaInicio,fechaFinal) VALUES ('F-11-KL','521413',TO_DATE('1999-01-01','YYYY-MM-DD'),TO_DATE('1999-03-04','YYYY-MM-DD'));
INSERT INTO animalxdieta (animalId,dietaId,fechaInicio,fechaFinal) VALUES ('F-12-FS','423872',TO_DATE('1999-11-01','YYYY-MM-DD'),TO_DATE('1999-12-09','YYYY-MM-DD'));
INSERT INTO animalxdieta (animalId,dietaId,fechaInicio,fechaFinal) VALUES ('G-12-AA','134134',TO_DATE('2005-04-29','YYYY-MM-DD'),TO_DATE('2005-07-10','YYYY-MM-DD'));
INSERT INTO animalxdieta (animalId,dietaId,fechaInicio,fechaFinal) VALUES ('G-12-AA','342567',TO_DATE('1999-01-01','YYYY-MM-DD'),TO_DATE('1999-01-28','YYYY-MM-DD'));
INSERT INTO animalxdieta (animalId,dietaId,fechaInicio,fechaFinal) VALUES ('K-12-DA','423872',TO_DATE('2005-06-09','YYYY-MM-DD'),TO_DATE('2006-07-09','YYYY-MM-DD'));
INSERT INTO animalxdieta (animalId,dietaId,fechaInicio,fechaFinal) VALUES ('L-03-D8','342567',TO_DATE('1999-01-01','YYYY-MM-DD'),TO_DATE('1999-02-05','YYYY-MM-DD'));

INSERT INTO nutriente (nutrienteId,nombre) VALUES ('78137SA','proteina');
INSERT INTO nutriente (nutrienteId,nombre) VALUES ('ADFASD','carbohidrato');
INSERT INTO nutriente (nutrienteId,nombre) VALUES ('DGAFAS','Calcio');
INSERT INTO nutriente (nutrienteId,nombre) VALUES ('G12NK9','vitamina C');
INSERT INTO nutriente (nutrienteId,nombre) VALUES ('MAHAD','Magnesio');
INSERT INTO nutriente (nutrienteId,nombre) VALUES ('R1N2B1','riboflavina');
INSERT INTO nutriente (nutrienteId,nombre) VALUES ('Y13121','vitamina A');

INSERT INTO nutrientesxalimento (alimentoId,nutrienteId,cantidad) VALUES ('145813','78137SA',3);
INSERT INTO nutrientesxalimento (alimentoId,nutrienteId,cantidad) VALUES ('145813','R1N2B1',4);
INSERT INTO nutrientesxalimento (alimentoId,nutrienteId,cantidad) VALUES ('145813','Y13121',6);
INSERT INTO nutrientesxalimento (alimentoId,nutrienteId,cantidad) VALUES ('49183MJ','R1N2B1',7);
INSERT INTO nutrientesxalimento (alimentoId,nutrienteId,cantidad) VALUES ('49183MJ','Y13121',10);
INSERT INTO nutrientesxalimento (alimentoId,nutrienteId,cantidad) VALUES ('ASADA','DGAFAS',10);
INSERT INTO nutrientesxalimento (alimentoId,nutrienteId,cantidad) VALUES ('ASADA','MAHAD',7);
INSERT INTO nutrientesxalimento (alimentoId,nutrienteId,cantidad) VALUES ('FDFSFS','78137SA',3);
INSERT INTO nutrientesxalimento (alimentoId,nutrienteId,cantidad) VALUES ('GKFJKAJ','78137SA',8);
INSERT INTO nutrientesxalimento (alimentoId,nutrienteId,cantidad) VALUES ('GKFJKAJ','ADFASD',14);
INSERT INTO nutrientesxalimento (alimentoId,nutrienteId,cantidad) VALUES ('KFS91049','ADFASD',16);
INSERT INTO nutrientesxalimento (alimentoId,nutrienteId,cantidad) VALUES ('KFS91049','G12NK9',11);
INSERT INTO nutrientesxalimento (alimentoId,nutrienteId,cantidad) VALUES ('KFS91049','R1N2B1',5);
INSERT INTO nutrientesxalimento (alimentoId,nutrienteId,cantidad) VALUES ('MNKJA','DGAFAS',8);
INSERT INTO nutrientesxalimento (alimentoId,nutrienteId,cantidad) VALUES ('MNKJA','MAHAD',5);
INSERT INTO nutrientesxalimento (alimentoId,nutrienteId,cantidad) VALUES ('QDSAS','DGAFAS',7);
INSERT INTO nutrientesxalimento (alimentoId,nutrienteId,cantidad) VALUES ('QDSAS','MAHAD',3);
INSERT INTO nutrientesxalimento (alimentoId,nutrienteId,cantidad) VALUES ('SFSGS1','G12NK9',13);
INSERT INTO nutrientesxalimento (alimentoId,nutrienteId,cantidad) VALUES ('SFSGS1','Y13121',9);

INSERT INTO tomas (tomaId,hora,fecha,animalId,dietaId) VALUES ('01',TO_DATE('2003-11-15 06:30:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2003-11-15','YYYY-MM-DD'),'A-01-D1','134134');
INSERT INTO tomas (tomaId,hora,fecha,animalId,dietaId) VALUES ('02',TO_DATE('2003-11-16 12:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2003-11-16','YYYY-MM-DD'),'A-01-D1','134134');
INSERT INTO tomas (tomaId,hora,fecha,animalId,dietaId) VALUES ('03',TO_DATE('2003-11-28 17:30:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2003-11-28','YYYY-MM-DD'),'A-01-D1','134134');
INSERT INTO tomas (tomaId,hora,fecha,animalId,dietaId) VALUES ('04',TO_DATE('1999-01-01 07:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('1999-01-01','YYYY-MM-DD'),'D-DA-12','342567');
INSERT INTO tomas (tomaId,hora,fecha,animalId,dietaId) VALUES ('05',TO_DATE('1999-01-28 13:15:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('1999-01-28','YYYY-MM-DD'),'G-12-AA','342567');
INSERT INTO tomas (tomaId,hora,fecha,animalId,dietaId) VALUES ('06',TO_DATE('1999-02-01 19:45:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('1999-02-01','YYYY-MM-DD'),'D-DA-12','342567');
INSERT INTO tomas (tomaId,hora,fecha,animalId,dietaId) VALUES ('07',TO_DATE('2005-06-09 05:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2005-06-09','YYYY-MM-DD'),'K-12-DA','423872');
INSERT INTO tomas (tomaId,hora,fecha,animalId,dietaId) VALUES ('08',TO_DATE('1999-12-09 11:25:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('1999-12-09','YYYY-MM-DD'),'F-12-FS','423872');
INSERT INTO tomas (tomaId,hora,fecha,animalId,dietaId) VALUES ('09',TO_DATE('1999-12-09 16:30:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('1999-12-09','YYYY-MM-DD'),'F-12-FS','423872');
INSERT INTO tomas (tomaId,hora,fecha,animalId,dietaId) VALUES ('10',TO_DATE('2006-07-09 21:15:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2006-07-09','YYYY-MM-DD'),'K-12-DA','423872');
INSERT INTO tomas (tomaId,hora,fecha,animalId,dietaId) VALUES ('11',TO_DATE('1999-01-01 06:20:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('1999-01-01','YYYY-MM-DD'),'F-11-KL','521413');
INSERT INTO tomas (tomaId,hora,fecha,animalId,dietaId) VALUES ('12',TO_DATE('1999-02-02 12:15:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('1999-02-02','YYYY-MM-DD'),'F-11-KL','521413');
INSERT INTO tomas (tomaId,hora,fecha,animalId,dietaId) VALUES ('13',TO_DATE('1999-03-04 18:45:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('1999-03-04','YYYY-MM-DD'),'F-11-KL','521413');
