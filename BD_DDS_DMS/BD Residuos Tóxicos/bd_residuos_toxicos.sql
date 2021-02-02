CREATE TABLE EmpresaProductora ( 
  nif_empresa VARCHAR2(12) NOT NULL, 
  nombre_empresa VARCHAR2(40) NOT NULL,  
  ciudad_empresa VARCHAR2(20),  
  actividad VARCHAR2(80),  
  desc_empresa VARCHAR2(2000),  
    CONSTRAINT  pk_emp  
      PRIMARY KEY (nif_empresa),  
    CONSTRAINT  ck_emp  
      CHECK (nif_empresa = UPPER(nif_empresa)) ); 
CREATE TABLE Residuo ( 
  nif_empresa VARCHAR2(12) NOT NULL, 
  cod_residuo NUMBER(6,3) NOT NULL, 
  toxicidad NUMBER(3),  
  cantidad_residuo NUMBER(6),  
  desc_residuo VARCHAR2(2000),  
    CONSTRAINT  pk_res  
      PRIMARY KEY (nif_empresa, cod_residuo),  
    CONSTRAINT  fk_res_emp  
      FOREIGN KEY (nif_empresa)  
      REFERENCES EmpresaProductora(nif_empresa) 
      ON DELETE CASCADE,  
    CONSTRAINT  ck_res  
      CHECK (cod_residuo > = 0),  
    CONSTRAINT  ck_ctd  
      CHECK (cantidad_residuo > 0) ); 
CREATE TABLE Constituyente ( 
  cod_constituyente NUMBER(3) NOT NULL, 
  nombre_constituyente VARCHAR2(20) NOT NULL,  
  desc_constituyente VARCHAR2(2000),  
    CONSTRAINT  pk_con  
      PRIMARY KEY (cod_constituyente),  
    CONSTRAINT  ck_cod  
      CHECK (cod_constituyente > = 0) ); 
CREATE TABLE Residuo_Constituyente ( 
  nif_empresa VARCHAR2(12) NOT NULL, 
  cod_residuo NUMBER(6,3) NOT NULL, 
  cod_constituyente NUMBER(3) NOT NULL, 
  cantidad NUMBER(3),  
    CONSTRAINT  pk_rec  
      PRIMARY KEY (nif_empresa, cod_residuo, cod_constituyente),  
    CONSTRAINT  fk_rec_res  
      FOREIGN KEY (nif_empresa,cod_residuo)  
      REFERENCES Residuo(nif_empresa, cod_residuo) 
      ON DELETE CASCADE,  
    CONSTRAINT  fk_rec_con  
      FOREIGN KEY (cod_constituyente)  
      REFERENCES Constituyente(cod_constituyente) 
      ON DELETE CASCADE,  
    CONSTRAINT  ck_cant  
      CHECK (cantidad > 0) ); 
CREATE TABLE EmpresaTransportista ( 
  nif_emptransporte VARCHAR2(12) NOT NULL, 
  nombre_emptransporte VARCHAR2(40) NOT NULL,  
  ciudad_emptransporte VARCHAR2(30),  
  desc_emptransporte VARCHAR2(2000),  
    CONSTRAINT  pk_tra  
      PRIMARY KEY (nif_emptransporte),  
    CONSTRAINT  ck_tra  
      CHECK (nif_emptransporte = UPPER(nif_emptransporte)) ); 
CREATE TABLE Destino ( 
  cod_destino VARCHAR2(12) NOT NULL, 
  nombre_destino VARCHAR2(20) NOT NULL,  
  ciudad_destino VARCHAR2(15),  
  desc_destino VARCHAR2(2000),  
    CONSTRAINT  pk_des  
      PRIMARY KEY (cod_destino),  
    CONSTRAINT  ck_des  
      CHECK (cod_destino = UPPER(cod_destino)) ); 
CREATE TABLE Traslado ( 
  nif_empresa VARCHAR2(12) NOT NULL, 
  cod_residuo NUMBER(6,3) NOT NULL, 
  fecha_envio DATE NOT NULL, 
  cod_destino VARCHAR2(12) NOT NULL,  
  envase VARCHAR2(10),  
  fecha_llegada DATE,  
  tratamiento VARCHAR2(120),  
  cantidad_traslado NUMBER(6),  
  desc_traslado VARCHAR2(2000),  
    CONSTRAINT  pk_trl  
      PRIMARY KEY (nif_empresa, cod_residuo, fecha_envio, 
                  cod_destino),  
    CONSTRAINT  fk_trl_res  
      FOREIGN KEY (nif_empresa, cod_residuo)  
      REFERENCES Residuo(nif_empresa, cod_residuo), 
    CONSTRAINT  fk_trl_des  
      FOREIGN KEY (cod_destino)  
      REFERENCES Destino(cod_destino), 
    CONSTRAINT  ck_fecha_llegada  
      CHECK (fecha_llegada > = fecha_envio),  
    CONSTRAINT  ck_can  
      CHECK (cantidad_traslado > 0) ); 
CREATE TABLE Traslado_EmpresaTransportista ( 
  nif_empresa VARCHAR2(12) NOT NULL, 
  cod_residuo NUMBER(6,3) NOT NULL, 
  fecha_envio DATE NOT NULL, 
  cod_destino VARCHAR2(12) NOT NULL,  
  nif_emptransporte VARCHAR2(12) NOT NULL,  
  tipo_transporte VARCHAR2(15),  
  kms NUMBER(4),  
  coste NUMBER(5),  
    CONSTRAINT  pk_tet  
      PRIMARY KEY (nif_empresa, cod_residuo, fecha_envio, 
                  cod_destino, nif_emptransporte),  
    CONSTRAINT  fk_tet_trl 
      FOREIGN KEY (nif_empresa, cod_residuo, fecha_envio, 
                  cod_destino)  
      REFERENCES Traslado(nif_empresa, cod_residuo, fecha_envio, 
                 cod_destino) 
      ON DELETE CASCADE,  
    CONSTRAINT  fk_tet_tra  
      FOREIGN KEY (nif_emptransporte)  
      REFERENCES EmpresaTransportista(nif_emptransporte), 
    CONSTRAINT  ck_cos  
      CHECK (coste > = 0),  
    CONSTRAINT  ck_kms  
      CHECK (kms > 0) ); 


INSERT 
  INTO EmpresaProductora (nif_empresa,nombre_empresa, 
       ciudad_empresa,actividad,desc_empresa)
  VALUES ('A-11111111-R','Pintatum','Madrid',
         'Pinturas,barnices y lacas','Mediana empresa situada 
         en Madrid');
INSERT 
  INTO EmpresaProductora (nif_empresa,nombre_empresa,
       ciudad_empresa,actividad,desc_empresa)
  VALUES ('A-17655551-Q','Fermezquita','Córdoba',
         'Fertilizantes y plaguicidas','Empresa ubicada en Córdoba 
         para la fabricación de Fertilizantes y Plaguicidas');
INSERT 
  INTO EmpresaProductora (nif_empresa,nombre_empresa,
       ciudad_empresa,actividad,desc_empresa)
  VALUES ('R-12356711-Q','Mueblesur','Lucena',
         'Muebles y accesorios','Empresa ubicada en Lucena y 
         especializada en la construcción de muebles');
INSERT 
  INTO EmpresaProductora (nif_empresa,nombre_empresa,
       ciudad_empresa,actividad,desc_empresa)
  VALUES ('C-34534522-R','Aceioro','Montoro',
         'Aceites y grasas',
         'Empresa de aceites ubicada en Montoro');
INSERT 
  INTO EmpresaProductora (nif_empresa,nombre_empresa,
       ciudad_empresa,actividad,desc_empresa)
  VALUES ('A-98988898-Q','Vidriosmer','Málaga',
         'Vidrio y productos de vidrio',
         'Empresa ubicada en Sevilla dedicada a la fabricación de 
          productos relacionados con el vidrio');
INSERT 
  INTO EmpresaProductora (nif_empresa,nombre_empresa,
       ciudad_empresa,actividad,desc_empresa)
  VALUES ('A-98989998-Q','Carbonsur','Huelva',
         'Metales no ferrosos','Empresa ubicada en sevilla 
         dedicada a la fabricación de productos relacionados con 
         el vidrio');

-- Se inserta en la tablas Residuo
INSERT 
  INTO Residuo (nif_empresa,cod_residuo,toxicidad, 
       cantidad_residuo,desc_residuo)
  VALUES ('C-34534522-R',1.01,100,614000,
         'Residuos de la producción de aceites vegetales');
INSERT 
  INTO Residuo (nif_empresa,cod_residuo,toxicidad,
       cantidad_residuo,desc_residuo)
  VALUES ('C-34534522-R',1.02,100,720000,
         'Residuos ácidos grasos');
INSERT 
  INTO Residuo (nif_empresa,cod_residuo,toxicidad,
       cantidad_residuo,desc_residuo)
  VALUES ('C-34534522-R',1.03,100,210000,
         'Emulusiones de aceites y grase');
INSERT 
  INTO Residuo (nif_empresa,cod_residuo,toxicidad,
       cantidad_residuo,desc_residuo)
  VALUES ('R-12356711-Q',3.06,120,830000,
         'Sales de impregnado de la madera');
INSERT 
  INTO Residuo (nif_empresa,cod_residuo,toxicidad,
       cantidad_residuo,desc_residuo)
  VALUES ('A-17655551-Q',5.01,200,345000,
         'Residuos de plaguicidas');
INSERT 
  INTO Residuo (nif_empresa,cod_residuo,toxicidad,
       cantidad_residuo,desc_residuo)
  VALUES ('A-17655551-Q',5.07,250,554000,
         'Residuos químicos de laboratorios');
INSERT 
  INTO Residuo (nif_empresa,cod_residuo,toxicidad,
       cantidad_residuo,desc_residuo)
  VALUES ('A-17655551-Q',6.12,150,150307,
         'Lodos con combustible');
INSERT 
  INTO Residuo (nif_empresa,cod_residuo,toxicidad,
       cantidad_residuo,desc_residuo)
  VALUES ('A-11111111-R',7.08,100,30000,
         'Pinturas y barnices residuales');
INSERT 
  INTO Residuo (nif_empresa,cod_residuo,toxicidad,
       cantidad_residuo,desc_residuo)
  VALUES ('A-11111111-R',7.09,289,50000,
         'Lodos de pinturas y barnices');
INSERT 
  INTO Residuo (nif_empresa,cod_residuo,toxicidad,
       cantidad_residuo,desc_residuo)
  VALUES ('A-11111111-R',8.06,300,2000,
         'Lodos y emulsiones de látex');
INSERT 
  INTO Residuo (nif_empresa,cod_residuo,toxicidad,
       cantidad_residuo,desc_residuo)
  VALUES ('A-98989998-Q',2.01,700,4000,
         'Residuos con sustancias peligrosas provinientes de 
         hornos');
INSERT 
  INTO Residuo (nif_empresa,cod_residuo,toxicidad,
       cantidad_residuo,desc_residuo)
  VALUES ('A-98989998-Q',2.02,500,800000,
         'Escoria de fundición de metales no ferrosos');
INSERT 
  INTO Residuo (nif_empresa,cod_residuo,toxicidad,
       cantidad_residuo,desc_residuo)
  VALUES ('A-98989998-Q',2.03,290,353000,
         'Escoria de salinas de la producción de metales no 
         ferrosos');
INSERT 
  INTO Residuo (nif_empresa,cod_residuo,toxicidad,
       cantidad_residuo,desc_residuo)
  VALUES ('A-98989998-Q',2.04,100,300000,
         'Cenizas de metales no ferrosos');
INSERT 
  INTO Residuo (nif_empresa,cod_residuo,toxicidad,
       cantidad_residuo,desc_residuo)
  VALUES ('A-98988898-Q',2.04,100,2000,
         'Cenizas de metales no ferrosos');
INSERT 
  INTO Residuo (nif_empresa,cod_residuo,toxicidad,
       cantidad_residuo,desc_residuo)
  VALUES ('A-11111111-R',3.06,120,830000,
         'Sales de impregnado de la madera');

-- Se inserta en la tabla Constituyente
INSERT 
  INTO Constituyente (cod_constituyente,nombre_constituyente, 
       desc_constituyente)
  VALUES (111,'Bario','');
INSERT 
  INTO Constituyente (cod_constituyente,nombre_constituyente,
       desc_constituyente)
  VALUES (112,'Lantano','');
INSERT 
  INTO Constituyente (cod_constituyente,nombre_constituyente,
       desc_constituyente)
  VALUES (113,'Actinio','');
INSERT 
  INTO Constituyente (cod_constituyente,nombre_constituyente,
       desc_constituyente)
  VALUES (114,'Beridio','');
INSERT 
  INTO Constituyente (cod_constituyente,nombre_constituyente,
       desc_constituyente)
  VALUES (115,'Magnesio','');
INSERT 
  INTO Constituyente (cod_constituyente,nombre_constituyente,
       desc_constituyente)
  VALUES (116,'Polonio','');
INSERT 
  INTO Constituyente (cod_constituyente,nombre_constituyente,
       desc_constituyente)
  VALUES (117,'Renio','');
INSERT 
  INTO Constituyente (cod_constituyente,nombre_constituyente,
       desc_constituyente)
  VALUES (118,'Tantalo','');
INSERT 
  INTO Constituyente (cod_constituyente,nombre_constituyente,
       desc_constituyente)
  VALUES (119,'Wolframio','');

-- Se inserta en la tablas ResiduoConstituyente
INSERT 
  INTO Residuo_Constituyente (nif_empresa,cod_residuo,
       cod_constituyente,cantidad)
  VALUES ('A-98988898-Q',2.04,111,2);
INSERT 
  INTO Residuo_Constituyente (nif_empresa,cod_residuo,
       cod_constituyente,cantidad)
  VALUES ('A-11111111-R',3.06,112,3);
INSERT 
  INTO Residuo_Constituyente (nif_empresa,cod_residuo,
       cod_constituyente,cantidad)
  VALUES ('C-34534522-R',1.01,111,2);
INSERT 
  INTO Residuo_Constituyente (nif_empresa,cod_residuo,
       cod_constituyente,cantidad)
  VALUES ('C-34534522-R',1.01,112,3);
INSERT 
  INTO Residuo_Constituyente (nif_empresa,cod_residuo,
       cod_constituyente,cantidad)
  VALUES ('C-34534522-R',1.01,113,5);
INSERT 
  INTO Residuo_Constituyente (nif_empresa,cod_residuo,
       cod_constituyente,cantidad)
  VALUES ('C-34534522-R',1.02,116,4);
INSERT 
  INTO Residuo_Constituyente (nif_empresa,cod_residuo,
       cod_constituyente,cantidad)
  VALUES ('C-34534522-R',1.02,117,6);
INSERT 
  INTO Residuo_Constituyente (nif_empresa,cod_residuo,
       cod_constituyente,cantidad)
  VALUES ('C-34534522-R',1.03,118,10);
INSERT 
  INTO Residuo_Constituyente (nif_empresa,cod_residuo,
       cod_constituyente,cantidad)
  VALUES ('C-34534522-R',1.03,119,11);
INSERT 
  INTO Residuo_Constituyente (nif_empresa,cod_residuo,
       cod_constituyente,cantidad)
  VALUES ('C-34534522-R',1.03,116,4);
INSERT 
  INTO Residuo_Constituyente (nif_empresa,cod_residuo,
       cod_constituyente,cantidad)
  VALUES ('R-12356711-Q',3.06,112,4);
INSERT 
  INTO Residuo_Constituyente (nif_empresa,cod_residuo,
       cod_constituyente,cantidad)
  VALUES ('R-12356711-Q',3.06,116,7);
INSERT 
  INTO Residuo_Constituyente (nif_empresa,cod_residuo,
       cod_constituyente,cantidad)
  VALUES ('A-17655551-Q',5.01,119,2);
INSERT 
  INTO Residuo_Constituyente (nif_empresa,cod_residuo,
       cod_constituyente,cantidad)
  VALUES ('A-17655551-Q',5.01,111,5);
INSERT 
  INTO Residuo_Constituyente (nif_empresa,cod_residuo,
       cod_constituyente,cantidad)
  VALUES ('A-17655551-Q',5.01,114,6);
INSERT 
  INTO Residuo_Constituyente (nif_empresa,cod_residuo,
       cod_constituyente,cantidad)
  VALUES ('A-17655551-Q',5.07,118,8);
INSERT 
  INTO Residuo_Constituyente (nif_empresa,cod_residuo,
       cod_constituyente,cantidad)
  VALUES ('A-17655551-Q',5.07,119,8);
INSERT 
  INTO Residuo_Constituyente (nif_empresa,cod_residuo,
       cod_constituyente,cantidad)
  VALUES ('A-17655551-Q',5.07,114,8);
INSERT 
  INTO Residuo_Constituyente (nif_empresa,cod_residuo,
       cod_constituyente,cantidad)
  VALUES ('A-17655551-Q',6.12,115,4);
INSERT 
  INTO Residuo_Constituyente (nif_empresa,cod_residuo,
       cod_constituyente,cantidad)
  VALUES ('A-17655551-Q',6.12,116,5);
INSERT 
  INTO Residuo_Constituyente (nif_empresa,cod_residuo,
       cod_constituyente,cantidad)
  VALUES ('A-11111111-R',7.08,111,6);
INSERT 
  INTO Residuo_Constituyente (nif_empresa,cod_residuo,
       cod_constituyente,cantidad)
  VALUES ('A-11111111-R',7.08,112,7);
INSERT 
  INTO Residuo_Constituyente (nif_empresa,cod_residuo,
       cod_constituyente,cantidad)
  VALUES ('A-11111111-R',7.09,113,1);
INSERT 
  INTO Residuo_Constituyente (nif_empresa,cod_residuo,
       cod_constituyente,cantidad)
  VALUES ('A-11111111-R',7.09,114,8);
INSERT 
  INTO Residuo_Constituyente (nif_empresa,cod_residuo,
       cod_constituyente,cantidad)
  VALUES ('A-11111111-R',8.06,113,5);
INSERT 
  INTO Residuo_Constituyente (nif_empresa,cod_residuo,
       cod_constituyente,cantidad)
  VALUES ('A-11111111-R',8.06,114,6);
INSERT 
  INTO Residuo_Constituyente (nif_empresa,cod_residuo,
       cod_constituyente,cantidad)
  VALUES ('A-98989998-Q',2.01,111,5);
INSERT 
  INTO Residuo_Constituyente (nif_empresa,cod_residuo,
       cod_constituyente,cantidad)
  VALUES ('A-98989998-Q',2.01,112,5);
INSERT 
  INTO Residuo_Constituyente (nif_empresa,cod_residuo,
       cod_constituyente,cantidad)
  VALUES ('A-98989998-Q',2.02,113,5);
INSERT 
  INTO Residuo_Constituyente (nif_empresa,cod_residuo,
       cod_constituyente,cantidad)
  VALUES ('A-98989998-Q',2.02,114,5);
INSERT 
  INTO Residuo_Constituyente (nif_empresa,cod_residuo,
       cod_constituyente,cantidad)
  VALUES ('A-98989998-Q',2.03,114,5);
INSERT 
  INTO Residuo_Constituyente (nif_empresa,cod_residuo,
       cod_constituyente,cantidad)
  VALUES ('A-98989998-Q',2.03,116,7);
INSERT 
  INTO Residuo_Constituyente (nif_empresa,cod_residuo,
       cod_constituyente,cantidad)
  VALUES ('A-98989998-Q',2.04,113,3);

-- Se inserta en la tabla EmpresaTransportista
INSERT 
  INTO EmpresaTransportista (nif_emptransporte, 
       nombre_emptransporte,ciudad_emptransporte,desc_emptransporte)
  VALUES ('A-87684567-B','Resur','En andalucía',
         'Empresa de transporte de residuos que actua en toda 
         andalucía');
INSERT 
  INTO EmpresaTransportista (nif_emptransporte,
       nombre_emptransporte,ciudad_emptransporte,desc_emptransporte)
  VALUES ('F-98987667-R','AceSur','Córdoba',
         'Empresa de transportes de residuos procedentes de 
         empresas de aceite');
INSERT 
  INTO EmpresaTransportista (nif_emptransporte,
       nombre_emptransporte,ciudad_emptransporte,desc_emptransporte)
  VALUES ('A-97654567-S','Pérez e Hijos','Madrid',
         'Empresa encargada del transporte de todo tipo de 
         residuos');
INSERT 
  INTO EmpresaTransportista (nif_emptransporte,
       nombre_emptransporte,ciudad_emptransporte,desc_emptransporte)
  VALUES ('A-98987067-V','HuelResi','Huelva',
         'Empresa encargada del transporte de todo tipo de 
         residuos en la provincia de Huelva');
INSERT 
  INTO EmpresaTransportista (nif_emptransporte,
       nombre_emptransporte,ciudad_emptransporte,desc_emptransporte)
  VALUES ('A-98985367-V','TransMadrid','Madrid',
         'Empresa encargada de los transportes en Madrid.');

-- Se inserta en la tabla Destino
INSERT 
  INTO Destino (cod_destino,nombre_destino,ciudad_destino,
       desc_destino)
  VALUES ('DESTINO-N01','VALSUR','Valencia','');
INSERT 
  INTO Destino (cod_destino,nombre_destino,ciudad_destino,
       desc_destino)
  VALUES ('DESTINO-N02','MASUR','Madrid','');
INSERT 
  INTO Destino (cod_destino,nombre_destino,ciudad_destino,
       desc_destino)
  VALUES ('DESTINO-N03','BASUR','Barcelona','');
INSERT 
  INTO Destino (cod_destino,nombre_destino,ciudad_destino,
       desc_destino)
  VALUES ('DESTINO-N04','SESUR','Málaga','');
INSERT 
  INTO Destino (cod_destino,nombre_destino,ciudad_destino,
       desc_destino)
  VALUES ('DESTINO-N05','BILSUR','Bilbao','');
INSERT 
  INTO Destino (cod_destino,nombre_destino,ciudad_destino,
       desc_destino)
  VALUES ('DESTINO-N06','VALNOR','Valencia','');
INSERT 
  INTO Destino (cod_destino,nombre_destino,ciudad_destino,
       desc_destino)
  VALUES ('DESTINO-N07','MANOR','Madrid','');
INSERT 
  INTO Destino (cod_destino,nombre_destino,ciudad_destino,
       desc_destino)
  VALUES ('DESTINO-N08','MADES','Madrid','');
INSERT 
  INTO Destino (cod_destino,nombre_destino,ciudad_destino,
       desc_destino)
  VALUES ('DESTINO-N09','BARNOR','Barcelona','');
INSERT 
  INTO Destino (cod_destino,nombre_destino,ciudad_destino,
       desc_destino)
  VALUES ('DESTINO-N10','BAREST','Barcelona','');
INSERT 
  INTO Destino (cod_destino,nombre_destino,ciudad_destino,
       desc_destino)
  VALUES ('DESTINO-N11','TASUR','Tarragona','');
INSERT 
  INTO Destino (cod_destino,nombre_destino,ciudad_destino,
       desc_destino)
  VALUES ('DESTINO-N12','TAES','Tarragona','');
INSERT 
  INTO Destino (cod_destino,nombre_destino,ciudad_destino,
       desc_destino)
  VALUES ('DESTINO-N13','COSUR','Córdoba','');
INSERT 
  INTO Destino (cod_destino,nombre_destino,ciudad_destino,
       desc_destino)
  VALUES ('DESTINO-N14','CONOR','Córdoba','');
INSERT 
  INTO Destino (cod_destino,nombre_destino,ciudad_destino,
       desc_destino)
  VALUES ('DESTINO-N15','COES','Córdoba','');
INSERT 
  INTO Destino (cod_destino,nombre_destino,ciudad_destino,
       desc_destino)
  VALUES ('DESTINO-N16','BINO','Bilbao','');

-- Se inserta en la tabla Traslado
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino, 
       envase,fecha_llegada,tratamiento,cantidad_traslado, 
       desc_traslado)
  VALUES ('C-34534522-R',1.010,TO_DATE('10/01/1990','DD/MM/YYYY'),
       'DESTINO-N01','Primario',TO_DATE('11/01/1990','DD/MM/YYYY'),
       'Incineración',23456,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('C-34534522-R',1.010,TO_DATE('10/01/1990','DD/MM/YYYY'),
       'DESTINO-N03','Primario',TO_DATE('11/01/1990','DD/MM/YYYY'),
       'Incineración',2345,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('C-34534522-R',1.010,TO_DATE('10/01/1990','DD/MM/YYYY'),
       'DESTINO-N02','Primario',TO_DATE('11/01/1990','DD/MM/YYYY'),
       'Incineración',2345,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('C-34534522-R',1.010,TO_DATE('22/02/1990','DD/MM/YYYY'),
     'DESTINO-N02','Secundario',TO_DATE('23/02/1990','DD/MM/YYYY'),
       'Incineración',31578,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('C-34534522-R',1.010,TO_DATE('22/02/1990','DD/MM/YYYY'),
     'DESTINO-N01','Secundario',TO_DATE('23/02/1990','DD/MM/YYYY'),
       'Incineración',2578,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('C-34534522-R',1.010,TO_DATE('21/04/1991','DD/MM/YYYY'),
     'DESTINO-N03','Terciario',TO_DATE('23/04/1991','DD/MM/YYYY'),
       'Incineración',60543,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('C-34534522-R',1.010,TO_DATE('21/04/1991','DD/MM/YYYY'),
      'DESTINO-N01','Terciario',TO_DATE('23/04/1991','DD/MM/YYYY'),
       'Incineración',5543,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('C-34534522-R',1.010,TO_DATE('12/01/1992','DD/MM/YYYY'),
       'DESTINO-N01','Primario',TO_DATE('13/01/1992','DD/MM/YYYY'),
       'Incineración',34456,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('C-34534522-R',1.020,TO_DATE('16/09/1990','DD/MM/YYYY'),
     'DESTINO-N13','Secundario',TO_DATE('16/09/1990','DD/MM/YYYY'),
       'Incineración',45543,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('C-34534522-R',1.020,TO_DATE('15/10/1991','DD/MM/YYYY'),
     'DESTINO-N02','Terciario',TO_DATE('16/10/1991','DD/MM/YYYY'),
       'Incineración',34554,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('C-34534522-R',1.020,TO_DATE('16/08/1992','DD/MM/YYYY'),
     'DESTINO-N03','Secundario',TO_DATE('18/08/1992','DD/MM/YYYY'),
       'Incineración',83873,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('C-34534522-R',1.020,TO_DATE('23/03/1993','DD/MM/YYYY'),
      'DESTINO-N01','Terciario',TO_DATE('24/03/1993','DD/MM/YYYY'),
       'Incineración',33433,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('C-34534522-R',1.030,TO_DATE('11/05/1994','DD/MM/YYYY'),
      'DESTINO-N02','Terciario',TO_DATE('12/05/1994','DD/MM/YYYY'),
       'Incineración',33455,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('C-34534522-R',1.030,TO_DATE('16/04/1995','DD/MM/YYYY'),
       'DESTINO-N01','Primario',TO_DATE('17/04/1995','DD/MM/YYYY'),
       'Incineración',3345,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('C-34534522-R',1.030,TO_DATE('17/06/1996','DD/MM/YYYY'),
     'DESTINO-N03','Secundario',TO_DATE('18/06/1996','DD/MM/YYYY'),
       'Incineración',34434,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('C-34534522-R',1.030,TO_DATE('25/07/1997','DD/MM/YYYY'),
      'DESTINO-N04','Terciario',TO_DATE('26/07/1997','DD/MM/YYYY'),
       'Incineración',4453,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('R-12356711-Q',3.060,TO_DATE('23/08/1998','DD/MM/YYYY'),
       'DESTINO-N01','Primario',TO_DATE('24/08/1998','DD/MM/YYYY'),
       'Incineración',34555,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('R-12356711-Q',3.060,TO_DATE('24/02/1994','DD/MM/YYYY'),
     'DESTINO-N04','Secundario',TO_DATE('25/02/1994','DD/MM/YYYY'),
       'Incineración',67543,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('R-12356711-Q',3.060,TO_DATE('21/01/1995','DD/MM/YYYY'),
       'DESTINO-N12','Primario',TO_DATE('22/01/1995','DD/MM/YYYY'),
       'Incineración',34322,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('R-12356711-Q',3.060,TO_DATE('14/03/1996','DD/MM/YYYY'),
     'DESTINO-N02','Secundario',TO_DATE('15/03/1996','DD/MM/YYYY'),
       'Incineración',23442,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('A-17655551-Q',5.010,TO_DATE('17/04/1997','DD/MM/YYYY'),
      'DESTINO-N04','Terciario',TO_DATE('18/04/1997','DD/MM/YYYY'),
       'Almacenamiento',34432,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('A-17655551-Q',5.010,TO_DATE('19/02/1998','DD/MM/YYYY'),
       'DESTINO-N03','Primario',TO_DATE('20/02/1998','DD/MM/YYYY'),
       'Almacenamiento',23322,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('A-17655551-Q',5.010,TO_DATE('18/04/1999','DD/MM/YYYY'),
     'DESTINO-N09','Secundario',TO_DATE('19/04/1999','DD/MM/YYYY'),
       'Almacenamiento',23423,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('A-17655551-Q',5.010,TO_DATE('16/06/1995','DD/MM/YYYY'),
      'DESTINO-N12','Terciario',TO_DATE('17/06/1995','DD/MM/YYYY'),
       'Almacenamiento',33423,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('A-17655551-Q',5.070,TO_DATE('10/07/1996','DD/MM/YYYY'),
     'DESTINO-N10','Secundario',TO_DATE('11/07/1996','DD/MM/YYYY'),
       'Almacenamiento',32343,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('A-17655551-Q',5.070,TO_DATE('11/08/1992','DD/MM/YYYY'),
       'DESTINO-N02','Primario',TO_DATE('12/08/1992','DD/MM/YYYY'),
       'Almacenamiento',34534,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('A-17655551-Q',5.070,TO_DATE('12/02/1990','DD/MM/YYYY'),
     'DESTINO-N12','Secundario',TO_DATE('14/02/1990','DD/MM/YYYY'),
       'Almacenamiento',44543,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('A-17655551-Q',5.070,TO_DATE('13/01/1993','DD/MM/YYYY'),
      'DESTINO-N10','Terciario',TO_DATE('15/01/1993','DD/MM/YYYY'),
       'Almacenamiento',34334,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('A-17655551-Q',6.120,TO_DATE('18/12/1994','DD/MM/YYYY'),
       'DESTINO-N02','Primario',TO_DATE('19/12/1994','DD/MM/YYYY'),
       'Almacenamiento',45543,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('A-17655551-Q',6.120,TO_DATE('19/12/1996','DD/MM/YYYY'),
      'DESTINO-N10','Terciario',TO_DATE('21/12/1996','DD/MM/YYYY'),
       'Almacenamiento',34433,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('A-17655551-Q',6.120,TO_DATE('21/10/1996','DD/MM/YYYY'),
     'DESTINO-N07','Secundario',TO_DATE('22/10/1996','DD/MM/YYYY'),
       'Almacenamiento',33444,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('A-11111111-R',7.080,TO_DATE('30/07/1994','DD/MM/YYYY'),
      'DESTINO-N11','Terciario',TO_DATE('31/07/1994','DD/MM/YYYY'),
       'Almacenamiento',15000,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('A-11111111-R',7.080,TO_DATE('27/02/1997','DD/MM/YYYY'),
       'DESTINO-N10','Primario',TO_DATE('28/02/1997','DD/MM/YYYY'),
       'Almacenamiento',15000,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('A-11111111-R',7.090,TO_DATE('25/03/1995','DD/MM/YYYY'),
     'DESTINO-N08','Secundario',TO_DATE('25/03/1995','DD/MM/YYYY'),
       'Almacenamiento',12500,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('A-11111111-R',7.090,TO_DATE('26/04/1996','DD/MM/YYYY'),
       'DESTINO-N07','Primario',TO_DATE('26/04/1996','DD/MM/YYYY'),
       'Almacenamiento',12500,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('A-11111111-R',7.090,TO_DATE('28/05/1998','DD/MM/YYYY'),
     'DESTINO-N11','Secundario',TO_DATE('29/05/1998','DD/MM/YYYY'),
       'Almacenamiento',12500,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('A-11111111-R',7.090,TO_DATE('10/08/1999','DD/MM/YYYY'),
      'DESTINO-N08','Terciario',TO_DATE('10/08/1999','DD/MM/YYYY'),
       'Almacenamiento',12500,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('A-11111111-R',8.060,TO_DATE('22/06/2000','DD/MM/YYYY'),
       'DESTINO-N07','Primario',TO_DATE('22/06/2000','DD/MM/YYYY'),
       'Almacenamiento',500,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('A-11111111-R',8.060,TO_DATE('11/01/2000','DD/MM/YYYY'),
     'DESTINO-N11','Secundario',TO_DATE('12/01/2000','DD/MM/YYYY'),
       'Almacenamiento',500,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('A-11111111-R',8.060,TO_DATE('14/08/1997','DD/MM/YYYY'),
       'DESTINO-N08','Primario',TO_DATE('14/08/1997','DD/MM/YYYY'),
       'Almacenamiento',500,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('A-11111111-R',8.060,TO_DATE('16/09/1998','DD/MM/YYYY'),
     'DESTINO-N15','Secundario',TO_DATE('17/09/1998','DD/MM/YYYY'),
       'Almacenamiento',500,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('A-98989998-Q',2.020,TO_DATE('13/11/1993','DD/MM/YYYY'),
       'DESTINO-N15','Primario',TO_DATE('14/11/1993','DD/MM/YYYY'),
       'Almacenamiento',45533,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('A-98989998-Q',2.020,TO_DATE('14/12/1994','DD/MM/YYYY'),
      'DESTINO-N14','Terciario',TO_DATE('15/12/1994','DD/MM/YYYY'),
       'Almacenamiento',34554,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('A-98989998-Q',2.020,TO_DATE('17/12/1994','DD/MM/YYYY'),
      'DESTINO-N08','Terciario',TO_DATE('17/12/1994','DD/MM/YYYY'),
       'Almacenamiento',3443,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('A-98989998-Q',2.020,TO_DATE('18/10/1996','DD/MM/YYYY'),
     'DESTINO-N06','Secundario',TO_DATE('19/10/1996','DD/MM/YYYY'),
       'Almacenamiento',34433,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('A-98989998-Q',2.030,TO_DATE('19/11/1997','DD/MM/YYYY'),
       'DESTINO-N14','Primario',TO_DATE('20/11/1997','DD/MM/YYYY'),
       'Incineración',34433,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('A-98989998-Q',2.030,TO_DATE('21/12/1998','DD/MM/YYYY'),
      'DESTINO-N15','Terciario',TO_DATE('22/12/1998','DD/MM/YYYY'),
       'Incineración',12345,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('A-98989998-Q',2.030,TO_DATE('23/12/1992','DD/MM/YYYY'),
     'DESTINO-N06','Secundario',TO_DATE('24/12/1992','DD/MM/YYYY'),
       'Incineración',23122,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('A-98989998-Q',2.040,TO_DATE('28/10/1993','DD/MM/YYYY'),
       'DESTINO-N15','Primario',TO_DATE('29/10/1993','DD/MM/YYYY'),
       'Incineración',23323,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('A-98989998-Q',2.040,TO_DATE('29/11/1995','DD/MM/YYYY'),
      'DESTINO-N14','Terciario',TO_DATE('30/11/1995','DD/MM/YYYY'),
       'Incineración',23442,'');
INSERT 
  INTO Traslado (nif_empresa,cod_residuo,fecha_envio,cod_destino,
       envase,fecha_llegada,tratamiento,cantidad_traslado,
       desc_traslado)
  VALUES ('A-98989998-Q',2.040,TO_DATE('21/12/1991','DD/MM/YYYY'),
       'DESTINO-N05','Primario',TO_DATE('22/12/1991','DD/MM/YYYY'),
       'Incineración',2332,'');

-- Se inserta en la tabla Traslado_EmpresaTransportista
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('C-34534522-R',1.010,TO_DATE('10/01/1990','DD/MM/YYYY'),
       'DESTINO-N01','A-87684567-B','Ferrocarril',400,80000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('C-34534522-R',1.010,TO_DATE('10/01/1990','DD/MM/YYYY'),
       'DESTINO-N01','A-98985367-V','Carretera',400,20000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('C-34534522-R',1.010,TO_DATE('10/01/1990','DD/MM/YYYY'),
       'DESTINO-N03','A-97654567-S','Carretera',300,35000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('C-34534522-R',1.010,TO_DATE('10/01/1990','DD/MM/YYYY'),
       'DESTINO-N02','A-87684567-B','Carretera',500,35000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('C-34534522-R',1.010,TO_DATE('22/02/1990','DD/MM/YYYY'),
       'DESTINO-N02','A-87684567-B','Ferrocarril',500,85000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('C-34534522-R',1.010,TO_DATE('22/02/1990','DD/MM/YYYY'),
       'DESTINO-N01','A-97654567-S','Carretera',300,35000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('C-34534522-R',1.010,TO_DATE('21/04/1991','DD/MM/YYYY'),
       'DESTINO-N03','A-87684567-B','Ferrocarril',900,80000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('C-34534522-R',1.010,TO_DATE('21/04/1991','DD/MM/YYYY'),
       'DESTINO-N01','A-97654567-S','Ferrocarril',300,85000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('C-34534522-R',1.010,TO_DATE('12/01/1992','DD/MM/YYYY'),
       'DESTINO-N01','A-87684567-B','Carretera',400,50000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('C-34534522-R',1.020,TO_DATE('16/09/1990','DD/MM/YYYY'),
       'DESTINO-N13','A-87684567-B','Carretera',50,10000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('C-34534522-R',1.020,TO_DATE('15/10/1991','DD/MM/YYYY'),
       'DESTINO-N02','A-87684567-B','Aéreo',450,99000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('C-34534522-R',1.020,TO_DATE('16/08/1992','DD/MM/YYYY'),
       'DESTINO-N03','A-87684567-B','Carretera',900,40000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('C-34534522-R',1.020,TO_DATE('23/03/1993','DD/MM/YYYY'),
       'DESTINO-N01','A-87684567-B','Carretera',400,50000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('C-34534522-R',1.030,TO_DATE('11/05/1994','DD/MM/YYYY'),
       'DESTINO-N02','A-87684567-B','Carretera',300,30000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('C-34534522-R',1.030,TO_DATE('16/04/1995','DD/MM/YYYY'),
       'DESTINO-N01','A-87684567-B','Aéreo',300,90000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('C-34534522-R',1.030,TO_DATE('17/06/1996','DD/MM/YYYY'),
       'DESTINO-N03','A-87684567-B','Ferrocarril',300,50000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('C-34534522-R',1.030,TO_DATE('25/07/1997','DD/MM/YYYY'),
       'DESTINO-N04','A-87684567-B','Carretera',300,35000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('R-12356711-Q',3.060,TO_DATE('23/08/1998','DD/MM/YYYY'),
       'DESTINO-N01','A-97654567-S','Aéreo',300,85000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('R-12356711-Q',3.060,TO_DATE('24/02/1994','DD/MM/YYYY'),
       'DESTINO-N04','A-97654567-S','Carretera',300,25000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('R-12356711-Q',3.060,TO_DATE('21/01/1995','DD/MM/YYYY'),
       'DESTINO-N12','A-97654567-S','Carretera',300,35000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('R-12356711-Q',3.060,TO_DATE('14/03/1996','DD/MM/YYYY'),
       'DESTINO-N02','A-97654567-S','Carretera',500,40000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('A-17655551-Q',5.010,TO_DATE('17/04/1997','DD/MM/YYYY'),
       'DESTINO-N04','A-87684567-B','Carretera',500,50000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('A-17655551-Q',5.010,TO_DATE('19/02/1998','DD/MM/YYYY'),
       'DESTINO-N03','A-87684567-B','Carretera',500,35000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('A-17655551-Q',5.010,TO_DATE('18/04/1999','DD/MM/YYYY'),
       'DESTINO-N09','A-87684567-B','Carretera',500,60000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('A-17655551-Q',5.010,TO_DATE('16/06/1995','DD/MM/YYYY'),
       'DESTINO-N12','A-87684567-B','Carretera',500,35000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('A-17655551-Q',5.070,TO_DATE('10/07/1996','DD/MM/YYYY'),
       'DESTINO-N10','A-87684567-B','Carretera',500,50000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('A-17655551-Q',5.070,TO_DATE('11/08/1992','DD/MM/YYYY'),
       'DESTINO-N02','A-87684567-B','Aéreo',500,90000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('A-17655551-Q',5.070,TO_DATE('12/02/1990','DD/MM/YYYY'),
       'DESTINO-N12','A-87684567-B','Carretera',500,35000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('A-17655551-Q',5.070,TO_DATE('13/01/1993','DD/MM/YYYY'),
       'DESTINO-N10','A-87684567-B','Carretera',500,35000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('A-17655551-Q',6.120,TO_DATE('18/12/1994','DD/MM/YYYY'),
       'DESTINO-N02','A-98987067-V','Ferrocarril',500,50000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('A-17655551-Q',6.120,TO_DATE('19/12/1996','DD/MM/YYYY'),
       'DESTINO-N10','A-98987067-V','Carretera',500,30000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('A-17655551-Q',6.120,TO_DATE('21/10/1996','DD/MM/YYYY'),
       'DESTINO-N07','A-98987067-V','Carretera',500,35000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('A-11111111-R',7.080,TO_DATE('30/07/1994','DD/MM/YYYY'),
       'DESTINO-N11','A-98987067-V','Carretera',500,20000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('A-11111111-R',7.080,TO_DATE('27/02/1997','DD/MM/YYYY'),
       'DESTINO-N10','A-98987067-V','Carretera',500,35000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('A-11111111-R',7.090,TO_DATE('25/03/1995','DD/MM/YYYY'),
       'DESTINO-N08','A-98987067-V','Carretera',600,40000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('A-11111111-R',7.090,TO_DATE('26/04/1996','DD/MM/YYYY'),
       'DESTINO-N07','A-98987067-V','Aéreo',600,11000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('A-11111111-R',7.090,TO_DATE('28/05/1998','DD/MM/YYYY'),
       'DESTINO-N11','A-98987067-V','Carretera',600,50000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('A-11111111-R',7.090,TO_DATE('10/08/1999','DD/MM/YYYY'),
       'DESTINO-N08','A-98987067-V','Aéreo',50,40000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('A-11111111-R',8.060,TO_DATE('22/06/2000','DD/MM/YYYY'),
       'DESTINO-N07','A-98987067-V','Carretera',50,10000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('A-11111111-R',8.060,TO_DATE('11/01/2000','DD/MM/YYYY'),
       'DESTINO-N11','F-98987667-R','Carretera',600,35000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('A-11111111-R',8.060,TO_DATE('14/08/1997','DD/MM/YYYY'),
       'DESTINO-N08','F-98987667-R','Aéreo',50,60000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('A-11111111-R',8.060,TO_DATE('16/09/1998','DD/MM/YYYY'),
       'DESTINO-N15','F-98987667-R','Carretera',450,35000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('A-98989998-Q',2.020,TO_DATE('13/11/1993','DD/MM/YYYY'),
       'DESTINO-N15','F-98987667-R','Ferrocarril',350,50000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('A-98989998-Q',2.020,TO_DATE('17/12/1994','DD/MM/YYYY'),
       'DESTINO-N08','F-98987667-R','Carretera',500,35000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('A-98989998-Q',2.020,TO_DATE('18/10/1996','DD/MM/YYYY'),
       'DESTINO-N06','F-98987667-R','Carretera',600,50000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('A-98989998-Q',2.030,TO_DATE('19/11/1997','DD/MM/YYYY'),
       'DESTINO-N14','F-98987667-R','Carretera',350,35000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('A-98989998-Q',2.030,TO_DATE('21/12/1998','DD/MM/YYYY'),
       'DESTINO-N15','F-98987667-R','Aéreo',350,80000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('A-98989998-Q',2.030,TO_DATE('23/12/1992','DD/MM/YYYY'),
       'DESTINO-N06','F-98987667-R','Carretera',600,30000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('A-98989998-Q',2.040,TO_DATE('28/10/1993','DD/MM/YYYY'),
       'DESTINO-N15','F-98987667-R','Carretera',350,35000);
INSERT 
  INTO Traslado_EmpresaTransportista (nif_empresa,cod_residuo,
       fecha_envio,cod_destino,nif_emptransporte,
       tipo_transporte,kms,coste)
  VALUES ('A-98989998-Q',2.040,TO_DATE('29/11/1995','DD/MM/YYYY'),
       'DESTINO-N14','F-98987667-R','Carretera',350,50000);

COMMIT;