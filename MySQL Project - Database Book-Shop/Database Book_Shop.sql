CREATE DATABASE book_shop;
USE book_shop; 

CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100)
	);
 
INSERT INTO books (title, author_fname, author_lname)
VALUES
('A Culture of Kindness', 'Nahla', 'Summers'),
('Invisible Women', 'Caroline', 'Perez'),
('Start With Why', 'Simon', 'Sinek'),
('Joyful', 'Ingrid', 'Lee'),
('Untamed: stop pleasing, start living', 'Glennon', 'Doyle'),
('Noise:A Flaw in Human Judgement', 'Daniel', 'Kahneman'),
('His Dark Material', 'Philip', 'Pullman'),
('A Detail of History', 'Arek', 'Hersh'),
('Quiet', 'Susan', 'Cain'),
('Dominicana', 'Angie', 'Cruz')
;

select * from books;


CREATE TABLE customers 
     (
	    customer_id int not null AUTO_INCREMENT PRIMARY KEY, 
        customer_fname VARCHAR(50), 
		customer_lname VARCHAR(50)
        );
        
INSERT INTO customers (customer_fname, customer_lname)
VALUES('Mark', 'Robinson'), 
      ('John', 'Mayer'),
      ('Pam', 'Williams'),
      ('Sara', 'Smith'),
      ('Todd', 'Simpson'),
      ('Mary', 'Miller'),
      ('Ben', 'Richards'),
      ('Jodi', 'Churchill'),
      ('Tom', 'Gates'),
      ('Ron', 'Cole')
      ;

SELECT * FROM customers;

drop table orders;
CREATE TABLE orders
   (
	    order_id int not null AUTO_INCREMENT PRIMARY KEY, 
        order_book_id int,
        order_customer_id int,
        order_date DATETIME
        );
        
ALTER table orders
        ADD CONSTRAINT
        fk_order_book_id
        FOREIGN KEY (order_book_id)
        REFERENCES
		books (book_id);
        
ALTER table orders
        ADD CONSTRAINT
        fk_order_customer_id
        FOREIGN KEY (order_customer_id)
        REFERENCES
		customers (customer_id);       

INSERT INTO orders (order_book_id, order_customer_id, order_date)
              VALUES (1, 1, NOW());
              
INSERT INTO orders (order_book_id, order_customer_id, order_date)
              VALUES (6, 1, NOW());
	
INSERT INTO orders (order_book_id, order_customer_id, order_date)
              VALUES (2, 6, NOW());
     
INSERT INTO orders (order_book_id, order_customer_id, order_date)
              VALUES (5, 10, NOW());

INSERT INTO orders (order_book_id, order_customer_id, order_date)
              VALUES (4, 7, NOW());

INSERT INTO orders (order_book_id, order_customer_id, order_date)
              VALUES (6, 7, NOW());    
              
INSERT INTO orders (order_book_id, order_customer_id, order_date)
              VALUES (3, 8, NOW());   
              
INSERT INTO orders (order_book_id, order_customer_id, order_date)
              VALUES (7, 10, NOW());   
              
INSERT INTO orders (order_book_id, order_customer_id, order_date)
              VALUES (7, 2, NOW());    
              
INSERT INTO orders (order_book_id, order_customer_id, order_date)
              VALUES (10, 9, NOW());                 
              
select * from orders;

					
CREATE table book_specifics
(
       book_specifics_id INT NOT NULL Primary key,
	   title varchar(100), 
       book_type VARCHAR(50),
       released_year INT,
	   stock_quantity INT,
	   pages INT
       );
       
ALTER table book_specifics
        ADD CONSTRAINT
        fk_book_spesifics_id
        FOREIGN KEY (book_specifics_id)
        REFERENCES
		books (book_id);

INSERT INTO book_specifics (book_specifics_id,title, book_type, released_year, stock_quantity, pages) 
VALUES (1, 'A Culture of Kindness', 'Hardback', 2019, 32, 296),
(2, 'Invisible Women','Paper Back', 2016, 43, 411),
(3, 'Start With Why', 'Audible', 2009, 12, 246),
(4, 'Joyful', 'Paperback', 2018, 97, 359),
(5, 'Untamed: stop pleasing, start living', 'Paperback', 2020, 154, 333),
(6, 'Noise:A Flaw in Human Judgement','Audible', 2021, 26, 454),
(7, 'His Dark Material', 'Hardcover', 1995, 68, 1016),
(8, 'A Detail of History', 'Hardback', 1998, 55, 168),
(9, 'Quiet','Paperback',  2012, 104, 333),
(10, 'Dominicana', 'Hardback', 2019, 100, 322); 

select * from book_specifics;


CREATE TABLE ratings
(
rating_book_id INT not null PRIMARY KEY,
title VARCHAR(100),
rating Decimal (5,1) 
);

ALTER TABLE ratings
ADD CONSTRAINT
        fk_rating_book_id
        FOREIGN KEY (rating_book_id)
        REFERENCES
	    books (book_id);
        
        
INSERT INTO ratings (rating_book_id,title,rating)
VALUES
(1,'A Culture of Kindness', 4.2),
(2,'Invisible Women', 4.5),
(3,'Start With Why', 3),
(4,'Joyful', 4),
(5,'Untamed: stop pleasing, start living', 3.2 ),
(6,'Noise:A Flaw in Human Judgement', 3.5),
(7,'His Dark Material', 3.8),
(8,'A Detail of History', 4.4),
(9,'Quiet',3),
(10,'Dominicana', 5);

select * from ratings;

drop table reviews;
CREATE TABLE reviews
(
review_book_id INT not null primary key,
title VARCHAR(100),
reviews VARCHAR (700)
);

ALTER TABLE reviews
ADD CONSTRAINT
        fk_review_book_id
        FOREIGN KEY (review_book_id)
        REFERENCES
	    books (book_id);

INSERT INTO reviews
Values
(1, 'A Culture of Kindness', 'Such a great read, kindness Radiates from every page!'),
(6, 'Noise:A Flaw in Human Judgement', 'The variety of ways judgment can be clouded is mind-boggling but thought the book was going to be more scientific.'),
(8, 'A Detail of History', 'Amazing and emotional, Very brave young child who lived to tell the story.'),
(5, 'Untamed: stop pleasing, start living', 'Intriguing and engaing but may not be for everyone.'),
(7, 'His Dark Material', 'Pretty good book. Going to read the full trilogy before making a final judgment.'),
(10, 'Dominicana', 'Beautifully written characters and I learned a lot about the Dominican migration to the States.');

select * from reviews;


CREATE TABLE customer_profile
(
  customer_profile_id int not null auto_increment primary key, 
    gender VARCHAR(50),
    age int not null
);

ALTER TABLE customer_profile
	ADD CONSTRAINT
        fk_customer_profile_id
        FOREIGN KEY (customer_profile_id)
        REFERENCES
	    customers (customer_id);

INSERT INTO customer_profile
Values
	(1, 'male', 25),
	(2, 'male', 57),
	(3, 'female', 63),
	(4, 'female', 15),
	(5, 'male', 19),
	(6, 'female', 42),
	(7, 'male', 39),
	(8, 'female', 17),
	(9, 'male', 89),
	(10, 'male', 35);
    
select * from customer_profile;


CREATE TABLE price
(
    price_id int not null primary key,
	title varchar(100),
    price decimal (10,2)
);
        
ALTER TABLE price
ADD CONSTRAINT
        fk_price_id
        FOREIGN KEY (price_id)
        REFERENCES
	    books (book_id);
        
INSERT INTO price
Values (1,'A Culture of Kindness', 14.99), 
       (2,'Invisible Women', 7.59), 
       (3,'Start With Why', 6.99), 
       (4,'Joyful', 12.87), 
       (5,'Untamed: stop pleasing, start living', 10.93), 
       (6,'Noise:A Flaw in Human Judgement', 7.99), 
       (7,'His Dark Material', 8.99), 
       (8,'A Detail of History', 13.45), 
       (9,'Quiet', 9.29), 
       (10, 'Dominicana', 12.99);
       

       


