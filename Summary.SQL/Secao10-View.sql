USE sakila;

-- 61 - Criando a primeira View
CREATE VIEW vendas_por_cliente AS -- Criando um atalho para a query
SELECT
	c.customer_id,
    c.first_name,
    c.last_name,
    p.amount
FROM customer c
JOIN payment p
	ON c.customer_id = p.payment_id;
    
SELECT * FROM sakila.vendas_por_cliente; -- Mostre a view



-- 62 -  Realizando DROP ou REPLACE
DROP VIEW vendas_por_cliente; -- Apague a view

CREATE OR REPLACE VIEW vendas_por_cliente AS -- OR REPLACE VIEW -> Para atualizar a view sem erro
SELECT
	c.customer_id,
    c.first_name,
    c.last_name,
    p.amount
FROM customer c
JOIN payment p
	ON c.customer_id = p.payment_id
ORDER BY p.amount DESC;
