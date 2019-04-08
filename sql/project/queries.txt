/* Query 1*/
WITH t1 AS (
    SELECT
        f.title film_title,
        c.name category_name,
        count(*) rental_count
    FROM
        film f
        JOIN film_category fc ON f.film_id = fc.film_id
        JOIN category c ON fc.category_id = c.category_id
        JOIN inventory i ON f.film_id = i.film_id
        JOIN rental r ON i.inventory_id = r.inventory_id
    WHERE
        c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')
    GROUP BY
        1,
        2
)
SELECT
    category_name,
    sum(rental_count) rentals
FROM
    t1
GROUP BY
    1
ORDER BY
    2 DESC;

/* Query 2 */
/* Note: even though this data is the same as the suggestion in
 question set #1 question 3, I used a counts in multiple
 columns to make the data work nicer with a stacked bar chart */
WITH t1 AS (
    SELECT
        f.title film_title,
        c.name category_name,
        f.rental_duration,
        NTILE(4) OVER (ORDER BY f.rental_duration) AS quartile
    FROM
        film f
        JOIN film_category fc ON f.film_id = fc.film_id
        JOIN category c ON fc.category_id = c.category_id
    WHERE
        c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')
)
SELECT
    category_name, count( CASE WHEN quartile = 1 THEN
        'countme'
    ELSE
        NULL
    END) AS standard_quart_1, count(
    CASE WHEN quartile = 2 THEN
        'countme'
    ELSE
        NULL
    END) AS standard_quart_2, count(
    CASE WHEN quartile = 3 THEN
        'countme'
    ELSE
        NULL
    END) AS standard_quart_3, count(
    CASE WHEN quartile = 4 THEN
        'countme'
    ELSE
        NULL
    END) AS standard_quart_4
FROM
    t1
GROUP BY
    1
ORDER BY
    1
    /* Query 3 */
    SELECT
        f.title film,
        count(*) rental_count
FROM
    film f
    JOIN inventory i ON i.film_id = f.film_id
    JOIN rental r ON r.inventory_id = i.inventory_id
GROUP BY
    1
ORDER BY
    2 DESC
LIMIT 10;

/* Query 4 */
SELECT
    c.first_name || ' ' || c.last_name AS customer,
    count(*) rental_count
FROM
    customer c
    JOIN rental r ON r.customer_id = c.customer_id
GROUP BY
    1
ORDER BY
    2 DESC
LIMIT 10;

