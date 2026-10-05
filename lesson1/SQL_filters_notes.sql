--
-- CREATING TABLES:
--
-- EXECUTING ALL IN 'SQL 1*':
--
-- At line 1:
CREATE TABLE customers (
  customer_id INTEGER PRIMARY KEY,
  first_name  TEXT NOT NULL,
  last_name   TEXT NOT NULL,
  email       TEXT UNIQUE,
  city        TEXT,
  joined_date TEXT
);
-- Result: query executed successfully. Took 6ms
-- At line 10:
CREATE TABLE products (
  product_id INTEGER PRIMARY KEY,
  name       TEXT NOT NULL,
  category   TEXT,
  price      REAL,
  stock      INTEGER
);
-- Result: query executed successfully. Took 0ms
-- At line 18:
INSERT INTO customers VALUES
(1,'Anna','Lindqvist','anna.lindqvist@example.com','Uppsala','2024-03-14'),
(2,'Erik','Johansson','erik.j@example.com','Stockholm','2023-11-02'),
(3,'Sara','Ahmed','sara.ahmed@example.com','Göteborg','2025-01-20'),
(4,'Johan','Berg','johan.berg@example.com','Uppsala','2022-06-30'),
(5,'Maria','Nilsson','maria.n@example.com','Malmö','2025-08-11'),
(6,'Ali','Hassan','ali.hassan@example.com','Stockholm','2024-09-05'),
(7,'Emma','Karlsson','emma.k@example.com','Västerås','2023-02-17'),
(8,'Oskar','Persson','oskar.p@example.com','Uppsala','2025-05-28'),
(9,'Fatima','Yilmaz','fatima.y@example.com','Göteborg','2024-12-01'),
(10,'Lukas','Ek','lukas.ek@example.com',NULL,'2026-01-09');
-- Result: query executed successfully. Took 0ms, 10 rows affected
-- At line 30:
INSERT INTO products VALUES
(1,'Hoodie Black','Clothing',599,25),
(2,'T-shirt White','Clothing',249,60),
(3,'Cap Logo','Accessories',199,40),
(4,'Sneakers Classic','Shoes',1199,12),
(5,'Water Bottle','Accessories',149,0),
(6,'Joggers Grey','Clothing',499,18),
(7,'Backpack Urban','Accessories',749,8),
(8,'Running Shoes','Shoes',1399,5),
(9,'Socks 3-pack','Clothing',129,100),
(10,'Beanie','Accessories',179,30),
(11,'Rain Jacket','Clothing',1299,0),
(12,'Sandals','Shoes',399,22);
-- Result: query executed successfully. Took 0ms, 12 rows affected
-- EXECUTING ALL IN 'SQL 1*'
--
-- At line 1:
CREATE TABLE customers (
-- Result: table customers already exists
-- EXECUTING ALL IN 'SQL 1*'
--
--
--
-- SELECTING DATA
--
--
--
--
-- At line 1:
SELECT * FROM customers;
-- Result: 10 rows returned in 12ms
-- EXECUTING ALL IN 'SQL 1*'
--
-- At line 1:
SELECT first_name, last_name, city FROM customers
-- Result: 10 rows returned in 8ms
-- EXECUTING ALL IN 'SQL 1*'
--
-- At line 1:
SELECT frist_name, last_name, city FROM customers
-- Result: no such column: frist_name
-- EXECUTING ALL IN 'SQL 1*'
--
-- At line 1:
SELECT first_name last_name, city FROM customers
-- Result: 10 rows returned in 9ms
-- EXECUTING ALL IN 'SQL 1*'
--
-- At line 1:
SELECT * FROM products
-- Result: 12 rows returned in 18ms
-- EXECUTING ALL IN 'SQL 1*'
--
-- At line 1:
SELECT first_name, last_name, city FROM customers
-- Result: 10 rows returned in 10ms
-- EXECUTING ALL IN 'SQL 1*'
--
-- At line 1:
SELECT * FROM customers WHERE city = 'Uppsala';
-- Result: 3 rows returned in 8ms
-- EXECUTING ALL IN 'SQL 1*'
--
-- At line 1:
SELECT * FROM customers WHERE city = Uppsala;
-- Result: no such column: Uppsala
-- EXECUTING ALL IN 'SQL 1*'
--
-- At line 1:
SELECT * FROM customers WHERE city = "Uppsala";
-- Result: 3 rows returned in 12ms
-- EXECUTING ALL IN 'SQL 1*'
--
-- At line 1:
SELECT name, price FROM products WHERE price < 500;
-- Result: 7 rows returned in 10ms
-- EXECUTING ALL IN 'SQL 1*'
--
-- At line 1:
SELECT name, category, price FROM products WHERE category = 'Clothing' AND price < 500;
-- Result: 3 rows returned in 10ms
-- EXECUTING SELECTION IN 'SQL 1*'
--
-- At line 1:
OR
-- Result: near "OR": syntax error
-- EXECUTING ALL IN 'SQL 1*'
--
-- At line 1:
SELECT name, category FROM products WHERE category = 'Shoes' OR category = 'Accessories';
-- Result: 7 rows returned in 7ms
-- EXECUTING ALL IN 'SQL 1*'
--
-- At line 1:
SELECT name, category FROM products
WHERE category IN ('Shoes', 'Accessories')
-- Result: 7 rows returned in 10ms
-- EXECUTING ALL IN 'SQL 1*'
--
-- At line 1:
SELECT name, price FROM products WHERE price BETWEEN 200 AND 600;
-- Result: 4 rows returned in 7ms
-- EXECUTING ALL IN 'SQL 1*'
--
-- At line 1:
SELECT name, FROM
-- Result: near "FROM": syntax error
-- EXECUTING ALL IN 'SQL 1*'
--
-- At line 1:
SELECT name FROM products WHERE name LIKE 'S%';
-- Result: 3 rows returned in 17ms
-- EXECUTING ALL IN 'SQL 1*'
--
-- At line 1:
SELECT name FROM products WHERE name LIKE 'S%';
-- Result: 3 rows returned in 11ms
-- At line 3:
SELECT first_name, joined_date FROM customers
WHERE joined_date >= '2025-01-01';
-- Result: 4 rows returned in 13ms
-- EXECUTING ALL IN 'SQL 1*'
--
-- At line 1:
SELECT first_name, joined_date FROM customers
WHERE joined_date >= '2025-01-01';
-- Result: 4 rows returned in 7ms
-- EXECUTING SELECTION IN 'SQL 1*'
--
-- At line 1:
SELECT name FROM products WHERE name LIKE 'S%';
-- Result: 3 rows returned in 9ms
-- EXECUTING SELECTION IN 'SQL 1*'
--
-- At line 1:
SELECT name FROM products WHERE name LIKE 'S%';
-- Result: 3 rows returned in 6ms
-- At line 3:
SELECT first_name, joined_date FROM customers
WHERE joined_date >= '2025-01-01';
-- Result: 4 rows returned in 9ms
-- EXECUTING SELECTION IN 'SQL 1*'
--
-- At line 3:
SELECT first_name, joined_date FROM customers
WHERE joined_date >= '2025-01-01';
-- Result: 4 rows returned in 6ms
-- EXECUTING SELECTION IN 'SQL 1*'
--
-- At line 1:
SELECT name FROM products WHERE name LIKE 'S%';
-- Result: 3 rows returned in 8ms
-- EXECUTING ALL IN 'SQL 1*'
--
-- At line 1:
SELECT frist_name, last_name,city FROM customers

SELECT
-- Result: near "SELECT": syntax error
-- EXECUTING SELECTION IN 'SQL 1*'
--
-- At line 1:
SELECT frist_name, last_name,city FROM customers;
-- Result: no such column: frist_name
-- EXECUTING SELECTION IN 'SQL 1*'
--
-- At line 1:
SELECT first_name, last_name, city FROM customers;
-- Result: 10 rows returned in 11ms
-- EXECUTING SELECTION IN 'SQL 1*'
--
-- At line 3:
SELECT first_name, joined_date FROM customers
WHERE joined_date >= '2025-01-01';
-- Result: 4 rows returned in 7ms
-- EXECUTING SELECTION IN 'SQL 1*'
--
-- At line 1:
SELECT first_name, last_name, city FROM customers;
-- Result: 10 rows returned in 8ms
-- At line 3:
SELECT first_name, joined_date FROM customers
WHERE joined_date >= '2025-01-01';
-- Result: 4 rows returned in 8ms
-- EXECUTING SELECTION IN 'SQL 1*'
--
-- At line 3:
SELECT first_name, joined_date FROM customers
WHERE joined_date >= '2025-01-01';
-- Result: 4 rows returned in 6ms
-- EXECUTING SELECTION IN 'SQL 1*'
--
-- At line 6:
SELECT name, price FROM products ORDER BY price DESC;
-- Result: 12 rows returned in 7ms
-- EXECUTING SELECTION IN 'SQL 1*'
--
-- At line 6:
SELECT name, price FROM products ORDER BY price ASC;
-- Result: 12 rows returned in 9ms
-- EXECUTING SELECTION IN 'SQL 1*'
--
-- At line 6:
SELECT name, price FROM products ORDER BY price DESC;
-- Result: 12 rows returned in 8ms
-- EXECUTING SELECTION IN 'SQL 1*'
--
-- At line 6:
SELECT name, price FROM products ORDER BY price;
-- Result: 12 rows returned in 13ms
-- EXECUTING SELECTION IN 'SQL 1*'
--
-- At line 8:
SELECT name, price FROM products ORDER BY price DESC LIMIT 3;
-- Result: 3 rows returned in 10ms
-- EXECUTING SELECTION IN 'SQL 1*'
--
-- At line 10:
SELECT DISTINCT city FROM customers;
-- Result: 6 rows returned in 7ms
-- EXECUTING SELECTION IN 'SQL 1*'
--
-- At line 12:
SELECT name AS products, price AS price_sek FROM products;
-- Result: 12 rows returned in 7ms
-- EXECUTING SELECTION IN 'SQL 1*'
--
-- At line 14:
SELECT * FROM customers WHERE city = NULL;
-- Result: 0 rows returned in 6ms
-- EXECUTING SELECTION IN 'SQL 1*'
--
-- At line 15:
SELECT * FROM customers WHERE city IS NULL;
-- Result: 1 rows returned in 8ms
-- EXECUTING SELECTION IN 'SQL 1*'
--
-- At line 14:
SELECT * FROM customers WHERE city = NULL;
-- Result: 0 rows returned in 7ms
-- EXECUTING SELECTION IN 'SQL 1*'
--
-- At line 15:
SELECT * FROM customers WHERE city IS NULL;
-- Result: 1 rows returned in 14ms
 