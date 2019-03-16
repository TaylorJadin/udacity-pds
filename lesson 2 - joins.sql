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
Select t1.column1 aliasname, t2.column2 aliasname2
FROM tablename AS t1
JOIN tablename2 AS t2