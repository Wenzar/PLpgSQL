-- INSERT INTO menu VALUES
-- (19,1,'cheese pizza',900); -- не позволит создать UNIQUE INDEX если будет похожая комбинация pizzeria_id, pizza_name

CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);

SET
    enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT
    pizza_name,
    pizzeria_id
FROM
    menu
WHERE
    pizzeria_id = 6
    AND pizza_name = 'cheese pizza';