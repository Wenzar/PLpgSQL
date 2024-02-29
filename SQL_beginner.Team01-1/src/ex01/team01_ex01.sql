INSERT INTO currency VALUES (100, 'EUR', 0.85, '2022-01-01 13:29');
INSERT INTO currency VALUES (100, 'EUR', 0.79, '2022-01-08 13:29');

CREATE OR REPLACE FUNCTION rate(cur_id bigint, balance_date timestamp)
RETURNS numeric AS $$
	SELECT rate_to_usd
	FROM ((SELECT
	 		rate_to_usd,
	 		(currency.updated - balance_date) AS "time"
	 FROM currency
	 WHERE currency.updated > balance_date AND currency.id = cur_id
	 ORDER BY "time"
	 LIMIT 1)
	 UNION
	 (SELECT
	 	rate_to_usd,
	 	(balance_date - currency.updated) AS "time"
	 FROM currency
	 WHERE currency.updated < balance_date AND currency.id = cur_id
	 ORDER BY "time"
	 LIMIT 1)
	 ORDER BY "time"
	 LIMIT 1);
$$ LANGUAGE sql;
	
SELECT
	COALESCE("user".name, 'not defined') AS "name",
	COALESCE("user".lastname, 'not defined') AS lastname,
	uniq_name.name AS currency_name,
	ROUND(rate(balance.currency_id, balance.updated) * money, 2) AS rate_to_usd
FROM balance LEFT JOIN "user" ON balance.user_id = "user".id
	LEFT JOIN (SELECT DISTINCT id, name FROM currency) AS uniq_name ON uniq_name.id = balance.currency_id
WHERE uniq_name.name IS NOT NULL
ORDER BY 1 DESC, 2, 3;