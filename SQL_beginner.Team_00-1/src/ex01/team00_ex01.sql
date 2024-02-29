WITH RECURSIVE paths AS(
    SELECT
        n1.point1 AS tour,
        n1.point1,
        n1.point2,
        n1.cost AS total_cost
    FROM
        nodes n1
    WHERE
        n1.point1 = 'a'
    UNION
    SELECT
        paths.tour || ',' || paths.point2 AS tour,
        n2.point1,
        n2.point2,
        n2.cost + paths.total_cost AS total_cost
    FROM
        nodes n2
        JOIN paths ON n2.point1 = paths.point2
    WHERE
        paths.tour NOT LIKE ('%' || paths.point2 || '%')
),
from_a_to_a AS(
    SELECT
        total_cost,
        '{' || tour || ',' || point2 || '}' AS tour
    FROM
        paths
    WHERE
        point2 = 'a'
        AND LENGTH(tour) = 7
)
SELECT
    *
FROM
    from_a_to_a
ORDER BY
    total_cost,
    tour