DROP FUNCTION IF EXISTS sakila.rentedMoviesbyCustomer ;


DELIMITER $$
CREATE FUNCTION sakila.rentedMoviesbyCustomer(p_first_name VARCHAR(72), p_last_name VARCHAR(72)) RETURNS INTEGER UNSIGNED
    DETERMINISTIC
 
BEGIN
    DECLARE movies_quantity INTEGER UNSIGNED;
    SET movies_quantity = (SELECT COUNT(*) FROM rental WHERE customer_id = (SELECT customer_id FROM customer WHERE first_name LIKE (p_first_name) AND last_name LIKE (p_last_name)) AND return_date IS NOT NULL);
    RETURN (movies_quantity);
END $$
DELIMITER ;

SELECT rentedMoviesbyCustomer('MARY','SMITH');

SELECT COUNT(*) from customer;

SELECT * from customer;
select * from rental;
select customer_id from customer where first_name like ('MARY') and last_name like ('SMITH');


CREATE TABLE rental_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id SMALLINT UNSIGNED NOT NULL,
    inventory_id MEDIUMINT UNSIGNED NOT NULL,
    changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);

DELIMITER $$
CREATE TRIGGER after_rental
    AFTER INSERT ON rental
    FOR EACH ROW 
BEGIN
    INSERT INTO rental_audit
    SET action = 'rented',
     customer_id = NEW.customer_id,
        inventory_id = NEW.inventory_id,
        changedat = NOW(); 
END $$
DELIMITER ;

INSERT INTO sakila.rental
(rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
VALUES(CURRENT_TIMESTAMP, 1, 1, NULL, 2, CURRENT_TIMESTAMP);



DELIMITER $$
CREATE TRIGGER update_rental
    AFTER UPDATE ON rental
    FOR EACH ROW 
BEGIN
    INSERT INTO rental_audit
    SET action = 'returned',
     customer_id = NEW.customer_id,
        inventory_id = NEW.inventory_id,
        changedat = NOW(); 
END $$
DELIMITER ;



DELIMITER $$
$$
CREATE PROCEDURE MyStoredProcedure(IN p_country VARCHAR(100), IN p_names TEXT)
BEGIN
	
	DECLARE v_finished INTEGER DEFAULT 0;
	DECLARE v_first varchar(100) DEFAULT "";
	DECLARE v_last varchar(100) DEFAULT "";
	
	DECLARE my_cursor CURSOR FOR 
        SELECT first_name,last_name FROM customer
        INNER JOIN address USING(address_id)
        INNER JOIN city USING(city_id)
        INNER JOIN country USING(country_id)
        WHERE country = p_country ;  	
	OPEN my_cursor ;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_finished = 1; -- Un cursor necesita si o si tener un not found handler
	get_names: LOOP

        FETCH my_cursor INTO v_first;

        IF v_finished = 1 THEN 
            LEAVE get_names;
        END IF;

        SET p_names = CONCAT(" ", v_first , " ", v_last ," ; ", p_names);

    END LOOP get_names;

    CLOSE my_cursor;

END $$
DELIMITER ;










