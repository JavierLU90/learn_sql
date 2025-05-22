-- NORMALIZATION

/* Table Relationships
Relational databases are powerful because of the relationships between the tables. 
These relationships help us to keep our databases clean and efficient. 
A relationship between tables assumes that one of these tables has a foreign key that references the primary key of another table.

Types of Relationships
There are 3 primary types of relationships in a relational database:
    One-to-one
    One-to-many
    Many-to-many

One-to-one
A one-to-one relationship most often manifests as a field or set of fields on a row in a table. 
For example, a user will have exactly one password.

Settings fields might be another example of a one-to-one relationship. 
A user will have exactly one email_preference and exactly one birthday.*/


/* One to Many
When talking about the relationships between tables, 
a one-to-many relationship is probably the most commonly used relationship.

A one-to-many relationship occurs when a single record in one table is related to potentially many records in another table.

The one->many relation only goes one way; 
a record in the second table can not be related to multiple records in the first table!

Examples of One-to-Many Relationships
    A customers table and an orders table. Each customer has 0, 1, or many orders that they've placed.
    A users table and a transactions table. Each user has 0, 1, or many transactions that they've taken part in.*/

CREATE TABLE customers (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE orders (
    id INTEGER PRIMARY KEY,
    amount INTEGER NOT NULL,
    customer_id INTEGER,
    CONSTRAINT fk_customers
    FOREIGN KEY (customer_id)
    REFERENCES customers(id)
);


/* Many to Many
A many-to-many relationship occurs when multiple records in one table can be related to multiple records in another table.

Examples of Many-To-Many Relationships
    A products table and a suppliers table - 
        Products may have 0 to many suppliers, and suppliers can supply 0 to many products.
    A classes table and a students table - 
        Students can take potentially many classes and classes can have many students enrolled.

Joining Table
Joining tables help define many-to-many relationships between data in a database. 
As an example when defining the relationship above between products and suppliers, 
we would define a joining table called products_suppliers that contains the primary keys from the tables to be joined.

Then, when we want to see if a supplier supplies a specific product, 
we can look in the joining table to see if the ids share a row.

Unique Constraint Across 2 Fields
When enforcing specific schema constraints we may need to enforce the UNIQUE constraint across two different fields.*/

CREATE TABLE product_suppliers (
  product_id INTEGER,
  supplier_id INTEGER,
  UNIQUE(product_id, supplier_id)
);
/* This lets multiple rows share the same product_id or supplier_id, 
but it prevents any two rows from having both the same product_id and supplier_id.*/


/* Database Normalization
Database normalization is a method for structuring your database schema in a way that helps:
    Improve data integrity
    Reduce data redundancy

What Is Data Integrity?
"Data integrity" refers to the accuracy and consistency of data. 
For example, if a user's age is stored in a database, rather than their birthday, 
that data becomes incorrect automatically with the passage of time.

It would be better to store a birthday and calculate the age as needed.

What Is Data Redundancy?
"Data redundancy" occurs when the same piece of data is stored in multiple places. 
For example: saving the same file multiple times to different hard drives.

Data redundancy can be problematic, especially when data in one place is changed such that 
the data is no longer consistent across all copies of that data.*/


/* Normal Forms
The creator of "database normalization", Edgar F. Codd described different "normal forms" a database can adhere to. We'll talk about the most common ones.
    First normal form (1NF)
    Second normal form (2NF)
    Third normal form (3NF)
    Boyce-Codd normal form (BCNF)

In short, 1st normal form is the least "normalized" form, and Boyce-Codd is the most "normalized" form.
The more normalized a database, the better its data integrity, and the less duplicate data you'll have.

In the Context of Normal Forms, “Primary Key” Means Something a Bit Different 
When we're talking about SQLite, a "primary key" is a single column that uniquely identifies a row.

When we're talking more generally about data normalization, 
the term "primary key" means the collection of columns that uniquely identify a row. 
That can be a single column, but it can actually be any number of columns that form a composite key. 
A primary key is the minimum number of columns needed to uniquely identify a row in a table.

If you think back to the many-to-many joining table product_suppliers, 
that table's "primary key" was actually a combination of the 2 ids, product_id and supplier_id:*/
CREATE TABLE product_suppliers (
    product_id INTEGER,
    supplier_id INTEGER,
    UNIQUE(product_id, supplier_id)
);
