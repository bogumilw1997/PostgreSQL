SELECT
	customer_id,
	SUM (amount) amount
FROM
	payment
GROUP BY
	customer_id;
	
SELECT
	customer_id,
	SUM (amount)
FROM
	payment
GROUP BY
	customer_id
ORDER BY
	SUM (amount) DESC;
	
SELECT
	first_name || ' ' || last_name full_name,
	SUM (amount) amount
FROM
	payment
INNER JOIN customer USING (customer_id)    	
GROUP BY
	full_name
ORDER BY amount DESC;

SELECT 
	DATE(payment_date) paid_date, 
	SUM(amount) sum
FROM 
	payment
GROUP BY
	DATE(payment_date);
	
	SELECT
	store_id,
	COUNT (customer_id)
FROM
	customer
GROUP BY
	store_id
HAVING
	COUNT (customer_id) > 300;
	
	SELECT
    EXTRACT (YEAR FROM rental_date) y,
    EXTRACT (MONTH FROM rental_date) M,
    EXTRACT (DAY FROM rental_date) d,
    COUNT (rental_id)
FROM
    rental
GROUP BY
    ROLLUP (
        EXTRACT (YEAR FROM rental_date),
        EXTRACT (MONTH FROM rental_date),
        EXTRACT (DAY FROM rental_date)
    );