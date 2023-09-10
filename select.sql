SELECT first_name FROM customer;

SELECT
   first_name,
   last_name,
   email
FROM
   customer;
   
 SELECT * FROM customer;

SELECT 
   first_name || ' ' || last_name,
   email
FROM 
   customer;
   
  SELECT 
   first_name, 
   last_name
FROM customer;

SELECT
    first_name || ' ' || last_name "full name"
FROM
    customer;
	
	SELECT
	first_name,
	last_name
FROM
	customer
ORDER BY
	first_name ASC;
	
	SELECT
	first_name,
	last_name
FROM
	customer
ORDER BY
	first_name ASC,
	last_name DESC;
	
	SELECT 
	first_name,
	LENGTH(first_name) len
FROM
	customer
ORDER BY 
	len DESC;
	
	CREATE TABLE sort_demo(
	num INT
);

INSERT INTO sort_demo(num)
VALUES(1),(2),(3),(null);

SELECT num
FROM sort_demo
ORDER BY num;

SELECT num
FROM sort_demo
ORDER BY num NULLS First;

Drop table sort_demo;

CREATE TABLE distinct_demo (
	id serial NOT NULL PRIMARY KEY,
	bcolor VARCHAR,
	fcolor VARCHAR
);

INSERT INTO distinct_demo (bcolor, fcolor)
VALUES
	('red', 'red'),
	('red', 'red'),
	('red', NULL),
	(NULL, 'red'),
	('red', 'green'),
	('red', 'blue'),
	('green', 'red'),
	('green', 'blue'),
	('green', 'green'),
	('blue', 'red'),
	('blue', 'green'),
	('blue', 'blue');
	
SELECT
	id,
	bcolor,
	fcolor
FROM
	distinct_demo ;
	
	SELECT
	DISTINCT bcolor
FROM
	distinct_demo
ORDER BY
	bcolor;
	
	
	SELECT
	DISTINCT bcolor,
	fcolor
FROM
	distinct_demo
ORDER BY
	bcolor,
	fcolor;
	
SELECT
	DISTINCT ON (bcolor) bcolor,
	fcolor
FROM
	distinct_demo 
ORDER BY
	bcolor,
	fcolor;
	
DRop TABLE distinct_demo;

	SELECT
	last_name,
	first_name
FROM
	customer
WHERE
	first_name = 'Jamie';
	
SELECT
	last_name,
	first_name
FROM
	customer
WHERE
	first_name = 'Jamie' AND 
        last_name = 'Rice';
		
SELECT
	first_name,
	last_name
FROM
	customer
WHERE 
	first_name IN ('Ann','Anne','Annie');
	
	SELECT
	first_name,
	last_name
FROM
	customer
WHERE 
	first_name LIKE 'Ann%';
	
	SELECT
	first_name,
	LENGTH(first_name) name_length
FROM
	customer
WHERE 
	first_name LIKE 'A%' AND
	LENGTH(first_name) BETWEEN 3 AND 5
ORDER BY
	name_length;
	
	SELECT 
	first_name, 
	last_name
FROM 
	customer 
WHERE 
	first_name LIKE 'Bra%' AND 
	last_name <> 'Motley';
	
SELECT
	film_id,
	title,
	release_year
FROM
	film
ORDER BY
	film_id
LIMIT 4 OFFSET 3;

SELECT
	film_id,
	title,
	rental_rate
FROM
	film
ORDER BY
	rental_rate DESC
LIMIT 10;

SELECT
    film_id,
    title
FROM
    film
ORDER BY
    title 
FETCH FIRST 5 ROW ONLY;

SELECT
    film_id,
    title
FROM
    film
ORDER BY
    title 
OFFSET 5 ROWS 
FETCH FIRST 5 ROW ONLY; 

SELECT
	customer_id,
	rental_id,
	return_date
FROM
	rental
WHERE
	customer_id NOT IN (1, 2);
	
	SELECT
	customer_id,
	first_name,
	last_name
FROM
	customer
WHERE
	customer_id IN (
		SELECT customer_id
		FROM rental
		WHERE CAST (return_date AS DATE) = '2005-05-27'
	)
ORDER BY customer_id;

SELECT
	customer_id,
	payment_id,
	amount
FROM
	payment
WHERE
	amount NOT BETWEEN 8 AND 9;
	
	SELECT
	customer_id,
	payment_id,
	amount,
 payment_date
FROM
	payment
WHERE
	payment_date BETWEEN '2007-02-07' AND '2007-02-15';

SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	first_name LIKE '_her%'
ORDER BY 
        first_name;
	SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	first_name ILIKE 'BAR%';