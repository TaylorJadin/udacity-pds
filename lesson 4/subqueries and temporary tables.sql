-- Subqueries, or inner queries, or nested queries
SELECT channel,
	AVG(event_count) AS avg_event_count
FROM (
	SELECT DATE_TRUNC('day', occurred_at) AS day,
		channel,
		COUNT(*) AS event_count
	FROM web_events
	GROUP BY 1,
		2
	) sub
GROUP BY 1
ORDER BY 2 DESC;

-- subqueries can go in the from statement, like you are making a temporary table to draw data from
-- subqueries always need an alias, in the example above that is sub
-- they can also go in as a column, or in a logical statement
-- subqueries that are in conditional statements should not have an ALIAS
SELECT *
FROM orders
WHERE DATE_TRUNC('month', occurred_at) = (
		SELECT DATE_TRUNC('month', MIN(occurred_at)) min_month
		FROM orders
		)
ORDER BY occurred_at;

SELECT AVG(standard_qty) avg_std,
	AVG(gloss_qty) avg_gls,
	AVG(poster_qty) avg_pst,
	SUM(total_amt_usd)
FROM orders
WHERE DATE_TRUNC('month', occurred_at) = (
		SELECT DATE_TRUNC('month', MIN(occurred_at))
		FROM orders
		);

-- EXs
SELECT t3.rep,
	t3.region,
	t3.total
FROM (
	SELECT region,
		max(total) total
	FROM (
		SELECT r.name region,
			s.name rep,
			SUM(o.total_amt_usd) total
		FROM region r
		JOIN sales_reps s ON r.id = s.region_id
		JOIN accounts a ON s.id = a.sales_rep_id
		JOIN orders o ON a.id = o.account_id
		GROUP BY 1,
			2
		ORDER BY 3 DESC
		) t1
	GROUP BY 1
	) t2
JOIN (
	SELECT r.name region,
		s.name rep,
		SUM(o.total_amt_usd) total
	FROM region r
	JOIN sales_reps s ON r.id = s.region_id
	JOIN accounts a ON s.id = a.sales_rep_id
	JOIN orders o ON a.id = o.account_id
	GROUP BY 1,
		2
	) t3 ON t3.region = t2.region AND t3.total = t2.total;