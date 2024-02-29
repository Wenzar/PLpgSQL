SELECT
    name,
    rating
FROM
    public.pizzeria
    LEFT JOIN public.person_visits ON pizzeria.id = person_visits.pizzeria_id
WHERE
    visit_date IS NULL