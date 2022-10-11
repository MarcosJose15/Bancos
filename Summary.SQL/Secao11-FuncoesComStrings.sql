USE sakila;

-- 63 - Funcoes com strings
SELECT TRIM('    Carros      '); -- TRIM -> Remove os espaços da string
SELECT LTRIM('   Carros  '); -- LTRIM -> Remove os espaços da esquerda
SELECT RTRIM('   Carros  '); -- RTRIM -> Remove os espaços da direita

SELECT TRIM(BOTH 'a' FROM 'aaaaaaaCarrosaaaaaaa'); -- BOTH -> Remove letras repetidas tanto do inicio quanto do final
SELECT TRIM(LEADING 'a' FROM 'aaaaaaaCarrosaaaaaaa'); -- LEADING -> Remove letras repetidas apenas antes da palavra
SELECT TRIM(TRAILING 'a' FROM 'aaaaaaaCarrosaaaaaaa'); -- TRAILING -> Remove letras repetidas depois da palavra

SELECT LOCATE('o', 'Carros'); -- LOCATE -> Localiza uma letra dentro de uma string

SELECT UCASE('Carros'); -- UCASE -> Deixa todas a letras maiusculas
SELECT LCASE('Carros'); -- LCASE -> Deixa todas a letras minusculas

SELECT LENGTH('Carros'); -- LENGTH -> Informa quantos espaços têm na string

SELECT REPEAT('Carros', 4); -- REPEAT -> Repete a palavra x vezes

SELECT RIGHT('Carros', 4); -- RIGHT -> Informe as x ultimas letras
SELECT LEFT('Carros', 4); -- LEFT -> Informe as x primeiras letras

