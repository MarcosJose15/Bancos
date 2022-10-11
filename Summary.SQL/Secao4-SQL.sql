USE sakila;

-- 21 - Modificando Coluna
SELECT 
    customer_id,
    amount,
    amount - (amount * 0.10) AS '10% de desconto' -- Reduzindo valor em -10%
FROM payment
WHERE customer_id = 1;

-- 23 - Operadores AND, OR e NOT
SELECT * FROM customer
WHERE store_id = 1 AND active = 0; -- Mostre os clientes inativos da loja 1

SELECT * FROM payment
WHERE staff_id = 1 AND amount = 0.99; -- Mostre as vendas de 0.99 do funcionario 1

SELECT * FROM payment
WHERE NOT staff_id = 1 AND amount = 4.99 AND customer_id < 10; -- Mostre as vendas de 4.99 menos do funcionario 1 realizadas pelos clientes até id 9

-- 24 - Operador in
SELECT * FROM address
WHERE district IN ('Texas','Alberta','California'); -- Filtrando por atributo, IN ao inves de vários OR

-- 25 - Operador Between
SELECT * FROM payment
WHERE amount BETWEEN 1.99 AND 3.99; -- Filtre por valor >= 1.99 e <= 3.99

-- 26 - Operador LIKE
SELECT * FROM actor
WHERE first_name LIKE 'A%'; -- Filtre o primeiro nome que começam com A (% - Qualquer outra coisa depois)

SELECT * FROM actor
WHERE first_name LIKE '%O'; -- Filtre o primeiro nome que terminam com O (% - Qualquer outra coisa antes)

-- 28 - Operador IS NULL
SELECT * FROM address
WHERE address2 IS NULL; -- Filtre por endereço 2 atributo vazio

-- 29 - Operador LIMIT
SELECT * FROM actor
LIMIT 5, 10; -- Mostre 10 registros a partir do 5

-- 30 - 
SELECT * FROM actor
WHERE first_name REGEXP 'a'; -- Filtre pelo primeiro nome que contenha 'a'

SELECT * FROM actor
WHERE first_name REGEXP '^a|^d'; -- (^) comece com 'a' ou  'd'

SELECT * FROM actor
WHERE first_name REGEXP '[ge]a'; -- Filtre os que contem com 'ga' ou 'ea'

SELECT * FROM actor
WHERE first_name REGEXP '^[ge]a'; -- Filtre os que começam com 'ga' ou 'ea'
