# Exercises: Queries and updates

# Use Python with the header from the code-along. Start by running python seed_webshop.py.
# Exercises 8 to 10 change data: run the seed script again when you are done.

# The header (at the top of every Python file):

# from pymongo import MongoClient
# client = MongoClient("mongodb://localhost:27017/")
# db = client["webshop"]

# ---------------------------------------------------------------------------------------
from pprint import pprint
from datetime import datetime
from pymongo import MongoClient
client = MongoClient("mongodb://localhost:27017/")
db = client["webshop"]

# Exercise 1
# Show the name and price of all products that cost more than 1000 kr.
# Expected: 3 products
# Solution:
# result = db.products.find({"price": {"$gt": 1000}}, {"name": 1, "price": 1, "_id": 0})
# for product in result:
#     pprint(product)
# # {'name': 'Sneakers Classic', 'price': 1199}
# # {'name': 'Running Shoes', 'price': 1399}
# # {'name': 'Rain Jacket', 'price': 1299}


# Exercise 2
# Show all orders that are not delivered. Use $ne. Print the _id and status.
# Expected: 8 orders
# Solution:
# result = db.orders.find({"status": {"$ne": "delivered"}}, {"status": 1})
# for order in result:
#     pprint(order)
# # {'_id': 7, 'status': 'cancelled'}
# # {'_id': 9, 'status': 'shipped'}
# # {'_id': 10, 'status': 'shipped'}
# # {'_id': 11, 'status': 'shipped'}
# # {'_id': 12, 'status': 'new'}
# # {'_id': 13, 'status': 'new'}
# # {'_id': 14, 'status': 'new'}
# # {'_id': 15, 'status': 'new'}


# Exercise 3
# Show customers who live in Stockholm or Malmö, using $in.
# Expected: 3 customers
#Solution:
# result = db.customers.find({"city": {"$in": ["Stockholm", "Malmö"]}})
# for customer in result:
#     pprint(customer)
# # {'_id': 2,
# #  'city': 'Stockholm',
# #  'email': 'erik.j@example.com',
# #  'first_name': 'Erik',
# #  'joined': datetime.datetime(2023, 11, 2, 0, 0),
# #  'last_name': 'Johansson',
# #  'phone': '070-1234567'}
# # {'_id': 5,
# #  'city': 'Malmö',
# #  'email': 'maria.n@example.com',
# #  'first_name': 'Maria',
# #  'joined': datetime.datetime(2025, 8, 11, 0, 0),
# #  'last_name': 'Nilsson',
# #  'phone': '073-7654321'}
# # {'_id': 6,
# #  'city': 'Stockholm',
# #  'email': 'ali.hassan@example.com',
# #  'first_name': 'Ali',
# #  'joined': datetime.datetime(2024, 9, 5, 0, 0),
# #  'last_name': 'Hassan',
# #  'newsletter': False}


# Exercise 4
# Which products are white? Use dot notation.
# Expected: 3 products
# Solution:
# result = db.products.find({"details.color": "white"})
# for product in result:
#     pprint(product)
# # {'_id': 2,
# #  'category': 'Clothing',
# #  'details': {'color': 'white', 'material': 'cotton'},
# #  'name': 'T-shirt White',
# #  'price': 249,
# #  'stock': 60,
# #  'tags': ['summer', 'cotton']}
# # {'_id': 4,
# #  'category': 'Shoes',
# #  'details': {'color': 'white', 'material': 'leather'},
# #  'name': 'Sneakers Classic',
# #  'price': 1199,
# #  'sizes': [39, 40, 41, 42, 43, 44],
# #  'stock': 12,
# #  'tags': ['bestseller']}
# # {'_id': 9,
# #  'category': 'Clothing',
# #  'details': {'color': 'white', 'material': 'cotton'},
# #  'name': 'Socks 3-pack',
# #  'price': 129,
# #  'stock': 100,
# #  'tags': ['cotton']}


# Exercise 5
# Which products have the tag sport? Show only name and tags, without _id.
# Expected: 3 products
# Solution:
# result = db.products.find({"tags": "sport"}, {"name": 1, "tags": 1, "_id": 0})
# for product in result:
#     pprint(product)
# # {'name': 'Water Bottle', 'tags': ['sport']}
# # {'name': 'Joggers Grey', 'tags': ['sport', 'cotton']}
# # {'name': 'Running Shoes', 'tags': ['sport', 'bestseller']}


# Exercise 6
# Show the 5 cheapest products, cheapest first. Only name and price.
# Expected: 5 products
# Solution:
# result = db.products.find({}, {"name": 1, "price": 1, "_id": 0 }).sort("price", 1).limit(5)
# for product in result:
#     pprint(product)
# # {'name': 'Socks 3-pack', 'price': 129}
# # {'name': 'Water Bottle', 'price': 149}
# # {'name': 'Beanie', 'price': 179}
# # {'name': 'Cap Logo', 'price': 199}
# # {'name': 'T-shirt White', 'price': 249}


# Exercise 7
# Which orders contain product 2 (T-shirt White)? Hint: dot notation works on arrays of objects too: "items.product_id".
# Expected: 4 orders
# Solution:
# result = db.orders.find({"items.product_id": 2}, {"status": 1})
# for order in result:
#     pprint(order)
# # {'_id': 4, 'status': 'delivered'}
# # {'_id': 8, 'status': 'delivered'}
# # {'_id': 10, 'status': 'shipped'}
# # {'_id': 15, 'status': 'new'}


# Exercise 8
# Raise the price of all Accessories by 20 kr with $inc. Then print the Accessories with their new prices.
# Expected: 4 products, each 20 kr more
# Solution:
# products = db.products.find({"category": "Accessories"}, {"price": 1})
# for product in products:
#     print(product)
# {'_id': 3, 'price': 199}
# {'_id': 5, 'price': 149}
# {'_id': 7, 'price': 749}
# {'_id': 10, 'price': 179}

# result = db.products.update_many({"category": "Accessories"}, {"$inc": {"price": 20}})
# print(result.modified_count)

# products = db.products.find({"category": "Accessories"}, {"price": 1})
# for product in products:
#     print(product)
# # {'_id': 3, 'price': 219}
# # {'_id': 5, 'price': 169}
# # {'_id': 7, 'price': 769}
# # {'_id': 10, 'price': 199}


# Exercise 9
# Add the tag "new" to the Rain Jacket without creating duplicates, and give it a field restock_date
# with today's date (use datetime.now()).
# Expected: 1 product with the new tag and field (the time will be yours)
#Solution:
# product = db.products.find_one({"name": "Rain Jacket"})
# print(product)
# # {'_id': 11, 'name': 'Rain Jacket', 'category': 'Clothing', 'price': 1299, 'stock': 0, 'tags': ['winter', 'waterproof'], 'details': {'color': 'yellow', 'material': 'polyester'}}

# result = db.products.update_one({"name": "Rain Jacket"}, {"$set": {"restock_date": datetime.now()}, "$addToSet": {"tags": "new"}})

# print(result.modified_count)

# product = db.products.find_one({"name": "Rain Jacket"})
# print(product)
# # {'_id': 11, 'name': 'Rain Jacket', 'category': 'Clothing', 'price': 1299, 'stock': 0, 'tags': ['winter', 'waterproof', 'new'], 'details': {'color': 'yellow', 'material': 'polyester'}, 'restock_date': datetime.datetime(2026, 10, 15, 11, 8, 12, 812000)}


# Exercise 10
# Challenge: delete all orders with status new placed before 2026-03-20. Count them first. Hint:
# dates in filters are datetime objects, like datetime(2026, 3, 20).
# Expected: 2, then 2 deleted
# Solution:
# orders = db.orders.find({"status": "new", "order_date": {"$lt": datetime(2026, 3, 20)}})

# for order in orders:
#     print(order["_id"], order["order_date"])
# # 12 2026-03-15 00:00:00
# # 13 2026-03-18 00:00:00

# result = db.orders.delete_many({"status": "new", "order_date": {"$lt": datetime(2026, 3, 20)}})
# print(result.deleted_count) # 2

