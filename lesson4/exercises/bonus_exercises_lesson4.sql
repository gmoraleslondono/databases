-- Extra exercises: review

-- These exercises mix everything so far: SELECT, filtering and sorting, creating and changing
-- tables, INSERT, UPDATE and DELETE, database design and JOINs. Before you start, check that
-- SELECT COUNT(*) FROM orders; gives 15. If not, run webshop_reset.sql and press Ctrl+S.

-- Level 1
-- Use webshop.db.

-- Exercise 1
-- Show products in Clothing or Accessories that cost between 150 and 500 kr. Most expensive first.
-- Expected: 4 rows

-- Exercise 2
-- Which orders were placed in February 2026 and are not cancelled?
-- Expected: 4 rows

-- Exercise 3
-- Show every order line with the order_id, product name, quantity and line total (quantity times unit price). Only show lines where the line total is more than 500 kr. Biggest first.
-- Expected: 11 rows

-- Exercise 4
-- Which customers from Uppsala or Stockholm have placed at least one order? Each customer only once.
-- Expected: 5 rows

-- Level 2
-- These exercises change data. Click Revert Changes after each one, so webshop.db is back to normal.

-- Exercise 5
-- A new customer, Leo Falk from Uppsala, places an order today: 1 Hoodie Black and 2 Socks 3-pack. Add the customer, the order and the order lines. Then show the receipt with product names using a JOIN.
-- Expected: the receipt has 2 rows

-- Exercise 6
-- Order 12 is cancelled. Change its status, and put its products back in stock. Look at its order lines first to see which products and how many.
-- Expected: Sneakers Classic goes from 12 to 13 in stock, Socks 3-pack from 100 to 101

-- Exercise 7
-- Try to delete Hoodie Black (product 1). What happens, and why? How could the shop stop selling it without deleting it?
-- Expected: an error

-- Exercise 8
-- Add a column discount_percent to products. It should be 0 if nothing is given and can only be between 0 and 90. Give all Shoes 20 percent off. Then show every product with its price and its price after discount.
-- Look up: ALTER TABLE ... ADD COLUMN · Expected: 12 rows

-- Level 3
-- Exercises 9 to 12 use webshop.db. Exercise 13 is a small practice lab in a new database, cinema.db.

-- Exercise 9
-- Show every product with the dates it was ordered. Products that were never ordered must also be shown, with an empty date. Sort by product name.
-- Expected: 25 rows

-- Exercise 10
-- Which customers have bought something from the Shoes category? Each customer only once.
-- Expected: 3 rows

-- Exercise 11
-- Show all pairs of customers who live in the same city, for example Anna and Johan. Each pair should only appear once.
-- Look up: self join (a table joined with itself) · Expected: 5 pairs

-- Exercise 12
-- The price of Hoodie Black goes up to 649 kr. Change it, then find all order lines where the customer paid a different price than today's price. Show order_id, product name, what they paid and today's price.
-- Expected: 3 rows

-- Exercise 13
-- Practice lab. A cinema shows movies in two salons. Each movie has a title, a length in minutes and
-- an age limit (0, 7, 11 or 15). A screening is one movie shown in one salon on a date and at a time.
-- Customers buy tickets for screenings. Each ticket has a seat number and a price, and a seat can
-- only be sold once per screening. Create cinema.db, draw the ER diagram and write CREATE TABLE
-- with suitable constraints. Add test data: at least 3 movies, 4 screenings, 3 customers, 6 tickets,
-- and one screening with no tickets. Then write three queries: all screenings with the movie title,
-- sorted by date and time; every ticket with customer name, movie title and date; and the
-- screenings that have no tickets sold.
-- Expected: depends on your own test data
