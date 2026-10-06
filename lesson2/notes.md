# Lesson 2

## Create tables: `CREATE TABLE`

Choose an appropriate data type for each column.

| Column | Type | Why |
| --- | --- | --- |
| `age` | `INTEGER` | Whole numbers |
| `price` | `REAL` | Decimal numbers |
| `name`, `email` | `TEXT` | Strings of characters |
| `date` | `TEXT` | Stored as `YYYY-MM-DD` |
| phone number | `TEXT` | You don't do calculations with it |

## Rules

- **`PRIMARY KEY`** — unique and not null
- **`FOREIGN KEY`** — points to the primary key of another table
- **`UNIQUE`** — unique value for the column
- **`NOT NULL`** — the column must have a value
- **`CHECK`** — the value must pass a condition
- **`DEFAULT`** — the value used when none is given

## Connect tables with foreign keys

A foreign key in one table points to the primary key of another table.

## Change tables: `ALTER TABLE`

## Delete tables: `DROP TABLE`

## SQL families

- **DDL** (Data Definition Language) — `CREATE`, `DROP`, `ALTER`. Macro manipulation of the database.
- **DML** (Data Manipulation Language) — `INSERT`, `UPDATE`, `DELETE`. Micro manipulation of the database.

## Constraints

Rules that apply to the columns.

- **`PRIMARY KEY`** — unique ID for each row
- **`NOT NULL`** — must have a value
- **`UNIQUE`** — no two rows can be the same
- **`CHECK`** — value must pass a test
- **`DEFAULT`** — value used if you give none

### Example

```sql
CREATE TABLE members (
    member_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE,
    age INTEGER CHECK (age >= 0),
    membership_start_date TEXT DEFAULT (DATE('now')),
    level TEXT DEFAULT 'beginner'
);
```
