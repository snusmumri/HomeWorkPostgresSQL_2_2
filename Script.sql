CREATE TABLE IF NOT EXISTS janrs (
id SERIAL PRIMARY KEY, 
janr VARCHAR(60) UNIQUE NOT NULL 
);

CREATE TABLE IF NOT EXISTS Singers (
id SERIAL PRIMARY KEY, 
singer VARCHAR(60) UNIQUE NOT NULL 
);

CREATE TABLE IF NOT EXISTS janrsSingers (
janr_id SERIAL REFERENCES janrs(id), 
singer_id SERIAL REFERENCES Singers(id), 
CONSTRAINT pk PRIMARY KEY (janr_id, singer_id)
);

CREATE TABLE IF NOT EXISTS Albums (
id SERIAL PRIMARY KEY, 
name_album VARCHAR(60) NOT NULL,
year_of_album INT NOT NULL 
);

CREATE TABLE IF NOT EXISTS AlbumsSingers (
album_id SERIAL REFERENCES Albums(id), 
singer_id SERIAL REFERENCES Singers(id), 
CONSTRAINT pk1 PRIMARY KEY (album_id, singer_id)
);

CREATE TABLE IF NOT EXISTS Trecks (
id SERIAL PRIMARY KEY,
album_id INTEGER NOT NULL REFERENCES Albums(id), 
name_treck VARCHAR(90) NOT NULL,
time INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Collections (
id SERIAL PRIMARY KEY, 
name VARCHAR(60) UNIQUE NOT NULL,
year INT NOT NULL
);

CREATE TABLE IF NOT EXISTS TrecksCollections (
treck_id SERIAL REFERENCES Trecks(id), 
collection_id SERIAL REFERENCES Collections(id), 
CONSTRAINT pk2 PRIMARY KEY (treck_id, collection_id)
);

INSERT INTO janrs (id, janr) 
VALUES (1, 'Rock'),
(2, 'R&B'),
(3, 'Pop'),
(4, 'Rap');

INSERT INTO Singers (id, singer) 
VALUES (1, 'Чайковский'),
(2, 'Бетховен'),
(3, 'Стравинский'),
(4, 'Моцарт и Сольери');

INSERT INTO janrsSingers (janr_id, singer_id) 
VALUES (1, 4),
(2, 3),
(3, 2),
(4, 1);

INSERT INTO Albums (id, name_album, year_of_album) 
VALUES (1, 'Времена года', 2024),
(2, 'Лебединое озеро', 2019),
(3, 'Лунная соната', 2005),
(4, 'Концерт 5', 2020);

INSERT INTO AlbumsSingers (album_id, singer_id) 
VALUES (4, 1),
(3, 2),
(2,3),
(1, 4);

INSERT INTO Trecks (id, name_treck, time, album_id) 
VALUES (1, 'My favorite song 0', 98, 2),
(2, 'Our favorite song 1', 198, 1),
(3, 'My favorite song 2', 83, 3),
(4, 'Her favorite song 3', 256, 4),
(5, 'My favorite song 4', 69, 3),
(6, 'His favorite song 5', 47, 3);

INSERT INTO Collections (id, name, year) 
VALUES (1, 'Best collection', 1998),
(2, 'The Best', 2024),
(3, 'World mixcollection', 2019),
(4, 'My collection', 2020),
(5, 'Super mix', 2001);

INSERT INTO TrecksCollections (treck_id, collection_id) 
VALUES (6, 4),
(2, 3),
(3, 2),
(5, 1);

SELECT name_treck, time 
FROM Trecks 
WHERE time=(SELECT MAX(time) FROM Trecks);

SELECT name_treck 
FROM Trecks 
WHERE time>= 210;

SELECT name
FROM Collections c 
WHERE year >=2018 AND year <= 2020;

SELECT singer 
FROM Singers 
WHERE singer NOT LIKE '% %';

SELECT name_treck 
FROM Trecks t  
WHERE lower(name_treck) LIKE 'my %' OR 
lower(name_treck) LIKE '% my' OR 
lower(name_treck) LIKE '% my %' OR 
lower(name_treck) LIKE 'my';

SELECT janr, COUNT(singer)
FROM Singers S
LEFT JOIN janrsSingers js ON S.id = js.janr_id
LEFT JOIN janrs j ON js.janr_id = j.id
GROUP BY janr;

SELECT COUNT(name_treck) 
FROM Trecks t  
LEFT JOIN Albums a ON a.id = t.album_id
WHERE year_of_album BETWEEN 2019 AND 2020;

SELECT name_album, AVG(time)
FROM Albums a 
LEFT JOIN Trecks ON a.id = Trecks.album_id
GROUP BY name_album;

SELECT singer  
FROM Singers s
WHERE singer NOT IN (SELECT singer  
FROM Singers s
LEFT JOIN AlbumsSingers ALS ON s.id = ALS.album_id
LEFT JOIN Albums a ON ALS.album_id = a.id
WHERE year_of_album = 2020);

SELECT name, name_treck
FROM Collections c 
LEFT JOIN TrecksCollections TC ON c.id = TC.collection_id 
LEFT JOIN Trecks T ON TC.treck_id = T.id
LEFT JOIN Albums A ON T.album_id = A.id 
LEFT JOIN AlbumsSingers ALS ON A.id = ALS.album_id
LEFT JOIN Singers s ON s.id = ALS.singer_id
WHERE singer LIKE '%Моцарт и Сольери%'
;


SELECT name, name_treck
FROM Collections c 
LEFT JOIN TrecksCollections TC ON c.id = TC.collection_id 
;

SELECT name, collection_id
FROM Collections c 
LEFT JOIN TrecksCollections TC ON c.id = TC.collection_id 


SELECT id, janr 
FROM janrs j;

SELECT id, singer 
FROM Singers s;

SELECT id, name_treck, album_id, time 
FROM Trecks t ;

