-- Extra challenges: SELECT

-- Level 1

-- Exercise 1
-- Show products that are not Accessories, are in stock, and have a space in their name. Sort by
-- category, then by price from highest to lowest.
-- Expected: 6 rows
-- different of and a name with a space between
SELECT * FROM products WHERE category != 'Accessories' AND stock > 0 AND name LIKE '% %' ORDER BY category, price DESC;

-- Exercise 2
-- Show customers who live in a city starting with S or M, plus customers with no city at all.
-- Expected: 4 rows
-- names that start with S or M
SELECT * FROM customers WHERE city LIKE 'S%' OR city LIKE 'M%' OR city = '' OR CITY IS NULL;

-- Exercise 3
-- Which Shoes product is the second most expensive? Show only that one.
-- Expected: 1 row
SELECT * FROM products ORDER BY price DESC  LIMIT 1 OFFSET 1;

-- Exercise 4
-- Of the customers who joined in 2024 or 2025, show the 3 who joined most recently. Solve it
-- without BETWEEN and without >=.
-- Expected: 3 rows
-- select a range time
SELECT * FROM customers WHERE joined_date BETWEEN '2024-01-01' AND '2026-01-01' ORDER BY joined_date DESC LIMIT 3;
SELECT * FROM customers WHERE joined_date > '2023-12-31' AND joined_date < '2026-01-01' ORDER BY joined_date DESC LIMIT 3;

-- Level 2
-- Use the SQLite documentation: sqlite.org/lang_corefunc.html

-- Exercise 5
-- Show each customer's full name in one column called full_name (like "Anna Lindqvist"), sorted by last name.
-- Look up: || · Expected: 10 rows
-- concatenate
SELECT first_name || ' ' || last_name AS full_name FROM customers ORDER BY last_name;

-- Exercise 6
-- Give every product a price level: budget under 200 kr, mid from 200 to 799 kr, premium from 800 kr.
-- Look up: CASE WHEN · Expected: 12 rows: 4 budget, 5 mid, 3 premium
-- different cases and create subcategories
SELECT *, CASE WHEN price < 200 THEN 'budget' WHEN price < 800 THEN 'mid' ELSE 'premium' END AS price_level FROM products;

-- Exercise 7
-- Show every customer's first name and city, but write Unknown instead of NULL.
-- Look up: COALESCE · Expected: 10 rows
-- replace NULL with Unknown
SELECT first_name, coalesce(city, 'Unknown') AS city FROM customers;

-- Exercise 8
-- Which customers joined in the first half of a year (January to June), whatever the year?
-- Look up: strftime · Expected: 6 rows
-- take only the month
SELECT * FROM customers WHERE strftime('%m', joined_date) IN ('01', '02', '03', '04', '05', '06');

-- Exercise 9
-- Which product has the longest name?
-- Look up: LENGTH · Expected: 1 row
-- string length
SELECT * FROM products ORDER BY length(name) DESC LIMIT 1;

-- Exercise 10
-- Show each customer's email username: the part before the @.
-- Look up: substr and instr · Expected: 10 rows
-- trim strings
SELECT email, substr(EMAIL, 1, INSTR(EMAIL, '@')-1) AS username FROM customers;

-- Level 3

-- Exercise 11
-- Which products cost more than the average price? Don't type the average yourself: let SQL
-- calculate it inside the query.
-- Expected: 5 rows
-- calculate average
SELECT * FROM products WHERE price > (SELECT avg(price) FROM products);

-- Exercise 12
-- Make a price list with one column that says, for example, "Socks 3-pack costs 129 kr". Only
-- products in stock, cheapest first. Watch out: does it say 129 or 129.0? Fix it.
-- Expected: 10 rows

-- Exercise 13
-- How many customers live in each city? Biggest city first.
-- Look up: GROUP BY · Expected: 6 rows

