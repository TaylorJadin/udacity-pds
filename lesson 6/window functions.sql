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
    DATE_TRUNC('month',occurred_at) AS month,
	SUM(standard_qty) OVER (
        PARTITION BY DATE_TRUNC('month',occurred_at)
		ORDER BY occurred_at
		) AS running_total
FROM orders

