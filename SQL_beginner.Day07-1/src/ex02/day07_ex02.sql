(
    SELECT
        name,
        COUNT(visit_date) AS count,
        'visit' AS action_type
    FROM
        person_visits
        JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    GROUP BY
        name
    LIMIT
        3
)
UNION
(
    SELECT
        name,
        COUNT(order_date) AS count_of_visits,
        'order' AS action_type
    FROM
        person_order
        JOIN menu ON person_order.menu_id = menu.id
        JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    GROUP BY
        name
    LIMIT
        3
)
ORDER BY
    action_type,
    count DESC