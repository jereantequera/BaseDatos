SELECT title, `length`
FROM film f1 
WHERE EXISTS (SELECT * 
					FROM film f2
					WHERE f2.`length` < f1.`length`)
ORDER BY 2 ASC;



SELECT customer.first_name, customer.last_name
FROM customer, rental
WHERE customer.customer_id = rental.customer_id
GROUP BY 1, 2
HAVING COUNT(*)>2

SELECT film.title, actor.first_name, actor.last_name
FROM film, film_actor, actor
WHERE film_actor.film_id = film.film_id
AND film_actor.actor_id = actor.actor_id;


SELECT film.title, COUNT(actor.first_name)
FROM film, film_actor, actor
WHERE film_actor.film_id = film.film_id
AND film_actor.actor_id = actor.actor_id
GROUP BY 1;

