-- 1. How many actors are there with the last name 'Wahlberg'? --
--Output: 2 actors with last name "Wahlberg"
SELECT *
FROM actor
WHERE last_name = "Wahlberg";

-- ALTERNATIVE SOLUTION:
-- SELECT COUNT(last_name), last_name
-- FROM actor
-- WHERE last_name = "Wahlberg"
-- GROUP BY last_name;


-- 2. How many payments were made between $3.99 and $5.99? --
--Output: 5,607
SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

-- 3. What film does the store have the most of? (search in inventory) --
-- Output: Between the 2 stores, 72 films have 8 copies each (the maximum)
SELECT COUNT(film_id), film_id
FROM inventory
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;

-- 4. How many customers have the last name ‘William’? --
--Output: 0 customers with last name 'William', but 1 with last name 'Williams'
SELECT last_name
FROM customer
WHERE last_name LIKE 'Will%';

--5. What store employee (get the id) sold the most rentals? --
--Output: Staff ID #1 rented out more films (from rental): 8,040
--Output: Staff ID #2 sold more films (from payment): 7,304
SELECT * FROM payment;
SELECT COUNT(staff_id), staff_id
FROM payment
GROUP BY staff_id
ORDER BY COUNT(staff_id) DESC;

SELECT * FROM rental;
SELECT COUNT(staff_id), staff_id
FROM rental
GROUP BY staff_id
ORDER BY COUNT(staff_id) DESC;


--6. How many different district names are there? --
--Output: 603 different district names
SELECT DISTINCT COUNT(district)
FROM address;

--7. What film has the most actors in it? (use film_actor table and get film_id)
--Output: Film ID #508 (Lambs Cincinatti) with 15 actors
SELECT COUNT(actor_id), film_id
FROM film_actor
GROUP BY DISTINCT film_id
ORDER BY COUNT(actor_id) DESC;

--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
--Output: 13 customers from store_id 1 have a last name ending with 'es'
SELECT COUNT(last_name)
FROM customer
WHERE last_name LIKE '%es' AND store_id = 1;

--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--   with ids between 380 and 430? (use group by and having > 250)
--Output: 3 payment amounts fit the criteria: 2.99, 4.99, and 0.99
SELECT * FROM payment;
SELECT COUNT(rental_id), amount
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(rental_id) > 250;

--10. Within the film table, how many rating categories are there? And what rating has the most
--    movies total?
--Output: There are 5 rating categories (PG-13, NC-17, R, PG, G). PG-13 has the most movies (223).
SELECT COUNT(film_id), rating
FROM film
GROUP BY DISTINCT rating
ORDER BY COUNT(film_id) DESC;