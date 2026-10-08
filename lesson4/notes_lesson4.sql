-- Lesson 4: JOIN and INNER JOIN

-- JOIN : put columns from different tables together
-- INNER JOIN : return rows that have a match in both tables

-- Example:
SELECT orders.order_id, customers.first_name
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id;

-- ALIAS : a short name for a table
-- Example:
SELECT o.order_id, c.first_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;
-- In this example, we are using the alias o for orders and c for customers
