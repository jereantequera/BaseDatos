-- 1

SELECT CONCAT_WS(" ",first_name,last_name) as full_name, address.address, city.city
FROM customer 
	INNER JOIN address USING(address_id)
	INNER JOIN city USING(city_id)
	INNER JOIN country USING(country_id)
WHERE country.country LIKE 'Argentina';

-- 2

SELECT title,
`language`.name, 
CASE
	WHEN rating = 'G' THEN 'All Ages Are Admitted.'
	WHEN rating = 'PG' THEN 'Some Material May Not Be Suitable For Children.'
	WHEN rating = 'PG-13' THEN 'Some Material May Be Inappropriate For Children Under 13.'
	WHEN rating = 'R' THEN 'Under 17 Requires Accompanying Parent Or Adult Guardian.'
	WHEN rating = 'NC-17' THEN 'No One 17 and Under Admitted.'
END AS rating_description
  FROM film
	INNER JOIN `language` USING (language_id);
	
-- 3
	
SELECT title, release_year
  FROM film 
	INNER JOIN film_actor USING(film_id)
	INNER JOIN actor USING(actor_id)
WHERE CONCAT_WS(" ",first_name,last_name) LIKE TRIM(UPPER("   johNNy lollobRigidA     "));

-- 4

SELECT film.title,
	   CONCAT_WS(" ", customer.first_name, customer.last_name) as full_name,
	   CASE WHEN rental.return_date IS NOT NULL THEN 'Yes'
	   ELSE 'No' END AS was_returned,
	   MONTHNAME(rental.rental_date) as month
  FROM film
  	INNER JOIN inventory USING(film_id)
  	INNER JOIN rental USING(inventory_id)
  	INNER JOIN customer USING(customer_id)
WHERE MONTHNAME(rental.rental_date) LIKE 'May'
   OR MONTHNAME(rental.rental_date) LIKE 'June';
   
-- 5
-- Cast y convert son casi lo mismo los dos se usan para convertir un tipo de dato a otro

SELECT CAST(last_update AS DATE) as only_date
FROM rental;

SELECT CONVERT("2006-02-15", DATETIME);

-- 6
-- NVL 
-- Si expr1 es nulo, devuelve expr2. Si expr1 no es nulo, devuelve expr1. Los argumentos pueden ser de cualquier tipo.
-- No esta en mysql
-- NVL(expr1, expr2))
-- Ejemplo:
SELECT NVL( NULL, 'Es nulo' ) FROM sakila.film;

-- ISNULL
-- Busca que entrada es nula
SELECT ISNULL(2) FROM sakila.address;

-- IFNULL
-- La función evalúa el primer parámetro y si este es nulo devuelve el valor indicado en el segundo, mientras que si no lo es devuelve el primero.
SELECT title, IFNULL(title, 'No tiene') FROM sakila.film;

-- COALESCE
-- Devuelve el primer no-null de la lista o null si no hay null
SELECT title, COALESCE(title) FROM sakila.film;

-- RESUMEN
-- Todas estas son funciones de mysql usadas para trabajar con valores NULL