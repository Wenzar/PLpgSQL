WITH sum_money AS (
    SELECT
        user_id,
        SUM(money) AS volume,
        currency_id
    FROM
        public.balance
    GROUP BY
        user_id,
        currency_id
),
actual_rate_usd AS(
    SELECT
        id,
        name,
        MAX(rate_to_usd) AS last_rate_to_usd,
        MAX(updated)
    FROM
        currency
    GROUP BY
        id,
        name
)
SELECT
    DISTINCT COALESCE("user".name, 'not defined') AS name,
    COALESCE(lastname, 'not defined') AS lastname,
    type,
    volume,
    COALESCE(actual_rate_usd.name, 'not defined') AS currency_name,
    COALESCE(last_rate_to_usd, 1) AS last_rate_to_usd,
    (volume * COALESCE(last_rate_to_usd, 1)) AS total_volume_in_usd
FROM
    public.balance FULL
    JOIN "user" ON balance.user_id = "user".id FULL
    JOIN actual_rate_usd ON balance.currency_id = actual_rate_usd.id FULL
    JOIN sum_money ON balance.user_id = sum_money.user_id
    AND balance.currency_id = sum_money.currency_id
ORDER BY
    name DESC,
    lastname,
    type