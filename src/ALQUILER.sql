CREATE DATABASE PARCIAL2_TOMAS_TOLOZA;

USE PARCIAL2_TOMAS_TOLOZA;

CREATE TABLE CATEGORIA
(
    COD_CATEGORIA INT         NOT NULL,
    CATEGORIA     VARCHAR(50) NOT NULL,
    PRIMARY KEY (COD_CATEGORIA)
);

CREATE TABLE AGENCIA
(
    COD_AGENCIA INT         NOT NULL,
    NOMBRE      VARCHAR(50) NOT NULL,
    DIRECCION   VARCHAR(50) NOT NULL,
    CIUDAD      VARCHAR(50) NOT NULL,
    PROVINCIA   VARCHAR(50) NOT NULL,
    PAIS        VARCHAR(50) NOT NULL,
    PRIMARY KEY (COD_AGENCIA)
);

CREATE TABLE COMPANIA
(
    COD_COMPANIA INT         NOT NULL,
    NOMBRE       VARCHAR(50) NOT NULL,
    DIRECCION    VARCHAR(50) NOT NULL,
    CIUDAD       VARCHAR(50) NOT NULL,
    PROVINCIA    VARCHAR(50) NOT NULL,
    PAIS         VARCHAR(50) NOT NULL,
    PRIMARY KEY (COD_COMPANIA)
);

CREATE TABLE CLIENTE
(
    COD_CLIENTE INT         NOT NULL,
    NOMBRE      VARCHAR(50) NOT NULL,
    APELLIDO    VARCHAR(50) NOT NULL,
    DIRECCION   VARCHAR(50) NOT NULL,
    FECHA_NAC   DATE        NOT NULL,
    EDAD        INT         NOT NULL,
    SEXO        VARCHAR(50) NOT NULL,
    CIUDAD      VARCHAR(50) NOT NULL,
    PROVINCIA   VARCHAR(50) NOT NULL,
    PAIS        VARCHAR(50) NOT NULL,
    PRIMARY KEY (COD_CLIENTE)
);


CREATE TABLE EMPLEADO
(
    COD_EMPLEADO INT         NOT NULL,
    NOMBRE       VARCHAR(50) NOT NULL,
    APELLIDO     VARCHAR(50) NOT NULL,
    DIRECCION    VARCHAR(50) NOT NULL,
    FECHA_NAC    DATE        NOT NULL,
    EDAD         INT         NOT NULL,
    CIUDAD       VARCHAR(50) NOT NULL,
    PROVINCIA    VARCHAR(50) NOT NULL,
    PRIMARY KEY (COD_EMPLEADO)
);

CREATE TABLE DOCUMENTO
(
    COD_DOCUMENTO INT         NOT NULL,
    COD_CLIENTE   INT         NOT NULL,
    TIPO          VARCHAR(50) NOT NULL,
    NUMERO        INT         NOT NULL,
    PRIMARY KEY (COD_DOCUMENTO),
    CONSTRAINT FOREIGN KEY (COD_CLIENTE) REFERENCES CLIENTE (COD_CLIENTE)
);

CREATE TABLE TRANSPORTE
(
    COD_TRANSPORTE INT         NOT NULL,
    COD_AGENCIA    INT         NOT NULL,
    COD_CATEGORIA  INT         NOT NULL,
    TRANSPORTE     VARCHAR(50) NOT NULL,
    MARCA          VARCHAR(50) NOT NULL,
    PU             INT         NOT NULL,
    PRIMARY KEY (COD_TRANSPORTE),
    CONSTRAINT FOREIGN KEY (COD_AGENCIA) REFERENCES AGENCIA (COD_AGENCIA),
    CONSTRAINT FOREIGN KEY (COD_CATEGORIA) REFERENCES CATEGORIA (COD_CATEGORIA)
);

CREATE TABLE ALQUILER
(
    COD_ALQUILER   INT  NOT NULL,
    COD_CLIENTE    INT  NOT NULL,
    COD_COMPANIA   INT  NOT NULL,
    COD_EMPLEADO   INT  NOT NULL,
    FECHA_ALQUILER DATE NOT NULL,
    COMENTARIOS    VARCHAR(50),
    PRIMARY KEY (COD_ALQUILER),
    CONSTRAINT FOREIGN KEY (COD_CLIENTE) REFERENCES CLIENTE (COD_CLIENTE),
    CONSTRAINT FOREIGN KEY (COD_COMPANIA) REFERENCES COMPANIA (COD_COMPANIA),
    CONSTRAINT FOREIGN KEY (COD_EMPLEADO) REFERENCES EMPLEADO (COD_EMPLEADO)
);

CREATE TABLE ALQUILER_DETALLE
(
    COD_DETALLE    INTEGER NOT NULL,
    COD_ALQUILER   INTEGER NOT NULL,
    COD_TRANSPORTE INTEGER NOT NULL,
    CANTIDAD       INTEGER NOT NULL
);


INSERT INTO COMPANIA(COD_COMPANIA, NOMBRE, DIRECCION, CIUDAD, PROVINCIA, PAIS)
VALUES (1, 'HERTZ', 'HILLARY CLINTON 8749', 'SAN JUAN', 'SAN JUAN', 'ARGENTINA'),
       (2, 'MONOLITICO', 'GERALT FIORIN 984', 'MENDOZA', 'MENDOZA', 'ARGENTINA');

INSERT INTO AGENCIA(COD_AGENCIA, NOMBRE, DIRECCION, CIUDAD, PROVINCIA, PAIS)
VALUES (1, 'LNG', 'EINSTEIN 234', 'SAN JUAN', 'SAN JUAN', 'ARGENTINA'),
       (2, 'OLIVIERI', 'URIBURU 484', 'MENDOZA', 'MENDOZA', 'ARGENTINA');


INSERT INTO CLIENTE (COD_CLIENTE, NOMBRE, APELLIDO, DIRECCION, FECHA_NAC, EDAD, SEXO, CIUDAD, PROVINCIA, PAIS)
VALUES (1, 'EMANUEL', 'ARAUJO', 'HILLING 405', '1990-09-10', 40, 'MASCULINO', 'VILLA FIORITO', 'BUENOS AIRES',
        'ARGENTINA'),
       (2, 'MARCELA', 'GALLO', 'PERKINS 555', '1999-06-15', 21, 'FEMENINO', 'CASTELAR', 'BUENOS AIRES', 'ARGENTINA'),
       (3, 'LETICIA', 'FERNANDEZ', 'PINIFARINA 2020', '2000-07-17', 20, 'FEMENINO', 'PUERTO MADRYN', 'CHUBUT',
        'ARGENTINA');

INSERT INTO EMPLEADO (COD_EMPLEADO, NOMBRE, APELLIDO, DIRECCION, FECHA_NAC, EDAD, CIUDAD, PROVINCIA)
VALUES (1, 'BENITO', 'GARCIA', 'YACARA 15', '1980-05-05', 40, 'SAN JUAN', 'SAN JUAN'),
       (2, 'MIGUEL', 'JORDAN', 'VAIBEN 204', '1969-02-24', 51, 'SAN JUAN', 'SAN JUAN'),
       (3, 'RICARDO', 'MENDEZ', 'SUECIA 153', '1978-03-15', 42, 'MENDOZA', 'MENDOZA');

INSERT INTO CATEGORIA(COD_CATEGORIA, CATEGORIA)
VALUES (1, '5000 TONELADAS'),
       (2, 'SEDAN 4 PUERTAS');

INSERT INTO TRANSPORTE(COD_TRANSPORTE, COD_AGENCIA, COD_CATEGORIA, TRANSPORTE, MARCA, PU)
VALUES (1, 1, 1, 'CAMION', 'VOLVO', 5000),
       (2, 1, 2, 'AUTO', 'BMW', 15000),
       (3, 2, 1, 'CAMION', 'ISUZU', 8000),
       (4, 2, 1, 'AUTO', 'FORD', 5000);

INSERT INTO ALQUILER(COD_ALQUILER, COD_CLIENTE, COD_COMPANIA, COD_EMPLEADO, FECHA_ALQUILER)
VALUES (1, 1, 1, 1, '2010-05-18'),
       (2, 2, 1, 2, '2016-07-25'),
       (3, 3, 2, 2, '2010-12-20'),
       (4, 1, 2, 1, '2012-12-20'),
       (5, 3, 2, 3, '2013-01-05');

INSERT INTO ALQUILER_DETALLE(COD_DETALLE, COD_ALQUILER, COD_TRANSPORTE, CANTIDAD)
VALUES (1, 1, 1, 1),
       (2, 2, 2, 1),
       (3, 2, 1, 1),
       (4, 4, 3, 1),
       (5, 5, 4, 1);

INSERT INTO DOCUMENTO(COD_DOCUMENTO, COD_CLIENTE, TIPO, NUMERO)
VALUES (1, 1, 'DNI', 31947032),
       (2, 2, 'DNI', 11497412),
       (3, 3, 'DNI', 29048321);

SELECT ALQUILER.COD_ALQUILER, TRANSPORTE.TRANSPORTE, TRANSPORTE.MARCA, ALQUILER.FECHA_ALQUILER
FROM ALQUILER,
     COMPANIA,
     AGENCIA,
     ALQUILER_DETALLE,
     TRANSPORTE
WHERE COMPANIA.COD_COMPANIA = ALQUILER.COD_COMPANIA
  AND ALQUILER.COD_ALQUILER = ALQUILER_DETALLE.COD_ALQUILER
  AND AGENCIA.COD_AGENCIA = TRANSPORTE.COD_AGENCIA
  AND TRANSPORTE.COD_TRANSPORTE = ALQUILER_DETALLE.COD_TRANSPORTE
  AND COMPANIA.NOMBRE = 'HERTZ'
  AND AGENCIA.NOMBRE = 'LNG'
  AND FECHA_ALQUILER BETWEEN '1999-01-01'
    AND '2013-01-01'
ORDER BY FECHA_ALQUILER;

SELECT AVG(CLIENTE.EDAD)
FROM CLIENTE,
     TRANSPORTE,
     CATEGORIA,
     EMPLEADO,
     ALQUILER,
     ALQUILER_DETALLE
WHERE CLIENTE.COD_CLIENTE = ALQUILER.COD_CLIENTE
    AND TRANSPORTE.COD_TRANSPORTE = ALQUILER_DETALLE.COD_TRANSPORTE
    AND CATEGORIA.COD_CATEGORIA = TRANSPORTE.COD_CATEGORIA
    AND ALQUILER_DETALLE.COD_ALQUILER = ALQUILER.COD_ALQUILER
    AND EMPLEADO.COD_EMPLEADO = ALQUILER.COD_EMPLEADO
    AND CATEGORIA.CATEGORIA = 'SEDAN 4 PUERTAS'
    AND EMPLEADO.PROVINCIA = 'SAN JUAN'
   OR EMPLEADO.PROVINCIA = 'MENDOZA';

SELECT COUNT(CLIENTE.NOMBRE)
FROM CLIENTE,
     TRANSPORTE,
     CATEGORIA,
     ALQUILER,
     ALQUILER_DETALLE,
     AGENCIA
WHERE CLIENTE.COD_CLIENTE = ALQUILER.COD_CLIENTE
  AND TRANSPORTE.COD_TRANSPORTE = ALQUILER_DETALLE.COD_TRANSPORTE
  AND CATEGORIA.COD_CATEGORIA = TRANSPORTE.COD_CATEGORIA
  AND ALQUILER_DETALLE.COD_ALQUILER = ALQUILER.COD_ALQUILER
  AND AGENCIA.COD_AGENCIA = TRANSPORTE.COD_AGENCIA
  AND CATEGORIA.CATEGORIA = '5000 TONELADAS'
  AND AGENCIA.NOMBRE = 'OLIVIERI';

SELECT EMPLEADO.NOMBRE,
       EMPLEADO.APELLIDO,
       EMPLEADO.DIRECCION,
       EMPLEADO.FECHA_NAC,
       EMPLEADO.EDAD,
       EMPLEADO.CIUDAD,
       EMPLEADO.PROVINCIA
FROM EMPLEADO,
     CLIENTE,
     ALQUILER,
     DOCUMENTO
WHERE EMPLEADO.COD_EMPLEADO = ALQUILER.COD_EMPLEADO
  AND CLIENTE.COD_CLIENTE = ALQUILER.COD_CLIENTE
  AND DOCUMENTO.COD_CLIENTE = CLIENTE.COD_CLIENTE
  AND DOCUMENTO.NUMERO > 28000000
  AND CLIENTE.PROVINCIA = 'CHUBUT'
ORDER BY EMPLEADO.EDAD DESC
LIMIT 3;