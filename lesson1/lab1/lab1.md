# Lab 1

## Install DB Browser for SQLite

1. Go to [sqlitebrowser.org/dl](https://sqlitebrowser.org/dl).
2. Download the version for your computer:
   - **Windows:** "DB Browser for SQLite – Standard installer for 64-bit Windows". Open the file and click Next until it's done. If the computer says you need admin rights, download the PortableApp version on the same page instead. It works without installing.
   - **Mac:** Download the `.dmg` file, open it, and drag DB Browser for SQLite into the Applications folder. The first time you start it, right-click the app and choose **Open**, then click **Open** again. A normal double-click gets blocked by macOS the first time.
   - **Linux:** Open a terminal and type:

     ```bash
     sudo apt install sqlitebrowser
     ```

3. Start the program. On Windows it's in the Start menu as **DB Browser (SQLite)**.

## Open `webshop.db`

1. Save the file first. Download `webshop.db` from where it was shared (Teams → Database channel) and save it in a folder you can find again, for example `Documents/SQL`. If it comes in a zip file, unzip it first.
2. In DB Browser, click **Open Database** in the toolbar at the top (or press `Ctrl+O`, Mac: `Cmd+O`).
3. Find `webshop.db`, select it, and click **Open**.
4. Check that it worked: click the **Database Structure** tab. You should see **Tables (2)** with `customers` and `products`.
5. Go to the **Execute SQL** tab to write your queries.

Next time: the file is in **File → Recent Files**, so you don't have to search for it again.

### If something goes wrong

- **You see no tables:** you probably opened the zip file or another file. Open the real `webshop.db` again.
- **Changes are gone when you reopen the file:** you forgot to save the data. Press `Ctrl+S` (**Write Changes**) after you change data.

## Lab 1

1. Show the first name and email of all customers. (10 rows)
2. Show all products in the Shoes category. (3 rows)
3. Which customers live in Uppsala? (3 rows)
4. Which product costs exactly 199 kr? (1 row)
5. Show all products sorted by name, A to Z. (12 rows)
6. Show all customers, the one who joined first at the top. (10 rows)
7. Which products are sold out (stock is 0)? (2 rows)
8. Show the 3 newest customers. (3 rows)
9. Show customers from Stockholm or Göteborg. Use `IN`. (4 rows)
10. Show product name and price, but call the columns `product` and `price_sek`. (12 rows)

### Bonus questions

1. Show products that are Clothing or Shoes and cost more than 1000 kr. Hint: you need brackets. Try without them too: why is the answer different? (3 rows)
2. For every product in stock, show name, price, stock and the total value of the stock (price × stock) as `stock_value`. Highest value first. (10 rows)
3. Which customers have a first name with exactly 4 letters? Hint: `_` in `LIKE` means "exactly one character". (4 rows)
4. Sort the products by price, cheapest first, and show only products number 6 to 10. Hint: look up `OFFSET`. (5 rows)
5. Show customers who joined before 2025 and don't live in Uppsala. Sort by city, and by last name within the same city. (4 rows)

### Extra challenges: SELECT

## Level 1

#### Exercise 1

Show products that are not Accessories, are in stock, and have a space in their name. Sort by
category, then by price from highest to lowest.
Expected: 6 rows

#### Exercise 2

Show customers who live in a city starting with S or M, plus customers with no city at all.
Expected: 4 rows

#### Exercise 3

Which Shoes product is the second most expensive? Show only that one.
Expected: 1 row

#### Exercise 4

Of the customers who joined in 2024 or 2025, show the 3 who joined most recently. Solve it
without BETWEEN and without >=.
Expected: 3 rows

## Level 2

Use the SQLite documentation: sqlite.org/lang_corefunc.html

#### Exercise 5

Show each customer's full name in one column called full_name (like "Anna Lindqvist"), sorted by
last name.
Look up: || · Expected: 10 rows

#### Exercise 6

Give every product a price level: budget under 200 kr, mid from 200 to 799 kr, premium from 800
kr.
Look up: CASE WHEN · Expected: 12 rows: 4 budget, 5 mid, 3 premium

#### Exercise 7

Show every customer's first name and city, but write Unknown instead of NULL.
Look up: COALESCE · Expected: 10 rows

#### Exercise 8

Which customers joined in the first half of a year (January to June), whatever the year?
Look up: strftime · Expected: 6 rows

##### Exercise 9

Which product has the longest name?
Look up: LENGTH · Expected: 1 row

#### Exercise 10

Show each customer's email username: the part before the @.
Look up: substr and instr · Expected: 10 rows

## Level 3

#### Exercise 11

Which products cost more than the average price? Don't type the average yourself: let SQL
calculate it inside the query.
Expected: 5 rows

#### Exercise 12

Make a price list with one column that says, for example, "Socks 3-pack costs 129 kr". Only
products in stock, cheapest first. Watch out: does it say 129 or 129.0? Fix it.
Expected: 10 rows

#### Exercise 13

How many customers live in each city? Biggest city first.
Look up: GROUP BY · Expected: 6 rows
