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

-- full name, film title, length of movie, filmlen_groups
SELECT full_name, 
       filmtitle,
       filmlen,
       CASE WHEN filmlen <= 60 THEN '1 hour or less'
       WHEN filmlen > 60 AND filmlen <= 120 THEN 'Between 1-2 hours'
       WHEN filmlen > 120 AND filmlen <= 180 THEN 'Between 2-3 hours'
       ELSE 'More than 3 hours' END AS filmlen_groups
FROM 
    (SELECT a.first_name, 
               a.last_name,
               a.first_name || ' ' || a.last_name AS full_name,
               f.title filmtitle, 
               f.length filmlen
        FROM film_actor fa
        JOIN actor a
        ON fa.actor_id = a.actor_id
        JOIN film f
        ON f.film_id = fa.film_id) t1

-- Write a query you to create a count of movies in each of the 4 filmlen_groups: 1 hour or less, Between 1-2 hours, Between 2-3 hours, More than 3 hours.

SELECT    DISTINCT(filmlen_groups),
          COUNT(title) OVER (PARTITION BY filmlen_groups) AS filmcount_bylencat
FROM  
         (SELECT title,length,
          CASE WHEN length <= 60 THEN '1 hour or less'
          WHEN length > 60 AND length <= 120 THEN 'Between 1-2 hours'
          WHEN length > 120 AND length <= 180 THEN 'Between 2-3 hours'
          ELSE 'More than 3 hours' END AS filmlen_groups
          FROM film ) t1
ORDER BY  filmlen_groups