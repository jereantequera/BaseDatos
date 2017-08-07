SELECT * FROM customers;

CREATE INDEX postalCode ON customers(postalCode);

DROP INDEX postalCode ON customers;

SELECT * FROM products;

ALTER TABLE products 
ADD FULLTEXT(productline);

SELECT productName, productline
FROM products
WHERE MATCH(productline) AGAINST('Classic');

SELECT productName, productline
FROM products
WHERE productLine LIKE 'Classic%';

SELECT productName, productline
FROM products
WHERE MATCH(productline) AGAINST('Classic,Vintage');

ALTER TABLE products 
ADD FULLTEXT(productName);

SELECT productName, productline
FROM products
WHERE MATCH(productName) AGAINST('1932,Ford');

-- El indice le resto 39ms al tiempo de respuesta

SELECT address FROM address -- 44ms
WHERE postal_code IN (SELECT postal_code FROM address WHERE postal_code LIKE('17886'));

CREATE INDEX postal_code ON address(postal_code); -- 5ms


SELECT address FROM address WHERE MATCH(postal_code) AGAINST('17886');

SELECT first_name FROM actor WHERE first_name LIKE 'PENELOPE'; -- No tiene un indice por eso tarda mas

SELECT last_name FROM actor WHERE last_name LIKE 'BACALL'; -- Tiene un indice y por eso tarda menos

SELECT description FROM film WHERE description LIKE ('A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies');

ALTER TABLE film_text
ADD FULLTEXT (description);

SELECT description
FROM film_text WHERE MATCH(description) AGAINST('Epic');

