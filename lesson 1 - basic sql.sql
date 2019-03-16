-- Basic statements
SELECT id, occurred_at FROM web_events;

SELECT id, occurred_at
FROM web_events;

-- LIMIT always comes last
SELECT id, occurred_at
FROM web_events
LIMIT 15;

-- ORDER BY always after select and from, ascending ORDER BY default unles desc, 1st arg is sorted first
SELECT id, occurred_at, total_amt_usd
FROM orders
ORDER BY occurred_at
LIMIT 10;

SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC 
LIMIT 5;

SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC, account_id;

-- WHERE statements are filters, after from but before ORDER BY or limit
SELECT *
FROM orders
WHERE gloss_amt_usd >= 1000
LIMIT 5;

SELECT *
FROM orders
WHERE total_amt_usd < 500
LIMIT 10;

-- operators for WHERE with non-numeric data need single quotes
SELECT name, website, primary_poc
FROM accounts
WHERE name = 'Exxon Mobil';

-- Derived Columns, us AS to name one
SELECT id, account_id, standard_amt_usd/standard_qty AS standard_paper
FROM orders
LIMIT 10;

SELECT id, account_id, 
   poster_amt_usd/(standard_amt_usd + gloss_amt_usd + poster_amt_usd) AS post_per
FROM orders
LIMIT 10;

-- logical operator LIKE requires wildcards, %
SELECT name
FROM accounts
WHERE name LIKE 'C%';

SELECT name
FROM accounts
WHERE name LIKE '%one%';

SELECT name
FROM accounts
WHERE name LIKE '%s';

-- IN is like using an = but for multiple things
SELECT name, primary_poc,sales_rep_id
FROM accounts
WHERE name IN ('Walmart', 'Target', 'Nordstrom');

SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords');

-- NOT, make like or in inverse
SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name NOT IN ('Walmart', 'Target', 'Nordstrom');

SELECT *
FROM web_events
WHERE channel NOT IN ('organic', 'adwords');

SELECT name
FROM accounts
WHERE name NOT LIKE 'C%';

SELECT name
FROM accounts
WHERE name not LIKE '%one%';

SELECT name
FROM accounts
WHERE name not LIKE '%s';

-- AND and BETWEEN
SELECT *
FROM orders
WHERE standard_qty > 1000
        AND poster_qty = 0
        AND gloss_qty = 0;

SELECT name
FROM accounts
WHERE name NOT LIKE 'C%'
        AND name NOT LIKE '&s';

SELECT occurred_at,
         gloss_qty
FROM orders
WHERE gloss_qty BETWEEN 24 AND 29;

SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords')
        AND occurred_at BETWEEN '2016-01-01' AND '2017-01-01;'
ORDER BY  occurred_at DESC

-- OR is like AND
SELECT id
FROM orders
WHERE gloss_qty > 4000
        OR poster_qty > 4000;
        
SELECT *
FROM orders
WHERE standard_qty = 0
        AND (gloss_qty > 1000
        OR poster_qty > 1000)

SELECT *
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%')
        AND (primary_poc LIKE '%ana%'
        OR primary_poc LIKE '%Ana%')
        AND primary_poc NOT LIKE '%eana%'