## build

```sql
create table Scientists (
  SSN int,
  Name Char(30) not null,
  Primary Key (SSN)
);

Create table Projects (
  Code Char(4),
  Name Char(50) not null,
  Hours int,
  Primary Key (Code)
);
	
create table AssignedTo (
  Scientist int not null,
  Project char(4) not null,
  Primary Key (Scientist, Project),
  Foreign Key (Scientist) references Scientists (SSN),
  Foreign Key (Project) references Projects (Code)
);

INSERT INTO Scientists(SSN,Name) 
  VALUES(123234877,'Michael Rogers'),
    (152934485,'Anand Manikutty'),
    (222364883, 'Carol Smith'),
    (326587417,'Joe Stevens'),
    (332154719,'Mary-Anne Foster'),	
    (332569843,'George ODonnell'),
    (546523478,'John Doe'),
    (631231482,'David Smith'),
    (654873219,'Zacary Efron'),
    (745685214,'Eric Goldsmith'),
    (845657245,'Elizabeth Doe'),
    (845657246,'Kumar Swamy');

 INSERT INTO Projects ( Code,Name,Hours)
 VALUES ('AeH1','Winds: Studying Bernoullis Principle', 156),
       ('AeH2','Aerodynamics and Bridge Design',189),
       ('AeH3','Aerodynamics and Gas Mileage', 256),
       ('AeH4','Aerodynamics and Ice Hockey', 789),
       ('AeH5','Aerodynamics of a Football', 98),
       ('AeH6','Aerodynamics of Air Hockey',89),
       ('Ast1','A Matter of Time',112),
       ('Ast2','A Puzzling Parallax', 299),
       ('Ast3','Build Your Own Telescope', 6546),
       ('Bte1','Juicy: Extracting Apple Juice with Pectinase', 321),
       ('Bte2','A Magnetic Primer Designer', 9684),
       ('Bte3','Bacterial Transformation Efficiency', 321),
       ('Che1','A Silver-Cleaning Battery', 545),
       ('Che2','A Soluble Separation Solution', 778);

 INSERT INTO AssignedTo ( Scientist, Project)
   VALUES (123234877,'AeH1'),
    (152934485,'AeH3'),
    (222364883,'Ast3'),	   
    (326587417,'Ast3'),
    (332154719,'Bte1'),
    (546523478,'Che1'),
    (631231482,'Ast3'),
    (654873219,'Che1'),
    (745685214,'AeH3'),
    (845657245,'Ast1'),
    (845657246,'Ast2'),
    (332569843,'AeH4');

```

## Questions

-	6.1 List all the scientists' names, their projects' names, and the hours worked by that scientist on each project, in alphabetical order of project name, then scientist name.
-	6.2 Select the project names which are not assigned yet

## Solution

-	6.1 List all the scientists' names, their projects' names, and the hours worked by that scientist on each project, in alphabetical order of project name, then scientist name.

```sql
select s.Name, p.Name, p.Hours
	from AssignedTo a
	inner join Scientists s on a.Scientist = s.SSN
	inner join Projects p on a.Project = p.Code
	order by p.Name asc, s.Name asc;
```

```
Name           Name              Hours     
-------------  ----------------  ----------
Elizabeth Doe  A Matter of Time  112       
Kumar Swamy    A Puzzling Paral  299       
John Doe       A Silver-Cleanin  545       
Zacary Efron   A Silver-Cleanin  545       
Anand Manikut  Aerodynamics and  256       
Eric Goldsmit  Aerodynamics and  256       
George ODonne  Aerodynamics and  789       
Carol Smith    Build Your Own T  6546      
David Smith    Build Your Own T  6546      
Joe Stevens    Build Your Own T  6546      
Mary-Anne Fos  Juicy: Extractin  321       
Michael Roger  Winds: Studying   156 

```

-	6.2 Select the project names which are not assigned yet

```sql
select Name from Projects where Code not in (select Project from AssignedTo);
```