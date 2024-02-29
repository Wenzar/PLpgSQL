CREATE FUNCTION fnc_person_visits_and_eats_on_date(pperson TEXT DEFAULT 'Dmitriy',pprice INT DEFAULT 500, pdate DATE DEFAULT '2022-01-08')
RETURNS TABLE (name VARCHAR) AS
$$
BEGIN
    RETURN QUERY 
    SELECT DISTINCT pizzeria.name
    FROM person
    JOIN person_visits ON person.id = person_visits.person_id
    JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
    JOIN menu ON pizzeria.id = menu.pizzeria_id
    WHERE person.name = pperson AND menu.price < pprice AND person_visits.visit_date = pdate;
END;
$$
LANGUAGE plpgsql;

SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
