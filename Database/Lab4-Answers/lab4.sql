--Lab 4

--Kosta Nikopoulos

--DROP TABLE games;
--DROP TABLE store;

CREATE TABLE games(
g_id NUMBER ,
g_name VARCHAR2(20) NOT NULL,
g_price NUMBER(8,3) NOT NULL,
g_quantity NUMBER NOT NULL,
release_date DATE NOT NULL,
PRIMARY KEY(g_id)
);

CREATE TABLE store(
s_id NUMBER ,
s_name VARCHAR2(25) NOT NULL,
s_location VARCHAR2(50) NOT NULL,
s_quantity NUMBER NOT NULL,
s_contact CHAR(12) NOT NULL,
g_id NUMBER,
PRIMARY KEY(s_id)
);
ALTER TABLE store ADD CONSTRAINT fk_store_games
FOREIGN KEY(g_id)REFERENCES games(g_id);

--Games
INSERT INTO games VALUES (1, 'Assassins Creed', 40, 9000, DATE '2007-06-25');
INSERT INTO games VALUES (2, 'Transformers', 30, 5000, DATE '2009-08-30');
INSERT INTO games VALUES (3, 'Minecraft', 35, 2000, DATE '2011-11-18');
INSERT INTO games VALUES (4, 'Fortnite', 29.99, 6000, DATE '2017-07-21');
INSERT INTO games VALUES (5, 'CallofDuty', 99.99, 7000, DATE '2020-11-19');

--Store
INSERT INTO store VALUES (1, 'Walmart','Laval', 100, '450-969-3226', 1);
INSERT INTO store VALUES (2, 'EB Games','Chateaugay', 500, '450-699-9011', 2);
INSERT INTO store VALUES (3, 'Best Buy', 'Laval', 200, '450-781-2030', 3);
INSERT INTO store VALUES (4, 'La Source','Montreal', 300, '450-689-7905', 4);
INSERT INTO store VALUES (5, 'Walmart','Montreal', 400, '514-832-4810', 5);

--Update
UPDATE games
SET
g_price = 70,
g_quantity = 8000,
release_date = '2020-12-31'
WHERE
g_id = 4;

--Delete
DELETE 
FROM store
WHERE
s_location = 'Montreal';

--Verification
SELECT * FROM games;
SELECT * FROM store;

