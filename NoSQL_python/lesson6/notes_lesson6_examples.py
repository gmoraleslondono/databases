from pymongo import MongoClient

client = MongoClient("mongodb://localhost:27017/")
db = client["webshop"]

# print(client.list_database_names())

# print(db.list_collection_names())

# for name in db.list_collection_names():
#     print(name, db[name].count_documents({}))


# FIND ONE
# product = db.products.find_one()
# print(product)


# FIND
# for customer in db.customers.find():
#     print(customer["first_name"], list(customer.keys()))


# INSERT
# from pprint import pprint

# result = db.products.insert_one({
#     "name": "Gloves",
#     "category": "Accessories",
#     "price": 199,
#     "stock": 20
# })

# print(result.inserted_id)
# pprint(db.products.find_one({"name": "Gloves"}), sort_dicts=False)


# DELETE
# from pprint import pprint

# result = db.products.delete_one({"name": "Gloves"})
# print("deleted count: ", result.deleted_count)
# pprint(db.products.count_documents({}))


# FIND ONE WITH CONDITION
# product = db.products.find_one({"name": "Beanie"})
# print(product["name"],"costs", product["price"], "kr")


# COUNT DOCUMENT
# print(db.products.count_documents({}))
# print(db.products.count_documents({"category": "Shoes"}))


# PRINT ALL CUSTOMERS
# print(db.customers.find()) # returns a cursor object

# for customer in db.customers.find():
#     print(customer["first_name"], customer["last_name"])


# COMPARING SQL TO PYTHON - FIND
# # SELECT first_name FROM customers WHERE CITY =  "Uppsala"
# for customer in db.customers.find({"city": "Uppsala"}):
#     print(customer["first_name"])

# # SELECT first_name FROM customers WHERE CITY =  "Uppsala"
# for customer in db.customers.find({"city": "Oppsala"}): # text is case sensitive
#     print(customer["first_name"])

# # SELECT first_name FROM customers WHERE CITY =  "Uppsala"
# for customer in db.customers.find({"citty": "Uppsala"}): # typo in the field name
#     print(customer["first_name"])
# # none with citty field, returns empty list

# # SELECT first_name FROM customers WHERE CITY =  "Uppsala"
# for customer in db.customers.find({city: "Uppsala"}): # forgot to wrap the field in ""
#     print(customer["first_name"])
# # will get error because city is field that should be wrapped in ""


# ERROR WHEN CUSTOMER HAS NOT A FIELD
# for customer in db.customers.find():
#     print(customer["first_name", customer["city"]])
# # will get error because some customers have no city field

# for customer in db.customers.find():
#     print(customer["first_name"], customer.get("city", "Unknown"))
# # will fill in Unknown for customers that have no city field


# INSERT ONE WITHOUT ID
# result = db.customers.insert_one({
#     "first_name": "Noah",
#     "last_name": "Svensson",
#     "email": "noah@gmail.com",
#     "city": "Enköping"
# })
# print(result.inserted_id)


# # INSERT MANY WITH ID
# result = db.products.insert_many([
#     {
#         "_id": 13,
#         "name": "Scarf",
#         "category": "Accessories",
#         "price": 299,
#         "stock": 15,
#         "tags": ["winter", "accessories"],
#         "details": {
#             "color": "red"
#         }
#     },
#     {
#         "_id": 14,
#         "name": "Gloves",
#         "category": "Accessories",
#         "price": 199,
#         "stock": 20,
#         "tags": ["winter", "accessories"],
#         "details": {
#             "color": "black"
#         }
#     }
# ])
# print(result.inserted_ids)
# print(db.products.count_documents({}))
