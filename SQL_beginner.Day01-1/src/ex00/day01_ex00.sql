SELECT
    id AS object_id,
    pizza_name AS object_name
FROM
    public.menu
UNION
SELECT
    id AS object_id,
    name AS object_name
FROM
    public.person
ORDER BY
    object_id ASC,
    object_name ASC