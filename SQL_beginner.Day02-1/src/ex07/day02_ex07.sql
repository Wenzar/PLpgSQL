WITH menu_under_800 AS(
    SELECT
        *
    FROM
        menu
    WHERE
        price < 800
)
SELECT
    pizzeria.name AS pizza_name
FROM
    person
    JOIN person_visits ON person_visits.person_id = person.id
    JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    JOIN menu_under_800 ON menu_under_800.pizzeria_id = pizzeria.id
WHERE
    person.name = 'Dmitriy'
    and visit_date = '2022-01-08'