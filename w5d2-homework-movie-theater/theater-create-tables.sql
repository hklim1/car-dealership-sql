CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	phone_number VARCHAR(15),
	address VARCHAR(150),
	email VARCHAR(100),
	billing_info VARCHAR(150)
);

CREATE TABLE movie(
	film_id SERIAL PRIMARY KEY,
	title VARCHAR(100),
	summary TEXT,
	rating VARCHAR(10),
	genre VARCHAR(50),
	duration TIME,
	language_ VARCHAR(25)
);

CREATE TABLE ticket(
	ticket_id SERIAL PRIMARY KEY,
	age_group VARCHAR(10),
	customer_id INTEGER NULL,
	discount BOOLEAN,
	film_id INTEGER NOT NULL,
	film_time VARCHAR(7),
	film_date DATE DEFAULT CURRENT_DATE,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(film_id) REFERENCES movie(film_id)
);

CREATE TABLE seat(
	seat_id SERIAL PRIMARY KEY,
	seat_type VARCHAR(15),
	ticket_id INTEGER,
	row_ VARCHAR(2),
	seat_number VARCHAR(2),
	FOREIGN KEY(ticket_id) REFERENCES ticket(ticket_id)
);

CREATE TABLE concessions(
	item_id SERIAL PRIMARY KEY,
	price NUMERIC(10,2),
	meal_snack_beverage VARCHAR(10),
	size_ VARCHAR(10) DEFAULT 'regular',
	alcoholic BOOLEAN,
	gluten_free BOOLEAN,
	customer_id INTEGER,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);