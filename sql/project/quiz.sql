SELECT CONCAT (
		a.first_name,
		' ',
		a.last_name
		) full_name,
	f.title,
	f.description,
	f.length
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id


SELECT CONCAT (
		a.first_name,
		' ',
		a.last_name
		) full_name,
	f.title,
	f.description,
	f.length
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.length > 60

SELECT a.actor_id,
	CONCAT (
		a.first_name,
		' ',
		a.last_name
		) full_name,
	count(*)
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
GROUP BY 1
ORDER BY 3 DESC;

