WITH visit_in_pizzeria AS (
    SELECT
        name,
        COUNT(visit_date) AS count_of_visits
    FROM
        person_visits
        RIGHT JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    GROUP BY
        name
),
order_in_pizzeria AS (
    SELECT
        name,
        COUNT(order_date) AS count
    FROM
        person_order
        JOIN menu ON person_order.menu_id = menu.id
        RIGHT JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    GROUP BY
        name
)
SELECT
    visit_in_pizzeria.name,
    SUM(count_of_visits + count) AS total_count
FROM
    order_in_pizzeria
    JOIN visit_in_pizzeria ON visit_in_pizzeria.name = order_in_pizzeria.name
GROUP BY
    visit_in_pizzeria.name
ORDER BY
    total_count DESC,
    name