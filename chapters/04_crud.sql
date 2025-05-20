-- CRUD
/* CRUD is an acronym that stands for CREATE, READ, UPDATE, and DELETE. 
These four operations are the bread and butter of nearly every database you will create.

HTTP and CRUD
The CRUD operations correlate nicely with the HTTP methods we learned in the Learn HTTP Clients course.
    HTTP POST - CREATE
    HTTP GET - READ
    HTTP PUT - UPDATE
    HTTP DELETE - DELETE
*/


/* Insert Statement
Tables are pretty useless without data in them! 
In SQL we can add records to a table using an INSERT INTO statement. 
hen using an INSERT statement we must first specify the table we are inserting the record into, 
followed by the fields within that table we want to add VALUES to.

Example INSERT INTO statement:*/
INSERT INTO employees(id, name, title)
VALUES (1, 'Allan', 'Engineer');

/* Auto Increment
Many dialects of SQL support an AUTO INCREMENT feature. 
When inserting records into a table with AUTO INCREMENT enabled, 
the database will assign the next value automatically. 
In SQLite an integer id field that has the PRIMARY KEY constraint will auto increment by default!

Id's
Depending on how your database is set up, you may be using traditional ids or you may be using UUIDs. 
SQL doesn't support auto incrementing a uuid so if your database is using them 
your server will have to handle the changing uuid's for each record.

Using AUTO INCREMENT in SQLite
We are using traditional ids in our database, so we can take advantage of the auto increment feature. 
Different dialects of SQL will implement this feature differently, 
but in SQLite any column that has the INTEGER PRIMARY KEY constraint will auto increment! 
So we can omit the id field within the INSERT statement and allow the database 
to automatically add that field for us!
*/


/* Count
We can use a SELECT statement to get a count of the records within a table. 
This can be very useful when we need to know how many records there are, 
but we don't particularly care what's in them.

Here's an example in SQLite:*/
SELECT COUNT(*) FROM employees;
-- The * in this case refers to a column name. We don't care about the count of a specific column - 
-- we want to know the number of total records so we can use the wildcard (*).


/* WHERE Clause
In order to keep learning about CRUD operations in SQL, 
we need to learn how to make the instructions we send to the database more specific. 
SQL accepts a WHERE statement within a query that allows us to be very specific with our instructions.

If we were unable to specify the record we wanted to 
READ, UPDATE, or DELETE making queries to a database would be very frustrating, and very inefficient.

Using a WHERE Clause
Say we had over 9000 records in our users table. 
We often want to look at specific user data within that table without retrieving all the other records in the table. 
We can use a SELECT statement followed by a WHERE clause to specify which records to retrieve. 
The SELECT statement stays the same, we just add the WHERE clause to the end of the SELECT. 
Here's an example:*/
SELECT name FROM users WHERE power_level >= 9000;
-- This will select only the name field of any user within the users table WHERE the power_level field is greater than or equal to 9000.


/* Finding NULL Values
You can use a WHERE clause to filter values by whether or not they're NULL.*/
-- Is Null:
SELECT name FROM users WHERE first_name IS NULL;
-- Is not Null:
SELECT name FROM users WHERE first_name IS NOT NULL;


/* DELETE Statement
A DELETE statement removes all records from a table that match the WHERE clause. As an example:*/
DELETE FROM employees
    WHERE id = 251;
-- This DELETE statement removes all records from the employees table that have an id of 251!


/* Update Statement
The UPDATE statement in SQL allows us to update the fields of a record. 
We can even update many records depending on how we write the statement.

An UPDATE statement specifies the table that needs to be updated, 
followed by the fields and their new values by using the SET keyword. 
Lastly a WHERE clause indicates the record(s) to update.*/
UPDATE employees
SET job_title = 'Backend Engineer', salary = 150000
WHERE id = 251;
