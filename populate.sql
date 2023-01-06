INSERT INTO genres(genre_id, genre_name)
VALUES
(1, 'documentary'),
(2, 'scifi'),
(3, 'drama'),
(4, 'comedy'), 
(5, 'western');
INSERT INTO production(production_id, production_name)
VALUES
(1, 'GB'),
(2, 'US'),
(3, 'IN'),
(4, 'US'),
(5, 'UA');
INSERT INTO shows(show_id, title, release_year, genre_id, duration, production_id)
VALUES
(1, 'David Attenborough: A Life on Our Planet', 2020, 1, 83, 1),
(2, 'Inception', 2010, 2, 148, 1),
(3, 'Forrest Gump', 1994, 3, 142, 2),
(4, 'Anbe Sivam', 2003, 4, 160, 3),
(5, 'Bo Burnham: Inside', 2021, 4, 87, 4);
INSERT INTO showscoredate(show_id, last_update, number_of_votes, score)
VALUES
(1, '29.12.2022', 31180, 9.0),
(2, '29.12.2022', 2268288, 8.8),
(3, '29.12.2022', 1994599, 8.8),
(4, '29.12.2022', 20595, 8.7),
(5, '29.12.2022', 44074, 8.7);