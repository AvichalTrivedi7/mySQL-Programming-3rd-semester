USE aviWorks;


-- Show all employees who do not have a supervisor.
SELECT * FROM Employee WHERE Super_ssn IS null;

-- List the distinct combinations of employee department and project.
SELECT DISTINCT Dnum, Pname FROM project;

-- List the employees whose first name starts with “J” and ends with “n”.
SELECT * FROM Employee WHERE Fname LIKE "J%n";

-- List the dependents whose names end with “a” or “e”.
SELECT * FROM Dependent WHERE dependent_name LIKE "%a" or dependent_name LIKE "%e";

-- Show employees whose first name has at least 2 characters and ends with “y”.
SELECT * FROM Employee WHERE Fname LIKE "%_y";

-- Show all employees ordered by birthdate (oldest first).
SELECT * FROM Employee ORDER BY Bdate DESC;

-- Show all employees ordered by salary, but only department 5 employees
SELECT * FROM Employee WHERE Dno = 5 ORDER BY Salary;

-- Show the Top 3 highest salaries.
SELECT * FROM Employee ORDER BY Salary DESC LIMIT 3;

-- List the employees with salaries that are multiples of 5000.
SELECT * FROM Employee WHERE Salary%5000=0;

-- Find the employees in department 4 earning more than 40,000 OR anyone in department 
SELECT * FROM Employee WHERE (Dno = 4 AND Salary>40000);

-- Find the employees with salary less than 30,000 OR born after 1970 AND in department 
SELECT * FROM Employee WHERE Salary<30000 OR Bdate>'1970-01-01';

-- List the distinct dependents who are either daughters OR females.
SELECT DISTINCT Dependent_name FROM Dependent WHERE (Relationship = 'Daughter' OR Sex = 'F'); 

-- Using Union get all department numbers from EMPLOYEE and DEPARTMENT.
SELECT Dno AS Dep_Numbers FROM Employee
UNION
SELECT Dnumber AS Dep_Numbers FROM Department;

-- Show employees with annual salary (12 × monthly salary).
SELECT *,Salary*12 AS Annual_Salary FROM Employee; 

-- Show employees with 10% salary hike.
SELECT *,Salary*1.10 AS Salary_Hike FROM Employee;