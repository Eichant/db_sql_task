#1.1
SELECT 
    film.title AS "Назва фільму", 
    film.length AS "Тривалість (хвилини)", 
    category.name AS "Категорія"
FROM 
    film
JOIN 
    film_category ON film.film_id = film_category.film_id
JOIN 
    category ON film_category.category_id = category.category_id;




#1.2
Select
    customer.first_name AS "Ім'я клієнта", 
    customer.last_name AS "Прізвище клієнта", 
    film.title AS "Назва фільму", 
    rental.rental_period AS "Дата оренди"
FROM 
    rental
JOIN 
    inventory ON rental.inventory_id = inventory.inventory_id
JOIN 
    film ON inventory.film_id = film.film_id
JOIN 
    customer ON rental.customer_id = customer.customer_id




#1.3
SELECT 
    film.title AS "Назва фільму", 
    COUNT(rental.rental_id) AS "Кількість оренд"
FROM 
    rental
JOIN 
    inventory ON rental.inventory_id = inventory.inventory_id
JOIN 
    film ON inventory.film_id = film.film_id
GROUP BY 
    film.title
ORDER BY 
    COUNT(rental.rental_id) DESC
LIMIT 5;




#2.1
Не вийшло


#2.2
UPDATE address
SET address = '52 Hanoi Way'
WHERE address.address_id = (
    SELECT customer.address_id 
    FROM customer
    JOIN address ON customer.address_id = address.address_id
    WHERE customer.first_name = 'MARY' AND customer.last_name = 'SMITH'
);


#2.3
DELETE FROM payment_p2007_01 
WHERE customer_id = (
    SELECT customer_id 
    FROM customer 
    WHERE first_name = 'MARY' AND last_name = 'SMITH'
);

DELETE FROM rental
WHERE customer_id = (
    SELECT customer_id 
    FROM customer 
    WHERE first_name = 'MARY' AND last_name = 'SMITH'
);

DELETE FROM customer
WHERE first_name = 'MARY' AND last_name = 'SMITH';