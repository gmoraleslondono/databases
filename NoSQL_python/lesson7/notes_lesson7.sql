-- # Asking better questions
-- Query operation, arrays, sorting and changing documents

-- RECAP
-- MongoDB store data in collections of documents, with list band objects inside (JSON format)
-- every document has a unique _id field (primary key)
-- pymongo is how to talk from python to MongoDB
-- all filters are dictionaries: {"field": "value"}

-- What is a collection?
-- A collection is a group of documents, like a table in SQL

-- What does db.customer.find() gives you, and how do you see the documents?
-- db.customer.find() gives you a cursor object (kind of list), you can use a loop to iterate over the cursor and print each document.

-- Why does a misspelling field name give 0 result instead of an error?
-- Mongo DB is flexible and case sensitive, so if you misspell a field name, it will look for the field if it doesn't found it, it will return 0 results.


-- COMPARISON OPERATORS

-- $eq: equal to,    ->    =
-- $ne: not equal to,     ->    <>
-- $gt: greater than,    ->    >
-- $gte: greater than or equal to,     ->    >=
-- $lt: less than,     ->    <
-- $lte: less than or equal to,     ->    <=
-- $in: in a list of values     ->    IN
-- $nin: not in a list of values     ->    NOT IN


-- Example:
{"price": {"$lt": 500}} -- find all products with price less than 500
{"category": {"$in": ["Shoes", "Clothing"]}} -- find all products in category Shoes or Clothing
{"stock": {"$ne": 0}} -- find all products with stock not equal to 0


--AND and OR

-- AND
{"category": "Shoes", "price": {"$lt": 500}} -- find all products in category Shoes AND price less than 500

-- OR
{"$OR": [{"category": "Shoes"}, {"stock": 0}]} -- find all products in category Shoes OR stock equal to 0


-- Dot notation
-- Use dot notation to reach fields inside an object. The whole name needs quotes
-- Example:
{"details.color": "black"} -- find all products with details color black


-- Searching in an array
-- Examples:
{"tags": "winter"} -- find all products with tags array containing winter
{"tags": {"$all": ["winter", "clothes"]}} -- find all products with tags array containing both winter AND clothes
{"tags": {"$in": ["winter", "summer"]}} -- find all products with tags array containing winter OR summer
{"tags": {"$size": 3}} -- find all products with tags array containing exactly 3 elements
{"size": 44} -- find all products with size 44 in details object


-- Field exist?
{"phone": {"$exists": true}} -- find all products with phone field
{"city": {"$exists": false}} -- find all products without city field
{"city": None} -- find all products with city field equal to null or missing the field


-- Projection
-- Use projection to show only the fields you want to see. 1 = show, 0 = hide
-- _id is always include unless you explicitly hide it "_id": 0
-- Example:
db.products.find({}, {"name": 1, "price": 1, "_id": 0}) -- find all products and show only name and price fields, hide _id field


--Sort, limit and skip
-- Sort the results by a field, 1 = ascending, -1 = descending
-- Example:
db.products.find().sort("name", 1) -- find all products and sort by name A-Z
db.products.find().sort("price", -1) -- find all products and sort by price highest to lowest
db.products.find().sort("price", -1).limit(3) -- find all products, sort by price and show only 3 most expensive products
db.products.find().sort("price", 1).skip(5).limit(5) -- find all products, sort by price, skip the first 5 results and show only the next 5 results


-- Counting and distinct values

db.products.count_documents({"stock": 0}) -- count all products with stock equal to 0 -- 2
db.products.distinct("category") -- find all distinct values in category field -- ['Clothing', 'Accessories', 'Shoes']


-- Changing documents
-- 1. filter which documents to change
-- 2. use $set to change the value of a field, or $unset to remove a field, or $inc to increment a field by a value
-- 3. use update_one() to change one document, or update_many() to change many documents
-- 4. result.matched_count gives how many documents matched the filter, result.modified_count gives how many documents were actually changed

-- Example:
db.products.update_one({"_id": 10}, {"$set": {"price": 299}}) -- change the price of product with _id 10 to 299
db.products.update_many({"category": "Shoes"}, {"$set": {"on_sale": True}}) -- change the on_sale field to True for all products in category Shoes


-- Update operators
-- $set: set the value of a field(adds the field if missing) {"$set": {"price": 299}}
-- $unset: remove a field {"$unset": {"phone": ""}}
-- $inc: increment/ decrement a field by a value {"$inc": {"stock": 5}} / {"$inc": {"stock": -5}}
-- $push: add a value to an array {"$push": {"tags": "new"}}
-- $pull: remove a value from an array {"$pull": {"tags": "old"}}
-- $addToSet: add a value to an array only if it doesn't exist {"$addToSet": {"tags": "sale"}}


-- NO REVERT BUTTON
-- 1. Always make a backup of your database before changing documents
-- 2. Use find() to check which documents will be changed before using update_one() OR count_documents() to check how many documents will be changed
-- 3. Use update_one() to change one document at a time, and check the result.matched_count and result.modified_count
-- Empty filter will apply changes to all elements in the collection, so be careful with that
-- Example: db.orders.delete_many({}) -- delete all documents in the orders collection



-- Upsert: update or insert
-- Found? Update the document
-- Not found? Insert a new document with the filter and update values
-- Example:
db.customers.update_one({"email": "john.doe@example.com"}, {"$set": {"first_name": "John", "city": "Lund"}}, upsert=True)



-- Deleting
-- delete_one() deletes the first document that matches the filter
-- delete_many() deletes all documents that match the filter
-- Example:
db.products.delete_one({"_id": 10}) -- delete the product with _id
db.products.delete_many({"category": "Shoes"}) -- delete all products in the Shoes category

-- how to check
print(db.products.count_documents({"category": "Shoes"})) -- check how many products are in the Shoes category
result = db.products.delete_many({"category": "Shoes"})
print(result.deleted_count) -- how many documents were deleted

