SELECT
    order_date,
    CONCAT (name, ' (age:', age, ')') AS person_information
FROM
    public.person_order
    JOIN public.person ON person_id = person.id
ORDER BY
    order_date,
    person_information