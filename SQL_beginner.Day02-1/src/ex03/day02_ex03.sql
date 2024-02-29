WITH generated_dates AS (
    SELECT
        day :: date AS missing_date
    FROM
        generate_series('2022-01-01', '2022-01-10', interval '1 day') AS day
),
filtered_visits AS (
    SELECT
        *
    FROM
        public.person_visits
    WHERE
        person_id = 1
        OR person_id = 2
)
SELECT
    gd.missing_date
FROM
    generated_dates gd
    LEFT JOIN filtered_visits fv ON gd.missing_date = fv.visit_date
WHERE
    fv.person_id IS NULL
ORDER BY
    gd.missing_date;