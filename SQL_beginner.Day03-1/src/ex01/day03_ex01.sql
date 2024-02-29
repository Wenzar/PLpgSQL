WITH menu_and_orders AS(
    SELECT
        menu_id
    FROM
        person_order
    UNION
    ALL
    SELECT
        id
    FROM
        menu
),
count_of_menu_orders AS (
    SELECT
        menu_id,
        COUNT(*) AS count_of_orders
    FROM
        menu_and_orders
    GROUP BY
        menu_id
)
SELECT
    menu_id
FROM
    count_of_menu_orders
WHERE
    count_of_orders = 1
ORDER BY
    menu_id