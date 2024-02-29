WITH female_order_peperoni AS (
    SELECT
        person.name
    FROM
        person_order
        JOIN person ON person_order.person_id = person.id
        JOIN menu ON menu.id = person_order.menu_id
    WHERE
        person.gender = 'female'
        AND pizza_name = 'pepperoni pizza'
),
female_order_cheese AS (
    SELECT
        person.name
    FROM
        person_order
        JOIN person ON person_order.person_id = person.id
        JOIN menu ON menu.id = person_order.menu_id
    WHERE
        person.gender = 'female'
        AND pizza_name = 'cheese pizza'
)
SELECT
    person.name
FROM
    person
    JOIN female_order_peperoni ON female_order_peperoni.name = person.name
    JOIN female_order_cheese ON female_order_cheese.name = person.name
ORDER BY
    person.name