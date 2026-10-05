-- LAB1

SELECT first_name, email FROM customers;

SELECT * FROM products
WHERE category = 'Shoes';

SELECT * FROM customers WHERE city = 'Uppsala';

SELECT * FROM products WHERE price = 199;

SELECT * FROM products ORDER BY name ASC;

SELECT * FROM customers ORDER BY joined_date ASC;

SELECT * FROM products WHERE stock = 0;

SELECT * FROM customers ORDER BY joined_date DESC LIMIT 3;

SELECT * FROM customers WHERE city IN ('Stockholm', 'Göteborg');

SELECT name product, price price_sek FROM products;


-- Bonus questions:

SELECT * FROM products WHERE category IN ('Clothing', 'Shoes') AND price > 1000;

SELECT name, price, stock, price*stock stock_value FROM products WHERE stock > 0 ORDER BY stock_value DESC;

SELECT * FROM customers WHERE first_name LIKE '____';

SELECT * FROM products ORDER BY price ASC LIMIT 5 OFFSET 5;

SELECT * FROM customers WHERE joined_date < '2025-01-01' AND city != 'Uppsala' ORDER BY city, last_name ASC;


-- Extra challenges:

-- Level 1
-- Exercise 1 -  different of and a name with a space between
SELECT * FROM products WHERE category != 'Accessories' AND stock > 0 AND name LIKE '% %' ORDER BY category, price DESC;

-- Exercise 2 -  names that start with S or M
SELECT * FROM customers WHERE city LIKE 'S%' OR city LIKE 'M%' OR city = '' OR CITY IS NULL;

-- Exercise 3
SELECT * FROM products ORDER BY price DESC  LIMIT 1 OFFSET 1;

-- Exercise 4 - select a range time
SELECT * FROM customers WHERE joined_date BETWEEN '2024-01-01' AND '2026-01-01' ORDER BY joined_date DESC LIMIT 3;
SELECT * FROM customers WHERE joined_date > '2023-12-31' AND joined_date < '2026-01-01' ORDER BY joined_date DESC LIMIT 3;

-- Level 2
-- Exercise 5 - concatenate
SELECT first_name || ' ' || last_name AS full_name FROM customers ORDER BY last_name;

-- Exercise 6 - different cases and create subcategories
SELECT *, CASE WHEN price < 200 THEN 'budget' WHEN price < 800 THEN 'mid' ELSE 'premium' END AS price_level FROM products;

-- Exercise 7 -  replace NULL with Unknown
SELECT first_name, coalesce(city, 'Unknown') AS city FROM customers;

-- Exercise 8 - take only the month
SELECT * FROM customers WHERE strftime('%m', joined_date) IN ('01', '02', '03', '04', '05', '06');

-- Exercise 9 - string lenght
SELECT * FROM products ORDER BY length(name) DESC LIMIT 1;
 
-- Exercise 10 - trim strings
SELECT email, substr(EMAIL, 1, INSTR(EMAIL, '@')-1) AS username FROM customers;

-- LEVEL 3
-- Exercise 11 -  calculate average
SELECT * FROM products WHERE price > (SELECT avg(price) FROM products);







