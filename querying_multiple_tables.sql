SELECT f.title FROM film f
INNER JOIN film_actor f_a
ON f.film_id=f_a.film_id
INNER JOIN actor a
ON a.actor_id=f_a.actor_id
WHERE a.first_name="JOHN";


SELECT f.title, f.length FROM film f
INNER JOIN film_actor f_a
ON f.film_id=f_a.film_id
INNER JOIN actor a
ON a.actor_id=f_a.actor_id
WHERE (a.first_name="Joe" AND a.last_name="Swank") AND (f.length>=90 AND f.length<=120);


SELECT s.first_name AS first_name, s.last_name AS last_name, COUNT(r.rental_id)
FROM staff s INNER JOIN rental r
ON s.staff_id=r.staff_id
GROUP BY first_name, last_name
ORDER BY first_name;
