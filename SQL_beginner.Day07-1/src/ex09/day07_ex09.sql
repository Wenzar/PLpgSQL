WITH address_calcs AS (
    SELECT
        address,
        ROUND(
            MAX(age :: numeric) -(MIN(age :: numeric) / MAX(age :: numeric)),
            2
        ) AS formula,
        ROUND(AVG(age), 2) AS average
    FROM
        person
    GROUP BY
        address
    ORDER BY
        address
)
SELECT
    *,
    formula > average AS comparison
FROM
    address_calcs