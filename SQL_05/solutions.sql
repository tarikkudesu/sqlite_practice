-- 6.1 List all the scientists' names, their projects' names, and the hours worked by that scientist on each project, in alphabetical order of project name, then scientist name.
select s.Name, p.Name, p.Hours
	from AssignedTo a
	inner join Scientists s on a.Scientist = s.SSN
	inner join Projects p on a.Project = p.Code
	order by p.Name asc, s.Name asc;

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
-- 6.2 Select the project names which are not assigned yet
select Name from Projects where Code not in (select Project from AssignedTo);