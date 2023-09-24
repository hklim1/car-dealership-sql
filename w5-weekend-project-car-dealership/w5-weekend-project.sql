-- ==================================== CREATING TABLES =================================================== --

CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	address_id INTEGER,
	phone_number VARCHAR(15),
	email VARCHAR(100),
	billing_info VARCHAR(150),
	date_created TIMESTAMP WITHOUT TIME ZONE,
	FOREIGN KEY(address_id) REFERENCES address(address_id)
);

CREATE TABLE salesperson(
	staff_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	address_id INTEGER,
	phone_number VARCHAR(15),
	email VARCHAR(100),
	years_worked SMALLINT,
	active BOOLEAN,
	FOREIGN KEY(address_id) REFERENCES address(address_id)
);

CREATE TABLE retail_car(
	retail_car_id SERIAL PRIMARY KEY,
	used_new VARCHAR(5),
	make VARCHAR(30),
	model VARCHAR(50),
	year_ VARCHAR(4),
	color VARCHAR(30),
	mileage VARCHAR(7),
	condition_ VARCHAR(100)
);

CREATE TABLE invoice(
	invoice_id SERIAL PRIMARY KEY,
	staff_id INTEGER,
	retail_car_id INTEGER,
	customer_id INTEGER,
	price NUMERIC(10,2),
	date_ DATE,
	FOREIGN KEY(staff_id) REFERENCES salesperson(staff_id),
	FOREIGN KEY(retail_car_id) REFERENCES retail_car(retail_car_id),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE address(
	address_id SERIAL PRIMARY KEY,
	address VARCHAR(150),
	address_2 VARCHAR(100),
	city VARCHAR(100),
	zip_code VARCHAR(10),
	country VARCHAR(50)
);

CREATE TABLE customer_car(
	customer_car_id SERIAL PRIMARY KEY,
	customer_id INTEGER,
	make VARCHAR(30),
	model VARCHAR(50),
	year_ VARCHAR(4),
	color VARCHAR(30),
	mileage VARCHAR(7),
	current_condition VARCHAR(100),
	warranty BOOLEAN,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	address_id INTEGER,
	phone_number VARCHAR(15),
	email VARCHAR(100),
	years_worked SMALLINT,
	active BOOLEAN,
	FOREIGN KEY(address_id) REFERENCES address(address_id)
);

CREATE TABLE service_ticket(
	service_ticket_id SERIAL PRIMARY KEY,
	customer_car_id INTEGER,
	customer_id INTEGER,
	mechanic_id INTEGER,
	oil_change BOOLEAN,
	brake_system BOOLEAN,
	tire_rotation BOOLEAN,
	keys_concern BOOLEAN,
	part_installation BOOLEAN,
	multi_point_inspection BOOLEAN,
	additional_services TEXT,
	FOREIGN KEY(customer_car_id) REFERENCES customer_car(customer_car_id),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id)
);


-- ====================================== INPUT DATA  =================================================== --

ALTER TABLE address ADD state VARCHAR(15);

INSERT INTO address(address, address_2, city, zip_code, country, state)
VALUES('1500 S Halsted St', 'Apt 3B', 'Chicago', '60608', 'USA', 'IL'),
			('810 KC', NULL, 'Dillas', '30345', 'USA', 'KS'),
			('128 Thony Ave', 'Unit 1304', 'Heartbreak', '82031A', 'China', NULL),
			('1384 Badtar St', 'Apt 7', 'Ladtar', '24802', 'Peru', NULL),
			('24901 Chanwerz', NULL, 'Treatza Town', '39024', 'USA', 'MO'),
			('1204 Gobbo Rd', NULL, 'Croc', '30293', 'USA', 'FL'),
			('7392 Jarsh Ave', 'Apt 2204', 'Moiderton', '40294', 'USA', 'CA'),
			('2409 Pork Belly', '#3', 'Taipei', 'A829D', 'Taiwan', NULL),
			('41 Boba Boulevard', NULL, 'Camellia', '23942', 'USA', 'CA'),
			('4920 Super Sophia Station', 'Unit 1', 'Shijia', '31093A', 'China', NULL),
			('12094 Square Up', 'Apt 913', 'Beantown', '13942', 'USA', 'CA');

INSERT INTO salesperson(first_name, last_name, address_id, phone_number, email, years_worked, active)
VALUES('Chandler', 'Cake', 5, '686-394-0395', 'chantheman@fatdoggoodies.com', 1, TRUE),
			('Timothy', 'Chakonas', 2, '456-789-1021', 'tim.chakonas@farmer.com', 27, TRUE),
			('Patrick', 'Hurtado', 4, '283-394-2034', 'networkslave@stack.com', 3, FALSE);
			
INSERT INTO customer(first_name, last_name, address_id, phone_number, email, billing_info, date_created)
VALUES('Heather', 'Lim', 1, '193-424-3945', 'heatherlim@codingtemple.com', '2121-2121-2121-2121 564 08/29', NOW()),
			('Sophia', 'Li', 10, '456-789-1021', 'superrickyfan@gmail.com', '8080-8080-8080-8080 834 09/25', NOW()),
			('Kwabena', 'Ankobiah', 3, '892-394-3948', 'kwabsorfrank@bozo.com', '3920-4929-3940-3934 893 10/24', NOW()),
			('Christine', 'Phan', 11, '283-394-2034', 'smellslikemoid@yahoo.com', '2390-3924-3842-9133 928 11/27', NOW());
			
INSERT INTO mechanic(first_name, last_name, address_id, phone_number, email, years_worked, active)
VALUES('Deanna', 'Lee', 9, '624-392-4925', 'brendancooklover@gmail.com', 4, TRUE),
			('Nicole', 'Cibuzar', 6, '232-4925-3953', 'greenbean@fightingmachine.com', 1, FALSE),
			('Abby', 'Lam', 8, '249-3498-1840', 'always@lookingforlove.com', 12, TRUE);
			
INSERT INTO retail_car(used_new, make, model, year_, color, mileage, condition_)
VALUES('used', 'Ford', 'Fusion', '2018', 'black', '20931', 'fair'),
			('new', 'Audi', 'SQ5', '2017', 'storm blue', '72000', 'new'),
			('used', 'Hyundai', 'Sonata', '2019', 'silver', '10240', 'like new'),
			('new', 'Jeep', 'Patriot', '2020', 'orange', '80392', 'fair');

INSERT INTO customer_car(customer_id, make, model, year_, color, mileage, current_condition, warranty)
VALUES(1, 'Toyota', 'Camry', '2014', 'gray', '101049', 'excellent', True),
			(2, 'Volkswagen', 'Passat', '2019', 'blue', '83720', 'poor', False),
			(3, 'Hyundai', 'Something', '2017', 'silver', '13023', 'fair', False),
			(4, 'Honda', 'Accord', '2012', 'blue', '112032', 'poor', False),
			(1, 'Bugatti', 'Veyron', '2024', 'purple', '0', 'excellent', True);
		
ALTER TABLE customer_car
ADD COLUMN last_service_date DATE;

INSERT INTO invoice(staff_id, retail_car_id, customer_id, price, date_)
VALUES(1, 2, 1, '45000', '2020-09-12'),
			(2, 3, 3, '17000', '2021-05-14'),
			(3, 1, 4, '6000', '2022-11-21');
			
INSERT INTO service_ticket(customer_car_id, customer_id, mechanic_id, oil_change, brake_system, tire_rotation, keys_concern, part_installation, multi_point_inspection, additional_services)
VALUES(9, 1, 1, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 'Placed wrap around car and provided full interior and exterior detail.'),
			(5, 1, 1, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, 'Removed hidden rabbit from under hood.'),
			(7, 3, 3, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE, 'Performed exorcism.'),
			(8, 4, 2, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, 'Re-attached side mirror and painted car.');
		
ALTER TABLE service_ticket
ADD COLUMN price NUMERIC(10,2);

ALTER TABLE service_ticket
ADD COLUMN service_date DATE;
			
		
-- ================================ FUNCTIONS & PROCEDURES  ============================================= --

-- GOAL #1: Create a new column in retail_car to denote availability, make a procedure to show all cars as available.
-- GOAL #2: Make a procedure that will change retail_car.available from True>False when retail_car_id is in invoice.retail_car_id

-- Making new column "Available"
ALTER TABLE retail_car ADD available BOOLEAN;

-- PROCEDURE #1: Mark all cars as "available"
CREATE OR REPLACE PROCEDURE mark_available()
LANGUAGE plpgsql AS $$
	BEGIN
		UPDATE retail_car
		SET available = TRUE;
		COMMIT;
	END
$$;

CALL mark_available()

-- PROCEDURE #2: Update retail_car availability from True>False using a join on to invoice table
CREATE OR REPLACE PROCEDURE update_car_availability()
LANGUAGE plpgsql AS $$
	BEGIN
		UPDATE retail_car
		   SET available = False
		   FROM invoice
		   WHERE invoice.retail_car_id = retail_car.retail_car_id;
	END 
$$;

CALL update_car_availability()

-- VERIFY:
SELECT * FROM retail_car_id;


-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --

--GOAL #3: Make a function that will return a table of customers' names, contact info, and any of their cars that have not been serviced in over 1 year.
--				 Staff members will be able to use this info to provide courtesy call reminders to schedule service.

CREATE OR REPLACE FUNCTION courtesy_call_list()
RETURNS TABLE (full_name TEXT, _customer_id INTEGER, _phone_number VARCHAR(15), _customer_car_id INTEGER, _make VARCHAR(30), _model VARCHAR(50), _year_ VARCHAR(4), _last_service_date DATE)
LANGUAGE plpgsql AS $$
BEGIN
	RETURN QUERY
	SELECT CONCAT(first_name, ' ', last_name) AS "full_name", customer.customer_id, phone_number, customer_car_id, make, model, year_, last_service_date
	FROM customer_car
	JOIN customer
	ON customer.customer_id = customer_car.customer_id
	WHERE last_service_date < NOW() - INTERVAL '1 year'
	GROUP BY customer.first_name, customer.last_name, customer.customer_id, phone_number, customer_car_id, make, model, year_, last_service_date
	ORDER BY full_name ASC;
END $$;

--VERIFY:
SELECT * FROM courtesy_call_list();


-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --

--GOAL #4: Make a function that will return the full service history for a given car.
--				 "Service records are referenced by car's serial number": serial number = customer_car_id

CREATE OR REPLACE FUNCTION service_history(a_customer_car_id INTEGER)
RETURNS TABLE (_customer_car_id INTEGER, _service_date DATE, _service_ticket_id INTEGER, _customer_id INTEGER, _mechanic_id INTEGER, _price NUMERIC(10,2))
LANGUAGE plpgsql AS $$
BEGIN
	RETURN QUERY
	SELECT customer_car_id, service_date, service_ticket_id, customer_id, mechanic_id, price
	FROM service_ticket
	WHERE customer_car_id = a_customer_car_id
	ORDER BY service_date ASC;
END $$;

-- VERIFY:
INSERT INTO service_ticket(customer_car_id, customer_id, mechanic_id, oil_change, brake_system, tire_rotation, keys_concern, part_installation, multi_point_inspection, additional_services, price, service_date)
VALUES(8, 4, 2, TRUE, FALSE, FALSE, TRUE, TRUE, TRUE, 'Glued door handles back on.', '1011.17', '2023-05-23'),
			(8, 4, 2, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, 'Added turbo blasters.', '50004.23', '2021-07-18');

SELECT * FROM service_history(8);


-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --

-- GOAL #5: Update the price on a service ticket

SELECT * FROM service_ticket;

CREATE OR REPLACE PROCEDURE update_service_ticket_price(_service_ticket_id INTEGER, _price NUMERIC(10,2))
AS $$
	BEGIN
		UPDATE service_ticket
		SET price = _price
		WHERE service_ticket_id = _service_ticket_id;
		COMMIT;
	END
$$ LANGUAGE plpgsql;

-- CALLING PROCEDURE:
CALL update_service_ticket_price(1, '900500.50');
CALL update_service_ticket_price(2, '200.25');
CALL update_service_ticket_price(3, '1452.89');
CALL update_service_ticket_price(4, '10.99');

--VERIFY:
SELECT * FROM service_ticket;


-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --

-- GOAL #6: Update last service date for customer cars in database using join*************

CREATE OR REPLACE PROCEDURE update_last_service_date(_customers_car_id INTEGER)
LANGUAGE plpgsql AS $$
	BEGIN
			UPDATE customer_car
			SET last_service_date = subquery.max_date
			FROM (
				SELECT MAX(_service_date) AS max_date 
				FROM service_history(_customers_car_id)
				) AS subquery
			WHERE customer_car_id = _customers_car_id;
	END
$$;

CALL update_last_service_date(7);


--VERIFY:
SELECT * FROM service_history(7);
SELECT * FROM customer_car WHERE customer_car_id = 7;

SELECT * FROM service_ticket;
INSERT INTO service_ticket(customer_car_id, customer_id, mechanic_id, oil_change, brake_system, tire_rotation, keys_concern, part_installation, multi_point_inspection, additional_services, price, service_date)
VALUES(5, 1, 1, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, 'Cleaned out bugs from inside of AC vents.', '12.15', '2012-05-12'),
			(7, 3, 3, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, 'Repaired bumper damage sustained from red shells.', '5314.23', '2023-08-03');


-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --

-- GOAL #7: Update service date for existing service tickets in service_ticket table
CREATE OR REPLACE PROCEDURE update_service_date(_service_ticket_id INTEGER, _service_date DATE)
AS $$
	BEGIN
		UPDATE service_ticket
		SET service_date = _service_date
		WHERE service_ticket_id = _service_ticket_id;
		COMMIT;
	END
$$ LANGUAGE plpgsql;

-- CALLING UPDATE_SERVICE_DATE PROCEDURE:
CALL update_service_date(1, '2008-11-09');
CALL update_service_date(2, '2010-03-21');
CALL update_service_date(3, '2023-06-16');
CALL update_service_date(4, '2022-12-23');

--VERIFY:
SELECT * FROM service_ticket;

