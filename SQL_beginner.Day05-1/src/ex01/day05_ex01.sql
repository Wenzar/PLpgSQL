SET
    enable_seqscan = OFF;-- планировщик по умолчанию применяет последовательное сканирование,тк таблица небольшого размера
EXPLAIN ANALYZE
SELECT
    pizza_name,
    pizzeria.name AS pizzeria_name
FROM
    menu
    JOIN pizzeria ON pizzeria.id = menu.pizzeria_id