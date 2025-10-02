
-- 2.1 Select the last name of all employees.
select LastName From Employees;
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
-- 2.2 Select the last name of all employees, without duplicates.
select distinct LastName From Employees;
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
-- 2.3 Select all the data of employees whose last name is "Smith".
select * from Employees where LastName = 'Smith';
┌───────────┬───────┬──────────┬────────────┐
│    SSN    │ Name  │ LastName │ Department │
├───────────┼───────┼──────────┼────────────┤
│ 222364883 │ Carol │ Smith    │ 37         │
│ 631231482 │ David │ Smith    │ 77         │
└───────────┴───────┴──────────┴────────────┘
-- 2.4 Select all the data of employees whose last name is "Smith" or "Doe".
select * from Employees where LastName in ("Smith", "Doe");
┌───────────┬───────────┬──────────┬────────────┐
│    SSN    │   Name    │ LastName │ Department │
├───────────┼───────────┼──────────┼────────────┤
│ 222364883 │ Carol     │ Smith    │ 37         │
│ 546523478 │ John      │ Doe      │ 59         │
│ 631231482 │ David     │ Smith    │ 77         │
│ 845657245 │ Elizabeth │ Doe      │ 14         │
└───────────┴───────────┴──────────┴────────────┘
-- 2.5 Select all the data of employees that work in department 14.
select * from Employees where Department in (14);
┌───────────┬───────────┬───────────┬────────────┐
│    SSN    │   Name    │ LastName  │ Department │
├───────────┼───────────┼───────────┼────────────┤
│ 123234877 │ Michael   │ Rogers    │ 14         │
│ 152934485 │ Anand     │ Manikutty │ 14         │
│ 332154719 │ Mary-Anne │ Foster    │ 14         │
│ 845657245 │ Elizabeth │ Doe       │ 14         │
│ 845657246 │ Kumar     │ Swamy     │ 14         │
└───────────┴───────────┴───────────┴────────────┘
-- 2.6 Select all the data of employees that work in department 37 or department 77.
select * from Employees where Department in (37, 77);
┌───────────┬────────┬──────────┬────────────┐
│    SSN    │  Name  │ LastName │ Department │
├───────────┼────────┼──────────┼────────────┤
│ 222364883 │ Carol  │ Smith    │ 37         │
│ 326587417 │ Joe    │ Stevens  │ 37         │
│ 332569843 │ George │ ODonnell │ 77         │
│ 631231482 │ David  │ Smith    │ 77         │
└───────────┴────────┴──────────┴────────────┘
-- 2.7 Select all the data of employees whose last name begins with an "S".
select * from Employees where LastName like "S%";
┌───────────┬───────┬──────────┬────────────┐
│    SSN    │ Name  │ LastName │ Department │
├───────────┼───────┼──────────┼────────────┤
│ 222364883 │ Carol │ Smith    │ 37         │
│ 326587417 │ Joe   │ Stevens  │ 37         │
│ 631231482 │ David │ Smith    │ 77         │
│ 845657246 │ Kumar │ Swamy    │ 14         │
└───────────┴───────┴──────────┴────────────┘
-- 2.8 Select the sum of all the departments' budgets.
select sum(Budget) from Departments;
┌─────────────┐
│ sum(Budget) │
├─────────────┤
│ 375000      │
└─────────────┘
-- 2.9 Select the number of employees in each department (you only need to show the department code and the number of employees).
select count(*), Department from Employees group by Department;
┌──────────┬────────────┐
│ count(*) │ Department │
├──────────┼────────────┤
│ 5        │ 14         │
│ 2        │ 37         │
│ 3        │ 59         │
│ 2        │ 77         │
└──────────┴────────────┘
-- 2.10 Select all the data of employees, including each employee's department's data.
SELECT e.*, d.* FROM Employees e INNER JOIN Departments d on e.Department = d.Code;
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
-- 2.11 Select the name and last name of each employee, along with the name and budget of the employee's department.
SELECT e.Name, e.LastName, d.Name, d.Budget FROM Employees e INNER JOIN Departments d on e.Department = d.Code;
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
-- 2.12 Select the name and last name of employees working for departments with a budget greater than $60,000.
SELECT e.Name, e.LastName FROM Employees e INNER JOIN Departments d on e.Department = d.Code where d.Budget > 60000;
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
-- 2.13 Select the departments with a budget larger than the average budget of all the departments.
SELECT Budget FROM Departments WHERE Budget > (SELECT avg(Budget) FROM Departments);
┌────────┐
│ Budget │
├────────┤
│ 240000 │
└────────┘
-- 2.14 Select the names of departments with more than two employees.
SELECT Name FROM Departments WHERE Code in (SELECT Department FROM Employees GROUP BY Department HAVING count(*) > 2);
┌─────────────────┐
│      Name       │
├─────────────────┤
│ IT              │
│ Human Resources │
└─────────────────┘
SELECT Departments.Name FROM Employees INNER JOIN Departments ON Employees.Department = Departments.Code GROUP BY Departments.Na
me HAVING count(*) > 2;
┌─────────────────┐
│      Name       │
├─────────────────┤
│ Human Resources │
│ IT              │
└─────────────────┘
-- 2.15 Very Important - Select the name and last name of employees working for departments with second lowest budget.

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
┌───────────┬───────────┐
│   Name    │ LastName  │
├───────────┼───────────┤
│ Michael   │ Rogers    │
│ Anand     │ Manikutty │
│ Mary-Anne │ Foster    │
│ Elizabeth │ Doe       │
│ Kumar     │ Swamy     │
└───────────┴───────────┘

-- 2.16  Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11. 
INSERT INTO Departments(Code, Name, Budget) VALUES (11, "Quality Assurance", 40000);
-- And Add an employee called "Mary Moore" in that department, with SSN 847-21-9811.
INSERT INTO Employees(SSN, Name, LastName, Department) VALUES (847219811, "Mary", "Moore", 11);
-- 2.17 Reduce the budget of all departments by 10%.
UPDATE Departments SET Budget = (0.9 * Budget);
-- 2.18 Reassign all employees from the Research department (code 77) to the IT department (code 14).
UPDATE Employees SET Department = 14 WHERE Department = 77;
-- 2.19 Delete from the table all employees in the IT department (code 14).
DELETE FROM Employees WHERE Department = 14;
-- 2.20 Delete from the table all employees who work in departments with a budget greater than or equal to $60,000.
DELETE FROM Employees WHERE Department IN (SELECT Code FROM Departments WHERE Budget > 60000);
-- 2.21 Delete from the table all employees.
DELETE FROM Employees;