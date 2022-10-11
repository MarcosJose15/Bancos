USE sakila;

SELECT * FROM language;

-- 42 - Adicionando uma linha a tabela
INSERT INTO language -- Adicione dentro da tabela language
VALUES(default, 'Portugues', '2001-06-24 05:02:19'); -- Os valores (de acordo com as colunas)

SELECT * FROM language;



-- 43 - Adicionando multiplas linhas
INSERT INTO language
VALUES
	(default, 'Alemao', '2011-07-10 05:02:19'),
    (default, 'Espanhol', '2011-07-10 05:02:19'),
    (default, 'Polones', '2009-01-30 05:02:19');


-- 44 - Inserindo em multiplas tabelas
INSERT INTO country
VALUES
	(default, 'JAMAICA VERDE', '2050-02-22 04:44:00');

INSERT INTO city
VALUES
	(default, 'Brasilandia', last_insert_id(), '2020-06-26 04:44:00');
    -- last_insert_id() -> Usado para inserir o último valor atribuido neste caso para encontrar o id para chave estrangeira
    
    
    
-- 45 - Copiar uma Tabela completa
CREATE TABLE payment_backup AS
SELECT * FROM payment;
    
    

-- 46 - Removendo uma tabela
DROP TABLE payment_backup; -- Remover toda a tabela e os dados

TRUNCATE TABLE payment_backup; -- Remover apenas os dados


-- 47 - Atualizando um valor
UPDATE payment -- Atualize na tabela payment
SET	amount = 15.99 -- Na coluna amount = novo valor (Informa a coluna e o novo valor)
WHERE payment_id = 1; -- Na linha do id 1 (Informa a linha)



-- 48 - Deletando um valor (Registro)
DELETE FROM payment -- Apague da tabela payment
WHERE payment_id = 997; -- O registro de id 1641
