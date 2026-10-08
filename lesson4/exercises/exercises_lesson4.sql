-- Exercises: Joining tables
-- Use webshop.db for all exercises. Before you start, check that the orders are there: SELECT
-- COUNT(*) FROM orders; should give 15. If not, run webshop_reset.sql and press Ctrl+S.

SELECT COUNT(*) FROM orders;

-- Exercise 1
-- Show every order with the customer's first name, last name and the order status.
-- Expected: 15 rows

SELECT c.first_name, c.last_name, o.status
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;
-- Result: 15 rows returned in 13ms

SELECT c.first_name, c.last_name, o.status
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;
-- Result: 15 rows returned in 12ms


-- Exercise 2
-- Show all orders made by Erik.
-- Expected: 3 rows

SELECT o.*
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE c.first_name = 'Erik';
-- Result: 3 rows returned in 13ms


-- Exercise 3
-- Show all orders from customers in Göteborg, newest first.
-- Expected: 3 rows
SELECT o.*
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE c.city = 'Göteborg'
ORDER BY o.order_date DESC;
-- Result: 3 rows returned in 13ms


-- Exercise 4
-- Show every order item with the product name and category.
-- Expected: 23 rows
SELECT oi.*, p.name, p.category
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;
-- Result: 23 rows returned in 13ms


-- Exercise 5
-- Which orders contained Shoes? Show order_id and product name.
-- Expected: 4 rows
SELECT o.order_id, p.name
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE p.category = 'Shoes';
-- Result: 4 rows returned in 13ms


-- Exercise 6
-- Show the full receipt for order 10: product name, quantity, unit price and line total.
-- Expected: 2 rows
SELECT p.name, oi.quantity, oi.unit_price, oi.quantity*oi.unit_price AS line_total
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_id = 10;
-- Result: 2 rows returned in 14ms


-- Exercise 7
-- Show which customers have bought a Hoodie Black (first name and order date).
-- Expected: 3 rows
SELECT c.first_name, o.order_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE p.name = 'Hoodie Black';
-- Result: 3 rows returned in 47ms


-- Exercise 8
-- Show all customers and their orders, including customers with no orders.
-- Expected: 17 rows
SELECT c.*, o.*
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;
-- Result: 17 rows returned in 3ms


-- Exercise 9
-- Which products have never been sold?
-- Expected: 2 rows
SELECT p.name
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;
-- Result: 2 rows returned in 14ms


-- Exercise 10
-- Challenge: show customers from Uppsala and every product they bought (first name, product name, quantity).
-- Expected: 8 rows
SELECT c.first_name, p.name, oi.quantity
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE c.city = 'Uppsala';
-- Result: 8 rows returned in 13ms

















