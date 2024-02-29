SELECT
    name,
    CASE
        name
        WHEN 'Denis' THEN 'true'
        ELSE 'false'
    END AS check_name
FROM
    public.person
WHERE
    id in (
        SELECT
            person_id
        From
            public.person_order
        WHERE
            menu_id = 13
            or menu_id = 14
            or menu_id = 18
            and order_date = '2022-01-07'
    )
ORDER BY
    id ASC