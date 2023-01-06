-- Функція, яка повертає назви фільмів з рейтингом не меншим за заданий
DROP FUNCTION IF EXISTS get_show_by_score(numeric);
CREATE OR REPLACE FUNCTION get_show_by_score(rating numeric) 
RETURNS TABLE(title text, score numeric)
LANGUAGE 'plpgsql'
AS $$
BEGIN 
	RETURN QUERY
   SELECT shows.title, showscoredate.score FROM shows JOIN showscoredate ON showscoredate.show_id = shows.show_id
   WHERE showscoredate.score >= rating;
END;
$$; 

SELECT get_show_by_score(8.8);
SELECT * FROM showscoredate

-- Процедура, яка надає інформацію про жанр фільму
DROP PROCEDURE IF EXISTS get_genre(text);
CREATE OR REPLACE PROCEDURE get_genre(_show text)
LANGUAGE 'plpgsql'
AS $$
DECLARE genre genres.genre_name%TYPE;
DECLARE show_name shows.title%TYPE;

BEGIN
    SELECT title, genre_name into show_name, genre FROM genres JOIN shows ON shows.genre_id = genres.genre_id
	WHERE title = _show;
    RAISE INFO 'Title: %,  Genre: %', _show, genre;
END;
$$;

CALL get_genre('David Attenborough: A Life on Our Planet')
CALL get_genre('Inception')
SELECT * FROM shows
SELECT * FROM genre

-- Тригер, який переводить значення production у верхній регістр
DROP TRIGGER IF EXISTS insert_production_name ON production;

CREATE OR REPLACE FUNCTION upper_production_name() RETURNS trigger 
LANGUAGE 'plpgsql'
AS
$$
	BEGIN
	 	UPDATE production 
        SET production_name = upper(production_name) 
		WHERE production.production_id = NEW.production_id;
	 	RETURN NULL;
		
     END;
$$;

CREATE TRIGGER insert_production_name
AFTER INSERT ON production
FOR EACH ROW EXECUTE FUNCTION upper_production_name()

INSERT INTO production(production_id, production_name) VALUES(999, 'aa')
DELETE FROM production WHERE production_name = 'AA'
SELECT * FROM production