-- window functions perform a calculation across a set of rows that are somehow related to the current row
-- kind of like an aggregate function but the rows retain their separate identities
-- running total using a window function
SELECT standard_qty,
	SUM(standard_qty) OVER (
		ORDER BY occurred_at
		) AS running_total
FROM orders

-- start the total over every month
SELECT standard_qty,
	DATE_TRUNC('month', occurred_at) AS month,
	SUM(standard_qty) OVER (
		PARTITION BY DATE_TRUNC('month', occurred_at) ORDER BY occurred_at
		) AS running_total
FROM orders

-- EXs
SELECT standard_amt_usd,
	SUM(standard_amt_usd) OVER (
		ORDER BY occurred_at
		) AS running_total
FROM orders

SELECT standard_amt_usd,
	DATE_TRUNC('year', occurred_at) AS year,
	SUM(standard_amt_usd) OVER (
		PARTITION BY 2 ORDER BY occurred_at
		) AS running_total
FROM orders

-- ROW_NUMBER, does what you think it does
SELECT id,
	asccount_id,
	occurred_at,
	ROW_NUMBER() OVER (
		ORDER BY occurred_at
		) AS row_num
FROM orders

-- RANK, entries with the same value in order by are given the same rank, but then it skips some values to make up for it when there is a different thing
-- its weird
SELECT id,
	asccount_id,
	DATE_TRUNC('month', occurred_at) AS month,
	RANK() OVER (
		ORDER BY DATE_TRUNC('month', occurred_at)
		) AS row_num
FROM orders

-- I feel like DENSE_RANK makes more sense, it doesn't skip values
SELECT id,
	asccount_id,
	DATE_TRUNC('month', occurred_at) AS month,
	DENSE_RANK() OVER (
		ORDER BY DATE_TRUNC('month', occurred_at)
		) AS row_num
FROM orders

-- EXs
SELECT id,
	account_id,
	total,
	DENSE_RANK() OVER (
		PARTITION BY account_id ORDER BY total DESC
		) AS total_rank
FROM orders

SELECT id,
	account_id,
	standard_qty,
	DATE_TRUNC('month', occurred_at) AS month,
	DENSE_RANK() OVER (PARTITION BY account_id) AS dense_rank,
	SUM(standard_qty) OVER (PARTITION BY account_id) AS sum_std_qty,
	COUNT(standard_qty) OVER (PARTITION BY account_id) AS count_std_qty,
	AVG(standard_qty) OVER (PARTITION BY account_id) AS avg_std_qty,
	MIN(standard_qty) OVER (PARTITION BY account_id) AS min_std_qty,
	MAX(standard_qty) OVER (PARTITION BY account_id) AS max_std_qty
FROM orders

-- The ORDER BY clause is one of two clauses integral to window functions. The ORDER and PARTITION define what is referred to as the “window”—the ordered subset of data over which calculations are made. Removing ORDER BY just leaves an unordered partition; in our query's case, each column's value is simply an aggregation (e.g., sum, count, average, minimum, or maximum) of all the standard_qty values in its respective account_id.
-- WINDOW alias
SELECT id,
	account_id,
	standard_qty,
	DATE_TRUNC('month', occurred_at) AS month,
	DENSE_RANK() OVER main_window AS dense_rank,
	sum(standard_qty) OVER main_window AS sum_standard_qty count(standard_qty) OVER main_window AS count_standard_qty avg(standard_qty) OVER main_window AS avg_standard_qty min(standard_qty) OVER main_window AS min_standard_qty max(standard_qty) OVER main_window AS max_standard_qty
FROM orders WINDOW main_window AS (
		PARTITION BY account_id ORDER BY DATE_TRUNC('month', occurred_at)
		)

-- EX
SELECT id,
	account_id,
	DATE_TRUNC('year', occurred_at) AS year,
	DENSE_RANK() OVER (
		PARTITION BY account_id ORDER BY DATE_TRUNC('year', occurred_at)
		) AS dense_rank,
	total_amt_usd,
	SUM(total_amt_usd) OVER (
		PARTITION BY account_id ORDER BY DATE_TRUNC('year', occurred_at)
		) AS sum_total_amt_usd,
	COUNT(total_amt_usd) OVER (
		PARTITION BY account_id ORDER BY DATE_TRUNC('year', occurred_at)
		) AS count_total_amt_usd,
	AVG(total_amt_usd) OVER (
		PARTITION BY account_id ORDER BY DATE_TRUNC('year', occurred_at)
		) AS avg_total_amt_usd,
	MIN(total_amt_usd) OVER (
		PARTITION BY account_id ORDER BY DATE_TRUNC('year', occurred_at)
		) AS min_total_amt_usd,
	MAX(total_amt_usd) OVER (
		PARTITION BY account_id ORDER BY DATE_TRUNC('year', occurred_at)
		) AS max_total_amt_usd
FROM orders

-- the last query simplifies down to this
SELECT id,
	account_id,
	DATE_TRUNC('year', occurred_at) AS year,
	DENSE_RANK() OVER main_window AS dense_rank,
	total_amt_usd,
	SUM(total_amt_usd) OVER main_window AS sum_total_amt_usd,
	COUNT(total_amt_usd) OVER main_window AS count_total_amt_usd,
	AVG(total_amt_usd) OVER main_window AS avg_total_amt_usd,
	MIN(total_amt_usd) OVER main_window AS min_total_amt_usd,
	MAX(total_amt_usd) OVER main_window AS max_total_amt_usd
FROM orders WINDOW main_window AS (
		PARTITION BY account_id ORDER BY DATE_TRUNC('year', occurred_at)
		)
-- LAG, returns the value from a previous row to the current row in a table
-- LEAD does the opposite
-- you can use these functions to make calculations that compare one row to another, like the days between one order and the next

-- EXs
SELECT account_id,
	total_sum,
	LAG(total_sum) OVER (
		ORDER BY total_sum
		) AS lag,
	LEAD(total_sum) OVER (
		ORDER BY total_sum
		) AS lead,
	total_sum - LAG(total_sum) OVER (
		ORDER BY total_sum
		) AS lag_difference,
	LEAD(total_sum) OVER (
		ORDER BY total_sum
		) - total_sum AS lead_difference
FROM (
	SELECT account_id,
		SUM(total_amt_usd) AS total_sum
	FROM orders
	GROUP BY 1
	) sub


-- NTILE, see percentile or subdivision that a given row falls into
-- number specified in the function is the number of parts you will divide the window
SELECT id,
	account_id,
	occurred_at,
	standard_qty,
	NTILE(4) OVER (
		ORDER BY standard_qty
		) AS quartile,
	NTILE(5) OVER (
		ORDER BY standard_qty
		) AS quintile,
	NTILE(100) OVER (
		ORDER BY standard_qty
		) AS percentile,
FROM orders
ORDER BY standard_qty DESC

-- EXs

SELECT id,
	account_id,
	occurred_at,
	standard_qty,
	gloss_qty,
	total_amt_usd,
	NTILE(4) OVER (
		ORDER BY standard_qty
		) AS standard_quartile,
	NTILE(2) OVER (
		ORDER BY gloss_qty
		) AS gloss_half,
	NTILE(100) OVER (
		ORDER BY total_amt_usd
		) AS total_percentile
FROM orders
ORDER BY account_id DESC

