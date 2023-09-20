INSERT INTO customer(first_name, last_name, phone_number, address, email, billing_info)
VALUES('Heather', 'Lim', '123-123-1203', '1500 S Halsted St, Chicago, IL 60608', 'heatherlim@codingtemple.com', '2121-2121-2121-2121 564 08/29'),
			('Timothy', 'Chakonas', '456-789-1021', '810 Osprey Ave, Backpack, SD 30345', 'tim.chakonas@farmer.com', '8080-8080-8080-8080 834 09/25'),
			('Kwabena', 'Ankobiah', '892-394-3948', '805 Thony St, Heartbreak, IL 48204', 'kwabsorfrank@bozo.com', '3920-4929-3940-3934 893 10/24'),
			('Patrick', 'Hurtado', '283-394-2034', '1382 Croc Rd, Gobbo, IL 20842', 'networkslave@stack.com', '2390-3924-3842-9133 928 11/27');
			
INSERT INTO movie(title, summary, genre, duration, language_, rating)
VALUES('Kwabsie''s Last Day', 'A dramatic true crime adaptation following a young boy''s first date and his unfortunate encounter with a secret Chicago serial killer.','Drama', '03:25:40','Twi','M');

INSERT INTO movie(title, summary, genre, duration, language_, rating)
VALUES('Fritz the 6-Toed Cat', 'A heartwarming animation about the friendship between a young boy and his 6-toed cat.','Children', '01:30:50','English','G'),
			('Forgot to Mute', 'A horror story about a student who forgot to mute his microphone and accidentally said ''Mario'' in front of half of his class.', 'Horror', '06:08:20','English','R'),
			('HANDS!', 'A riveting documentary detailing fascinating facts about hands.','Documentary', '10:45:50','Chinese','PG');
			
INSERT INTO ticket(age_group, customer_id, discount, film_id, film_time, film_date)
VALUES('Adult',1,True,5,'12:00pm','1995-09-12'),
			('Child',2,False,3,'02:00pm','1995-08-13'),
			('Senior',3,False,1,'01:00pm','1996-05-14'),
			('Senior',4,False,4,'11:00pm','1996-11-07');
			
INSERT INTO seat(seat_type, ticket_id, row_, seat_number)
VALUES('Luxury',5,'H',14),
			('Standard',6,'T',9),
			('Accessible',7,'K',12),
			('Standard',8,'P',10);
			
ALTER TABLE concessions ADD item_purchased VARCHAR(100);

INSERT INTO concessions(price, meal_snack_beverage, size_, alcoholic, gluten_free, customer_id, item_purchased)
VALUES(10.99,'snack','large', FALSE, FALSE, 1, 'popcorn'),
			(15.99,'snack','regular', TRUE, TRUE, 2, 'sour patch kids'),
			(12.99,'meal','large', FALSE, FALSE, 3, 'melted milk-flavored ice cream topped with grapes, ketchup, and mayonnaise'),
			(300.99,'beverage','x-large', TRUE, FALSE, 4, 'coffee');
			
ALTER TABLE customer ALTER COLUMN first_name TYPE VARCHAR(100);
ALTER TABLE customer ALTER COLUMN first_name SET NOT NULL;
ALTER TABLE customer ALTER COLUMN last_name SET NOT NULL;
