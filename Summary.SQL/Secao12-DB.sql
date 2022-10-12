USE Carros;

CREATE DATABASE carros;

CREATE TABLE marcas(
	id INT NOT NULL AUTO_INCREMENT,
    nome_marca VARCHAR(100) NOT NULL,
    PRIMARY KEY(id)
);

ALTER TABLE marcas ADD origem VARCHAR(255);


CREATE TABLE inventario(
	id INT NOT NULL AUTO_INCREMENT,
    modelo VARCHAR(255) NOT NULL,
	transmissao VARCHAR(255) NOT NULL,
    motor VARCHAR(255) NOT NULL,
    combustivel VARCHAR(255) NOT NULL,
    marcas_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (marcas_id) REFERENCES marcas(id)
);



CREATE TABLE clientes(
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
	sobrenome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
);

-- SQL DATA TYPES
-- https://www.w3schools.com/sql/sql_datatypes.asp

INSERT INTO clientes(nome, sobrenome, endereco)
VALUES ('Marcos', 'José', 'Rua do principe, 155, Boa vista,  Recife'),
	 ('Cleber','Costa', 'Rua da ram, 454, Torre, Recife'),
	 ('Maria','Matins', 'Rua da prata, 145, Torre, Recife' ),
	 ('Pedro','Coelho', 'Rua do bronze, 156, Torre, Recife' ),
	 ('Bianca','Carvalhal', 'Rua da bala, 1568, Torre, Recife' ),
	 ('Carla','Sampaio', 'Rua do fogo, 199, Torre, Recife' );

SELECT * FROM clientes;

-- DROP TABLE clientes;


INSERT INTO marcas(nome_marca, origem)
VALUES ('Porsche','Alemanha'),
	('BMW','Alemanha'),
	('Ferrari','Itália'),
	('Mercedes','Alemanha'),
	('Aston Martin','Reino Unido');
    
SELECT * FROM marcas;    

SELECT * FROM inventario; 

INSERT INTO inventario(
	modelo, 
	transmissao,
	motor,
	combustivel,
	marcas_id
)
VALUES 
	('Porsche Cayenne','Automática de 8 marchas','4.0 V8 biturbo ','Gasolina 100 litros', 1),
    ('BMW X1','Steptronic','TwinPower Turbo de 4 cilindros','Gasolina 100 litros', 2),
    ('ASTON MARTIN DBS','Automática','6.0 V12 48V','Gasolina', 5),
    ('Ferrari F8','Automática','3,9 l V8','Gasolina', 3),
    ('Mercedes-Benz GLE Coupé','Automática','2,9 l 6 cilindros','Diesel', 4);
