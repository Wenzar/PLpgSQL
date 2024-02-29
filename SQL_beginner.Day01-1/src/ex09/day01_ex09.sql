SELECT
    name
FROM
    public.pizzeria
WHERE
    NOT id IN(
        SELECT
            pizzeria_id
        FROM
            public.person_visits
    );

SELECT
    name
FROM
    public.pizzeria
WHERE
    NOT EXISTS(
        SELECT
            DISTINCT pizzeria_id
        FROM
            public.person_visits
        WHERE
            pizzeria_id = pizzeria.id
    )