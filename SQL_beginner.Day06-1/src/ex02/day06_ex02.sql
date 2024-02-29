SELECT
    person.name,
    menu.pizza_name,
    menu.price,
    ROUND(price - person_discounts.discount * price * 0.01, 0) AS discount_price,
    pizzeria.name AS pizzeria_name
FROM
    person_discounts
    JOIN person ON person.id = person_discounts.person_id
    JOIN pizzeria ON pizzeria.id = person_discounts.pizzeria_id
    JOIN menu ON menu.pizzeria_id = pizzeria.id
ORDER BY
    name,
    pizza_name