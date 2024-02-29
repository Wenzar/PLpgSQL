WITH male_Moscow_Samara AS(
    SELECT
        *
    FROM
        person
    WHERE
        gender = 'male'
        AND address = 'Moscow'
        OR address = 'Samara'
)
SELECT
    male_Moscow_Samara.name AS name
FROM
    male_Moscow_Samara
    JOIN person_order ON person_order.person_id = male_Moscow_Samara.id
    JOIN menu ON menu.id = person_order.menu_id
WHERE
    menu.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY
    name DESC