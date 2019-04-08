-- full outer join example, join two tables on a timestamp and return unmatched rows from both tables
-- one table containing the number of item 1 sold, another containing the number of item 2 sold, but the dates are not the same
-- if you want to return unmatched rows only, y ou can add this to the query:
WHERE table_a.column_name IS NULL
	OR table_b.column_name IS NULL

-- EXs
SELECT s.name rep,
	a.name account
FROM sales_reps s
FULL OUTER JOIN accounts a ON a.sales_rep_id = s.id

-- When is a good situation to use a full outer join? https://stackoverflow.com/questions/2094793/when-is-a-good-situation-to-use-a-full-outer-join
-- Joining without an equals sign
-- what web_events occurred before the first order?
-- start with a query that returns the first order of each account
SELECT *
FROM orders
WHERE date_trunc('month', MIN(occurred_at) FROM orders) = (
		SELECT date_trunc('month', min(occurred_at))
		FROM orders
		)
ORDER BY occurred_at

-- join web_events using inequality join
SELECT o.id,
	o.occurred_at order_date,
	w.*
FROM orders o
LEFT JOIN web_events w ON w.account_id = o.account_id
	AND w.occurred_at < o.occurred_at
WHERE date_trunc('month', MIN(o.occurred_at) FROM orders) = (
		SELECT date_trunc('month', min(o.occurred_at))
		FROM orders
		)
ORDER BY occurred_at

-- EX
SELECT a.name,
	a.primary_poc,
	s.name rep
FROM accounts a
LEFT JOIN sales_reps s ON a.sales_rep_id = s.id
	AND a.primary_poc < s.name

-- Self JOINS
-- common use case: where two events occurred, one after another
SELECT w1.id AS w1_id,
	w1.account_id AS w1_account_id,
	w1.occurred_at AS w1_occurred_at,
	w1.channel AS w1_channel,
	w2.id AS w2_id,
	w2.account_id AS w2_account_id,
	w2.occurred_at AS w2_occurred_at,
	w2.channel AS w2_channel
FROM web_events w1
LEFT JOIN web_events w2 ON w1.account_id = w2.account_id
	AND w2.occurred_at > w1.occurred_at
	AND w2.occurred_at <= w1.occurred_at + INTERVAL '1 day'
ORDER BY w1.account_id,
	w1.occurred_at

-- more info on INTERVAL: https://www.postgresql.org/docs/8.2/functions-datetime.html
-- UNION, stack two datasets on top of one another, instead of side by side (like in a JOIN)
-- UNIONS need to have the same amount of columns and the data types must match in same order, column names don't have to be the same
-- UNION skips rows that are the same, whereas UNION ALL doesn't skip, so UNION ALL is used more often
-- EXs
-- 1
SELECT *
FROM accounts
WHERE name = 'Walmart'

UNION ALL

SELECT *
FROM accounts
WHERE name = 'Disney'
-- 2
WITH double_accounts AS (
		SELECT *
		FROM accounts
		
		UNION ALL
		
		SELECT *
		FROM accounts
		)

SELECT count(*)
FROM double_accounts
WHERE name = 'Walmart'

-- Performance tuning
-- maybe limit by time to speed up your query
SELECT *
FROM orders
WHERE occurred_at >= '2016-01-01'
	AND occurred_at < '2016-07-01'

-- or use an actual LIMIT 100 etc.
SELECT *
FROM orders limit 50

-- aggregations get run, across the whole dataset, so LIMIT doesn't save much time for those
SELECT account_id,
	sum(poster_qty) sum_poster_qty
FROM orders
GROUP BY 1 limit 10

-- if you want to limit the dzataset before performing an aggregation use a subquery
SELECT account_id,
	sum(poster_qty) sum_poster_qty
FROM (
	SELECT *
	FROM orders limit 10
	)
GROUP BY 1

-- putting limit in a subquery is often a good way to speed things up, but it will obviously change your actual results, so its a good thing to test with, but sometimes not a good thing to get actual good data with
-- instead of performing a large join with an aggregate function:
SELECT a.name,
	count(*) web_events
FROM accounts a
JOIN web_events w ON w.account_id = a.id
GROUP BY 1
ORDER BY 2 DESC;

-- you can do the aggregate first then join to reduce the amount of records that need to be matched in the join:

SELECT a.name,
	sub.web_events
FROM (
	SELECT account_id,
		count(*) web_events
	FROM web_events w
	GROUP BY 1
	) sub
JOIN accounts a ON a.id = sub.account_id
ORDER BY 2 DESC;

-- EXPLAIN gives you the query plan in reverse order, cost metric can give you a relative idea of resources required