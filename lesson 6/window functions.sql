-- running total using a window function
SELECT standard_qty SUM(standard_qty) OVER (
		ORDER BY occurred_at
		) AS running_total
FROM orders
