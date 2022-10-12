-- 73 - Visualizando a DB de usuários
USE mysql;
SELECT * FROM user;

SELECT * FROM mysql.user;



-- 74 - Criando usuários
CREATE USER maria IDENTIFIED BY '1242'; -- Criando usuário e senha
CREATE USER joao@localhost IDENTIFIED BY '1242'; -- Este usuário só pode acessar o banco na rede local
CREATE USER ricardo@192.168.10.1 IDENTIFIED BY '1242'; -- Este usuário só pode acessar deste IP
CREATE USER priscila@andreiacono.com IDENTIFIED BY '1242'; -- Este usuário só pode acessar deste dominio

SELECT * FROM mysql.user;



-- 75 - Removendo usuários
DROP USER joao@localhost;

SELECT * FROM mysql.user;



-- 76 - Recuperando a senha do usuário
SET PASSWORD FOR priscila@andreiacono.com = '17842'; -- Nova senha do usuário

SET PASSWORD = '6866994'; -- Nova senha para meu usuário

SELECT * FROM mysql.user;



-- 77 - Aplicando privilégios a usuários
SHOW GRANTS FOR priscila@andreiacono.com; -- Visualizar as permissões do usuário

GRANT SELECT, INSERT, UPDATE, DELETE -- Adicionando permissões para um usuário
ON sakila.* -- No banco sakila em todas as tabelas
TO priscila@andreiacono.com; -- Para o usuario priscila



-- 78 - Adicionando um ADMIN
GRANT ALL -- Permissão total para
ON sakila.* -- determinado banco em todas as tabelas
TO priscila@andreiacono.com; -- Para o usuario priscila


SHOW GRANTS FOR priscila@andreiacono.com; 

SHOW GRANTS FOR joao@localhost;

GRANT ALL -- Permissão total a
ON *.* -- todos os bancos
TO joao@localhost; -- Para o usuario joao




-- 79 - Removendo privilégios de usuários
GRANT SELECT, INSERT, UPDATE
ON sakila.*
TO maria;

REVOKE UPDATE -- Remover privilégio
ON sakila.* -- do banco para todas as tabelas
FROM maria;

SHOW GRANTS FOR maria;
