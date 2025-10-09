## build

```sql

CREATE TABLE Departments (
  Code INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  Budget decimal NOT NULL 
);

CREATE TABLE Employees (
  SSN INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  LastName varchar(255) NOT NULL ,
  Department INTEGER NOT NULL , 
  foreign key (department) references Departments(Code) 
);

INSERT INTO Departments(Code,Name,Budget) VALUES(14,'IT',65000);
INSERT INTO Departments(Code,Name,Budget) VALUES(37,'Accounting',15000);
INSERT INTO Departments(Code,Name,Budget) VALUES(59,'Human Resources',240000);
INSERT INTO Departments(Code,Name,Budget) VALUES(77,'Research',55000);

INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('123234877','Michael','Rogers',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('152934485','Anand','Manikutty',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('222364883','Carol','Smith',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('326587417','Joe','Stevens',37);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332154719','Mary-Anne','Foster',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('332569843','George','ODonnell',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('546523478','John','Doe',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('631231482','David','Smith',77);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('654873219','Zacary','Efron',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('745685214','Eric','Goldsmith',59);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657245','Elizabeth','Doe',14);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES('845657246','Kumar','Swamy',14);

```

## Questions

-	2.1 Select the last name of all employees.
-	2.2 Select the last name of all employees, without duplicates.
-	2.3 Select all the data of employees whose last name is "Smith".
-	2.4 Select all the data of employees whose last name is "Smith" or "Doe".
-	2.5 Select all the data of employees that work in department 14.
-	2.6 Select all the data of employees that work in department 37 or department 77.
-	2.7 Select all the data of employees whose last name begins with an "S".
-	2.8 Select the sum of all the departments' budgets.
-	2.9 Select the number of employees in each department (you only need to show the department code and the number of employees).
-	2.10 Select all the data of employees, including each employee's department's data.
-	2.11 Select the name and last name of each employee, along with the name and budget of the employee's department.
-	2.12 Select the name and last name of employees working for departments with a budget greater than $60,000.
-	2.13 Select the departments with a budget larger than the average budget of all the departments.
-	2.14 Select the names of departments with more than two employees.
-	2.15 Very Important - Select the name and last name of employees working for departments with second lowest budget.
-	2.16  Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11. 
-	And Add an employee called "Mary Moore" in that department, with SSN 847-21-9811.
-	2.17 Reduce the budget of all departments by 10%.
-	2.18 Reassign all employees from the Research department (code 77) to the IT department (code 14).
-	2.19 Delete from the table all employees in the IT department (code 14).
-	2.20 Delete from the table all employees who work in departments with a budget greater than or equal to $60,000.
-	2.21 Delete from the table all employees.


## Solution


-	2.1 Select the last name of all employees.
```sql
select LastName From Employees;
```

```
┌───────────┐
│ LastName  │
├───────────┤
│ Rogers    │
│ Manikutty │
│ Smith     │
│ Stevens   │
│ Foster    │
│ ODonnell  │
│ Doe       │
│ Smith     │
│ Efron     │
│ Goldsmith │
│ Doe       │
│ Swamy     │
└───────────┘
```

-	2.2 Select the last name of all employees, without duplicates.

```sql
select distinct LastName From Employees;
```

```
┌───────────┐
│ LastName  │
├───────────┤
│ Rogers    │
│ Manikutty │
│ Smith     │
│ Stevens   │
│ Foster    │
│ ODonnell  │
│ Doe       │
│ Efron     │
│ Goldsmith │
│ Swamy     │
└───────────┘
```

-	2.3 Select all the data of employees whose last name is "Smith".

```sql
select * from Employees where LastName = 'Smith';
```

```
┌───────────┬───────┬──────────┬────────────┐
│    SSN    │ Name  │ LastName │ Department │
├───────────┼───────┼──────────┼────────────┤
│ 222364883 │ Carol │ Smith    │ 37         │
│ 631231482 │ David │ Smith    │ 77         │
└───────────┴───────┴──────────┴────────────┘
```

-	2.4 Select all the data of employees whose last name is "Smith" or "Doe".

```sql
select * from Employees where LastName in ("Smith", "Doe");
```

```
┌───────────┬───────────┬──────────┬────────────┐
│    SSN    │   Name    │ LastName │ Department │
├───────────┼───────────┼──────────┼────────────┤
│ 222364883 │ Carol     │ Smith    │ 37         │
│ 546523478 │ John      │ Doe      │ 59         │
│ 631231482 │ David     │ Smith    │ 77         │
│ 845657245 │ Elizabeth │ Doe      │ 14         │
└───────────┴───────────┴──────────┴────────────┘
```

-	2.5 Select all the data of employees that work in department 14.

```sql
select * from Employees where Department in (14);
```

```
┌───────────┬───────────┬───────────┬────────────┐
│    SSN    │   Name    │ LastName  │ Department │
├───────────┼───────────┼───────────┼────────────┤
│ 123234877 │ Michael   │ Rogers    │ 14         │
│ 152934485 │ Anand     │ Manikutty │ 14         │
│ 332154719 │ Mary-Anne │ Foster    │ 14         │
│ 845657245 │ Elizabeth │ Doe       │ 14         │
│ 845657246 │ Kumar     │ Swamy     │ 14         │
└───────────┴───────────┴───────────┴────────────┘
```

-	2.6 Select all the data of employees that work in department 37 or department 77.

```sql
select * from Employees where Department in (37, 77);
```

```
┌───────────┬────────┬──────────┬────────────┐
│    SSN    │  Name  │ LastName │ Department │
├───────────┼────────┼──────────┼────────────┤
│ 222364883 │ Carol  │ Smith    │ 37         │
│ 326587417 │ Joe    │ Stevens  │ 37         │
│ 332569843 │ George │ ODonnell │ 77         │
│ 631231482 │ David  │ Smith    │ 77         │
└───────────┴────────┴──────────┴────────────┘
```

-	2.7 Select all the data of employees whose last name begins with an "S".

```sql
select * from Employees where LastName like "S%";
```

```
┌───────────┬───────┬──────────┬────────────┐
│    SSN    │ Name  │ LastName │ Department │
├───────────┼───────┼──────────┼────────────┤
│ 222364883 │ Carol │ Smith    │ 37         │
│ 326587417 │ Joe   │ Stevens  │ 37         │
│ 631231482 │ David │ Smith    │ 77         │
│ 845657246 │ Kumar │ Swamy    │ 14         │
└───────────┴───────┴──────────┴────────────┘
```

-	2.8 Select the sum of all the departments' budgets.

```sql
select sum(Budget) from Departments;
```

```
┌─────────────┐
│ sum(Budget) │
├─────────────┤
│ 375000      │
└─────────────┘
```

-	2.9 Select the number of employees in each department (you only need to show the department code and the number of employees).

```sql
select count(*), Department from Employees group by Department;
```

```
┌──────────┬────────────┐
│ count(*) │ Department │
├──────────┼────────────┤
│ 5        │ 14         │
│ 2        │ 37         │
│ 3        │ 59         │
│ 2        │ 77         │
└──────────┴────────────┘
```

-	2.10 Select all the data of employees, including each employee's department's data.

```sql
SELECT e.*, d.* FROM Employees e INNER JOIN Departments d on e.Department = d.Code;
```

```
┌───────────┬───────────┬───────────┬────────────┬──────┬─────────────────┬────────┐
│    SSN    │   Name    │ LastName  │ Department │ Code │      Name       │ Budget │
├───────────┼───────────┼───────────┼────────────┼──────┼─────────────────┼────────┤
│ 123234877 │ Michael   │ Rogers    │ 14         │ 14   │ IT              │ 65000  │
│ 152934485 │ Anand     │ Manikutty │ 14         │ 14   │ IT              │ 65000  │
│ 222364883 │ Carol     │ Smith     │ 37         │ 37   │ Accounting      │ 15000  │
│ 326587417 │ Joe       │ Stevens   │ 37         │ 37   │ Accounting      │ 15000  │
│ 332154719 │ Mary-Anne │ Foster    │ 14         │ 14   │ IT              │ 65000  │
│ 332569843 │ George    │ ODonnell  │ 77         │ 77   │ Research        │ 55000  │
│ 546523478 │ John      │ Doe       │ 59         │ 59   │ Human Resources │ 240000 │
│ 631231482 │ David     │ Smith     │ 77         │ 77   │ Research        │ 55000  │
│ 654873219 │ Zacary    │ Efron     │ 59         │ 59   │ Human Resources │ 240000 │
│ 745685214 │ Eric      │ Goldsmith │ 59         │ 59   │ Human Resources │ 240000 │
│ 845657245 │ Elizabeth │ Doe       │ 14         │ 14   │ IT              │ 65000  │
│ 845657246 │ Kumar     │ Swamy     │ 14         │ 14   │ IT              │ 65000  │
└───────────┴───────────┴───────────┴────────────┴──────┴─────────────────┴────────┘
```

-	2.11 Select the name and last name of each employee, along with the name and budget of the employee's department.

```sql
SELECT e.Name, e.LastName, d.Name, d.Budget FROM Employees e INNER JOIN Departments d on e.Department = d.Code;
```

```
┌───────────┬───────────┬─────────────────┬────────┐
│   Name    │ LastName  │      Name       │ Budget │
├───────────┼───────────┼─────────────────┼────────┤
│ Michael   │ Rogers    │ IT              │ 65000  │
│ Anand     │ Manikutty │ IT              │ 65000  │
│ Carol     │ Smith     │ Accounting      │ 15000  │
│ Joe       │ Stevens   │ Accounting      │ 15000  │
│ Mary-Anne │ Foster    │ IT              │ 65000  │
│ George    │ ODonnell  │ Research        │ 55000  │
│ John      │ Doe       │ Human Resources │ 240000 │
│ David     │ Smith     │ Research        │ 55000  │
│ Zacary    │ Efron     │ Human Resources │ 240000 │
│ Eric      │ Goldsmith │ Human Resources │ 240000 │
│ Elizabeth │ Doe       │ IT              │ 65000  │
│ Kumar     │ Swamy     │ IT              │ 65000  │
└───────────┴───────────┴─────────────────┴────────┘
```

-	2.12 Select the name and last name of employees working for departments with a budget greater than $60,000.

```sql
SELECT e.Name, e.LastName FROM Employees e INNER JOIN Departments d on e.Department = d.Code where d.Budget > 60000;
```

```
┌───────────┬───────────┐
│   Name    │ LastName  │
├───────────┼───────────┤
│ Michael   │ Rogers    │
│ Anand     │ Manikutty │
│ Mary-Anne │ Foster    │
│ John      │ Doe       │
│ Zacary    │ Efron     │
│ Eric      │ Goldsmith │
│ Elizabeth │ Doe       │
│ Kumar     │ Swamy     │
└───────────┴───────────┘
```

-	2.13 Select the departments with a budget larger than the average budget of all the departments.

```sql
SELECT Budget FROM Departments WHERE Budget > (SELECT avg(Budget) FROM Departments);
```

```
┌────────┐
│ Budget │
├────────┤
│ 240000 │
└────────┘
```

-	2.14 Select the names of departments with more than two employees.

```sql
SELECT Name FROM Departments WHERE Code in (SELECT Department FROM Employees GROUP BY Department HAVING count(*) > 2);
```

```
┌─────────────────┐
│      Name       │
├─────────────────┤
│ IT              │
│ Human Resources │
└─────────────────┘
```

```sql
SELECT Departments.Name FROM Employees INNER JOIN Departments ON Employees.Department = Departments.Code GROUP BY Departments.Na
me HAVING count(*) > 2;
```

```
┌─────────────────┐
│      Name       │
├─────────────────┤
│ Human Resources │
│ IT              │
└─────────────────┘
```

-	2.15 Very Important - Select the name and last name of employees working for departments with second lowest budget.

```sql

SELECT Name, LastName
	FROM Employees
	WHERE Department
	IN (
		SELECT Code
		FROM (
			SELECT Code, Budget
			FROM Departments
			ORDER BY Budget DESC LIMIT 2
		) ORDER BY Budget ASC LIMIT 1
	);
```

```
┌───────────┬───────────┐
│   Name    │ LastName  │
├───────────┼───────────┤
│ Michael   │ Rogers    │
│ Anand     │ Manikutty │
│ Mary-Anne │ Foster    │
│ Elizabeth │ Doe       │
│ Kumar     │ Swamy     │
└───────────┴───────────┘

```

-	2.16  Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11. And Add an employee called "Mary Moore" in that department, with SSN 847-21-9811. 

```sql
INSERT INTO Departments(Code, Name, Budget) VALUES (11, "Quality Assurance", 40000);
INSERT INTO Employees(SSN, Name, LastName, Department) VALUES (847219811, "Mary", "Moore", 11);
```

-	2.17 Reduce the budget of all departments by 10%.

```sql
UPDATE Departments SET Budget = (0.9 * Budget);
```

-	2.18 Reassign all employees from the Research department (code 77) to the IT department (code 14).

```sql
UPDATE Employees SET Department = 14 WHERE Department = 77;
```

-	2.19 Delete from the table all employees in the IT department (code 14).

```sql
DELETE FROM Employees WHERE Department = 14;
```

-	2.20 Delete from the table all employees who work in departments with a budget greater than or equal to $60,000.

```sql
DELETE FROM Employees WHERE Department IN (SELECT Code FROM Departments WHERE Budget > 60000);
```

-	2.21 Delete from the table all employees.

```sql
DELETE FROM Employees;
```