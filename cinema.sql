show databases;

/*Início DDL*/

create database cinema;

use cinema;

create table cinema(
	idCinema int primary key not null auto_increment,
    nomeFantasia varchar(45) not null,
	capacidadeLotacao int not null
);

create table telefone(
	idTelefone int primary key not null auto_increment,
	numero varchar(11) not null
);

create table endereco(
	idEndereco int primary key not null auto_increment,
    UF varchar(2) not null,
	cidade varchar(45) not null,
	bairro varchar(45) not null,
    rua varchar(45),
    numero int,
    cep varchar(11),
    complemento varchar (200)
);