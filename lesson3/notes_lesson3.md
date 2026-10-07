# Lesson 3

## CRUD

CRUD means Create, Read, Update, Delete.

In databases the CRUD operations are `SELECT`, `INSERT`, `UPDATE`, and `DELETE`.

### `SELECT`

Retrieves data from a table.

```sql
SELECT * FROM products WHERE stock = 0;
```

### `INSERT`

Adds a new row to a table.

```sql
INSERT INTO products (name, price)
VALUES ('Product 1', 100);
```

### `UPDATE`

Changes an existing row in a table.

```sql
UPDATE products
SET price = 100
WHERE product_id = 1;
```

### `DELETE`

Removes a row from a table.

```sql
DELETE FROM products
WHERE product_id = 1;
```

## Common mistakes

Forgetting `WHERE` on `UPDATE` or `DELETE` changes the whole table.

```sql
UPDATE products
SET price = 0;
-- Sets the price of all products to 0.

UPDATE products
SET price = 0
WHERE product_id = 1;
-- Sets the price of product 1 to 0.

DELETE FROM products;
-- Deletes all products from the table.

DELETE FROM products
WHERE product_id = 1;
-- Deletes product 1 from the table.
```

A safer way:

1. Check which rows you will hit.

   ```sql
   SELECT * FROM products WHERE stock = 0;
   ```

2. Use `WHERE` to change exactly those rows.

   ```sql
   UPDATE products SET stock = 10 WHERE stock = 0;
   ```

## Transactions

A transaction is a sequence of operations executed as a single unit.

- **`COMMIT`** saves the changes.
- **`ROLLBACK`** undoes them.

## Why design matters

Each fact is stored in exactly one place.

Problems from a bad design:

- You can find things, but it takes forever.
- Data gets duplicated.
- Updates go wrong.
- Deletes go wrong.
- Accountability is lost.

## Relationships

| Relationship | Meaning | How to store it |
| --- | --- | --- |
| **1:1** | One person, one passport | A foreign key, or the same key in both tables |
| **1:N** | One customer, many orders. One order has one customer | A foreign key on the "many" side |
| **N:N** | Many orders, many products | A middle table |

### N:N example

You can't put a list of products in one cell. Each product in an order needs its own row, so the middle table is `order_items`. Each row is one product in one order.

| `order_id` | `product_id` | `quantity` |
| --- | --- | --- |
| 1 | 1 | 1 |
| 1 | 2 | 1 |
| 2 | 1 | 1 |
| 2 | 3 | 1 |

```text
orders 1---N order_items N---1 products
```

## ER diagram

An ER diagram is a map of the database.

- **Boxes** are tables.
- **Lines** are relationships.
- Mark each line as 1:1, 1:N, or N:M.

```text
customer 1---N orders 1---N order_items N---1 products
```

## Normalization

Tidying in three steps. Each step removes one kind of problem.

1. **1NF** — one value per cell. No lists or arrays. Every row has a primary key.
2. **2NF** — applies when the key has two columns. Example: the `order_items` key is `(order_id, product_id)`.
3. **3NF** — a column must depend on the key, not on another normal column. If changing X means changing many rows, that column is probably in the wrong table.

Every column must depend on the key, the whole key, and nothing but the key.

## From words to tables

1. Read the description and underline the nouns.
2. Each important noun becomes a table.
3. Its details become columns. Pick a primary key.
4. Draw the relationships.
5. Find the N:N relationships and make a middle table.
6. Draw the ER diagram.
7. Write the `CREATE TABLE` statements.

## Example of a good design

A library lends books to members. A member can borrow many books. A book can be borrowed many times, but only by one member at a time. We want to know when a book was borrowed, and when it was returned.

```text
members 1---N loans N---1 books
```

```sql
CREATE TABLE members (
    member_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE
);

CREATE TABLE books (
    book_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    author TEXT,
    year INTEGER
);

CREATE TABLE loans (
    loan_id INTEGER PRIMARY KEY,
    member_id INTEGER NOT NULL,
    book_id INTEGER NOT NULL,
    loan_date TEXT NOT NULL,
    return_date TEXT,
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

INSERT INTO members
VALUES (1, 'Leo', 'leo@gmail.com'), (2, 'Mira', 'mira@gmail.com');

INSERT INTO books
VALUES (1, 'The Hobbit', 'JRR Anderson', 1950), (2, 'Matilda', 'Mel Gibson', 1989);

INSERT INTO loans
VALUES
    (1, 1, 2, '2026-10-01', '2026-10-06'),
    (2, 2, 2, '2026-10-07', NULL),
    (3, 1, 1, '2026-10-08', NULL);

SELECT * FROM loans WHERE return_date IS NULL;
```
