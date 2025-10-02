# sqlite_practice
This repository contains a collection of SQLite exercises accompanied by my personal solutions. the exercises are designed to help improve SQL query writing and database management skills using SQLite.

All exercises are originally sourced from the [wikibooks](https://en.wikibooks.org/wiki/SQL_Exercises), where the challenges were curated for learning and practice purposes. This repo contains my own solutions for each exercise to aid with understanding and self-study.


# SQL tutorial

## SQL Commands:

```sql
CREATE, SELECT, INSERT, UPDATE, DELETE, DROP
```

### DDL - Data Definition Language:

**```CREATE```** Creates a new table, a view of a table, or other object in database.

**```ALTER```** Modifies an existing database object, such as a table.

**```DROP```** Deletes an entire table, a view of a table or other object in the database.

### DML - Data Manipulation Language:

**```INSERT```** Creates a record.

**```UPDATE```** Modifies records.

**```DELETE```** Deletes records.

### DCL - Data Control Language:

**```GRANT```** Gives a privilege to user.

**```REVOKE```** Takes back privileges granted from user.

### DQL - Data Query Language:

**```SELECT```** Retrieves certain records from one or more tables.

## SQL Constraints:

-	```NOT NULL``` Constraint: Ensures that a column cannot have NULL value.
-	```DEFAULT``` Constraint: Provides a default value for a column when none is specified.
-	```UNIQUE``` Constraint: Ensures that all values in a column are different.
-	```PRIMARY Key```: Uniquely identified each rows/records in a database table.
-	```FOREIGN Key```: Uniquely identified a rows/records in any another database table.
-	```CHECK``` Constraint: The CHECK constraint ensures that all values in a column satisfy certain conditions.
-	```INDEX```: Used to create and retrieve data from the database very quickly.


#### Definition

```sql
CREATE TABLE CUMSTOMERS (
	ID INT NOT NULL,
	NAME VARCHAR(15) NOT NULL
)
```

#### 

## Data Normalization

### 1NF: First Normal Form

-	Define the data items required and place related data items in a table.
-	Ensure that there are no repeating groups of data.
-	Ensure that there is a primary key.

### 2NF: Second Normal Form

-	1NF must be met.
-	There must be no partial dependences of any of the columns on the primary key.

### 3NF: Third Normal Form

-	2NF must be met.
-	All nonprimary fields are dependent on the primary key.

## SQL syntax

### SQL SELECT Statement:

```sql
SELECT column1, column2....columnN
FROM table_name;
```

### SQL DISTINCT Clause:

```sql
SELECT DISTINCT column1, column2....columnN
FROM table_name;
```

### SQL WHERE Clause:

```sql
SELECT column1, column2....columnN
FROM table_name
WHERE CONDITION;
```

### SQL AND/OR Clause:

```sql
SELECT column1, column2....columnN
FROM table_name
WHERE CONDITION-1 {AND|OR} CONDITION-2;
```

### SQL IN Clause:

```sql
SELECT column1, column2....columnN
FROM table_name
WHERE column_name IN (val-1, val-2,...val-N);
```

### SQL BETWEEN Clause:

```sql
SELECT column1, column2....columnN
FROM table_name
WHERE column_name BETWEEN val-1 AND val-2;
```

### SQL LIKE Clause:

```sql
SELECT column1, column2....columnN
FROM table_name
WHERE column_name LIKE { PATTERN };
```

### SQL ORDER BY Clause:

```sql
SELECT column1, column2....columnN
FROM table_name
WHERE CONDITION
ORDER BY column_name {ASC|DESC};
```

### SQL GROUP BY Clause:

```sql
SELECT SUM(column_name)
FROM table_name
WHERE CONDITION
GROUP BY column_name;
```

### SQL COUNT Clause:

```sql
SELECT COUNT(column_name)
FROM table_name
WHERE CONDITION;
```

### SQL HAVING Clause:

```sql
SELECT SUM(column_name)
FROM table_name
WHERE CONDITION
GROUP BY column_name
HAVING (arithematic function condition);
```

### SQL CREATE TABLE Statement:

```sql
CREATE TABLE table_name(
column1 datatype,
column2 datatype,
column3 datatype,
.....
columnN datatype,
PRIMARY KEY( one or more columns )
);
```

### SQL DROP TABLE Statement:

```sql
DROP TABLE table_name;
```

### SQL CREATE INDEX Statement:

```sql
CREATE UNIQUE INDEX index_name
ON table_name ( column1, column2,...columnN);
```

### SQL DROP INDEX Statement:

```sql
ALTER TABLE table_name
DROP INDEX index_name;
```

### SQL DESC Statement:

```sql
DESC table_name;
```

### SQL TRUNCATE TABLE Statement:

```sql
TRUNCATE TABLE table_name;
```

### SQL ALTER TABLE Statement:

```sql
ALTER TABLE table_name {ADD|DROP|MODIFY} column_name {data_ype};
```

### SQL ALTER TABLE Statement (Rename):

```sql
ALTER TABLE table_name RENAME TO new_table_name;
```

### SQL INSERT INTO Statement:

```sql
INSERT INTO table_name( column1, column2....columnN)
VALUES ( value1, value2....valueN);
```

### SQL UPDATE Statement:

```sql
UPDATE table_name
SET column1 = value1, column2 = value2....columnN=valueN
[ WHERE CONDITION ];
```

### SQL DELETE Statement:

```sql
DELETE FROM table_name
WHERE {CONDITION};
```

### SQL CREATE DATABASE Statement:

```sql
CREATE DATABASE database_name;
```

### SQL DROP DATABASE Statement:

```sql
DROP DATABASE database_name;
```

### SQL USE Statement:

```sql
USE DATABASE database_name;
```

### SQL COMMIT Statement:

```sql
COMMIT;
```

### SQL ROLLBACK Statement:

```sql
ROLLBACK;
```
