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