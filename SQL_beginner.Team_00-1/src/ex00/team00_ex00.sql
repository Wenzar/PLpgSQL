CREATE TABLE nodes (
    point1 varchar,
    point2 varchar,
    cost bigint
);

INSERT INTO nodes (point1, point2 ,cost)
VALUES
('a','b',10),('b','a',10),
('a','d',20),('d','a',20),
('a','c',15),('c','a',15),
('b','c',35),('c','b',35),
('b','d',25),('d','b',25),
('c','d',30),('d','c',30);

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
WHERE
    total_cost = (
        SELECT
            MIN(total_cost)
        FROM
            from_a_to_a
    )
ORDER BY
    total_cost,
    tour