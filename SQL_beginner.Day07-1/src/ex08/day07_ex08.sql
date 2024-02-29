SELECT
    address,
    pizzeria.name,
    COUNT(menu_id) AS count_of_orders
FROM
    menu
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    JOIN person_order ON person_order.menu_id = menu.id
    JOIN person ON person.id = person_order.person_id
GROUP BY
    address,
    pizzeria.name
ORDER BY
    address,
    pizzeria.name