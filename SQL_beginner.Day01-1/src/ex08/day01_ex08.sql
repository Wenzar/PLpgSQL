SELECT
    pv.order_date,
    CONCAT (name, ' (age:', age, ')') AS person_information
FROM
    public.person_order AS pv(primary_key, id, menu_id, order_date) NATURAL
    JOIN public.person
ORDER BY
    order_date,
    person_information