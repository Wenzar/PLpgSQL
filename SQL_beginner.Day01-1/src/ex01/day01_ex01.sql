(
    SELECT
        name AS object_name
    FROM
        public.person
    ORDER BY
        name
)
UNION
ALL (
    SELECT
        pizza_name
    FROM
        public.menu
    ORDER BY
        pizza_name
)