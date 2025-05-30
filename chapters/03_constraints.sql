-- CONTRAINTS
/* Null Values
In SQL, a cell with a NULL value indicates that the value is missing. 
A NULL value is very different from a zero value.

Constraints:
When creating a table we can define whether or not a field can or cannot be NULL, 
and that's a kind of constraint.

A constraint is a rule we create on a database that enforces some specific behavior. 
For example, setting a NOT NULL constraint on a column ensures that the column will not accept NULL values.

If we try to insert a NULL value into a column with the NOT NULL constraint, 
the insert will fail with an error message. 
Constraints are extremely useful when we need to ensure that certain kinds of data exist within our database.

Defining a NOT NULL Constraint
The NOT NULL constraint can be added directly to the CREATE TABLE statement.*/

CREATE TABLE employees(
    id INTEGER PRIMARY KEY,
    name TEXT UNIQUE,
    -- The UNIQUE constraint ensures that no two rows can have the same value in the 'name' column
    title TEXT NOT NULL
    -- The NOT NULL constraint ensures that the 'title' column cannot have NULL values
);


/* Primary Keys
A key defines and protects relationships between tables. 
A primary key is a special column that uniquely identifies records within a table. 
Each table can have one, and only one primary key.

Your Primary Key Will Almost Always Be the “id” Column
It's very common to have a column named id on each table in a database, 
and that id is the primary key for that table. 
No two rows in that table can share an id.

A PRIMARY KEY constraint can be explicitly specified on a column to ensure uniqueness, 
rejecting any inserts where you attempt to create a duplicate ID.*/


/* Foreign Keys
Foreign keys are what make relational databases relational! 
Foreign keys define the relationships between tables. 
Simply put, a FOREIGN KEY is a field in one table that references another table's PRIMARY KEY.

Creating a Foreign Key in SQLite
Creating a FOREIGN KEY in SQLite happens at table creation! 
After we define the table fields and constraints we add a named CONSTRAINT 
where we define the FOREIGN KEY column and its REFERENCES.*/

CREATE TABLE departments (
    id INTEGER PRIMARY KEY,
    department_name TEXT NOT NULL
);

CREATE TABLE employees (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    department_id INTEGER,
    CONSTRAINT fk_departments
    FOREIGN KEY (department_id)
    REFERENCES departments(id)
);
/* In this example, an employee has a department_id. 
The department_id must be the same as the id field of a record from the departments table. 
fk_departments is the specified name of the constraint.

    CONSTRAINT fk_departments: create a constraint called fk_departments
    FOREIGN KEY (department_id): make this constraint a foreign key assigned to the department_id field
    REFERENCES departments(id): link the foreign field id from the departments table
*/
