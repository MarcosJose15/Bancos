show databases;

create database postoGasolinaShell;

use postoGasolinaShell;

/*drop database postoGasolinaShell;*/

/*drop table test;

create table test(
	nome varchar(14)
);*/

create table departamento(
	idDepartamento int primary key not null auto_increment,
    nome varchar(45) not null,
    email varchar(45) not null unique,
    descricao varchar(200),
    localDep varchar(45) not null
);

desc departamento;

create table empregado(
	cpf varchar(14) primary key not null,
    nome varchar(60) not null,
    salario decimal(6,2) not null,
    sexo char(1) not null,
    email varchar(45) not null unique,
    CTPS varchar(15) not null unique,
    dataNasc date not null,
    dataAdm datetime not null,
    dataDem datetime,
    Departamento_idDepartamento int not null,
    foreign key(Departamento_idDepartamento) references departamento(idDepartamento)
);

desc empregado;

create table endereco(
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

desc endereco;

create table dependente(
	cpf varchar(14) primary key not null,
    nome varchar(60) not null,
    dataNasc date not null,
    parentesco varchar(25) not null,
    Empregado_cpf varchar(14) not null,
    foreign key(Empregado_cpf) references empregado(cpf)
		on update cascade
        on delete cascade
);

alter table empregado add column statusEmp boolean not null after sexo;
desc empregado;

create table fornecedor(
	cnpj varchar(15) primary key not null,
    nome varchar(45) not null,
    valorFrete decimal(5,2),
    statusForn boolean not null
);
desc fornecedor;

create table telefone(
	idTelefone int primary key not null auto_increment,
    numero varchar(11) not null,
    Empregado_cpf varchar(14),
    Departamento_idDepartamento int,
    Fornecedor_cnpj varchar(15),
    foreign key(Empregado_cpf) references empregado(cpf) on update cascade on delete cascade,
    foreign key(Departamento_idDepartamento) references departamento(idDepartamento) on delete cascade,
    foreign key(Fornecedor_cnpj) references fornecedor(cnpj) on update cascade on delete cascade
);

create table estoque(
	idProduto int primary key not null auto_increment,
    nomeProduto varchar(45) not null,
    qtdProduto decimal(7,2) not null,
    valorProduto decimal(6,2) not null,
    codigoBarra varchar(25),
    validade  date,
    lote varchar(45)
);
desc estoque;

create table Fornecedor_Produto(
	Fornecedor_CNPJ varchar(15) not null,
    Estoque_idProduto int not null,
    dataComp datetime,
    qtdComp decimal(7,2),
    valorComp decimal(6,2),
    primary key(Fornecedor_CNPJ, Estoque_idProduto),
    foreign key(Fornecedor_CNPJ) references fornecedor(CNPJ),
    foreign key(Estoque_idProduto) references estoque(idProduto)
);
desc fornecedor_produto;
/*alter table fornecedor_produto add primary key(Fornecedor_CNPJ, Estoque_idProduto);*/

create table bombaComb(
	idBombaComb int primary key not null auto_increment,
    dataVistoria date not null,
    localBomba varchar(45) not null
);

create table Vendas(
	idVenda int primary key not null auto_increment,
    dataVenda datetime not null,
    desconto decimal(5,2),
    valorTotal decimal(6,2) not null,
    Empregado_CPF varchar(14) not null,
    Bomba_Comp_IdBombaComb int,
    foreign key(Empregado_CPF) references empregado(CPF),
    foreign key(Bomba_Comp_IdBombaComb) references bombacomb(idBombaComb)
);

create table FormaPag(
	idFormaPag int primary key not null auto_increment,
    tipo varchar(45) not null,
    qtdParcelas int,
    valor decimal(6,2) not null,
    Vendas_idVenda int not null,
    foreign key(Vendas_idVenda) references vendas(idVenda)
		on delete cascade
);
desc formapag;

create table ItensVenda(
	Vendas_idVenda int not null,
    Estoque_idProduto int not null,
    quantidade decimal(6,2) not null,
    primary key(Vendas_idVenda, Estoque_idProduto),
    foreign key(Vendas_idVenda) references vendas(idVenda),
    foreign key(Estoque_idProduto) references estoque(idProduto)
);

alter table departamento add column Gerente_CPF varchar(14);
alter table departamento add foreign key(Gerente_CPF) references empregado(CPF);

alter table fornecedor add column emailFor varchar(10);
alter table fornecedor add column email varchar(10) first;

alter table fornecedor drop column email;
alter table fornecedor change column emailFor email varchar(45) unique after valorFrete;
desc fornecedor;
desc departamento;
insert into departamento (nome, email, descricao, localDep) 
	value ("TI", "ti@postoSucesso.com", "Departamento TI", "Sala - 12");

select * from departamento;
select * from empregado;
insert into departamento (nome, email, descricao, localDep) 
	values ("Administrativo", "adm@postoSucesso.com", "Departamento Administrativo", "Sala - 1"),
		("Financeiro", "financeiro@postoSucesso.com", "Departamento Financeiro", "Sala - 2"),
        ("RH", "rh@postoSucesso.com", "Departamento Recursos Humano", "Sala - 3");

/*insert into departamento value ("Comercial", "comercial@postoSucesso.com", "Departamento Comercial", "Sala - 4");*/
insert into departamento value (5, "Comercial", "comercial@postoSucesso.com", "Departamento Comercial", "Sala - 4", null);

insert into departamento (nome, email, descricao, localDep) 
	value ("Frente Loja", "frentistas@postoSucesso.com", "Departamento Frente Loja", "Pátio");
/*True - 1 | False - 0*/
insert into empregado (cpf, nome, salario, sexo, statusEmp, email, ctps, dataNasc, dataAdm, departamento_idDepartamento)
	value ("025.111.258-97", "Danilo Farias", 1852.56, 'M', 1, "dansoaresfarias@gmail.com", "986532741", '1986-09-07', '2018-05-03 13:30:00', 5);
desc empregado;
select * from empregado;

insert into empregado (cpf, nome, salario, sexo, statusEmp, email, ctps, dataNasc, dataAdm, departamento_idDepartamento)
	values ("070.154.874-57", "Hugo Diniz", 1800.00, 'M', 1, "hugo@senac.com.br", "0987654321", '1993-01-08', '2019-06-04 13:30:00', 1),
		("112.345.678-90", "Juliana Ramalho", 2654.84, 'F', 1, "juramalho@gmail.com", "895623", '1993-12-20', '2015-05-18 08:15:00', 1),
		("765.387.876-34", "Diego Coutinho", 2345.67, 'M', 1, "diegocoutinho@fac.pe.senac.br", "93763828377", '1980-12-02', '2019-07-14 12:41:21', 3),
		("014.128.358-00", "Ben Hur Queiroz", 1311.56, 'M', 1, "benhur@gmail.com", "111533341", '1976-01-07', '2012-03-03 15:30:00', 2),
        ("055.432.798-57", "Fellipe Diniz", 1489.56, 'M', 1, "fellipediniz@gmail.com", "326498741", '1989-06-08', '2020-02-09 13:30:00', 3),
        ("077.188.387-02", "Godofredo Souza", 1701.56, 'M', 1, "godo@gmail.com", "188775341", '1980-08-01', '2019-11-03 09:30:00', 6),
        ("098.765.432-11", "César Pinho", 2450.00, 'M', 1, "pinhocesar@senac.com.br", "2233456789", '1992-06-18', '2022-07-05 15:00:00', 2),
		("102.406.954-01", "Mácio Júnior", 1800.00, 'M', 1, "macio@senac.com.br", "1020304050", '1993-11-11', '2020-07-10 12:00:02', 4),
        ("120.380.134-18", "Joao Victor", 3500.00, 'M', 1, "joaobarreto@email.com", "123456789", '1999-02-15', '2022-06-03 12:20:00', 5),
        ("120.749.910-88", "Luiz Andre", 1222.00, 'M',   1, "luizalcorreia@fac.pe.senac.br", "828929818",'2002-06-28','2021-07-11 12:08:00', 1),
		("100.300.650-76", "Thiago Rodrigues", 1680.00, 'M', 1, "thiago@gmail.com", "147859670", '1996-03-04', '2022-06-01 08:15:00', 6),
		("112.088.387-02", "Godolores Castro", 2052.56, 'F', 1, "godolores@gmail.com", "499725381", '1979-03-18', '2011-06-03 10:05:00', 6);
        
insert into endereco (uf, cidade, bairro, rua, numero, comp, cep, empregado_cpf)
	value ("PE", "Recife", "Boa Vista", "Rua Dom Bosco", 1542, "Ap 1502", "50050-070", "025.111.258-97");
    
insert into endereco (uf, cidade, bairro, rua, numero, comp, cep, empregado_cpf)
	values ("PE", "Recife", "Boa Viagem", "Rua Segredo", 51, "Ap 1803", "51020-170", "070.154.874-57"),
		("PE", "Recife", "Boa Viagem", "Rua Passarinho", 1345, "Ap 357", "51111-000", "112.345.678-90"),
		("PE", "Recife", "Prado", "Rua Capitão Zuera", 453, "Ap 56", "38888-058", "765.387.876-34"),
		("PE", "Recife", "Madalena", "Rua Ricardo Salazar", 45, "Ap 501-A", "50720-123", "014.128.358-00"),
        ("PE", "Recife", "Campo Grande", "Rua Faz Chover", 1000, "Casa 02", "50887-170", "055.432.798-57"),
		("PE", "Jaboatao", "Cha Grande", "Rua Desce e Sobe", 1, "Primeiro Andar", "51227-170", "077.188.387-02"),
		("PE", "Olinda", "Bairro Novo", "Rua Faz Chover", 40, "Apto 15", "50087-170", "098.765.432-11"),
		("PE", "Recife", "Hipódromo", 'Rua Fulano de Tal', 100, "casa", "51041-500", "102.406.954-01"),
		("PE", "São Lourenço da mata", "Centro", "Rua Holanda", 08, "Quadra E", "54735-110", "120.380.134-18"),
        ("PE", "Olinda", "Jardim Atlantico", "Rua Rutilo", 8, " ", "53060-360", "120.749.910-88"),
        ("PE", "Recife", "Campo Grande", "Rua N S da Glória", 164, "casa", "52031-050", "100.300.650-76"),
        ("PE", "Recife", "iputinga", "Rua João do caminhão", 102, "Ap 200", "55309-083", "112.088.387-02");
        
insert into dependente 
	values ("123.456.789-98", "Daniel Farias", '2021-10-25', "Filho","025.111.258-97"),
		("123.456.789-34", "Maria José", '2015-02-25', "Filha","112.345.678-90"),
        ("123.456.789-45", "Igor José", '2000-11-24', "Filho","112.345.678-90"),
        ("123.456.789-56", "Aline Lima", '2001-02-25', "Filha","112.088.387-02"),
        ("123.456.789-67", "Pedro Costa", '2020-03-02', "Filho","112.088.387-02"),
        ("123.456.789-78", "José Farias", '2020-11-12', "Filho","102.406.954-01"),
        ("123.456.789-89", "Bento Soares", '2022-05-15', "Filho","077.188.387-02"),
        ("123.456.789-10", "Elisa Farias", '2020-12-25', "Filha","100.300.650-76"),
        ("123.456.789-20", "Diogo Silva", '2010-11-28', "Filho","120.749.910-88"),
        ("123.456.789-30", "Dayane Silva", '2020-02-02', "Filha","014.128.358-00"),
        ("123.456.789-40", "Diego Costa", '2021-06-03', "Filho","098.765.432-11");
    
SELECT d.cpf, d.nome, d.dataNasc, d.parentesco, d.Empregado_cpf, e.nome FROM dependente d, empregado e
	where d.Empregado_cpf = e.cpf;
    
/*delete from dependente;

delete from dependente
	where cpf like "123.456.789-30";

delete from dependente
	where Empregado_cpf like "112.345.678-90";*/

/*% é coringa da clausula where, onde tudo que vier antes ou depois do % vai ser ignorado*/
/*delete from dependente
	where nome like "%Farias%";*/
 
/*Destravar a base de dados para permitir delete sem where*/
SET SQL_SAFE_UPDATES = 0;

/*Travar a base de dados para permitir delete sem where*/
/*SET SQL_SAFE_UPDATES = 1;

 delete from empregado
	where cpf like "112.088.387-02";*/

insert into bombacomb (dataVistoria, localBomba)
	values ("2021-07-02", "Bomba A"), 
			("2021-07-02", "Bomba B"),
            ("2021-07-02", "Bomba C"),
            ("2021-07-02", "Bomba D"),
            ("2021-07-04", "Bomba E"),
            ("2021-07-04", "Bomba F");
desc estoque;            
insert into estoque (nomeProduto, qtdProduto, valorProduto, codigoBarra)
	values ("Gasolina", 6579.8, 6.99, "0010992874"),
			("Álcool", 4579.8, 5.99, "0010992875"),
            ("Diesel", 7679.8, 6.49, "0010992876"),
            ("Água Minalba 500ml", 53, 2, "0010992877"),
            ("Água Minalba 1500ml", 28, 5, "0010992864"),
            ("Coca Cola Lata 350ml", 55, 3.5, "0010992844"),
            ("Fanta Lata 350ml", 15, 3.49, "0010992873"),
            ("Sprite Lata 350ml", 20, 3.5, "0010992872"),
            ("Pipoca Gravatá Salgada", 59, 2, "0010992871"),
            ("Pipoca Gravatá Doce", 34, 2, "0010992869"),
            ("Coxinha Frango", 25, 6.99, "0010992845"),
            ("Enroladinho", 3, 6.99, "0010992846"),
            ("Coxinha Fango c/Catupiry", 24, 6.99, "0010992847"),
            ("Risole", 6579.8, 15, "0010992848");
            
insert into fornecedor 
	values ("97.776.353/0001", "Ipiranga Distribuidora",  0, "ipidisp@ipiranga.br", 1),
			("97.776.354/0001", "CocaCola Distribuidora", 0, "disp@coca.br", 1),
            ("97.776.355/0001", "Pipocas Gravatá Distribuidora", 200.0, "disp@pipocasgta.br", 1),
            ("97.776.356/0001", "Minalba Distribuidora", 200.0, "disp@minalba.br", 1),
            ("97.776.357/0001", "Maria do Salgado", 30.0, "mariasal@gmail.com", 1),
            ("97.776.358/0001", "Dona Glória do Salgado", 25.0, "glorinha@gmail.com", 1),
            ("97.776.359/0001", "Iaia Águas Dist", 0, "iaiadisp@iaia.br", 0);
            
select * from fornecedor;
select * from estoque;
desc fornecedor_produto;
insert into fornecedor_produto (Fornecedor_CNPJ, Estoque_idProduto, dataComp, qtdComp)
		values ("97.776.353/0001", 1, '2016-04-12 11:25:00', 5000),
				("97.776.353/0001", 2, '2022-04-12 11:25:00', 3000),
                ("97.776.353/0001", 3, '2022-05-12 11:25:00', 4000),
                ("97.776.356/0001", 4, '2022-05-12 11:25:00', 30),
                ("97.776.356/0001", 5, '2022-06-12 11:25:00', 50),    
                ("97.776.354/0001", 6, '2022-05-12 11:25:00', 20),
                ("97.776.354/0001", 7, '2022-04-12 11:25:00', 45),
                ("97.776.354/0001", 8, '2022-04-12 11:25:00', 40),
                ("97.776.354/0001", 9, '2022-06-12 11:25:00', 10),
                ("97.776.354/0001", 10, '2022-06-12 11:25:00', 60),
                ("97.776.358/0001", 11, '2022-06-08 11:25:00', 20),
                ("97.776.358/0001", 12, '2022-06-08 11:25:00', 20),
                ("97.776.358/0001", 13, '2022-06-08 11:25:00', 30),
                ("97.776.358/0001", 14, '2022-06-08 11:25:00', 30);

select * from departamento;

select * from empregado
	where Departamento_idDepartamento in (5,6);
    
insert into vendas (dataVenda, desconto, valorTotal, Empregado_CPF, bomba_comp_idBombaComb)
	values ('2022-06-01 10:30:00', 0.0, 70.0, "077.188.387-02", 1),
			('2022-06-01 11:30:00', 0.0, 150.0, "100.300.650-76", 2),
            ('2022-06-01 11:35:00', 0.0, 100.0, "100.300.650-76", 1),
            ('2022-06-01 12:05:00', 0.0, 180.0, "100.300.650-76", 3),
            ('2022-06-01 12:15:00', 0.0, 100.0, "077.188.387-02", 2),
            ('2022-06-01 13:35:00', 0.0, 200.0, "100.300.650-76", 4),            
            ('2022-06-02 13:35:00', 0.0, 230.0, "077.188.387-02", 5),
            ('2022-06-01 10:35:00', 0.0, 10.0, "025.111.258-97", null),
            ('2022-06-01 11:30:00', 0.0, 12.0, "025.111.258-97", null),
            ('2022-06-01 12:08:00', 0.0, 23.0, "025.111.258-97", null),
            ('2022-06-01 12:36:00', 0.0, 44.0, "120.380.134-18", null),
			('2022-06-02 10:35:00', 0.0, 15.0, "120.380.134-18", null),
            ('2022-06-02 11:30:00', 0.0, 18.0, "120.380.134-18", null),
            ('2022-06-02 12:08:00', 0.0, 29.0, "120.380.134-18", null),
            ('2022-06-02 12:36:00', 0.0, 13.0, "120.380.134-18", null);

select * from vendas;
select * from estoque;            
insert into itensvenda 
	values (1, 1, 30.0),
			(2, 1, 12.0),
            (3, 2, 18.5),
            (4, 3, 14.0),
            (5, 3, 11.0),
            (6, 2, 30.0),
            (6, 1, 3.0),
            (7, 1, 30.0),
            (8, 4, 5),
            (9, 5, 2),
            (10, 6, 3),
            (11, 7, 2),
            (11, 13, 2),
            (12, 14, 3),
            (13, 8, 1),
            (13, 12, 2),
            (14, 9, 6),
            (15, 9, 2),
            (15, 10, 3);

insert into formapag (tipo, qtdParcelas, valor, Vendas_idVenda)
	values ("Débito", 0, 70.0 ,1),
			("Débito", 0, 150.0 ,2),
            ("Crédito", 0, 100.0 ,3),
            ("Débito", 0, 180.0 ,4),
            ("Pix", 0, 100.0 ,5),
            ("Débito", 0, 200.0 ,6),
            ("Crédito", 0, 230.0 ,7),
            ("Dinheiro", 0, 10.0 ,8),
            ("Pix", 0, 12.0 ,9),
            ("Dinheiro", 0, 23.0 ,10),
            ("Débito", 0, 44.0 ,11),
            ("Dinheiro", 0, 15.0 ,12),
            ("Crédito", 0, 18.0 ,13),
            ("Dinheiro", 0, 29.0 ,14),
            ("Pix", 0, 13.0 ,15);

 insert into telefone (numero, empregado_cpf, departamento_iddepartamento, fornecedor_cnpj)
	values ("8199985671", "070.154.874-57", null, null),
		("8121263306", null, 1, null),
        ("81212633602", null, 2, null),
        ("81212633562", null, 3, null),
        ("81212633432", null, 4, null),
        ("8132445678", null, null, "97.776.353/0001"),
        ("8135331817", null, null, "97.776.355/0001"),
        ("8135331237", null, null, "97.776.354/0001");

select * from empregado;

/*update empregado
	set nome = "Hugo Gonzaga Diniz", salario = 1900.00
		where cpf like "070.154.874-57";

update empregado
	set salario = salario * 1.1
		where departamento_idDepartamento = 6;

select * from estoque;

update estoque
	set valorProduto = valorProduto * 1.08
		where idProduto in (1,2,3);
        
update estoque
	set validade = '2025-02-01';*/
    
/*DQL*/
select * from empregado;
select * from dependente;
select * from departamento;
select * from endereco;
select * from estoque;
select * from vendas;

select nome, cpf, salario from empregado;

select * from fornecedor;

select *  from empregado
	where sexo = 'M';

select *  from empregado
	where sexo = 'M'
		order by nome;

select *  from empregado
	where sexo = 'M'
		order by dataadm;
        
select *  from empregado
	where sexo = 'M'
		order by dataadm desc;
        
select *  from empregado
		order by sexo, dataadm desc;

select nome "Nome", cpf as "CPF Empregado", salario "Salário", dataadm as "Data Admissão"
	from empregado
		order by salario;

select upper(nome) "Nome", cpf as "CPF Empregado", salario "Salário", dataadm as "Data Admissão"
	from empregado
		order by salario;

select ucase(nome)"Nome", cpf as "CPF Empregado", salario "Salário", dataadm as "Data Admissão"
	from empregado
		order by salario;
        
select avg(salario) from empregado;

select nome "Nome", cpf as "CPF Empregado", salario "Salário", dataadm as "Data Admissão"
	from empregado
		where salario < (select avg(salario) from empregado)
			order by nome;

select nome "Nome", cpf as "CPF Empregado", salario "Salário", dataadm as "Data Admissão"
	from empregado
		where salario >= (select avg(salario) from empregado)
			order by nome;
            
select idDepartamento from departamento
	where nome like "TI";

select nome "Nome", cpf as "CPF Empregado", salario "Salário", dataadm as "Data Admissão"
	from empregado
		where departamento_iddepartamento = (select idDepartamento from departamento where nome like "TI")
			order by nome;

select idDepartamento from departamento
	where nome like "TI"
		or nome like "Com%";
        
select nome "Nome", cpf as "CPF Empregado", salario "Salário", dataadm as "Data Admissão"
	from empregado
		where departamento_iddepartamento in (select idDepartamento from departamento where nome like "TI" or nome like "Com%")
			order by nome;
            
select nome "Nome", cpf as "CPF Empregado", salario "Salário", dataadm as "Data Admissão"
	from empregado
		where departamento_iddepartamento in (1, 4)
			order by nome;

/* % é o mesmo que * ou ... */
select nome "Nome", cpf as "CPF Empregado", salario "Salário", dataadm as "Data Admissão"
	from empregado
		where nome like "%Diniz%"
			order by nome;

/*Cross Join - ERRRADO*/
select e.nome "Nome", e.cpf "CPF", e.salario "Salario", e.dataadm "Data Admissão", d.nome "Departamento"
	from empregado e, departamento d;

/*Inner Join - CORRETO*/
select e.nome "Nome", e.cpf "CPF", e.salario "Salario", e.dataadm "Data Admissão", d.nome "Departamento"
	from empregado e, departamento d
		where e.departamento_iddepartamento = d.iddepartamento;


select e.nome "Nome", e.cpf "CPF", e.salario "Salario", e.dataadm "Data Admissão", d.nome "Departamento"
	from empregado e, departamento d
		where e.departamento_iddepartamento = d.iddepartamento
			and e.dataadm >= '2022-01-01';


select e.nome "Nome", e.cpf "CPF", e.salario "Salario", e.dataadm "Data Admissão", d.nome "Departamento"
	from empregado e, departamento d
		where e.departamento_iddepartamento = d.iddepartamento
			and e.dataadm between '2021-01-01' and '2022-03-31';


select e.nome "Nome", e.cpf "CPF", e.salario "Salario", e.dataadm "Data Admissão", d.nome "Departamento"
	from empregado e, departamento d
		where e.departamento_iddepartamento = d.iddepartamento
			and e.nome between 'a' and 'j'
				order by e.nome;
                
select * from telefone;

select numero from telefone
	where departamento_idDepartamento is not null;
    
select numero from telefone
	where empregado_cpf is null
			and fornecedor_cnpj is null;

select v.dataVenda "Data", e.nomeProduto "Produto", iv.quantidade "Quantidade", e.valorProduto "Valor",
		v.valorTotal "Valor Total", emp.nome "Funcionário"
	from vendas v, itensvenda iv, estoque e, empregado emp;
    
select v.dataVenda "Data", e.nomeProduto "Produto", iv.quantidade "Quantidade", e.valorProduto "Valor",
		v.valorTotal "Valor Total", emp.nome "Funcionário"
	from vendas v
		cross join itensvenda iv, estoque e, empregado emp;

select v.dataVenda "Data", e.nomeProduto "Produto", iv.quantidade "Quantidade", e.valorProduto "Valor",
		v.valorTotal "Valor Total", emp.nome "Funcionário"
	from vendas v, itensvenda iv, estoque e, empregado emp
		where iv.Vendas_idVenda = v.idVenda and
				iv.Estoque_idProduto =  e.idProduto and
                v.Empregado_CPF = emp.cpf;
                
select v.dataVenda "Data", e.nomeProduto "Produto", iv.quantidade "Quantidade", e.valorProduto "Valor",
		v.valorTotal "Valor Total", emp.nome "Funcionário"
	from vendas v, itensvenda iv, estoque e, empregado emp
		where iv.Vendas_idVenda = v.idVenda and
				iv.Estoque_idProduto =  e.idProduto and
                v.Empregado_CPF = emp.cpf
					order by v.dataVenda desc;

select v.dataVenda "Data", e.nomeProduto "Produto", iv.quantidade "Quantidade", e.valorProduto "Valor",
		v.valorTotal "Valor Total", emp.nome "Funcionário"
	from vendas v
		inner join itensvenda iv on iv.Vendas_idVenda = v.idVenda
		inner join estoque e on iv.Estoque_idProduto = e.idProduto
        inner join empregado emp on v.Empregado_CPF = emp.cpf			
					order by v.dataVenda desc;
                                
select e.nome "Nome", e.cpf "CPF", e.salario "Salario", e.dataadm "Data Admissão", d.nome "Departamento"
	from empregado e, departamento d
		where e.departamento_iddepartamento = d.iddepartamento
			order by e.nome;
        
select e.nome "Nome", e.cpf "CPF", e.salario "Salario", e.dataadm "Data Admissão", d.nome "Departamento"
	from empregado e
		inner join departamento d
			on e.departamento_iddepartamento = d.iddepartamento
				order by d.nome;

select v.dataVenda "Data", e.nomeProduto "Produto", iv.quantidade "Quantidade", e.valorProduto "Valor",
		v.valorTotal "Valor Total", emp.nome "Funcionário", dep.nome "Departamento"
	from vendas v
		inner join itensvenda iv on iv.Vendas_idVenda = v.idVenda
		inner join estoque e on iv.Estoque_idProduto = e.idProduto
        inner join empregado emp on v.Empregado_CPF = emp.cpf
        inner join departamento dep on emp.Departamento_idDepartamento = dep.idDepartamento
					order by v.dataVenda desc;
                                
select dep.nome "Departamento", count(emp.cpf) "Total Funcionários"
	from empregado emp
		inner join departamento dep on emp.Departamento_idDepartamento = dep.idDepartamento
			group by dep.idDepartamento
				order by dep.nome;

/*pode usar a tabela diretamento no group by*/
select dep.nome "Departamento", count(emp.cpf) "Total Funcionários"
	from empregado emp
		inner join departamento dep on emp.Departamento_idDepartamento = dep.idDepartamento
			group by departamento
				order by dep.nome;
                
select substring(email, 1, 10) from empregado;

select nome, salario from empregado
	order by nome;

select nome, concat("R$ ",salario) from empregado
	order by nome;

select nome "Funcionário", concat("R$ ",salario) "Salário" from empregado
	order by nome;

select * from vendas
	order by dataVenda;

select dataVenda "Data",  count(idVenda) "Quantidade Vendas"
	from vendas
		group by dataVenda;
/*Dia*/        
select substring(dataVenda, 1, 10) "Data",  count(idVenda) "Quantidade Vendas"
	from vendas
		group by substring(dataVenda, 1, 10);
/*Mês*/
select substring(dataVenda, 1, 7) "Data",  count(idVenda) "Quantidade Vendas"
	from vendas
		group by substring(dataVenda, 1, 7);

select emp.nome "Funcionário", count(v.idVenda) "Quantidade Vendas"
	from vendas v
		inner join empregado emp on v.Empregado_CPF = emp.cpf
			group by emp.cpf
				order by emp.nome;
                
select emp.nome "Funcionário", emp.email "E-mail", tel.numero "Telefone"
	from empregado emp
		inner join telefone tel on tel.Empregado_cpf = emp.cpf
			order by emp.nome;
        
select emp.nome "Funcionário", emp.email "E-mail", tel.numero "Telefone"
	from empregado emp
		left join telefone tel on tel.Empregado_cpf = emp.cpf
			order by emp.nome;