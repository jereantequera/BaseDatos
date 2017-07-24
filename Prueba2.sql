INSERT INTO sakila.customer
(store_id, first_name, last_name, email, address_id, active, create_date)
VALUES(1, 'pepito', 'pepo', 'email@email.com',599, 1, CURRENT_TIMESTAMP);
SELECT MAX(address_id) FROM address
INNER JOIN city USING (city_id)
INNER JOIN country USING (country_id) 
WHERE country.country LIKE 'United States';

INSERT INTO sakila.rental
(inventory_id, customer_id, staff_id, last_update)
VALUES(730, 1, 2, CURRENT_TIMESTAMP);
SELECT manager_staff_id FROM store WHERE store_id = 2;
SELECT MAX(inventory_id) FROM film
INNER JOIN inventory USING (film_id)
WHERE film.title LIKE 'CLOSER BANG';
 
DELETE FROM film_actor
WHERE (SELECT film_id FROM film
				WHERE film.title LIKE 'CAUSE DATE')			
DELETE FROM film_category
WHERE EXISTS(SELECT film_id FROM film
				WHERE film.title LIKE 'CAUSE DATE')			
DELETE FROM rental
WHERE rental.inventory_id IN (SELECT inventory_id FROM inventory
				WHERE inventory.film_id = 129)				
DELETE FROM inventory
WHERE inventory.film_id IN(SELECT film_id FROM film
				WHERE film.title LIKE 'CAUSE DATE')
DELETE FROM film
WHERE film_id = 129;


UPDATE film
SET film.release_year = 2001
WHERE rating = 'G';

UPDATE film
SET film.release_year = 1955
WHERE rating = 'PG';

UPDATE film
SET film.release_year = 1975
WHERE rating = 'R';

UPDATE film
SET film.release_year = 1951
WHERE rating = 'NC-17';

UPDATE film
SET film.release_year = 2207
WHERE rating = 'PG-13';
