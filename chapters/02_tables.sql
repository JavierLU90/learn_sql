/* Creating a Table
To create a new table in a database, use the CREATE TABLE statement 
followed by the name of the table and the fields you want in the table.*/

CREATE TABLE employees (id INTEGER, name TEXT, age INTEGER, is_manager BOOLEAN, salary INTEGER);

/* Each field name is followed by its datatype. 
We'll get to data types in a minute.

It's also acceptable and common to break up the CREATE TABLE statement with some whitespace like this:*/

CREATE TABLE employees(
    id INTEGER,
    name TEXT,
    age INTEGER,
    is_manager BOOLEAN,
    salary INTEGER
);

/* Altering Tables:
We often need to alter our database schema without deleting it and re-creating it. 
Imagine if Twitter deleted its database each time it needed to add a feature, 
that would be a disaster! Your account and all your tweets would be wiped out on a daily basis.

Instead, we can use the ALTER TABLE statement to make changes in place without deleting any data.

ALTER TABLE: 
With SQLite an ALTER TABLE statement allows you to: */

-- 1. Rename a Table or Column:
ALTER TABLE employees
RENAME TO contractors;

ALTER TABLE contractors
RENAME COLUMN salary TO invoice;

-- 2. Add or DROP a Column
ALTER TABLE contractors
ADD COLUMN job_title TEXT;

ALTER TABLE contractors
DROP COLUMN is_manager;

/* SQLite Data Types
Let's go over the data types supported by SQLite: and how they are stored.

    NULL - Null value.
    INTEGER - A signed integer stored in 0,1,2,3,4,6, or 8 bytes.
    REAL - Floating point value stored as an 64-bit IEEE floating point number.
    TEXT - Text string stored using database encoding such as UTF-8
    BLOB - Short for Binary large object and typically used for images, audio or other multimedia.
    BOOLEAN - Boolean values are written in SQLite queries as true or false, but are recorded as 1 or 0.*/

