-- 1) List all customers who live in Texas (use JOINs):
--		Write a query to retrieve the full list of customers who reside in the state of Texas. Utilize the appropriate JOIN operation to combine the necessary tables.

SELECT first_name, last_name, district
FROM customer
JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';
--Output: Jennifer Davis, Kim Cruz, Richard Mccrary, Bryan Hardison, Ian Still


-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --


-- 2) Get all payments above $6.99 with the Customer's Full Name:
--		Create a query that fetches all payment records where the payment amount exceeds $6.99. Additionally, include the full name of the customer associated with each payment

SELECT CONCAT(first_name, ' ', last_name) AS "full_name", amount
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99
ORDER BY amount ASC;
--Output: 1406 payments above 6.99, full names are visible for each payment when code is ran

--CHECK:
SELECT COUNT(amount) FROM payment
WHERE amount > 6.99;
--Result is also 1406, confirming output above is correct.


-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --


-- 3) Show all customer names who have made payments over $175 (use subqueries):

SELECT CONCAT(first_name, ' ', last_name), customer_id
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY DISTINCT customer_id
	HAVING SUM(amount) > 175
);
--Output: Rhonda Kennedy, Clara Shaw, Eleanor Hunt, Marion Snyder, Tommy Collazo, Karl Seal


-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --


-- 4) List all customers that live in Nepal (use the city table):
--		Formulate a query to list all customers who reside in Nepal. You will need to utilize the city table in your query.

SELECT CONCAT(first_name, ' ', last_name) AS "full_name", address, city, country
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city
ON address.city_id = city.city_id
JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';
--Output: Kevin Schuler


-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --


-- 5) Which staff member had the most transactions?
-- Write a query to determine the staff member who conducted the highest number of transactions. Consider the appropriate tables for this task.
SELECT COUNT(payment_id), staff.staff_id, CONCAT(first_name, ' ', last_name) AS "staffer_name"
FROM payment
JOIN staff
ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id;
--Output: John Stephens (7,304 transactions) had more transactions than Mike Hillyer (7,292 transactions)


-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --


-- 6) How many movies of each rating are there?
-- Create a query that counts the number of movies for each distinct rating. Your query should display the rating category along with the corresponding count.

SELECT COUNT(rating), rating
FROM film
GROUP BY DISTINCT rating
ORDER BY COUNT(rating) ASC;
--Output: G (178 movies), PG (194 movies), R (195 movies), NC-17 (210 movies), PG-13 (223 movies)


-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --


-- 7) Show all customers who have made a single payment above $6.99 (Use Subqueries):
--		Construct a query to retrieve the names of customers who have made only one payment, and the payment amount exceeds $6.99. Utilize subqueries to accomplish this task.

SELECT CONCAT(first_name, ' ', last_name) AS "full_name"
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING COUNT(customer_id) = 1
);
--Output: No customers have made only one payment. However, there are some customers who have made only 1 payment that exceeds $6.99 (in addition to their other payments).

SELECT CONCAT(first_name, ' ', last_name) AS "full_name"
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	WHERE amount > 6.99
	GROUP BY customer_id
	HAVING COUNT(payment_id) = 1
);
--Alternative Output: 130 customers who have made multiple payments, but with only 1 payment exceeding $6.99.


-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --


-- 8) How many free rentals did our stores give away?
-- Write a query to calculate the total number of free rentals given away by our stores.
SELECT COUNT(amount)
FROM payment
WHERE amount = 0;
--Output: 24 free rentals were given away

--CHECK:
SELECT *
FROM payment
ORDER BY amount ASC;
--Counting by hand, can confirm 24 payments of $0 were made.