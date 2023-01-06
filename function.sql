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