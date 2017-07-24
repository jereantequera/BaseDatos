-- 1
SELECT COUNT(c.city), co.country, co.country_id
FROM city c, country co
WHERE c.country_id = co.country_id
GROUP BY co.country, co.country_id
ORDER BY co.country, co.country_id;

-- 2
SELECT COUNT(c.city), co.country, co.country_id
FROM city c, country co
WHERE c.country_id = co.country_id
GROUP BY co.country, co.country_id
HAVING COUNT(*) > 10
ORDER BY 1 DESC;

-- 3
SELECT customer.first_name, customer.last_name, address.address, COUNT(rental.rental_id) AS 'Total de alquileres', SUM(payment.amount) AS 'Total que pago'     
FROM customer
INNER JOIN address USING (address_id)
INNER JOIN rental USING (customer_id)
INNER JOIN payment USING (rental_id)
GROUP BY 1, 2, 3
ORDER BY 5 DESC;

SELECT *     
FROM customer
INNER JOIN address USING (address_id)
GROUP BY customer_id
ORDER BY customer_id DESC;


-- 4
SELECT film.title 
FROM film
WHERE film.film_id NOT IN (SELECT inventory.film_id FROM inventory);

-- 5

SELECT film.title, inventory.inventory_id
  FROM film
LEFT OUTER JOIN inventory USING (film_id);



