SELECT
    person.name AS person_name,
    pizza_name,
    pizzeria.name AS pizzeria_name
FROM
    public.person_order
    JOIN public.person ON person.id = person_order.person_id
    JOIN public.menu ON menu.id = person_order.menu_id
    JOIN public.pizzeria ON pizzeria.id = menu.pizzeria_id
ORDER BY
    person_name,
    pizza_name,
    pizzeria_name