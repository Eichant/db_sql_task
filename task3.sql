1#
SELECT c.name AS category_name, COUNT(fc.film_id) AS film_count
FROM film_category fc
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name;

#2
SELECT c.name AS category_name, AVG(f.length) AS avg_length
FROM film_category fc
JOIN category c ON fc.category_id = c.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY c.name;

#3
SELECT MIN(length) AS min_duration, MAX(length) AS max_duration
FROM film;

#4
SELECT count(customer_id)
FROM customer c ;

#5
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_payments
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.first_name, c.last_name;

#6
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_payments
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY total_payments desc 
limit 5;

7#
SELECT c.first_name, c.last_name, COUNT(r.rental_id) AS total_rentals
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.first_name, c.last_name;

#8
SELECT AVG(EXTRACT(YEAR FROM CURRENT_DATE) - release_year) AS avg_film_age
FROM film;

#9
SELECT COUNT(rental_id) AS total_rentals
FROM rental
WHERE rental_period && tsrange('2005-05-04', '2006-09-09', '[]');

#10
SELECT TO_CHAR(payment_date, 'YYYY-MM') AS payment_month, SUM(amount) AS total_payments
FROM payment
GROUP BY TO_CHAR(payment_date, 'YYYY-MM')
ORDER BY payment_month;

#11
SELECT customer_id, MAX(amount) AS max_payment
FROM payment
GROUP BY customer_id;

#12
SELECT customer_id, AVG(amount) AS avg_payment
FROM payment
GROUP BY customer_id;

#13
SELECT rating, COUNT(*) AS total_films
FROM film
WHERE rating IN ('G', 'PG', 'PG-13', 'R', 'NC-17')
GROUP BY rating;

#14
SELECT s.store_id, AVG(p.amount) AS avg_payment
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
JOIN store s ON c.store_id = s.store_id
GROUP BY s.store_id;