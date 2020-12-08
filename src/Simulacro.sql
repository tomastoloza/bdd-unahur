CREATE DATABASE biblioteca;
USE biblioteca;


CREATE TABLE obra(

    clasif_decimal INT NOT NULL,
    nombre VARCHAR (50) NULL DEFAULT '',
    autor VARCHAR (50) NULL DEFAULT '',
    
    PRIMARY KEY (clasif_decimal)
);

CREATE TABLE socio(

    idSocio INT NOT NULL,
    apellido VARCHAR (50) NULL DEFAULT '',
    nombre VARCHAR (50) NULL DEFAULT '',
    domicilio VARCHAR (100) NULL DEFAULT '',
    ciudad VARCHAR (50) NULL DEFAULT '',
    telefono VARCHAR (50) NULL DEFAULT '' ,
    fecha_nac DATE NOT NULL ,
    
    PRIMARY KEY (idSocio)
);

CREATE TABLE biblioteca(

    idBiblioteca INT NOT NULL,
    nombre VARCHAR (50) NULL DEFAULT '',
    direccion VARCHAR (100) NULL DEFAULT  '',
    fecha_Fundacion VARCHAR (50) NULL DEFAULT '',
    ciudad VARCHAR (50) NULL DEFAULT '',
    
    PRIMARY KEY (idBiblioteca)
);



CREATE TABLE bibliotecario(

    idBibliotecario INT NOT NULL,
    idBiblioteca INT NOT NULL,
    apellido VARCHAR (50) NULL DEFAULT '',
    nombre VARCHAR (50) NULL DEFAULT '',
    fecha_nac DATE NOT NULL,
    fechaIncioActividad INT NOT NULL ,
    
    PRIMARY KEY (idBibliotecario),
    CONSTRAINT bibliotecario_biblioteca FOREIGN KEY (idBiblioteca ) REFERENCES biblioteca (idBiblioteca)
);

CREATE TABLE ejemplar (

    nroInventario INT NOT NULL,
    idBiblioteca INT  NOT NULL,
    clasif_decimal INT NOT NULL,
    estado VARCHAR (50) NULL DEFAULT '',
    nroEjemplar INT NULL DEFAULT 0,
    
    PRIMARY KEY (nroINventario),
    CONSTRAINT ejemplar_biblioteca FOREIGN KEY (idBiblioteca) REFERENCES biblioteca (idBiblioteca),
    CONSTRAINT ejemplar_obra FOREIGN KEY (clasif_decimal) REFERENCES obra (clasif_decimal)
);

CREATE TABLE prestamo(

    prestamo INT NOT NULL,
    nroInventario INT NOT NULL,
    idSocio INT NOT NULL,
    idBibliotecario INT NOT NULL,
    fechaInicio DATE NOT NULL,
    fechaFin DATE NOT NULL,
    
    PRIMARY KEY (prestamo),
    CONSTRAINT prestamo_ejemplar FOREIGN KEY (nroInventario) REFERENCES ejemplar (nroInventario),
    CONSTRAINT prestamo_socio FOREIGN KEY (idSocio) REFERENCES socio (idSocio),
    CONSTRAINT prestamo_biliotecario FOREIGN KEY (idBibliotecario) REFERENCES bibliotecario (idBibliotecario)
);



INSERT INTO biblioteca.obra
(clasif_decimal, nombre, autor)

VALUES
(1, "cien años de soledad", " marquez"),
(2,"tunel", "borges"),
(3,"relato naufrago", "marquez"),
(4,"62 modelos para armar", "cortazar"),
(5,"cementerio de Praga", "eco"),
(6,"After dark", "murakami"),
(7,"rayuela", "cortazar");

INSERT INTO biblioteca.socio
(idSocio, apellido , nombre, domicilio, ciudad, telefono, fecha_nac)

VALUES
(1,"yaniri", "adrian", "gibraltar", "hurlingham", "15000", "1981-02-11"),
(2,'gomeez','maria','palermo','quilmes','25000','1990-05-25' ),
(3,'silva','juan manuel','salta','caba','2000','2000-11-04'),
(4,'frias','hugo','callao','ciudadela','8000','1960-05-04'),
(5,'mendez','laura','diaz','hurlingham','4000','1985-03-14');


INSERT INTO biblioteca.biblioteca
(idBiblioteca, nombre, direccion, fecha_Fundacion, ciudad)

VALUES
(1, 'nacional','9 de julio','1890-01-25','cordoba'),
(2, 'cervantez','peligrino', '1901-02-02','caba'),
(3, 'provincial','congreso','1860-03-14','bsas');


INSERT INTO biblioteca.bibliotecario
(idBibliotecario, idBiblioteca, apellido, nombre, fecha_nac, fechaIncioActividad)

VALUES
(1,1,'lopez','andrea','1985-02-28',2000),
(2,1,'lorenzo','javier','1990-05-25',2010),
(3,2,'martinez','oscar','1979-12-01',1992),
(4,3,'benitez','maria','2000-11-13',2015),
(5,3,'lopez','jorge','1960-01-01',1980),
(6,2,'chavez','camila','1998-08-30',2018);

INSERT INTO biblioteca.ejemplar
(nroInventario, idBiblioteca, clasif_decimal,estado, nroEjemplar)

VALUES
(1,1,1,'',10),
(2,1,3,'',2),
(3,2,4,'',1),
(4,2,5,'',5),
(5,3,5,'',2),
(6,3,6,'',15),
(7,1,2,'',2),
(8,2,7,'',3),
(9,3,2,'',1),
(10,3,6,'',3);

INSERT INTO biblioteca.prestamo
(prestamo,nroInventario,idSocio,idBibliotecario,fechaInicio,fechaFin)

VALUES
(1,1,2,4,'2020-05-17','2020-11-08'),
(2,2,3,4,'2020-02-11','2020-11-08'),
(3,3,2,2,'2020-03-23','2020-11-08'),
(4,8,4,3,'2020-02-05','2020-11-08'),
(5,10,5,1,'2020-02-13','2020-11-08'),
(6,5,2,6,'2020-10-01','2020-11-08'),
(7,6,5,2,'2019-08-17','2020-11-08'),
(8,7,1,3,'2018-02-20','2020-11-08'),
(9,9,3,5,'2020-10-06','2020-11-08');





// consulta 1

SELECT obra.nombre,obra.autor, biblioteca.nombre
FROM obra, ejemplar, biblioteca
WHERE obra.clasif_decimal = ejemplar.clasif_decimal
AND biblioteca.idBiblioteca = ejemplar.idBiblioteca



// consulta2

SELECT obra.nombre, socio.apellido, socio.nombre,
bibliotecario.apellido, bibliotecario.nombre
FROM obra, socio, bibliotecario,prestamo,ejemplar
WHERE prestamo.idSocio = socio.idSocio
AND prestamo.idBibliotecario = bibliotecario.idBibliotecario
AND prestamo.nroInventario = ejemplar.nroInventario
AND ejemplar.clasif_decimal = obra.clasif_decimal



// consulta 3

SELECT bibliotecario.nombre, bibliotecario.apellido,bibliotecario.fechaIncioActividad,
biblioteca.nombre
FROM bibliotecario,biblioteca
WHERE biblioteca.idBiblioteca = bibliotecario.idBiblioteca
ORDER BY bibliotecario.fechaIncioActividad ASC
LIMIT 2


// consulta 4

SELECT count(socio.idSocio) AS cantSocios, avg(DATEDIFF(CURDATE(),socio.fecha_nac)/365) AS edadPromedio
FROM socio


// consulta 5 

SELECT biblioteca.nombre , COUNT(bibliotecario.idBiblioteca) AS nroEmpleados
FROM biblioteca, bibliotecario
WHERE biblioteca.idBiblioteca = bibliotecario.idBiblioteca
GROUP BY biblioteca.idBiblioteca


// consulta 6 

SELECT obra.nombre, obra.autor,count(ejemplar.nroInventario)
FROM obra, ejemplar
WHERE obra.clasif_decimal = ejemplar.clasif_decimal
GROUP BY obra.clasif_decimal


// consulta 7

SELECT obra.nombre, count(prestamo.nroInventario) AS cantPrestamos /*COUNT(prestamo.nroInventario) AS cant*/
FROM obra, prestamo, ejemplar
WHERE obra.clasif_decimal = ejemplar.clasif_decimal
AND ejemplar.nroInventario = prestamo.nroInventario
GROUP BY obra.clasif_decimal

