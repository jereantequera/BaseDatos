CREATE TABLE film (
	film_id INT(6) AUTO_INCREMENT PRIMARY KEY NOT NULL,
	title VARCHAR(32),
	description TINYTEXT,
	release_year DATE
);
CREATE TABLE actor (
	actor_id INT(6) AUTO_INCREMENT PRIMARY KEY NOT NULL,
	first_name VARCHAR(16),
	las_name VARCHAR(16)
);
CREATE TABLE film_actor (
	film_actor_id INT(6) AUTO_INCREMENT PRIMARY KEY NOT NULL,
	actor_id INT(6),
	film_id INT(6),
	CONSTRAINT fk_actor FOREIGN KEY (actor_id) REFERENCES actor(actor_id),
	CONSTRAINT fk_film FOREIGN KEY (film_id)  REFERENCES film(film_id)
);

ALTER TABLE actor ADD COLUMN last_update DATE;

ALTER TABLE film ADD COLUMN last_update DATE;

ALTER TABLE actor ALTER COLUMN last_update SET DEFAULT '2032-3-3';

INSERT INTO imbd.actor
(first_name, las_name, last_update)
VALUES('Juan', 'Perez', '2012-9-9');

INSERT INTO imbd.film
(title, description, release_year)
VALUES('Titulo', 'Es una descripcion', '2014-3-4');

INSERT INTO imbd.film_actor
(actor_id, film_id)
VALUES(1, 1);

