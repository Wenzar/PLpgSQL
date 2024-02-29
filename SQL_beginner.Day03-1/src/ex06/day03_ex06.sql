WITH same_prices_on_same_pizzas AS (
    SELECT
        pizza_name,
        price,
        count (price)
    FROM
        menu
        JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    GROUP BY
        pizza_name,
        price
    HAVING
        count(price) > 1
),
pizza_and_pizzerias AS (
    SELECT
        menu.pizza_name,
        pizzeria.name,
        menu.price,
        menu.id
    FROM
        menu
        JOIN same_prices_on_same_pizzas ON same_prices_on_same_pizzas.pizza_name = menu.pizza_name
        JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    WHERE
        menu.price = same_prices_on_same_pizzas.price
    ORDER BY
        menu.id
)
SELECT
    pp1.pizza_name AS pizza_name,
    pp1.name AS pizzeria_name_1,
    pp2.name AS pizzeria_name_2,
    pp1.price AS price
FROM
    pizza_and_pizzerias pp1
    JOIN pizza_and_pizzerias pp2 ON pp1.price = pp2.price
    AND pp1.id > pp2.id
ORDER BY
    pizza_name