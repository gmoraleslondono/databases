# Day 2: Exercises

## Exercise 1

Create a table `books` with:

- `book_id` (primary key)
- `title` (must have a value)
- `author`
- `year` (whole number)

## Exercise 2

Add a rule to `books` so `year` must be greater than 1400.

Hint: `DROP` and `CREATE` again.

## Exercise 3

Add a column `isbn` to `books`. It should be `TEXT`.

## Exercise 4

Delete the `books` table.

## Exercise 5

Create a table `reviews`:

- `review_id`
- `product_id` (points to `products`)
- `rating` (1 to 5)
- `comment`

## Exercise 6

Test `reviews`: try to add a review with rating 6. What happens?

## Exercise 7

Test `reviews`: try to add a review for product 50. What happens?

## Exercise 8

On paper: draw the 4 webshop tables as boxes and draw arrows for each foreign key.

### Extra challenges: building tables

## Level 1

#### Exercise 1

Create a table `suppliers` with:

- `supplier_id` (primary key)
- `name` (must have a value and must be unique)
- `country` (Sweden if nothing is given)
- `email`

Expected: Runs without errors

#### Exercise 2

Add a supplier without giving a country. Then show all suppliers. What does the `country` column say?

Expected: 1 row, country is Sweden

#### Exercise 3

Try to add a second supplier with the same name, `Nordic Textiles`. What happens, and which rule stopped you?

Expected: An error

#### Exercise 4

Create a table `coupons` where the code itself (for example `'SUMMER20'`) is the primary key. `discount_percent` must be between 1 and 90, and `valid_until` must have a value. Then try to add a coupon with 95 percent off.

Expected: The table is created, the `INSERT` gives an error

## Level 2

Use the SQLite documentation: [sqlite.org/lang_createtable.html](https://sqlite.org/lang_createtable.html) and [sqlite.org/lang_altertable.html](https://sqlite.org/lang_altertable.html)

#### Exercise 5

Add a supplier without giving a `supplier_id`. Which id does it get? Why?

Look up: `INTEGER PRIMARY KEY` · Expected: 1 new row

#### Exercise 6

Rename the column `email` in `suppliers` to `contact_email`.

Look up: `ALTER TABLE ... RENAME COLUMN` · Expected: Runs without errors

#### Exercise 7

Show the columns of the `products` table using SQL, not the Database Structure tab.

Look up: `PRAGMA table_info` · Expected: 5 rows, one per column

#### Exercise 8

A product can come from many suppliers, and a supplier can deliver many products. Create the middle table `product_suppliers` with a purchase price that must be more than 0. The same pair can only appear once. Then try to connect product 1 to supplier 99.

Look up: `PRIMARY KEY` with two columns · Expected: The table is created, the `INSERT` gives an error

#### Exercise 9

Create a table `campaigns` with `name`, `start_date` and `end_date`. Add a rule that `end_date` can never be before `start_date`. Test it with a campaign that ends before it starts.

Look up: `CHECK` that compares two columns · Expected: The table is created, the `INSERT` gives an error

## Level 3

#### Exercise 10

Create a table `product_sizes` with an own id, `product_id` (points to `products`), `size` (only S, M, L or XL) and `stock` (0 if nothing is given). The same product can't have the same size twice. Test it by adding size M for product 1 twice.

Look up: `UNIQUE` on two columns · Expected: The first `INSERT` works, the second gives an error

#### Exercise 11

Create a table `employees` where each employee can have a manager, who is also an employee in the same table. The boss has no manager. Add the boss and two employees who report to the boss.

Look up: a foreign key that points to its own table · Expected: 3 rows

#### Exercise 12

Create two tables: `teams` and `players`, where a player belongs to a team. Make it so that when a team is deleted, its players are deleted automatically. Add one team with two players, delete the team, and check the `players` table.

Look up: `ON DELETE CASCADE` · Expected: 0 rows left in `players`
