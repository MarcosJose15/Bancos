--AULA 34 - Utilizando Inner Join
USE sakila; --USE Banco

SELECT * --Selecione tudo(*)
FROM customer --Da Tabela
--Coloque junto Tabela com Tabela aonde (ON) Tabela.Coluna = Tabela.Coluna
JOIN payment ON customerrer.customer_id = payment.payment_id 


--AULA 35 - Filtrando com Join
SELECT  --Selecione 
    customer.customer_id,  --Tabela.Coluna,
    customer.first_name, --Tabela.Coluna,
    customer.last_name, --Tabela.Coluna,
    payment.rental_id,  --Tabela.Coluna,
    payment.amount --Tabela.Coluna,
FROM customer --Da Tabela
JOIN payment --Coloque junto Tabela com Tabela(do FROM) 
    ON customerrer.customer_id = payment.payment_id --Aonde (ON) Tabela.Coluna = Tabela.Coluna


--AULA 36 - Adicionando um Alias (Adicionando Apelido a uma Tabela)
SELECT  --Selecione 
    cus.customer_id,  --Tabela(Apelido).Coluna,
    cus.first_name, --Tabela(Apelido).Coluna,
    cus.last_name, --Tabela(Apelido).Coluna,
    pay.rental_id,  --Tabela(Apelido).Coluna,
    pay.amount --Tabela(Apelido).Coluna,
FROM customer cus --Da Tabela (Apelido)
JOIN payment pay --Coloque junto Tabela (Apelido) com Tabela(do FROM) 
    ON cus.customer_id = pay.payment_id --Aonde (ON) Tabela(Apelido).Coluna = Tabela(Apelido).Coluna


--AULA 37 - Multiplas Tabelas
SELECT  --Selecione 
    cus.customer_id,  --Tabela(Apelido).Coluna,
    cus.first_name, --Tabela(Apelido).Coluna,
    cus.last_name, --Tabela(Apelido).Coluna,
    adr.address, --Tabela(Apelido).Coluna,
    pay.rental_id,  --Tabela(Apelido).Coluna,
    pay.amount --Tabela(Apelido).Coluna,
FROM customer cus --Da Tabela (Apelido)
JOIN payment pay --Coloque junto Tabela (Apelido) com Tabela(do FROM) 
    ON cus.customer_id = pay.payment_id --Aonde (ON) Tabela(Apelido).Coluna = Tabela(Apelido).Coluna
JOIN adress adr --Coloque junto Tabela (Apelido) com Tabela(do FROM)
    ON cus.customer_id = adr.address_id --Aonde (ON) Tabela(Apelido).Coluna = Tabela(Apelido).Coluna


--AULA 38 - LEFT e RIGHT Join
SELECT   
    cus.customer_id,  
    cus.first_name, 
    cus.last_name, 
    adr.address, 
    pay.rental_id,
    pay.amount 
FROM customer cus 
LEFT JOIN payment pay --LEFT - Mostra todos do lado esquerdo independente de ter ou não correspondente do lado direito. 
    ON cus.customer_id = pay.payment_id 
RIGHT JOIN adress adr --RIGHT - Mostra todos do lado direito independente de ter ou não correspondente do lado esquerdo.
    ON cus.customer_id = adr.address_id 


    
--AULA 39 -  Adicionando UNION - Ele junta dois selects no mesmo resulatado
SELECT   
    cus.customer_id,  
    cus.first_name, 
    cus.last_name, 
    pay.amount,
    'VIP' AS Status --Adicione 'VIP' para nova COLUNA (Status) 
FROM customer cus 
JOIN payment pay 
    ON cus.customer_id = pay.payment_id
    WHERE pay.amount >= 10.99 --Quando A.Tabela.Coluna for MAIOR ou IGUAL 10.99

UNION --JUNTA OS DOIS SELECTS EM UM SÓ RESULTADO

SELECT   
    cus.customer_id,  
    cus.first_name, 
    cus.last_name, 
    pay.amount,
    'NO VIP' AS Status --Adicione 'VIP' para nova COLUNA (Status) 
FROM customer cus 
JOIN payment pay 
    ON cus.customer_id = pay.payment_id
    WHERE pay.amount < 10.99; --Quando A.Tabela.Coluna for MAIOR ou IGUAL 10.99;