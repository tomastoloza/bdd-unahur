CREATE DATABASE PRODUCTO;

USE PRODUCTO;

CREATE TABLE CLIENTE (
                         COD_CLIENTE INT NOT NULL,
                         NOMBRE VARCHAR(50) NOT NULL,
                         APELLIDO VARCHAR(50) NOT NULL,
                         DIRECCION VARCHAR(50) NOT NULL,
                         FECHA_NACIMIENTO DATE NOT NULL,
                         PRIMARY KEY (COD_CLIENTE)
);


CREATE TABLE PRODUCTO (
                          COD_PRODUCTO INT NOT NULL,
                          NOMBRE VARCHAR(50) NOT NULL,
                          MARCA VARCHAR(50) NOT NULL,
                          PU INT NOT NULL,
                          PRIMARY KEY (COD_PRODUCTO)
);

CREATE TABLE VENTA (
                       COD_VENTA INT NOT NULL,
                       COD_CLIENTE INT NOT NULL,
                       COD_PRODUCTO INT NOT NULL,
                       CANTIDAD INT NOT NULL,
                       FECHA_VENTA DATE NOT NULL,
                       PRIMARY KEY (COD_VENTA),
                       CONSTRAINT FK_venta_cliente FOREIGN KEY (COD_CLIENTE) REFERENCES cliente (COD_CLIENTE),
                       CONSTRAINT FK_venta_producto FOREIGN KEY (COD_PRODUCTO) REFERENCES producto (COD_PRODUCTO)
);


INSERT INTO producto.cliente (COD_CLIENTE, NOMBRE, APELLIDO, DIRECCION, FECHA_NACIMIENTO) VALUES ('1', 'Enzo', 'Francescoli', 'alsina 45', '2018-09-12');
INSERT INTO producto.cliente (COD_CLIENTE, NOMBRE, APELLIDO, DIRECCION, FECHA_NACIMIENTO) VALUES ('2', 'Chicho', 'Serna', 'Madero 45', '2018-10-12');
INSERT INTO producto.cliente (COD_CLIENTE, NOMBRE, APELLIDO, DIRECCION, FECHA_NACIMIENTO) VALUES ('3', 'Ricardo', 'Bochini', 'La Paz 45', '1965-09-11');
INSERT INTO producto.cliente (COD_CLIENTE, NOMBRE, APELLIDO, DIRECCION, FECHA_NACIMIENTO) VALUES ('4', 'Enzo', 'Perez', 'Pringles 47', '1985-03-12');

INSERT INTO producto.producto (COD_PRODUCTO, NOMBRE, MARCA, PU) VALUES ('1', 'Yerba', 'Amanda', '130');
INSERT INTO producto.producto (COD_PRODUCTO, NOMBRE, MARCA, PU) VALUES ('2', 'azucar', 'ledesma', '150');
INSERT INTO producto.producto (COD_PRODUCTO, NOMBRE, MARCA, PU) VALUES ('3', 'Gaseosa', 'Manaos', '30');


SELECT NOMBRE,MARCA, PU FROM PRODUCTO ORDER BY NOMBRE DESC;