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