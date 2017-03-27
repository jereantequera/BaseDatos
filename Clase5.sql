-- EXEPT as subquery
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (SELECT customer_id 
						FROM payment 
						WHERE amount = 0.99)
AND customer_id NOT IN (SELECT customer_id 
						FROM payment 
						WHERE amount = 1.99)
AND first_name LIKE ('W%');

-- Exists query
SELECT first_name, last_name
FROM customer c1
WHERE EXISTS (SELECT * 
				FROM customer c2
				WHERE c1.first_name = c2.first_name);

-- Busca gente que tenga el mismo nombre			
SELECT first_name, last_name
FROM customer c1
WHERE EXISTS (SELECT * 
				FROM customer c2
				WHERE c1.first_name = c2.first_name
				AND c1.customer_id <> c2.customer_id)
ORDER BY first_name;

-- Busca las peliculas que tienen la maxima duracion
SELECT title, `length`
FROM film f1 
WHERE NOT EXISTS (SELECT * -- Buscas las que no matchearon  
					FROM film f2
					WHERE f2.`length` > f1.`length`); -- compara y busca las mas grandes que f1

SELECT title, length
FROM film
WHERE `length` >= ALL (SELECT `length` -- compara la row con todas la de esa tabla
						 FROM film);
						 
UPDATE film SET `length` = 200 WHERE film_id = 182;

SELECT title, `length`
FROM film f1
WHERE `length` > ALL (SELECT `length`
						FROM film f2
						WHERE f2.film_id <> f1.film_id);


					
					
					