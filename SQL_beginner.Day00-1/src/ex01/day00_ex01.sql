SELECT
    name,
    age
FROM
    public.person
WHERE
    address = 'Kazan'
    and gender = 'female'
ORDER BY
    name ASC