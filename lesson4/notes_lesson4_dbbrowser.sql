SELECT * FROM orders;

SELECT orders.order_id, customers.first_name, orders.order_date
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id;

-- This is the same using aliases
SELECT o.order_id, c.first_name, o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

-- If we forget the ON, every customer will have order_id 1
-- SELECT o.order_id, c.first_name
-- FROM orders o
-- JOIN customers c;

-- show all customers from Uppsala
SELECT o.order_id, c.first_name, c.city
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE c.city = 'Uppsala';


-- show names, order info related and ordered by order_date
SELECT o.order_id, c.first_name, o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
ORDER BY o.order_date DESC
LIMIT 5;


-- shows name and quantity from an order
SELECT oi.order_id, p.name, oi.quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;


-- who bought what, how much and when
SELECT c.first_name, o.order_date, p.name, oi.quantity
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON oi.product_id = p.product_id;

-- ER diagram
-- customers <-- orders <-- order_items --> products

-- show what, how much has ANNA bought and when
SELECT c.first_name, o.order_date, p.name, oi.quantity
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON oi.product_id = p.product_id
WHERE c.first_name = 'Anna';


--LEFT JOIN
-- shows ALL names and orders related to the customer, NULL means they have never bought anything (no order_id related)
SELECT c.first_name, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id =  o.customer_id;


-- INNER JOIN
-- shows names and orders related to the customer, excluding the ones that have never bought anything (no order_id related)
SELECT c.first_name, o.order_id
FROM customers c
JOIN orders o ON c.customer_id =  o.customer_id;


