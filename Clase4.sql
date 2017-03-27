SELECT f.title, f.special_features, f.rental_rate, c.name
FROM film f, film_category fc, category c 
WHERE f.film_id = fc.film_id
AND fc.category_id = c.category_id
ORDER BY f.rental rate DESC, f.special_features ASC;

SELECT f1.title, f2.title, f1.`length`
FROM film f1, film f2
WHERE f1.`length` = f2.`length` AND f1.film_id > f2.film_id
ORDER BY 1; 

-- EXERCISES 
-- 1
SELECT title, special_features
FROM film
WHERE rating LIKE 'PG-13';

-- 2
SELECT DISTINCT  f1.`length`
FROM film f1;

-- 3
SELECT title, rental_rate, replacement_cost
FROM film
WHERE replacement_cost BETWEEN 20.00 AND 24.00;

-- 4
SELECT f.title, c.name, f.rating, f.special_features
FROM film f, category c, film_category fc
WHERE f.film_id = fc.film_id
AND c.category_id = fc.category_id
AND f.special_features LIKE '%Behind the Scenes%';

-- 5
SELECT a.first_name, a.last_name
FROM actor a, film f, film_actor fa 
WHERE f.title LIKE 'ZOOLANDER FICTION'
AND a.actor_id = fa.actor_id
AND f.film_id = fa.film_id;

-- 6
SELECT a.address, c.city, o.country
FROM store str, address a, city c, country o 
WHERE str.store_id = 1
AND str.address_id = a.address_id
AND a.city_id = c.city_id
AND c.country_id = o.country_id
ORDER BY o.country, c.city;

-- 7
SELECT f1.title, f2.title, f1.rating, f2.rating
FROM film f1, film f2
WHERE f1.rating LIKE f2.rating 
AND f1.film_id < f2.film_id
ORDER BY 1;

-- 8
SELECT DISTINCT f.title, s.first_name, s.last_name
FROM film f, inventory i, store st, staff s
WHERE i.store_id = 2 
AND f.film_id = i.film_id
AND s.store_id = 2; 


