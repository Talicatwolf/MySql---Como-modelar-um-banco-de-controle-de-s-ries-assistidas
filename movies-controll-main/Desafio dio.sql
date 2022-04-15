--Criar a tabela categoria de filmes

IF NOT EXISTS tipo(
	tipo_id SERIAL PRIMARY KEY,
	categoria VARCHAR (20)
)

--Criar a tabela de séries
CREATE TABLE IF NOT EXISTS series_assistidas (
	serie_id SERIAL PRIMARY KEY,
	tipo INT ,
	nome VARCHAR (50) NOT NULL,
	total_ep INT,
	ep_atual  INT,
	ultima_view DATE,
	FOREIGN KEY(tipo) REFERENCES tipo(tipo_id)
)

--Inserir as categorias de séries
INSERT INTO tipo (categoria) VALUES ('ação'),('comedia'),('drama'),('terror'),('misterio');

--Ver as tabelas e seus nomes

SELECT *
FROM pg_catalog.pg_tables
WHERE schemaname != 'pg_catalog' AND 
    schemaname != 'information_schema';

--inserir dados na tabela series
INSERT INTO series_assistidas (tipo, nome, total_ep, ep_atual, ultima_view) VALUES 
(3, 'Lucifer', 93, 93, current_timestamp),
(1, 'Heroes', 77, 11, current_timestamp),
(1, 'Arcane', 9, 9, current_timestamp),
(2, 'Todo Mundo odeio a Chris', 88, 88, current_timestamp),
(4, 'American Horror Story', 1, 133, current_timestamp),
(5, 'Sherlock Holmes', 13, 13, current_timestamp),
(2, 'Brooklyn Nine-Nine', 153, 12, current_timestamp),
(3, 'Roma', 22, 22, current_timestamp),
(3, 'Game of Thrones', 73, 73, current_timestamp),
(3, 'Breaking Bad', 62, 62, current_timestamp)

--Erro no American horror history, inverteu o total de episódio com os assistidos
UPDATE series_assistidas SET total_ep = 133 WHERE serie_id = 5
UPDATE series_assistidas SET ep_atual = 1 WHERE serie_id = 5

--Alguns selects 
SELECT * FROM tipo
SELECT tipo, total_ep, nome FROM series_assistidas GROUP BY tipo, total_ep, nome;
SELECT * FROM series_assistidas GROUP BY series_assistidas.tipo
SELECT tipo, total_ep, nome FROM series_assistidas ORDER BY tipo
SELECT tipo, total_ep, nome FROM series_assistidas ORDER BY tipo DESC

DELETE FROM series_assistidas WHERE serie_id = 1
DELETE FROM series_assistidas

DROP TABLE series_assistidas


