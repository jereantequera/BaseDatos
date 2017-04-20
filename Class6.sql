-- 1
SELECT f1.last_name 
FROM actor f1
WHERE EXISTS(SELECT * 
				FROM actor f2
				WHERE f1.last_name = f2.last_name
				AND f1.actor_id <> f2.actor_id);
				
-- 2
SELECT ac.first_name, ac.last_name
FROM actor ac
WHERE ac.actor_id NOT IN (SELECT actor_id 
							FROM film_actor);
							
-- 3
SELECT first_name, last_name
  FROM customer c1
 WHERE NOT EXISTS (SELECT *
 					 FROM rental r1, customer c2
 					WHERE c2.customer_id = r1.customer_id
 					  AND c1.customer_id <> c2.customer_id); 
						
 					  
-- 5
SELECT DISTINCT ac.first_name, ac.last_name, f1.title
FROM actor ac, film f1, film_actor fa
WHERE ac.actor_id = fa.actor_id 
AND f1.film_id = fa.film_id
AND (f1.title LIKE ('BETRAYED REAR') OR f1.title LIKE ('CATCH AMISTAD'));

-- 6
SELECT DISTINCT ac.first_name, ac.last_name
FROM actor ac, film f1, film_actor fa
WHERE ac.actor_id = fa.actor_id 
AND f1.film_id = fa.film_id
AND (f1.title LIKE ('BETRAYED REAR') AND NOT f1.title LIKE ('CATCH AMISTAD'));

-- 7
SELECT first_name, last_name
  FROM actor
 WHERE actor.actor_id IN (SELECT actor_id
 						FROM actor, film, film_actor
 						WHERE actor.actor_id = film.actor.film_id
 						  AND film_actor.film_id = film.film_id
 						  AND (film.title LIKE 'BETRAYED REAR'))
 					
 )
 

 					  
 					  
 					  
 					  
 					  
 				
							
							