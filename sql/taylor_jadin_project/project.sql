/* Query 1*/
WITH t1
AS (
	SELECT f.title film_title,
		c.name category_name,
		count(*) rental_count
	FROM film f
	JOIN film_category fc ON f.film_id = fc.film_id
	JOIN category c ON fc.category_id = c.category_id
	JOIN inventory i ON f.film_id = i.film_id
	JOIN rental r ON i.inventory_id = r.inventory_id
	WHERE c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')
	GROUP BY 1, 2
	)
SELECT category_name,
	sum(rental_count) rentals
FROM t1
GROUP BY 1
ORDER BY 2 DESC;

/* Query 2 */
/* Note: even though this data is the same as the suggestion in question set #1 question 3,
		 I used a count to make the data work nicer with a stacked bar chart */
WITH t1
AS (
	SELECT f.title film_title,
		c.name category_name,
		f.rental_duration,
		NTILE(4) OVER (
			ORDER BY f.rental_duration
			) AS quartile
	FROM film f
	JOIN film_category fc ON f.film_id = fc.film_id
	JOIN category c ON fc.category_id = c.category_id
	WHERE c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')
	)
SELECT category_name,
	count(CASE 
			WHEN quartile = 1
				THEN 'countme'
			ELSE NULL
			END) AS standard_quart_1,
	count(CASE 
			WHEN quartile = 2
				THEN 'countme'
			ELSE NULL
			END) AS standard_quart_2,
	count(CASE 
			WHEN quartile = 3
				THEN 'countme'
			ELSE NULL
			END) AS standard_quart_3,
	count(CASE 
			WHEN quartile = 4
				THEN 'countme'
			ELSE NULL
			END) AS standard_quart_4
FROM t1
GROUP BY 1
ORDER BY 1
