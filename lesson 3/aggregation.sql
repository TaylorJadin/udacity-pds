-- nulls
WHERE primary_poc IS nulls

-- COUNT
SELECT COUNT(*)
FROM accounts;

SELECT COUNT(accounts.id)
FROM accounts;

-- counting * will give the number of rows, if we specifiy a colummn like in the second example, we can see how many values aren't NULL

-- count nulls
SELECT *
FROM accounts
WHERE primary_poc IS NULL

-- SUM can only be used on numeric columns, it ignores NULL values as do other aggregation functions

SELECT SUM(standard_qty) AS standard,
         SUM(gloss_qty) AS gloss,
         SUM(poster_qty) AS poster
FROM orders

-- aggregators only aggregate vertically, if you want to perform a caculation across rows, you do this with arithmetic, i.e total+paper_stuff

-- EXs

SELECT sum(poster_qty) total_poster_sales
FROM orders

SELECT sum(standard_qty) total_standard_sales
FROM orders

SELECT sum(total_amt_usd) total_dollar_sales
FROM orders

SELECT standard_amt_usd+gloss_amt_usd total_standard_gloss
FROM orders

SELECT sum(standard_amt_usd)/sum(standard_qty) standard_price_per_unit
FROM orders

-- MIN and MAX, can be used on non-numerical columns, would return earliest letter in alphabet, earliest date or lowest number

-- AVG, average, mean of the data, does not count NULLs, if you wanted to count NULLs just SUM/COUNT

-- EXs
SELECT MIN(occurred_at)
FROM orders

SELECT occurred_at
FROM orders
ORDER BY occurred_at
LIMIT 1

SELECT MAX(occurred_at)
FROM web_events

SELECT occurred_at
FROM web_events
ORDER BY  occurred_at DESC limit 1

SELECT avg(standard_qty) avg_standard_qty,
         avg(gloss_qty) avg_gloss_qty,
         avg(poster_qty) avg_poster_qty,
         avg(standard_amt_usd) avg_standard_amt,
         avg(gloss_amt_usd) avg_gloss_amt,
         avg(poster_amt_usd) avg_poster_amt
FROM orders

-- advanced example, find the median
SELECT *
FROM (SELECT total_amt_usd
      FROM orders
      ORDER BY total_amt_usd
      LIMIT 3457) AS Table1
ORDER BY total_amt_usd DESC
LIMIT 2;

-- GROUP BY, aggregate data within subsets of the data

SELECT account_id
       SUM(standard_qty) AS standard_sum,
       SUM(gloss_qty) AS gloss_sum
       SUM(poster_qty) AS poster_sum
    FROM orders
GROUP BY account_id
ORDER BY account_id

-- note: SQL evaluates aggreations before LIMIT so the totals will be correct

-- any column not within an aggregation must show up in group by

-- you can substitute numbers for column names in group by and order by, but usually you only do this with statements that are excessively long

-- EXs

SELECT a.name account_name,
         o.occurred_at order_date
FROM accounts a
JOIN orders o
    ON a.id = o.account_id
ORDER BY order_date
LIMIT 1;

SELECT a.name,
         sum(o.total_amt_usd) total_sales
FROM accounts a
JOIN orders o
    ON a.id = o.account_id
GROUP BY a.name
ORDER BY a.name;

SELECT w.occurred_at,
         w.channel,
         a.name
FROM web_events w
JOIN accounts a
    ON w.account_id = a.id
ORDER BY  w.occurred_at DESC
LIMIT 1;

SELECT channel,
         count(*)
FROM web_events
GROUP BY channel;

SELECT a.primary_poc,
         w.occurred_at
FROM accounts a
JOIN web_events w
    ON a.id = w.account_id
ORDER BY  w.occurred_at
LIMIT 1;

SELECT a.name,
         min(o.total_amt_usd) smallest_order
FROM accounts a
JOIN orders o
    ON a.id = o.account_id
GROUP BY a.name
ORDER BY smallest_order;

SELECT r.name region,
         count(r.*) num_reps
FROM region r
JOIN sales_reps s
    ON r.id = s.region_id
GROUP BY  r.name
ORDER BY  num_reps;

-- multiple GROUP BY Exs

SELECT a.name,
         avg(o.standard_qty) avg_standard,
         avg(o.gloss_qty) avg_gloss,
         avg(o.poster_qty) avg_poster
FROM accounts a
JOIN orders o
    ON a.id = o.account_id
GROUP BY  a.name
ORDER BY  a.name;

SELECT a.name,
         avg(o.standard_amt_usd) avg_standard_usd,
         avg(o.gloss_amt_usd) avg_gloss_usd,
         avg(o.poster_amt_usd) avg_poster_usd
FROM accounts a
JOIN orders o
    ON a.id = o.account_id
GROUP BY  a.name
ORDER BY  a.name;

SELECT s.name,
         w.channel,
         count(w.*) frequency
FROM sales_reps s
JOIN accounts a
    ON s.id = a.sales_rep_id
JOIN web_events w
    ON a.id = w.account_id
GROUP BY  s.name, w.channel
ORDER BY  frequency DESC;

SELECT r.name region,
         w.channel,
         count(w.*) frequency
FROM region r
JOIN sales_reps s
    ON r.id = s.region_id
JOIN accounts a
    ON s.id = a.sales_rep_id
JOIN web_events w
    ON a.id = w.account_id
GROUP BY  region, w.channel
ORDER BY  frequency DESC;