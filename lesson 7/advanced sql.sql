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
