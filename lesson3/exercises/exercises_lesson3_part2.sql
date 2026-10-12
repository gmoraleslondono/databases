-- Designing a good database

-- 10. Look at this table: student | phone_numbers | course1 | course2 | course3. List every problem you can find.
-- Solution:
-- Problem 1: phone_numbers is a list, not a single value
-- Problem 2: primary is not clear. If student is a name, could be dangerous because people can have the same name

-- 11. In order_sheet, which normal form does the products column break? How would you fix it?
-- Solution: 1NF: one value per cell
-- we should create a middle table: order_items

-- 12. A table has: order_id | customer_id | customer_email | order_date. Which column is in the wrong place? Why?
-- Solution: The customer_email is in the wrong place. It should be in the customers table. the email is a detail of the customer.

-- 13. Music school (in pairs): 'Students take lessons from teachers. A lesson has a date, time, room and
-- instrument. One teacher can teach many instruments.' Underline the things.
-- Solution: students, teachers, lessons, instruments

--TODO:
-- 14. Find the relationships in the music school. Which are 1:N and which are N:M?
-- Solution:

-- 15. Draw the ER diagram for the music school.

-- 16. Write the CREATE TABLE statements for the music school in a new file music.db.
-- Database: create a new file. Click New Database, name it music.db, and click Cancel in the 'Edit
-- table definition' window. Don't create these tables in webshop.db
