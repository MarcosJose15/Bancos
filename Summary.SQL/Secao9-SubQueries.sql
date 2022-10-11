USE sakila;

-- 57 - Criando uma Subquery
SELECT *
FROM payment
WHERE amount >= (SELECT AVG(amount)) -- Filtre pelo valor maior ou igual ao valor medio
ORDER BY amount DESC;

-- 58 - Trabalhando com o MAX em SubQueries
SELECT *
FROM payment
WHERE amount = (
	SELECT MAX(amount)
    FROM payment
    WHERE customer_id = 1
); -- Selecione as comprar que foram iguais a maior compra do cliente id 1


-- 59 - Utilizando IN
SELECT * FROM customer
WHERE customer_id IN ( -- IN -> Está dentro
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING COUNT(*) > 35
);


-- 60 - Utilizando o ANY -> (Qualquer um)
SELECT * FROM customer
WHERE customer_id =ANY ( -- (=ANY) -> Igual a qualquer um dentro de (Subquery)
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING COUNT(*) > 35
); -- Chegando ao mesmo resultado da Aula 59
