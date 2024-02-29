WITH visit_but_not_order AS (
    SELECT
        visit_date,
        person_id
    FROM
        person_visits
    EXCEPT
    SELECT
        order_date,
        person_id
    FROM
        person_order
)
SELECT
    pizzeria.name AS pizzeria_name
FROM
    person
    JOIN visit_but_not_order ON visit_but_not_order.person_id = person.id
    JOIN person_visits ON person_visits.visit_date = visit_but_not_order.visit_date
    JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
WHERE
    person.name = 'Andrey'
ORDER BY
    pizzeria_name