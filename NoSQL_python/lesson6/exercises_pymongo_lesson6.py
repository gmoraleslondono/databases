# Exercises: MongoDB basics
# Do all exercises in Python, with the header from the code-along at the top of your file. Start by
# running python seed_webshop.py. Exercises 7 and 8 add data: when you are done, run python
# seed_webshop.py to reset the webshop.

# The header (at the top of every Python file):

# from pymongo import MongoClient
# client = MongoClient("mongodb://localhost:27017/")
# db = client["webshop"]

# --------------------------------------------------------------------------------------------------

from pprint import pprint
from datetime import datetime
from pymongo import MongoClient
client = MongoClient("mongodb://localhost:27017/")
db = client["webshop"]

# Exercise 1
# Print the name of every product in the Accessories category.
# Expected: 4 names
# Solution:
# for product in db.products.find({"category": "Accessories"}):
#     print(product["name"])
# # Cap Logo
# # Water Bottle
# # Backpack Urban
# # Beanie

# Exercise 2
# Print the first and last name of every customer who lives in Göteborg.
# Expected: 2 customers
# Solution:
# for customer in db.customers.find({"city": "Göteborg"}):
#     print(customer["first_name"], customer["last_name"])
# # Sara Ahmed
# # Fatima Yilmaz

# Exercise 3
# Python: print the name and price of every product, one per line.
# Expected: 12 lines
# Solution:
# for product in db.products.find():
#     print(product["name"], product["price"])
# # Hoodie Black 599
# # T-shirt White 249
# # Cap Logo 199
# # Sneakers Classic 1199
# # Water Bottle 149
# # Joggers Grey 499
# # Backpack Urban 749
# # Running Shoes 1399
# # Socks 3-pack 129
# # Beanie 179
# # Rain Jacket 1299
# # Sandals 399

# Exercise 4
# Python: how many customers live in Uppsala? Use count_documents.
# Expected: 3
# Solution:
# print(db.customers.count_documents({"city": "Uppsala"})) # 3

# Exercise 5
# Python: find the product named Sandals with find_one and print how many are in stock.
# Expected: 22
# product = db.products.find_one({"name": "Sandals"})
# print(product["stock"]) #22

# Exercise 6
# Python: print the first name of every customer who gets the newsletter (newsletter is True).
# Expected: 3 names
# for customer in db.customers.find({"newsletter": True}):
#     print(customer["first_name"])
# # Anna
# # Sara
# # Oskar

# Exercise 7
# Python: add yourself as a customer with insert_one, without an _id. Print the inserted_id. Then find yourself again with find_one and your email, and print yourself with pprint.
# Expected: an ObjectId, then your document
# Solution:
# result = db.customers.insert_one({
#     "first_name": "Cecilia",
#     "last_name": "Morales",
#     "email": "cecilia@test.com",
#     "city": "Stockholm",
#     "joined": datetime(2026, 10, 12)
# })
# print(result.inserted_id) # 6ace8abe1cc50c85ae73c592

# customer1 = db.customers.find_one({"email": "cecilia@test.com"})
# pprint(customer1)
# # {'_id': ObjectId('6ace8abe1cc50c85ae73c592'),
# #  'city': 'Stockholm',
# #  'email': 'cecilia@test.com',
# #  'first_name': 'Cecilia',
# #  'joined': datetime.datetime(2026, 10, 12, 0, 0),
# #  'last_name': 'Morales'}

# Exercise 8
# Python: add two new products with insert_many (give them _id 13 and 14, and include tags). Then print how many products there are.
# Expected: 14
#Solution:
# result = db.products.insert_many([
#     {
#         "_id": 13,
#         "name": "Red socks",
#         "category": "Clothing",
#         "price": 455,
#         "stock": 50,
#         "tags": ["bestseller"]
#     },
#     {
#         "_id": 14,
#         "name": "Blue socks",
#         "category": "Clothing",
#         "price": 455,
#         "stock": 20,
#         "tags": ["bestseller"]
#     }
# ])

# print(db.products.count_documents({})) # 14

# Exercise 9
# Python: print every customer as 'First Last (City)'. Customers without a city should show (unknown). Hint: dict.get().
# Expected: 10 lines
# Solution:
# for customer in db.customers.find():
#     print(f"{customer["first_name"]} {customer["last_name"]} ({customer.get("city", "unknown")})")
# # Anna Lindqvist (Uppsala)
# # Erik Johansson (Stockholm)
# # Sara Ahmed (Göteborg)
# # Johan Berg (Uppsala)
# # Maria Nilsson (Malmö)
# # Ali Hassan (Stockholm)
# # Emma Karlsson (Västerås)
# # Oskar Persson (Uppsala)
# # Fatima Yilmaz (Göteborg)
# # Lukas Ek (unknown)
# # Cecilia Morales (Stockholm)

# Exercise 10
# Challenge: print every order as 'Order 1: 2 items'. Hint: an order's items is a list, and len() works on lists.
# Expected: 15 lines
# Solution
# for order in db.orders.find():
#     print(f"Order {order["_id"]}: {len(order["items"])} items")
# # Order 1: 2 items
# # Order 2: 1 items
# # Order 3: 1 items
# # Order 4: 2 items
# # Order 5: 1 items
# # Order 6: 2 items
# # Order 7: 1 items
# # Order 8: 2 items
# # Order 9: 1 items
# # Order 10: 2 items
# # Order 11: 1 items
# # Order 12: 2 items
# # Order 13: 1 items
# # Order 14: 2 items
# # Order 15: 2 items
