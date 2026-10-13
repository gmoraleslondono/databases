# Exercises: Python and personal data

# Python and the database

# Work in VS Code, in your folder with a copy of webshop.db. Close the database in DB Browser
# first (Close Database), otherwise Python can get the error 'database is locked'. Exercises 5 to 8
# build on shop.py from the code-along.

# Exercise 1
# Write a script that prints all customers as 'First Last (City)'.
# Expected: 10 lines

# Exercise 2
# Ask the user for a max price and show all products cheaper than that. Use a ? placeholder.

# Exercise 3
# Ask the user for a category and print how many products it has. Use COUNT and fetchone().

# Exercise 4
# Explain in your own words: why is building SQL with an f-string dangerous, and why is a ? placeholder safe?
# Expected: a few sentences

# Exercise 5
# Add a menu option 4 to shop.py: change the stock of a product. Ask for the product id and the new stock.

# Exercise 6
# Add a menu option 5 to shop.py: show an order's receipt. Ask for the order_id and use a JOIN to show product names.

# Exercise 7
# What happens in add_product if the user types abc as the price? Fix it with try/except.

# Exercise 8
# Challenge: add a menu option 6, 'top 3 best-selling products'. Use GROUP BY, ORDER BY and LIMIT.
# Expected: 3 lines


# Personal data

# Use webshop.db in DB Browser. When you are done, click Revert Changes so webshop.db is back to normal.

# Exercise 9
# Anna (customer 1) asks: 'Which products have I bought?' Write the query that answers her. Show product names only, each once.
# Expected: 4 rows

# Exercise 10
# Erik says his email is wrong. Correct it to erik.johansson@example.com.
# Expected: 1 row changed

# Exercise 11
# Create a view customer_overview that a support person can use: customer_id, first name, city and number of orders, but no email. Customers with no orders must also be shown.
# Expected: 10 rows when you SELECT from the view

# Exercise 12
# Discuss in pairs: the webshop wants to add a birth_date column 'just in case'. What would you say? Write two sentences.
# Expected: two sentences
