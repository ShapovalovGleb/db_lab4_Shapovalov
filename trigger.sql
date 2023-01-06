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