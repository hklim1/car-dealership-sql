-- ==================================== FUNCTION EXAMPLE =========================================== --

--GOAL: Find the top 10 highest paying customers so we can send them more promotional offers and/or rewards.

CREATE OR REPLACE FUNCTION best_customers()
RETURNS TABLE (total_payments NUMERIC, full_name TEXT, _customer_id INT2)
LANGUAGE plpgsql AS $$
BEGIN
	RETURN QUERY
	SELECT SUM(amount) AS "total_payments", CONCAT(first_name, ' ', last_name) AS "full_name", payment.customer_id
	FROM payment
	JOIN customer
	ON customer.customer_id = payment.customer_id
	GROUP BY payment.customer_id, customer.first_name, customer.last_name
	ORDER BY SUM(amount) DESC
	LIMIT 10;
END $$;

SELECT * FROM best_customers();



-- ==================================== PROCEDURE EXAMPLE ========================================== --

-- GOAL: be able to find all of the films that are within a customer's budget

--Function:
ALTER TABLE film
ADD budget_friendly BOOLEAN;

CREATE OR REPLACE PROCEDURE update_budget_friendly(rate_min NUMERIC(1,2), rate_max NUMERIC(1,2))
LANGUAGE plpgsql AS $$
BEGIN
	UPDATE film
	SET budget_friendly = (
		CASE WHEN rental_rate BETWEEN rate_min AND rate_max THEN TRUE ELSE FALSE END);
END;
$$;

--Calling function:
CALL update_budget_friendly('0.99','2.99');

--Verifying that it works:
SELECT title, rental_rate FROM film
WHERE budget_friendly = TRUE
ORDER BY rental_rate ASC;