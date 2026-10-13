-- Python  meets databases
-- sqlite3, safe queries and SQL injection
-- How to stop SQL injection. Examples

-- Why to connect Python to a Database?
-- real apps use code to communicate with the databases
-- Python asks the database questions and shows the answer to the user

-- 4 steps to connect Python to a Database
-- 1. Connect to the Database
-- 2. Create a Cursor
-- 3. Execute a Query, fetch (run SQL and get an answer)
-- 4. Close the Connection

-- Example:
import sqlite3

conn = sqlite3.connect("webshop.db")  -- connect
cursor = conn.cursor() -- create a cursor
cursor.execute("SELECT * FROM products") -- execute a query
result = cursor.fetchall() -- get the answer
print(result) -- print the answer

conn.close() -- close the connection

-- NOTES:
-- sqlite3 is build in python library. We don't need to install it.
-- Results are returned as a list of tuples.

-- What we get back?
-- fetchall() gives a list of tuples. Each tuple is a row in the table.
-- fetchone() gives a single tuple. just first row in the result.

result = cursor.fetchall()
-- [(1, 'Product 1', 100), (2, 'Product 2', 200), (3, 'Product 3', 300)]

for product_id, name, price in result:
    print(name, price)


-- SQL INJECTION:

-- NEVER put user input into SQL with F-STRINGS

-- looks harmless but user can type SQL code to the input field
-- Example: typing -> x' OR '1'='1
-- will return all rows from the table (all products or all customers :( )
-- because '1'='1' is true

city = input("Enter the city: ")
query = f"SELECT * FROM customers WHERE city = '{city}'"
cursor.execute(query) -- execute the query --> DANGER!!
result = cursor.fetchall()
print(result)

-- if user type 'x' OR '1'='1'
-- will return all rows from the table (all products or all customers :( )
-- because '1'='1' is true
-- Attackers will get access to more than what they should have access to
-- Attackers can read, change or delete data from the database

-- How to stop SQL injection?
-- use placeholders instead of f-strings
-- write a ? for each value you want to insert -> execute(sql, (value1, value2, ...))
-- values are passed to the execute() method as a tuple
-- the database will replace the ? with the value and execute the query
-- note the comma (city,) because it is a tuple

-- Example:
city = input("Enter the city: ")
query = "SELECT * FROM customers WHERE city = ?"
cursor.execute(query, (city,)) -- execute the query --> SAFE!!
result = cursor.fetchall()
print(result)


-- CHANGING DATA IN THE DATABASE
-- commit() to save the changes to the database
-- rollback() to undo the changes if something goes wrong

-- Example:
cursor.execute(
	"INSERT INTO products (name, category, price, stock)"
	"VALUES (?, ?, ?, ?)",
	("Product 4", "Category 4", 400, 40)
)
conn.commit() -- save the changes to the database


-- Foreign Keys:
-- DB Browser checks foreign keys for you, Python not.
-- We need to turn them ON after the connection

-- Example:
conn = sqlite3.connect("webshop.db")
cursor = conn.cursor()
cursor.execute("PRAGMA foreign_keys = ON") -- turn on foreign keys
conn.commit() -- save the changes to the database

-- NOTES: Turn foreign keys ON after the connection: PRAGMA foreign_keys = ON


-- Code from the video

SELECT o.order_id, o.order_date, o.status, p.name, oi.quantity, oi.unit_price
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p 	ON oi.product_id = p.product_id
WHERE o.customer_id = 1;
CREATE VIEW sales_for_analysts AS
SELECT o.order_id, o.order_date, c.city, p.category,
		oi.quantity * oi.unit_price AS amount
FROM orders o
JOIN customers c	ON o.customer_id = c.customer_id
JOIN order_items oi	ON o.order_id = oi.order_id
JOIN products p		ON oi.product_id = p.product_id;

SELECT city, SUM(amount) AS sales
FROM sales_for_analysts
GROUP BY city;

DELETE FROM customers WHERE customer_id = 1;
UPDATE customers
SET first_name = "Deleted",
	last_name = "customer",
	email	  = NULL,
	city 	  = NULL
WHERE customer_id = 2;
NoSQL (MongoDB)
{"order_id":1 "customer": "Anna",
"items": [{"product": "Hoodie Black"}, "qty":1]
}

SELECT * FROM customers WHERE customer_id = 1;
