/* Query 1 - query used for first insight */
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