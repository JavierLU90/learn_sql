-- PERFORMANCE

/* SQL Indexes
An index is an in-memory structure that ensures that queries we run on a database are performant, 
that is to say, they run quickly. 
If you can remember back to the data structures course, 
most database indexes are just binary trees or B-trees! 
The binary tree can be stored in ram as well as on disk, 
and it makes it easy to lookup the location of an entire row.

PRIMARY KEY columns are indexed by default, ensuring you can look up a row by its id very quickly. 
However, if you have other columns that you want to be able to do quick lookups on, 
you'll need to index them.

CREATE INDEX*/
CREATE INDEX index_name ON table_name (column_name);
-- It's fairly common to name an index after the column it's created on with a suffix of _idx.


/* Multi-Column Indexes
Multi-column indexes are useful for the exact reason you might think - 
they speed up lookups that depend on multiple columns.

CREATE INDEX*/
CREATE INDEX first_name_last_name_age_idx
ON users (first_name, last_name, age);
/* A multi-column index is sorted by the first column first, the second column next, and so forth. 
A lookup on only the first column in a multi-column index gets almost all of the performance improvements that it would get from its own single-column index. 
However, lookups on only the second or third column will have very degraded performance.

Rule of Thumb
Unless you have specific reasons to do something special, 
only add multi-column indexes if you're doing frequent lookups on a specific combination of columns.*/
