USE sakila;

-- 50 - Aplicando funções básicas
SELECT 
	MAX(amount) AS 'MAIOR',
	MIN(amount) AS 'MENOR',
	AVG(amount) AS 'VALOR MEDIO'
FROM payment;


-- 51 - Utilizando o COUNT e SUM
SELECT 
	MAX(amount) AS 'Maior',
	MIN(amount) AS 'Menor',
	AVG(amount) AS 'Valor medio',
    SUM(amount) AS 'Total de vendas', -- SUM = SOMA DE VALORES
    COUNT(amount) AS 'Numero de vendas' -- COUNT -> Calcula a quantidade de Registros em uma tabela
FROM payment
WHERE staff_id = 1; -- Filtrando pela id do funcionario



-- 52 - Agrupando os clientes
SELECT
	customer_id,
    SUM(amount) AS 'Total'
FROM payment
GROUP BY customer_id -- Agrupar pelo id
ORDER BY total DESC; -- Ordenar pelo total de forma do maior para o menor (descobrindo o cliente que mais gastou)


-- 53 - Ordenando os clientes
-- Mostre os dados dos clientes ordenando os que mais gastaram para os que menores gastaram
SELECT
	c.customer_id AS 'ID',
    c.first_name AS 'Nome',
    c.last_name AS 'Sobrenome',
    SUM(amount) AS 'Total'
    
FROM payment pay
JOIN customer c USING(customer_id) -- Adicione a tabela customer atráves do id
GROUP BY customer_id -- Agrupar pelo id
ORDER BY Total DESC;




-- 54 - Filtrando os valores com o HAVING
SELECT
	c.customer_id AS 'ID',
    c.first_name AS 'Nome',
    c.last_name AS 'Sobrenome',
    SUM(amount) AS 'Total',
    COUNT(amount) AS 'QtdCompras'
FROM payment pay
JOIN customer c USING(customer_id) 
GROUP BY customer_id
HAVING Total >= 150 AND QtdCompras >= 35 -- Filtre pelas compras com valor maior ou igual a 150 e por igual ou mais de 35 compras feita pelo cliente
ORDER BY Total DESC;
