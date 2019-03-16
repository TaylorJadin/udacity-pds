-- INNER JOIN table name is before the period, column is after
-- this will only pull stuff from the orders table
SELECT orders.*
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

-- this will pull name from accounts and occurred_at from orders
SELECT accounts.name, orders.occurred_at
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

-- this will pull all columns from the accounts and orders tables
SELECT *
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

-- more join EXs
SELECT orders.*, accounts.*
FROM accounts
JOIN orders
ON accounts.id = orders.account_id;

SELECT orders.standard_qty,
         orders.gloss_qty,
         orders.poster_qty,
         accounts.website,
         accounts.primary_poc
FROM orders
JOIN accounts
    ON orders.account_id = accounts.id;

-- PK primary key, unique column in every table
-- FK foreign key, column in one table that is a primary key in a different table

-- join more than two tables
SELECT *
FROM web_events
JOIN accounts
ON web_events.account_id = accounts.id
JOIN orders
ON accounts.id = orders.account_id

SELECT web_events.channel, accounts.name, orders.total
FROM web_events
JOIN accounts
ON web_events.account_id = accounts.id
JOIN orders
ON accounts.id = orders.account_id

-- you can leave out AS from AS statements
SELECT col1 + col2 AS total, col3
SELECT col1 + col2 total, col3

-- aliasing table names can make selects easier and alias columns can make them more readable
SELECT t1.column1 aliasname,
         t2.column2 aliasname2
FROM tablename AS t1
JOIN tablename2 AS t2

-- EXs
SELECT a.primary_poc, w.occurred_at, w.channel, a.name
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
WHERE a.name = 'Walmart';

SELECT r.name region, s.name rep, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
ORDER BY a.name;

SELECT r.name region, a.name account, 
       o.total_amt_usd/(o.total + 0.01) unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id;

-- ON statements should always occur with the foreign key being equal to the primary key, though there edge cases where this isn't true

