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
