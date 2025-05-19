/* SQL Select Statement
Let's write our own SQL statement from scratch! 
A SELECT statement is the most common operation in SQL - often called a "query". 
SELECT retrieves data from one or more tables. 
Standard SELECT statements do not alter the state of the database.*/

SELECT id FROM users;

-- Select a Single Field
-- A SELECT statement begins with the keyword SELECT followed by the fields you want to retrieve.

SELECT id FROM users;

-- Select Multiple Fields
-- If you want to select more than one field you can specify multiple fields separated by commas.

SELECT id, name FROM users;

-- Select All Fields
-- If you want to select every field in a record you can use the shorthand * syntax.

SELECT * FROM users;

/* After specifying fields, you need to indicate which table you want to pull the records from 
using the FROM statement followed by the name of the table. 
We'll talk more about tables later, but for now, you can think about them like structs or objects. 
For example, the users table might have 3 fields:
    id
    name
    balance
And finally, all statements end with a semi-colon ;.*/
