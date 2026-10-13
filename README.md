# Databases

Course notes and exercises for SQL and NoSQL, using a small webshop of customers, products, and orders.

SQL work uses SQLite (`webshop.db`) in [DB Browser for SQLite](https://sqlitebrowser.org/). Later lessons use Python (`sqlite3` and `pymongo`) against the same shop.

## Layout

| Path | Contents |
| --- | --- |
| `lesson1/`–`lesson4/` | SQL notes, labs, and exercises: filters, tables, CRUD, and joins |
| `SQL_python/` | Connecting Python to SQLite, plus a small shop menu (`shop.py`) |
| `NoSQL_python/` | MongoDB notes and exercises with `pymongo` |
| `webshop.db` | Sample SQLite database |
| `webshop_reset.sql` | Rebuilds the webshop tables |

## Setup

- **SQL:** open `webshop.db` in DB Browser and run the `.sql` files from the Execute SQL tab.
- **Python + SQLite:** run scripts from `SQL_python/` with `webshop.db` in the working directory. Close the file in DB Browser first so SQLite is not locked.
- **MongoDB:** a local server on `mongodb://localhost:27017/`. Run `python NoSQL_python/webshop.py` to create or reset the `webshop` database, then work through `exercises_NoSQL_python.py`.
