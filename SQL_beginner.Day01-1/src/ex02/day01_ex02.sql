SELECT
    pizza_name
FROM
    public.menu
UNION
SELECT
    pizza_name
FROM
    public.menu
ORDER BY
    pizza_name DESC