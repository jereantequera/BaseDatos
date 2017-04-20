SELECT title, rating, length  
FROM film
WHERE length > 100;

SELECT title, length FROM film   -- EL BETWEEN INCLUYE AL 100 Y AL 120
WHERE length BETWEEN 100 AND 120;

SELECT title, name, film.language_id
FROM film, `language`
WHERE film.language_id = language.language_id;

SELECT country, city
FROM address, city, country
WHERE address.city_id = city.city_id
AND city.country_id = country.country_id;

SELECT DISTINCT country, city
FROM address, city, country
WHERE address.city_id = city.city_id
AND city.country_id = country.country_id;

SELECT title, name
FROM film, `language`
WHERE film.language_id = language.language_id
AND film.`length` > 100 AND language.name = 'English';

SELECT title, special_features, rental_rate, name
FROM film, film_category, category
WHERE film.film_id = film_category.film_id
AND film_category.category_id = category.category_id
ORDER BY rental_rate DESC;

SELECT title, special_features, rental_rate, name
FROM film, film_category, category
WHERE film.film_id = film_category.film_id
AND film_category.category_id = category.category_id
ORDER BY rental_rate DESC, special_features ASC;

SELECT title, special_features, rental_rate, name
FROM film, film_category, category
WHERE film.film_id = film_category.film_id
AND film_category.category_id = category.category_id
ORDER BY rental_rate DESC LIMIT 5;

SELECT *
FROM film
WHERE special_features LIKE '%Trailers%';

SELECT * FROM address
WHERE address LIKE '%\_%';

SELECT title, description, rental_rate * 15 AS "In pesos"
FROM film ORDER BY `In pesos` ASC;

SELECT name AS val FROM  category
WHERE name LIKE 'A%' OR name LIKE 'M%'
UNION
SELECT title FROM  film
WHERE title LIKE 'A%' OR title LIKE 'S%';