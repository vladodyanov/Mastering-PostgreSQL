# Mastering-PostgreSQL
Welcome to the Mastering-PostgreSQL repository! This repository is designed to be a comprehensive resource for learning and mastering PostgreSQL. Here, you'll find a collection of theory, commands, and SQL files to help you understand and effectively use PostgreSQL for your database needs.
Contents:
Theory: Detailed explanations and theoretical concepts about PostgreSQL, including its architecture, data types, indexing, and more.
Commands: A curated list of essential PostgreSQL commands for database management, querying, and optimization.
SQL Files: Practical SQL scripts and examples to demonstrate various features and capabilities of PostgreSQL.


## Table of Contents
* [Databases Introduction](#databases-introduction)
  
# Databases Introduction.
It's one thing to just store data; it's another to manage it effectively.
The Problem with Flat Storage (Files):
-Size
-Update Complexity
-Accuracy
-Access Control
- What is a DBMS?
Database Management System
A system optimized for searching and processing data.
We don't have direct access to the files; the DBMS manages this.
We send a query to the engine, the engine processes the query, retrieves from the files, and returns the results to us.
Operates over the TCP/IP protocol, even on the local machine.
RDBMS - Data and Engine
Relational Database Management System.
SQL/NoSQL:
Use SQL when scaling vertically (upgrading the machine).
Use NoSQL when scaling horizontally (adding new machines).
The idea of SQL syntax is to resemble a sentence.
Parts of a Query
Queries: ALTER TABLE, ALTER COLUMN, SELECT...
Clauses: update/delete, etc.
Expressions: salary * 1.1
Predicates: job_title = "Cashier"
Statements: Update Set Where, the entire expression
Logical Division into Four Categories
Data Definition: Describes what our data is, how it looks, how it is linked, and what our schema will look like.
Data Manipulation: READ/CREATE/UPDATE/DELETE
Data Control: Control over rights or who has access to the data.
Transaction Control: Whether to execute queries as a group, meaning either all or none are executed.
Why We Need Relations
Provides abstraction, flexibility, and avoids data duplication.
No empty records (though sometimes they are okay, e.g., middle names).
Keys
Primary Key: Always unique.
Foreign Key
Entity/Relation Diagram
Visualize the schemas and relationships between tables.
Data Types
INT: small/int/big
DECIMAL/NUMERIC: Allows specification of precision after the decimal point.
REAL: Less precision than double.
DOUBLE
SERIAL: Creates a script to increment the number for each new record, with an option to manually provide a value.
GENERATED ALWAYS AS IDENTITY: Creates a script to increment the number without allowing manual value input.
CHAR (255 symbols)
VARCHAR (65,535 symbols)
TEXT (65,535 symbols)
BLOB
DATE: Date without time - YYYY-MM-DD
TIME: Time without date
TIMESTAMP: Date and time
TIMESTAMPZ: Date, time, and time zone
Bonus: Indexes - Two Types
Use them when frequently searching by one field.
Clustered: Grouped in some way, often using the primary key.
Non-Clustered: Index on any field with links to the actual data.
CRUD - Create, Read, Update, Delete
Retrieve data with SELECT - READ

Filter with WHERE
sql
Copy code
SELECT * FROM project WHERE start_date='2023-06-01';
Sort data with ORDER BY
sql
Copy code
SELECT * FROM project ORDER BY id;
ORDER BY first_name DESC, last_name ASC;
SELECT id AS 'No.' ...;
Alias with AS
sql
Copy code
SELECT e.id FROM employees AS e;
Concatenate with CONCAT()
sql
Copy code
SELECT CONCAT(first_name, ' ', second_name) AS full_name ...;
Concatenate skipping NULL values with CONCAT_WS()
Eliminate duplicates with SELECT DISTINCT
Conditions with WHERE; WHERE id NOT IN ...; WHERE id = 1 OR/AND ...; WHERE id IN (1, 2, 3);
NULL handling with WHERE id IS NULL; Incorrect: WHERE id = NULL;
Limit rows with LIMIT
sql
Copy code
LIMIT 3;
Skip rows with OFFSET
sql
Copy code
OFFSET 3 LIMIT 1;
Create table from another table's fields without data
sql
Copy code
CREATE TABLE customer_contacts AS SELECT customer_id, first_name FROM customers;
BETWEEN for ranges
sql
Copy code
BETWEEN 1 AND 3;
Projection
1.1 Projection - Which columns to select.
1.2 Selection - Selecting rows, often achieved with WHERE.
1.3 Join - Combining columns.

Updating Data with UPDATE
Usually, update with a condition in 99% of cases.
sql
Copy code
UPDATE projects SET end_date = '2006-02-02' WHERE start_date = '2005-01-01';
Inserting Data with INSERT
Current time with NOW()
sql
Copy code
INSERT INTO projects(name, start_date) SELECT CONCAT(name, ' ', last_name), NOW() FROM departments;
Deleting Data with DELETE
sql
Copy code
DELETE FROM projects WHERE start_date = '2006-01-01';
Views
Save selection queries
sql
Copy code
CREATE VIEW v_hr_result_set AS SELECT CONCAT(first_name, ' ', last_name) AS 'full name', salary FROM employees ORDER BY department_id;
SELECT * FROM v_hr_result_set;
Alter views with ALTER VIEW
Built-in Functions
String Functions: SUBSTRING, REPLACE, LTRIM, RTRIM, CHAR_LENGTH, LENGTH, BIT_LENGTH, LEFT, RIGHT, LOWER, UPPER, REVERSE, REPEAT, INSERT, POSITION.
Math Functions: /, -, *, +, ABS, PI, SQRT, POW, ROUND, FLOOR, CEIL, SIGN, RANDOM.
Date Functions: EXTRACT, AGE, TO_CHAR.
Wildcards
LIKE() for pattern matching.
% for zero or more characters.
_ for a single character.
Data Aggregation
Grouping: Treating identical records as one.
GROUP BY allows using aggregate functions.
COUNT(DISTINCT()) for group count.
COUNT(*) for row count.
Aggregate Functions: AVG, MIN, MAX, COUNT, SUM.
HAVING for additional filtering using aggregate functions.
CASE Statements
Simple Case for comparing one value.
sql
Copy code
SELECT column_name,
    CASE grade
        WHEN 'A' THEN 'Excellent'
        WHEN 'B' THEN 'Good'
        WHEN 'C' THEN 'Fair'
        ELSE 'Poor'
    END AS grade_description
FROM student_grades;
General Case for comparing different conditions.
sql
Copy code
SELECT column_name,
    CASE 
        WHEN grade >= 90 THEN 'Excellent'
        WHEN grade >= 80 THEN 'Good'
        WHEN grade >= 70 THEN 'Fair'
        WHEN grade <= 0 THEN 'Mistake'
        ELSE 'Poor'
    END AS grade_description
FROM student_grades;
Edge Cases to Keep in Mind
COUNT() counts everything except NULL.
WHERE is executed before returning data, like an if statement, grouping, and then HAVING.
Table Relations
Entities: Steps in DB Design:
1.1 Define objects (each table represents an object).
1.2 Create columns.
1.3 Define primary keys (PK).
1.4 Define relations (Many to One, Many to Many via junction/mapping table, One to One).
1.5 Define constraints.
1.6 Populate with test data.
Cascade Delete
Deleting a record also deletes all related records to maintain data consistency.
Indexes
Indexing a table creates a structure over it for faster searching.
Clustered: Sorts values for binary search.
Non-clustered: B-Tree (Balanced Tree), unique nodes with pointers to records.
Database Programmability
Functions: Similar to views, written in different languages like Python, Pascal, plpgsql.

STABLE: Returns the same result for the same table, e.g., row count.
IMMUTABLE: Always returns the same result, e.g., square of a number.
VOLATILE: Default, variable functions.
Procedures: Usually void functions, executed by CALL.

Transactions
Actions on the database that can be rolled back if needed.
sql
Copy code
BEGIN;
UPDATE accounts SET balance = balance - 100 WHERE account_id = 1;
UPDATE accounts SET balance = balance + 100 WHERE account_id = 2;
DECLARE
    bob_balance DECIMAL(20,2);
BEGIN
    SELECT balance INTO bob_balance FROM accounts WHERE account_id = 2;
    IF bob_balance > 1000 THEN
        RAISE NOTICE 'Bob has too much money. Rolling back transaction.';
        ROLLBACK;
        RETURN;
    END IF;
END;
Savepoint Example
sql
Copy code
BEGIN;
UPDATE accounts SET balance = balance + 50 WHERE id = 1;
SAVEPOINT my_savepoint;
UPDATE accounts SET balance - 30 WHERE id = 1;
ROLLBACK TO SAVEPOINT my_savepoint;
END;
Triggers
Functions executed before/after a DELETE/UPDATE/INSERT query.
sql
Copy code
CREATE OR REPLACE FUNCTION update_last_modified()
RETURNS TRIGGER AS $$
BEGIN
    NEW.last_modified = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_last_modified
BEFORE UPDATE ON products
FOR EACH ROW EXECUTE FUNCTION update_last_modified();
*plpgsql - Procedural Language/PostgreSQL
