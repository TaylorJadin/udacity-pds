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
	) t3 ON t3.region = t2.region
	AND t3.total = t2.total;

SELECT r.name,
	count(*)
FROM region r
JOIN sales_reps s ON r.id = s.region_id
JOIN accounts a ON s.id = a.sales_rep_id
JOIN orders o ON a.id = o.account_id
GROUP BY 1
HAVING sum(o.total_amt_usd) = (
		SELECT MAX(total_sales_usd)
		FROM (
			SELECT r.name region,
				sum(o.total_amt_usd) total_sales_usd
			FROM region r
			JOIN sales_reps s ON r.id = s.region_id
			JOIN accounts a ON s.id = a.sales_rep_id
			JOIN orders o ON a.id = o.account_id
			GROUP BY 1
			) sub
		);

SELECT COUNT(*)
FROM (
	SELECT a.name
	FROM orders o
	JOIN accounts a ON a.id = o.account_id
	GROUP BY 1
	HAVING SUM(o.total) > (
			SELECT total
			FROM (
				SELECT a.name act_name,
					SUM(o.standard_qty) tot_std,
					SUM(o.total) total
				FROM accounts a
				JOIN orders o ON o.account_id = a.id
				GROUP BY 1
				ORDER BY 2 DESC LIMIT 1
				) inner_tab
			)
	) counter_tab;

SELECT a.name,
	w.channel,
	count(*)
FROM accounts a
JOIN web_events w ON a.id = w.account_id
	AND a.id = (
		SELECT id
		FROM (
			SELECT a.id,
				a.name,
				sum(o.total_amt_usd) tot_spent
			FROM accounts a
			JOIN orders o ON a.id = o.account_id
			GROUP BY a.id,
				a.name
			ORDER BY sum(o.total_amt_usd) DESC limit 1
			) inner_table
		)
GROUP BY 1,
	2
ORDER BY 3 DESC;

SELECT avg(sum) lifetime_avg_spent
FROM (
	SELECT a.id,
		a.name,
		sum(o.total_amt_usd)
	FROM accounts a
	JOIN orders o ON a.id = o.account_id
	GROUP BY 1,
		2
	ORDER BY 3 DESC limit 10
	) sub

SELECT avg(avg)
FROM (
	SELECT o.account_id,
		avg(o.total_amt_usd)
	FROM orders o
	GROUP BY 1
	HAVING avg(o.total_amt_usd) > (
			SELECT avg(o.total_amt_usd) avg_all
			FROM orders o
			)
	) sub

-- WITH, or common table expressions, or CTE
-- these serve the same purpose as subqueries, but they are more common in practice as they tend to be cleaner for future reading, and often faster
-- WITH needs to be at the beginning and needs an alias
-- subquery
SELECT channel,
	AVG(events) AS average_events
FROM (
	SELECT DATE_TRUNC('day', occurred_at) AS day,
		channel,
		COUNT(*) AS events
	FROM web_events
	GROUP BY 1,
		2
	) sub
GROUP BY channel
ORDER BY 2 DESC;

-- instead as a CTE --
WITH events
AS (
	SELECT DATE_TRUNC('day', occurred_at) AS day,
		channel,
		COUNT(*) AS events
	FROM web_events
	GROUP BY 1,
		2
	)
SELECT channel,
	AVG(events) AS average_events
FROM events
GROUP BY channel
ORDER BY 2 DESC;

-- multiple WITH
WITH table1
AS (
	SELECT *
	FROM web_events
	),
table2
AS (
	SELECT *
	FROM accounts
	)
SELECT *
FROM table1
JOIN table2 ON table1.account_id = table2.id;

-- EXs
-- 1
WITH t1 AS (
select s.name rep, r.name region, sum(o.total_amt_usd) total_sales
from region r
join sales_reps s on r.id = s.region_id
join accounts a on s.id = a.sales_rep_id
join orders o on a.id = o.account_id
group by 1,2
ORDER by 3 desc
),

t2 as (
	select region, max(total_sales) total_sales
	from t1
	group by 1
)

SELECT t1.rep, t1.region, t1.total_sales
from t1
join t2 on t1.total_sales = t2.total_sales
--

-- 2

