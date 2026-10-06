-- 1. Create a table books with: book_id (primary key), title (must have a value), author, year (whole number).

CREATE TABLE books(
	book_id INTEGER PRIMARY KEY,
	title TEXT NOT NULL,
	author TEXT,
	year INTEGER
);

-- 2. Add a rule to books so year must be greater than 1400. (Hint: DROP and CREATE again.)
DROP TABLE books;

CREATE TABLE books(
	book_id INTEGER PRIMARY KEY,
	title TEXT NOT NULL,
	author TEXT,
	year INTEGER CHECK (year > 1400)
);

-- 3. Add a column isbn to books. It should be TEXT.
ALTER TABLE books ADD COLUMN isbn TEXT;

-- 4. Delete the books table.
DROP TABLE books;

-- 5. Create a table reviews: review_id, product_id (points to products), rating (1 to 5), comment.
CREATE TABLE reviews(
	review_id INTEGER PRIMARY KEY,
	product_id INTEGER NOT NULL,
	rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
	comment TEXT,
	FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- 6. Test reviews: try to add a review with rating 6. What happens?
INSERT INTO reviews VALUES(1, 1, 6, 'Extremelly good!');

-- Got an error -> since rating has a check it only accept values between 1 and 5.

-- Execution finished with errors.
-- Result: CHECK constraint failed: rating >= 1 AND rating <= 5
-- At line 36:
-- INSERT INTO reviews VALUES(1, 1, 6, 'Extremelly good!');

-- 7. Test reviews: try to add a review for product 50. What happens?
INSERT INTO reviews VALUES(1, 50, 1, 'Bad :(');

-- Got an error -> since product with product_id 50 doesn't exist.

-- Execution finished with errors.
-- Result: FOREIGN KEY constraint failed
-- At line 46:
-- INSERT INTO reviews VALUES(1, 50, 1, 'Bad :(');


-- testing with existing and correct data.
INSERT INTO reviews VALUES (1, 1, 3, 'Good');




