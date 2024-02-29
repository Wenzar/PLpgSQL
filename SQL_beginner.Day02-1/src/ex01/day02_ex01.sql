SELECT
    day :: date AS missing_date
FROM
    generate_series('2022-01-01', '2022-01-10', interval '1 day') AS day
    LEFT JOIN (
        SELECT
            *
        FROM
            public.person_visits
        WHERE
            person_id = 1
            OR person_id = 2
    ) AS pers ON day = pers.visit_date
WHERE
    person_id IS null
ORDER BY
    visit_date