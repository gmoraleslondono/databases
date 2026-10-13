# Exercises: Python and personal data

# Python and the database

# Work in VS Code, in your folder with a copy of webshop.db. Close the database in DB Browser
# first (Close Database), otherwise Python can get the error 'database is locked'. Exercises 5 to 8
# build on shop.py from the code-along.

# -----------------------------------------------------------------------------------------------------

import sqlite3
from pprint import pprint

# Exercise 1
# Write a script that prints all customers as 'First Last (City)'.
# Expected: 10 lines
# Solution:
# conn = sqlite3.connect("webshop.db")
# cursor = conn.cursor()
# query = "SELECT first_name, last_name, city FROM customers"
# cursor.execute(query)
# results = cursor.fetchall()
# for first, last, city in results:
#     print(f"{first} {last} ({city})")
# # Anna Lindqvist (Uppsala)
# # Erik Johansson (Stockholm)
# # Sara Ahmed (Göteborg)
# # Johan Berg (Uppsala)
# # Maria Nilsson (Malmö)
# # Ali Hassan (Stockholm)
# # Emma Karlsson (Västerås)
# # Oskar Persson (Uppsala)
# # Fatima Yilmaz (Göteborg)
# # Lukas Ek (None)

# Exercise 2
# Ask the user for a max price and show all products cheaper than that. Use a ? placeholder.
# Solution:
# max_price = input("Enter max price: ") # 500
# conn = sqlite3.connect("webshop.db")
# cursor = conn.cursor()
# query = "SELECT * FROM products WHERE price <= ?"
# cursor.execute(query, (max_price,))
# result = cursor.fetchall()
# pprint(result)
# # [(2, 'T-shirt White', 'Clothing', 249.0, 60),
# #  (3, 'Cap Logo', 'Accessories', 199.0, 40),
# #  (5, 'Water Bottle', 'Accessories', 149.0, 0),
# #  (6, 'Joggers Grey', 'Clothing', 499.0, 18),
# #  (9, 'Socks 3-pack', 'Clothing', 129.0, 100),
# #  (10, 'Beanie', 'Accessories', 179.0, 30),
# #  (12, 'Sandals', 'Shoes', 399.0, 22)]

# Exercise 3
# Ask the user for a category and print how many products it has. Use COUNT and fetchone().
# Solution:
# print("Select a category: Clothing, Accessories or Shoes")
# category = input("Enter the category name: ")
# conn = sqlite3.connect("webshop.db")
# cursor = conn.cursor()
# query = "SELECT COUNT(*) FROM products WHERE category = ?"
# cursor.execute(query, (category,))
# result = cursor.fetchone()
# print(f"Products in the category {category} are {result[0]}") # Products in the category Shoes are 3

# Exercise 4
# Explain in your own words: why is building SQL with an f-string dangerous, and why is a ? placeholder safe?
# Expected: a few sentences
# Solution:
# Using f-strings allows the user to insert any text into the query, which can lead to SQL injection attacks.
# Attackers will get access to more than what they should have access to
# Attackers can read, change or delete data from the database

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
