WITH kate_visit AS (
    SELECT
        *
    FROM
        person
    WHERE
        name = 'Kate'
)
SELECT
    pizza_name,
    price,
    pizzeria.name AS pizzeria_name,
    visit_date
FROM
    person_visits
    JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
    JOIN kate_visit ON kate_visit.id = person_visits.person_id
    JOIN menu ON pizzeria.id = menu.pizzeria_id
WHERE
    menu.price >= 800
    and menu.price <= 1000
ORDER BY
    pizza_name,
    price,
    pizzeria_name