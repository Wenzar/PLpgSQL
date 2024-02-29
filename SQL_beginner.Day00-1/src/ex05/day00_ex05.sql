SELECT
    (
        SELECT
            name
        FROM
            public.person
        WHERE
            person_id = id
    )
FROM
    public.person_order
WHERE
    menu_id = 13
    or menu_id = 14
    or menu_id = 18
    and order_date = '2022-01-07'
ORDER BY
    id ASC