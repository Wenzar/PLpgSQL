DROP FUNCTION IF EXISTS fnc_persons_female();
DROP FUNCTION IF EXISTS fnc_persons_male();

CREATE FUNCTION fnc_persons(pgender TEXT DEFAULT 'female')
RETURNS TABLE (id INT, name TEXT,age TEXT, gender TEXT, address TEXT) AS
$$
    SELECT *
    FROM person
    WHERE gender = pgender;
$$
LANGUAGE SQL;

SELECT *
FROM fnc_persons(pgender := 'male');

SELECT *
FROM fnc_persons();
