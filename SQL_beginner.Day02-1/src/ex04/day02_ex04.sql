SELECT
    menu.pizza_name,
    pizzeria.name AS pizzeria_name,
    menu.price
FROM
    menu
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE
    menu.pizza_name LIKE '%mushroom%'
    OR menu.pizza_name LIKE '%pepperoni%'
ORDER BY
    pizza_name,
    pizzeria_name