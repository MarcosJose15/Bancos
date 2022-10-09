(2022-2 ter-n) Banco de Dados - DQL e DTL
ADS 2º Módulo | PD - Noite
BDII - Revisão SQL, Acompanhamento de Projetos - 04/10/22
BDII - Revisão SQL, Acompanhamento de Projetos - 04/10/22
DANILO FARIAS SOARES DA SILVA
•
4 de out. Editado às 6 de out.
BDII - Revisão SQL, Acompanhamento de Projetos - 04/10/22

SENAC-ADS-2022.1-DDL-PostoComb.sql
Texto

SENAC-ADS-2022.1-DML-PostoComb.sql
Texto

Guia Completo de SQL: Aprenda SQL do Básico ao Avançado
https://www.devmedia.com.br/guia/guia-completo-de-sql/38314

10 Instruções SQL para manipulação de dados
https://www.devmedia.com.br/10-instrucoes-sql-para-manipulacao-de-dados/4832

SQL: Utilizando o Operador UNION e UNION ALL
https://www.devmedia.com.br/sql-utilizando-o-operador-union-e-union-all/37457

SENAC-ADS-2022.1-DQL-PostoComb.sql
SQL
Comentários da turma

select * from departamento;

select * from gerente;

select * from empregado;

-- ADS 2ª Manha PCRxPD Turma 2 (Terça) --

select d.cpf, d.nome, d.dataNasc, d.parentesco, e.cpf, e.nome
	from dependente d, empregado e
		where d.empregado_cpf = e.cpf and
			e.salario >= 2000;

select d.cpf, d.nome, d.dataNasc, d.parentesco, e.cpf, e.nome
	from dependente d
		inner join empregado e on d.empregado_cpf = e.cpf
			where e.salario >= 2000
				order by e.nome;

select e.cpf "CPF Empregado", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departamento", d.localdep "Local Departamento", eg.nome "Gerente"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
			inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
            inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
            inner join empregado eg on eg.cpf = g.empregado_cpf
				order by e.nome;
			
select date_format(v.dataVenda, '%h:%m %d/%m/%Y') "Data", p.nome "Produto", p.categoria "Categoria", p.valor "Preco Und",
				iv.qtdProduto "Quantidade", v.valorTotal "Valor Total", e.nome "Empregado",
				d.nome "Departamento", eg.nome "Gerente"
		from itensVenda iv 
			inner join vendas v on v.idvendas = iv.vendas_idvendas
            inner join estoque p on p.idproduto = iv.estoque_idproduto
            inner join empregado e on e.cpf = v.empregado_cpf
            inner join trabalhar t on t.empregado_cpf = e.cpf
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
            inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
            inner join empregado eg on eg.cpf = g.empregado_cpf
				order by v.dataVenda;
            
select e.cpf "CPF Empregado", e.nome "Empregado", count(v.empregado_cpf) "Quantidade Venda",
	sum(v.valorTotal) "Total das Vendas"
	from vendas v
		inner join empregado e on e.cpf = v.empregado_cpf
			group by v.empregado_cpf;
 
select substring(v.dataVenda, 1, 10) "Data Venda", 
	count(substring(v.dataVenda, 1, 10)) "Quantidade por Dia",
	sum(v.valorTotal) "Valor do Dia"
		from vendas v
			group by (substring(v.dataVenda, 1, 10));

select substring( date_format(v.dataVenda, '%d-%m-%Y'), 1, 10) "Data Venda", 
	count(substring(v.dataVenda, 1, 10)) "Quantidade por Dia",
	concat('R$ ' , round(sum(v.valorTotal), 2))  "Valor do Dia"
		from vendas v
			group by (substring(v.dataVenda, 1, 10));
    
select e.cpf "CPF Empregado", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departamento", d.localdep "Local Departamento", eg.nome "Gerente"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
			inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
            inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
            inner join empregado eg on eg.cpf = g.empregado_cpf
				where e.cpf in (select empregado_cpf from dependente)
					order by e.nome;

 select e.cpf "CPF Empregado", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departamento", d.localdep "Local Departamento", eg.nome "Gerente"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
			inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
            inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
            inner join empregado eg on eg.cpf = g.empregado_cpf
				where e.cpf in (select empregado_cpf from vendas)
					order by e.nome;
            
select e.cpf "CPF Empregado", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departamento", d.localdep "Local Departamento", eg.nome "Gerente"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
			inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
            inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
            inner join empregado eg on eg.cpf = g.empregado_cpf
				where e.salario >= (select avg(salario) from empregado)
					order by e.nome;            
            
select e.cpf "CPF Empregado", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departamento", d.localdep "Local Departamento", eg.nome "Gerente"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
			inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
            inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
            inner join empregado eg on eg.cpf = g.empregado_cpf
				where e.salario <= (select avg(salario) from empregado)
					order by e.nome;              
    
select d.nome "Departamento", d.email "Email", d.localDep "Local Departamento", d.horario "Horário", 
	d.descricao "Descrição Departamento", d.gerente_empregado_cpf "CPF Gerente", e.nome "Gerente"
     from departamento d, gerente g, empregado e
		where d.gerente_empregado_cpf = g.empregado_cpf and
				g.empregado_cpf = e.cpf;

select d.nome "Departamento", d.email "Email", d.localDep "Local Departamento", d.horario "Horário", 
	d.descricao "Descrição Departamento", d.gerente_empregado_cpf "CPF Gerente", e.nome "Gerente"
     from departamento d 
		inner join gerente g on d.Gerente_Empregado_CPF = g.empregado_cpf
        inner join empregado e on g.empregado_cpf = e.cpf;

select d.nome, d.cpf, d.dataNasc, d.parentesco, e.nome, e.cpf
	from dependente as d, empregado e
		where d.empregado_cpf = e.cpf;

select d.nome, d.cpf, d.dataNasc, d.parentesco, e.nome, e.cpf
	from dependente as d
		inner join empregado e on d.empregado_cpf = e.cpf;
        
select e.nome "Empregado", e.dataAdm "Data Admissão", d.nome "Departamento", 
	d.localDep "Local Departamento", o.nome "Ocupação", e.salario "Salário"
		from trabalhar t
			inner join empregado e on t.empregado_cpf = e.cpf
			inner join departamento d on t.Departamento_idDepartamento = d.iddepartamento
			inner join ocupacao o on t.ocupacao_cbo = o.cbo;
            
create view empregadoTrab as
	select e.nome "Empregado", e.dataAdm "Data Admissão", d.nome "Departamento", 
	d.localDep "Local Departamento", o.nome "Ocupação", e.salario "Salário"
		from trabalhar t
			inner join empregado e on t.empregado_cpf = e.cpf
			inner join departamento d on t.Departamento_idDepartamento = d.iddepartamento
			inner join ocupacao o on t.ocupacao_cbo = o.cbo;
     
select * from empregadotrab;

desc empregadotrab;
     
select * from empregadotrab
	order by departamento;

select * from empregadotrab
	where `Salário` >= (select avg(salario) from empregado)
		order by departamento;

drop view empregadotrab;

select e.cpf "CPF", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departamento", tel.numero "Telefone"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
            inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
            inner join telefone tel on tel.empregado_cpf = e.cpf;
            
select e.cpf "CPF", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departamento", tel.numero "Telefone"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
            inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
            left join telefone tel on tel.empregado_cpf = e.cpf
				order by d.nome;       
 
select e.nome "Empregado", d.nome "Departamento", f.nome "Fornecedor", t.numero "Telefone"
	from telefone t
		left join empregado e on e.cpf = t.empregado_cpf
        left join departamento d on d.iddepartamento = t.departamento_iddepartamento
        left join fornecedor f on f.`cnpj/cpf` = t.`fornecedor_cnpj/cpf`; 

select e.nome "Nome", t.numero "Telefone", Empregado
		from telefone t
			inner join empregado e on e.cpf = t.empregado_cpf;

create view telefoneEmp as
	select e.nome "Nome", t.numero "Telefone"
		from telefone t
			inner join empregado e on e.cpf = t.empregado_cpf;

create view telefoneDep as
	select d.nome "Nome", t.numero "Telefone"
		from telefone t
			inner join departamento d on d.iddepartamento = t.departamento_iddepartamento;

create view telefoneForn as
	select f.nome "Nome", t.numero "Telefone"
		from telefone t
			inner join fornecedor f on f.`cnpj/cpf` = t.`fornecedor_cnpj/cpf`;

select * from telefoneemp
	union select * from telefonedep
		union select * from telefoneforn;

-- ADS 2ª Noite PCRxPD Turma 1 (Terça) --
-- cross join --
select d.cpf, d.nome, d.dataNasc, d.parentesco, e.cpf, e.nome
	from dependente d, empregado e; 	

-- inner join (implicita) --
select d.cpf, d.nome, d.dataNasc, d.parentesco, e.cpf, e.nome
	from dependente d, empregado e
		where d.empregado_cpf = e.cpf and
				e.nome like "Juliana%"; 

-- inner join (explicita) --
select d.cpf, d.nome, d.dataNasc, d.parentesco, e.cpf, e.nome
	from dependente d
		inner join empregado e on d.empregado_cpf = e.cpf;

select d.cpf, d.nome, d.dataNasc, d.parentesco, e.cpf, e.nome
	from dependente d
		inner join empregado e on d.empregado_cpf = e.cpf
			where e.nome like "Juliana%";
            
select f.anoRef, f.dataIni, f.dataFim, f.qtdDias, e.nome
	from ferias f
		inner join empregado e on f.empregado_cpf = e.cpf
			order by f.anoRef desc, f.dataIni;

select e.nome "Empregado", d.cpf 
	from empregado e
		inner join dependente d on d.empregado_cpf = e.cpf
			order by e.nome;

select e.nome "Empregado", d.cpf 
	from empregado e
		left join dependente d on d.empregado_cpf = e.cpf
			order by e.nome;

select e.nome "Empregado", count(e.nome) "Qtd Dependentes"
	from empregado e
		inner join dependente d on d.empregado_cpf = e.cpf
			group by e.nome	
				order by e.nome;

select e.nome "Empregado", count(d.cpf) "Qtd Dependentes"
	from empregado e
		left join dependente d on d.empregado_cpf = e.cpf
			group by e.nome	
				order by e.nome;

select e.nome "Empregado", count(d.cpf) "Qtd Dependentes"
	from empregado e
		left join dependente d on d.empregado_cpf = e.cpf
			group by e.nome
				order by count(d.cpf) desc;
		
select e.nome "Empregado", v.idvendas
	from empregado e
		left join vendas v on v.empregado_cpf = e.cpf;       
        
select e.nome "Empregado", count(v.idvendas) "Qtd Vendas"
	from empregado e
		inner join vendas v on v.empregado_cpf = e.cpf
			group by v.empregado_cpf
				order by count(v.idvendas) desc;

select e.nome "Empregado", count(v.idvendas) "Qtd Vendas"
	from empregado e
		left join vendas v on v.empregado_cpf = e.cpf
			group by e.nome
				order by count(v.idvendas) desc;

select e.cpf "CPF", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departamento"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
            inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
				order by e.nome;

select e.cpf "CPF", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departamento", eg.nome "Gerente"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
            inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
            inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
            inner join empregado eg on eg.cpf = g.empregado_cpf
				order by e.nome;

select round(avg(salario), 2)
	from empregado;

select e.cpf "CPF", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departamento", eg.nome "Gerente"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
            inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
            inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
            inner join empregado eg on eg.cpf = g.empregado_cpf
				where e.salario >= (select avg(salario) from empregado)
					order by e.nome;
                    
create view empregadoTrab as
	select e.cpf "CPF", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
		d.nome "Departamento", eg.nome "Gerente"
			from trabalhar t
				inner join empregado e on e.cpf = t.empregado_cpf
				inner join ocupacao o on o.cbo = t.ocupacao_cbo
				inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
				inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
				inner join empregado eg on eg.cpf = g.empregado_cpf;

select * from empregadotrab
	where salário <= (select avg(salario) from empregado);

-- ADS 2ª Manhã PCRxPD Turma 1 (Quarta) --
-- cross join --
select d.cpf, d.nome, d.dataNasc, d.parentesco, e.cpf, e.nome
	from dependente d, empregado e;
    
-- inner join (implicita) --
select d.cpf, d.nome, d.dataNasc, d.parentesco, e.cpf, e.nome
	from dependente d, empregado e
		where d.empregado_cpf = e.cpf;
        
-- inner join (explicito) --
select d.cpf, d.nome, d.dataNasc, d.parentesco, e.cpf, e.nome
	from dependente d
		inner join empregado e on d.empregado_cpf = e.cpf;

select f.anoRef, f.dataIni, f.dataFim, f.qtdDias, e.nome
	from ferias f
		inner join empregado e on e.cpf = f.empregado_cpf
			order by f.anoref;

select f.anoRef, f.dataIni, f.dataFim, f.qtdDias, e.nome
	from ferias f
		inner join empregado e on e.cpf = f.empregado_cpf
			order by f.anoref desc;

select f.anoRef, f.dataIni, f.dataFim, f.qtdDias, e.nome
	from ferias f
		inner join empregado e on e.cpf = f.empregado_cpf
			where e.nome like "João%"
				order by f.anoref desc;

select f.anoRef "Ano Referência", f.dataIni "Data Início", f.dataFim "Data Fim", 
	f.qtdDias "Quantidade Dias", e.nome "Empregado"
	from ferias f
		inner join empregado e on e.cpf = f.empregado_cpf
        inner join trabalhar t on t.empregado_cpf = e.cpf
        inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
			where d.nome like "Administra%"
				order by f.anoref desc;

select e.cpf "CPF Empregado", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departamento", d.localdep "Local Departamento"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
            inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
				order by d.nome;
                
select e.cpf "CPF Empregado", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departamento", d.localdep "Local Departamento", eg.nome "Gerente"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
            inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
            inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
            inner join empregado eg on eg.cpf = g.empregado_cpf
				order by d.nome;
            
select e.cpf "CPF Empregado", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departamento", d.localdep "Local Departamento", eg.nome "Gerente"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
            inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
            inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
            inner join empregado eg on eg.cpf = g.empregado_cpf
				where e.salario >= (select avg(salario) from empregado)
						order by d.nome;

create view empregadoTrab as
	select e.cpf "CPF Empregado", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
		d.nome "Departamento", d.localdep "Local Departamento", eg.nome "Gerente"
			from trabalhar t
				inner join empregado e on e.cpf = t.empregado_cpf
				inner join ocupacao o on o.cbo = t.ocupacao_cbo
				inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
				inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
				inner join empregado eg on eg.cpf = g.empregado_cpf
					order by e.nome;


select * from empregadotrab;

select * from empregadotrab
	order by departamento;
    
select avg(salario) from empregado;

select * from empregadotrab
	where `Salário` <= (select avg(salario) from empregado)
		order by `Local Departamento`;

drop view empregadotrab;

select e.cpf "CPF Empregado", e.nome "Empregado", tel.numero "Telefone",e.salario "Salário", o.nome "Ocupação",
	d.nome "Departamento", d.localdep "Local Departamento", eg.nome "Gerente"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
            inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
            inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
            inner join empregado eg on eg.cpf = g.empregado_cpf
            inner join telefone tel on tel.Empregado_CPF = e.CPF
				order by d.nome;

select e.cpf "CPF Empregado", e.nome "Empregado", tel.numero "Telefone",e.salario "Salário", o.nome "Ocupação",
	d.nome "Departamento", d.localdep "Local Departamento", eg.nome "Gerente"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
            inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
            inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
            inner join empregado eg on eg.cpf = g.empregado_cpf
            left join telefone tel on tel.Empregado_CPF = e.CPF
				order by d.nome;
                
select * from telefone;

select e.nome "Empregado", d.nome "Departamento", f.nome "Fornecedor", tel.numero "Telefone"
	from telefone tel
		inner join empregado e on e.cpf = tel.Empregado_CPF
        inner join departamento d on d.idDepartamento = tel.Departamento_idDepartamento
        inner join fornecedor f on f.`cnpj/cpf` = tel.`Fornecedor_cnpj/cpf`;

select e.nome "Empregado", d.nome "Departamento", f.nome "Fornecedor", tel.numero "Telefone"
	from telefone tel
		left join empregado e on e.cpf = tel.Empregado_CPF
        left join departamento d on d.idDepartamento = tel.Departamento_idDepartamento
        left join fornecedor f on f.`cnpj/cpf` = tel.`Fornecedor_cnpj/cpf`
        order by e.nome desc;

select e.nome "Empregado", tel.numero "Telefone"
	from empregado e
		left join telefone tel on tel.Empregado_CPF = e.CPF;
        
select e.nome "Nome", tel.numero "Telefone"
	from empregado e
		inner join telefone tel on tel.Empregado_CPF = e.CPF
			order by e.nome;

select d.nome "Nome", tel.numero "Telefone"
	from departamento d
		inner join telefone tel on tel.Departamento_idDepartamento = d.idDepartamento
			order by d.nome;
             
select f.nome "Nome", tel.numero "Telefone"
	from fornecedor f
		inner join telefone tel on tel.`Fornecedor_cnpj/cpf` = f.`cnpj/cpf`
			order by f.nome;

create view telefoneEmp as 
	select e.nome "Empregado", tel.numero "Telefone"
		from empregado e
			inner join telefone tel on tel.Empregado_CPF = e.CPF
				order by e.nome;
                
create view telefoneDep as
	select d.nome "Departamento", tel.numero "Telefone"
		from departamento d
			inner join telefone tel on tel.Departamento_idDepartamento = d.idDepartamento
				order by d.nome;
                
create view telefoneFor as
	select f.nome "Fornecedor", tel.numero "Telefone"
		from fornecedor f
			inner join telefone tel on tel.`Fornecedor_cnpj/cpf` = f.`cnpj/cpf`
				order by f.nome;
                
select * from telefoneemp
	union select * from telefonedep
		union select * from telefonefor;

select e.nome "Nome", tel.numero "Telefone"
	from empregado e
		inner join telefone tel on tel.Empregado_CPF = e.CPF
union
select d.nome "Nome", tel.numero "Telefone"
	from departamento d
		inner join telefone tel on tel.Departamento_idDepartamento = d.idDepartamento
union             
select f.nome "Nome", tel.numero "Telefone"
	from fornecedor f
		inner join telefone tel on tel.`Fornecedor_cnpj/cpf` = f.`cnpj/cpf`
			order by "Nome";
            
select v.dataVenda "Data Venda", est.nome "Produto", iv.qtdProduto "Quantidade", est.valor "Valor Produto",
	v.valorTotal "Total Venda", emp.nome "Empregado", d.nome "Departamento"
	from vendas v
		inner join itensvenda iv on iv.Vendas_idVendas = v.idVendas
        inner join estoque est on est.idProduto = iv.Estoque_idProduto
        inner join empregado emp on emp.cpf = v.Empregado_CPF
        inner join trabalhar t on t.Empregado_CPF = emp.CPF
        inner join departamento d on d.idDepartamento = t.Departamento_idDepartamento;

-- envolvendo view --
select v.dataVenda "Data Venda", est.nome "Produto", iv.qtdProduto "Quantidade", est.valor "Valor Produto",
	v.valorTotal "Total Venda", empT.`Empregado`, empT.`Departamento`
	from vendas v
		inner join itensvenda iv on iv.Vendas_idVendas = v.idVendas
        inner join estoque est on est.idProduto = iv.Estoque_idProduto
        inner join empregadotrab empT on empT.`CPF Empregado` = v.Empregado_CPF;

select emp.cpf "CPF", emp.nome "Empregado", count(v.idVendas) "Qtd Vendas"
	from vendas v 
		inner join empregado emp on emp.cpf = v.Empregado_CPF
			group by v.Empregado_CPF;
            
-- Errado, devido ao relacionamento de empregado com trabalhar --
select empT.`CPF Empregado`, empT.`Empregado`, empT.`Departamento`, count(v.idVendas) "Qtd Vendas"
	from vendas v 
		inner join empregadotrab empT on empT.`CPF Empregado` = v.Empregado_CPF
			group by v.Empregado_CPF;
            
select emp.cpf "CPF", emp.nome "Empregado", count(v.idVendas) "Qtd Vendas", 
	sum(v.valorTotal) "Total Vendido"
		from vendas v 
			inner join empregado emp on emp.cpf = v.Empregado_CPF
				group by v.Empregado_CPF
					order by sum(v.valorTotal) desc;

select substring(v.dataVenda, 1, 10), count(v.idVendas), sum(v.valorTotal)
	from vendas v
		group by substring(v.dataVenda, 1, 10);
    
-- ADS 2ª Noite Turma 2 (Quinta s2) --

select * from dependente;
-- cross join (implicita) --
select d.cpf, d.nome, d.dataNasc, d.parentesco, e.cpf, e.nome
	from dependente d, empregado e;

-- cross join (explicito) --
select d.cpf, d.nome, d.dataNasc, d.parentesco, e.cpf, e.nome
	from dependente d
		cross join empregado e;

-- inner join (implicita) --
select d.cpf, d.nome, d.dataNasc, d.parentesco, e.cpf, e.nome
	from dependente d, empregado e
		where e.cpf = d.empregado_cpf
			order by d.nome;

-- inner join (explicito) --
select d.cpf, d.nome, d.dataNasc, d.parentesco, e.cpf, e.nome
	from dependente d
		inner join empregado e on e.cpf = d.empregado_cpf
			order by d.nome;

select e.cpf "CPF Empregado", e.nome "Empregado", e.salario "Salário",  o.nome "Ocupação",
	d.nome "Departamento", d.localdep "Local Departamento"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
            inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
				order by d.nome;
            
select e.cpf "CPF Empregado", e.nome "Empregado", e.salario "Salário",  o.nome "Ocupação",
	d.nome "Departamento", d.localdep "Local Departamento"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
            inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
				where e.nome like "João%"
					order by d.nome;

select e.cpf "CPF Empregado", e.nome "Empregado", e.salario "Salário",  o.nome "Ocupação",
	d.nome "Departamento", d.localdep "Local Departamento", eg.nome "Gerente"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
            inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
			inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
            inner join empregado eg on eg.cpf = g.empregado_cpf
				order by d.nome;

select e.cpf "CPF Empregado", e.nome "Empregado", e.salario "Salário",  o.nome "Ocupação",
	d.nome "Departamento", d.localdep "Local Departamento", eg.nome "Gerente"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
            inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
			inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
            inner join empregado eg on eg.cpf = g.empregado_cpf
				where e.salario >= (select avg(salario) from empregado)
					order by d.nome;

select e.cpf "CPF Empregado", e.nome "Empregado", e.salario "Salário",  o.nome "Ocupação",
	d.nome "Departamento", d.localdep "Local Departamento", eg.nome "Gerente"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
            inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
			inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
            inner join empregado eg on eg.cpf = g.empregado_cpf
			inner join endereco ed on ed.empregado_cpf = e.cpf
				where ed.cidade like "%ecife"
					order by d.nome;
		
create view empregadoTrab as
	select e.cpf "CPF Empregado", e.nome "Empregado", e.salario "Salário",  o.nome "Ocupação",
		d.nome "Departamento", d.localdep "Local Departamento", eg.nome "Gerente"
			from trabalhar t
				inner join empregado e on e.cpf = t.empregado_cpf
				inner join ocupacao o on o.cbo = t.ocupacao_cbo
				inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
				inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
				inner join empregado eg on eg.cpf = g.empregado_cpf
					order by d.nome;

select * from empregadotrab;

select * from empregadotrab 
	where `Salário` >= (select avg(salario) from empregado);

select * 
	from empregadotrab et
		inner join endereco ed on ed.empregado_cpf = et.`CPF Empregado`
			where ed.cidade like "Recife";
    
select e.cpf "CPF Empregado", e.nome "Empregado", tel.numero "Telefone", 
	e.salario "Salário",  o.nome "Ocupação", d.nome "Departamento", 
    d.localdep "Local Departamento", eg.nome "Gerente"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
            inner join ocupacao o on o.cbo = t.ocupacao_cbo
            inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
			inner join gerente g on g.empregado_cpf = d.gerente_empregado_cpf
            inner join empregado eg on eg.cpf = g.empregado_cpf
            left join telefone tel on tel.empregado_cpf = e.cpf
				order by d.nome; 
                
select * from telefone;

select e.nome "Empregado", d.nome "Departamento", f.nome "Fornecedor", tel.numero "Número"
	from telefone tel
		left join departamento d on d.iddepartamento = tel.departamento_iddepartamento
        left join empregado e on e.CPF = tel.Empregado_CPF
        left join fornecedor f on f.`cnpj/cpf` = tel.`Fornecedor_cnpj/cpf`;

select e.nome "Empregado", tel.numero "Número"
	from telefone tel
        left join empregado e on e.CPF = tel.Empregado_CPF;

select e.nome "Empregado", tel.numero "Número"
	from telefone tel
        inner join empregado e on e.CPF = tel.Empregado_CPF;

select e.nome "Empregado", tel.numero "Número"
	from telefone tel
        right join empregado e on e.CPF = tel.Empregado_CPF;

select e.nome "Nome",  
	case when tel.Empregado_CPF  is not null then 'Empregado'
		end "Tipo",		   
	tel.numero "Número"
		from telefone tel
			inner join empregado e on e.CPF = tel.Empregado_CPF
union
select d.nome "Nome", 
	case when tel.Departamento_idDepartamento  is not null then 'Departamento'
		end "Tipo",
	tel.numero "Número"
		from telefone tel
			inner join departamento d on d.iddepartamento = tel.departamento_iddepartamento
union
select f.nome "Nome",
	case when tel.`Fornecedor_cnpj/cpf`  is not null then 'Fornecedor'
		end "Tipo",
	tel.numero "Número"
	from telefone tel
        inner join fornecedor f on f.`cnpj/cpf` = tel.`Fornecedor_cnpj/cpf`;

create view agenda as
	select e.nome "Nome",  
		case when tel.Empregado_CPF  is not null then 'Empregado'
			end "Tipo",		   
		tel.numero "Número"
			from telefone tel
				inner join empregado e on e.CPF = tel.Empregado_CPF
	union
	select d.nome "Nome", 
		case when tel.Departamento_idDepartamento  is not null then 'Departamento'
			end "Tipo",
		tel.numero "Número"
			from telefone tel
				inner join departamento d on d.iddepartamento = tel.departamento_iddepartamento
	union
	select f.nome "Nome",
		case when tel.`Fornecedor_cnpj/cpf`  is not null then 'Fornecedor'
			end "Tipo",
		tel.numero "Número"
		from telefone tel
			inner join fornecedor f on f.`cnpj/cpf` = tel.`Fornecedor_cnpj/cpf`;

select * from agenda;

select v.dataVenda "Data", est.nome "Produto", iv.qtdproduto "Quantidade", 
	v.valorTotal "Total", emp.nome "Empregado", d.nome "Departamento"
		from vendas v
			inner join empregado emp on emp.cpf = v.Empregado_CPF
            inner join trabalhar t on t.Empregado_CPF = emp.CPF
            inner join departamento d on d.idDepartamento = t.Departamento_idDepartamento
            inner join itensvenda iv on iv.Vendas_idVendas = v.idVendas
            inner join estoque est on est.idProduto = iv.Estoque_idProduto;

select e.nome "Empregado", count(v.empregado_cpf) "Quantidade Vendas"
	from vendas v
		inner join empregado e on e.CPF = v.Empregado_CPF
			group by v.empregado_cpf
				order by count(v.empregado_cpf) desc;
            
select e.nome "Empregado", count(v.empregado_cpf) "Quantidade Vendas", 
	sum(v.valorTotal) "Total"
		from vendas v
			inner join empregado e on e.CPF = v.Empregado_CPF
				group by v.empregado_cpf
					order by sum(v.valorTotal) desc;

select d.nome "Departamento", count(v.empregado_cpf) "Quantidade Vendas", 
	sum(v.valorTotal) "Total"
		from vendas v
			inner join empregado e on e.cpf = v.Empregado_CPF
            inner join trabalhar t on t.Empregado_CPF = e.CPF
            inner join departamento d on d.idDepartamento = t.Departamento_idDepartamento
				group by v.empregado_cpf
					order by sum(v.valorTotal) desc;

select e.cpf
	from trabalhar t
		inner join empregado e on e.CPF = t.Empregado_CPF
        inner join departamento d on d.idDepartamento = t.Departamento_idDepartamento
			where d.nome like "Frente%";

select e.nome "Empregado", count(v.empregado_cpf) "Quantidade Vendas", 
	sum(v.valorTotal) "Total"
		from vendas v
			inner join empregado e on e.CPF = v.Empregado_CPF
				where e.CPF in (select e.cpf from trabalhar t
									inner join empregado e on e.CPF = t.Empregado_CPF
									inner join departamento d on d.idDepartamento = t.Departamento_idDepartamento
										where d.nome like "Frente%")
					group by v.empregado_cpf
						order by sum(v.valorTotal) desc;

select substring(v.dataVenda, 1, 10) "Data", 
	count(substring(v.dataVenda, 1, 10)) "Quantidade Vendas", sum(v.valorTotal) "Total"
		from vendas v
			group by substring(v.dataVenda, 1, 10);



-- ADS 3ª Noite PCRxPD (UNIT) (Sexta) --
-- cross join --
select d.cpf, d.nome, d.dataNasc, d.parentesco, e.cpf, e.nome
	from dependente d, empregado e;

-- inner join (implicita) --
select d.cpf, d.nome, d.dataNasc, d.parentesco, e.cpf, e.nome
	from dependente d, empregado e
		where d.empregado_cpf = e.cpf;

-- inner join (explicita) --
select d.cpf, d.nome, d.dataNasc, d.parentesco, e.cpf, e.nome
	from dependente d
		inner join empregado e on d.empregado_cpf = e.cpf;

select e.cpf "CPF", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departemento", d.localDep "Local do Departamento"
    from trabalhar t
		inner join empregado e on e.cpf = t.empregado_cpf
        inner join ocupacao o on o.cbo = t.ocupacao_cbo
        inner join departamento d on d.iddepartamento = t.departamento_iddepartamento;

select e.cpf "CPF", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departemento", d.localDep "Local do Departamento", eg.nome "Gerente"
    from trabalhar t
		inner join empregado e on e.cpf = t.empregado_cpf
        inner join ocupacao o on o.cbo = t.ocupacao_cbo
        inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
        inner join gerente g on d.gerente_empregado_cpf = g.empregado_cpf
        inner join empregado eg on eg.cpf = g.empregado_cpf;

select e.cpf "CPF", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departemento", d.localDep "Local do Departamento", eg.nome "Gerente"
    from trabalhar t
		inner join empregado e on e.cpf = t.empregado_cpf
        inner join ocupacao o on o.cbo = t.ocupacao_cbo
        inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
        inner join gerente g on d.gerente_empregado_cpf = g.empregado_cpf
        inner join empregado eg on eg.cpf = g.empregado_cpf
        inner join endereco en on en.empregado_cpf = e.cpf
			where en.cidade like "%ecife";

select avg(salario) from empregado;

select e.cpf "CPF", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departemento", d.localDep "Local do Departamento", eg.nome "Gerente"
    from trabalhar t
		inner join empregado e on e.cpf = t.empregado_cpf
        inner join ocupacao o on o.cbo = t.ocupacao_cbo
        inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
        inner join gerente g on d.gerente_empregado_cpf = g.empregado_cpf
        inner join empregado eg on eg.cpf = g.empregado_cpf
			where e.salario <= (select avg(salario) from empregado);
            
create view empregadoTrab as
	select e.cpf "CPF", e.nome "Empregado", e.salario "Salário", o.nome "Ocupação",
		d.nome "Departemento", d.localDep "Local do Departamento", eg.nome "Gerente"
		from trabalhar t
			inner join empregado e on e.cpf = t.empregado_cpf
			inner join ocupacao o on o.cbo = t.ocupacao_cbo
			inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
			inner join gerente g on d.gerente_empregado_cpf = g.empregado_cpf
			inner join empregado eg on eg.cpf = g.empregado_cpf;

select * from empregadotrab;

select * from empregadotrab
	where `Salário` >= (select avg(salario) from empregado);

select e.cpf "CPF", e.nome "Empregado", tel.numero "Telefone", e.salario "Salário", o.nome "Ocupação",
	d.nome "Departemento", d.localDep "Local do Departamento", eg.nome "Gerente"
    from trabalhar t
		inner join empregado e on e.cpf = t.empregado_cpf
        inner join ocupacao o on o.cbo = t.ocupacao_cbo
        inner join departamento d on d.iddepartamento = t.departamento_iddepartamento
        inner join gerente g on d.gerente_empregado_cpf = g.empregado_cpf
        inner join empregado eg on eg.cpf = g.empregado_cpf
        left join telefone tel on tel.empregado_cpf = e.cpf;
SENAC-ADS-2022.1-DQL-PostoComb.sql
Exibindo SENAC-ADS-2022.1-DQL-PostoComb.sql…
