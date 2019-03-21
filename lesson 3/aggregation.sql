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