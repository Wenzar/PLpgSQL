CREATE FUNCTION fnc_persons_female()
RETURNS TABLE (id INT, name TEXT,age TEXT, gender TEXT, address TEXT) AS
$$
    SELECT *
    FROM person
    WHERE gender = 'female';
$$
LANGUAGE SQL;

CREATE FUNCTION fnc_persons_male()
RETURNS TABLE (id INT, name TEXT,age TEXT, gender TEXT, address TEXT) AS
$$
    SELECT *
    FROM person
    WHERE gender = 'male';
$$
LANGUAGE SQL;

SELECT *
FROM fnc_persons_male();

SELECT *
FROM fnc_persons_female();
