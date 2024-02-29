SELECT
    order_date AS action_date,
    person_id
FROM
    public.person_order
INTERSECT
SELECT
    visit_date AS action_date,
    person_id
FROM
    public.person_visits
ORDER BY
    action_date,
    person_id DESC