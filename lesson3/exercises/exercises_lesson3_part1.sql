SELECT * FROM orders;

SELECT COUNT(*) FROM orders;

-- 1. Add yourself as customer number 11 (use a made-up email).
INSERT INTO customers VALUES(11, 'Cecilia', 'Morales', 'cecilia@cecilia.com', 'Stockholm', '2026-10-07');

-- 2. Add two new products in one INSERT: Scarf (Accessories, 229 kr, 15 in stock) and Gloves(Accessories, 199 kr, 20 in stock).
INSERT INTO products VALUES(13, 'Scarf', 'Accessories', 229, 15),
							(14, 'Gloves', 'Accessories', 199, 20);
							
-- 3. Customer 7 (Emma) orders 2 Beanies (product 10, 179 kr). Make the order (order 16) and the order item.
INSERT INTO orders VALUES(16, 7, '2026-10-01', 'shipped');
							
INSERT INTO order_items VALUES(16, 10, 2, 179);							
							
-- 4. Try to add an order item with quantity 0. Which rule stops you?
INSERT INTO order_items VALUES(16, 10, 0, 179);

-- CHECK constraint failed: quantity > 0. Quantity must be greather than 0.

-- 5. Order 12 has been shipped. Change its status.
SELECT * FROM orders;
UPDATE orders SET status = 'shipped' WHERE order_id = 12;
SELECT * FROM orders WHERE order_id = 12 ;

-- 6. The Water Bottle (product 5) is back in stock: 50 pieces.
SELECT * FROM products WHERE product_id = 5;
UPDATE products SET stock = 50 WHERE product_id = 5;
SELECT * FROM products WHERE product_id = 5;

-- 7. Raise the price of all Accessories by 10%.
SELECT * FROM products WHERE category = 'Accessories';
UPDATE products SET price = price*1.1 WHERE category = 'Accessories';
SELECT * FROM products WHERE category = 'Accessories';

-- 8. Delete the cancelled order. Watch out: its items must go first! Why?
SELECT * FROM orders WHERE status = 'cancelled';

-- You should delete first the items related to the order, otherwise
-- an error (FOREIGN KEY constraint failed) will display.

SELECT * FROM order_items WHERE order_id = 7;
DELETE FROM order_items WHERE order_id = 7;
SELECT * FROM order_items WHERE order_id = 7;

DELETE FROM orders WHERE status = 'cancelled';

SELECT * FROM orders WHERE status = 'cancelled';
SELECT * FROM orders;










