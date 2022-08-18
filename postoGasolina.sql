show databases;

/*Início DDL*/

create database postoGasolina;

use postoGasolina;

/*drop database postoGasolina;*/

create table Departamento(
	idDepartamento int primary key not null auto_increment,
    nome varchar(45) not null,
    localDep varchar(45) not null,
    horario varchar(45) not null
);
/*drop table Departamento;*/
desc Departamento;

create table Empregado(
	cpf varchar(14) primary key not null,
    nome varchar(60) not null,
    nomeSocial varchar(60),
    sexo char(1) not null,
    salario decimal(6,2) not null,
    dataNasc date not null,
    email varchar(45) unique,
    dataAdm datetime not null,
    dataDem datetime,
    statusEmp tinyint not null,
    Departamento_idDepartamento int not null,
    foreign key(Departamento_idDepartamento) references Departamento (idDepartamento)
);

create table Endereco(
	idEndereco int primary key not null auto_increment,
    uf varchar(2) not null,
    cidade varchar(45) not null,
    bairro varchar(45) not null,
    rua varchar(60) not null,
    numero int not null,
    comp varchar(45),
    cep varchar(9) not null,
    Empregado_cpf varchar(14) not null,
    foreign key(Empregado_cpf) references Empregado(cpf)
		on delete cascade
        on update cascade
);

create table Ferias(
	idFerias int primary key not null auto_increment,
    anoRef year(4) not null,
    dataInicio date not null,
    dataFim date not null,
    qtdDias int not null,
    Empregado_cpf varchar(14) not null,
    foreign key (Empregado_cpf) references Empregado(cpf)
		on delete cascade
        on update cascade
);

create table Dependente(
	cpf varchar(14) primary key not null,
    nome varchar(45) not null,
    dataNasc date not null,
    parentesco varchar(15) not null,
    Empregado_cpf varchar(14) not null,
    foreign key(Empregado_cpf) references Empregado(cpf) 
		on delete cascade
        on update cascade
);

create table Vendas(
	idVendas int primary key not null auto_increment,
    dataVenda datetime not null,
    valorTotal decimal(7,2) not null,
    desconto decimal(4,2),
    Empregado_cpf varchar(14) not null,
    foreign key(Empregado_cpf) references Empregado(cpf)
);

create table FormaPag(
	idFormaPag int primary key not null auto_increment,
    tipoPag varchar(45) not null,
    valorPag decimal(7,2) not null,
    qtdParcelas int,
    Vendas_idVendas int not null,
    foreign key(Vendas_idVendas) references Vendas(idVendas)
		on delete cascade
);

create table Fornecedor(
	cnpj_cpf varchar(18) primary key not null,
    nome varchar(45) not null,
    email varchar(45) unique
);

create table Estoque(
	idProduto int primary key not null auto_increment,
    nome varchar(45) not null,
	categoria varchar(45) not null,
    codigoBarra varchar(80) not null unique,
    valor decimal(7,2) not null,
    quantidade decimal(7,2) not null,
    validade date,
    descricao varchar(150),
    lote varchar(45),
    marca varchar(45)
);

create table Telefone (
	idTelefone int primary key not null auto_increment,
    numero varchar(11) not null,
    Departamento_idDepartamento int,
    Empregado_cpf varchar(14),
    Fornecedor_cnpj_cpf varchar(18),
    foreign key(Departamento_idDepartamento) references Departamento(idDepartamento) on delete cascade,
    foreign key(Empregado_cpf) references Empregado(cpf) on update cascade on delete cascade,
    foreign key(Fornecedor_cnpj_cpf) references Fornecedor(cnpj_cpf) on update cascade on delete cascade
);

create table FornecedorProduto(
	Fornecedor_cnpj_cpf varchar(18) not null,
    Estoque_idProduto int not null,
    dataCompra datetime not null,
    qtdCompra decimal(6,2) not null,
    obs varchar(280),
    primary key(Fornecedor_cnpj_cpf, Estoque_idProduto),
    foreign key(Fornecedor_cnpj_cpf) references Fornecedor(cnpj_cpf),
    foreign key(Estoque_idProduto) references Estoque(idProduto)
);

create table ItensVenda(
	Estoque_idProduto int not null,
    Vendas_idVendas int not null,
    qtdOProduto decimal(6,2) not null,
    primary key(Estoque_idProduto, Vendas_idVendas),
    foreign key(Estoque_idProduto) references Estoque(idProduto),
    foreign key(Vendas_idVendas) references Vendas(idVendas)
);

alter table fornecedor add column representante varchar(25) not null;

alter table fornecedor add column descricao varchar(80);

alter table fornecedor drop column descricao;

alter table fornecedor change column representante contato varchar(45);

alter table fornecedor change column contato contato varchar(45) not null;

alter table fornecedor drop column contato;

alter table feria rename ferias;

alter table departamento add column Gerente_cpf  varchar(14);

alter table departamento add foreign key(Gerente_cpf) references empregado(cpf) on update cascade;

desc departamento;
/*DML*/