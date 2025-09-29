USE aviWorks;

-- 1. Find maximum and minimum salary among all employees.
SELECT MAX(Salary) AS Max_Salary, MIN(Salary) AS Min_Salary FROM Employee;

-- 2. Get the first 2 letters of every project location.
SELECT SUBSTRING(Plocation, 1, 2) AS First_2_Letters FROM Project;

-- 3. Show monthly salary rounded to nearest integer.
SELECT Fname, Lname, ROUND(Salary, 0) AS Monthly_Salary FROM Employee;

-- 4. List the employees whose birth year is before 1960.
SELECT * FROM Employee HAVING YEAR(Bdate) < 1960;

-- 5. List the employees whose names have at least 2 vowels.
SELECT * FROM Employee 
WHERE (LENGTH(Fname) - LENGTH(REPLACE(LOWER(Fname), 'a','')) +
       LENGTH(Fname) - LENGTH(REPLACE(LOWER(Fname), 'e','')) +
       LENGTH(Fname) - LENGTH(REPLACE(LOWER(Fname), 'i','')) +
       LENGTH(Fname) - LENGTH(REPLACE(LOWER(Fname), 'o','')) +
       LENGTH(Fname) - LENGTH(REPLACE(LOWER(Fname), 'u',''))) >= 2;

-- 6. Show the distinct supervisor SSNs assigned in EMPLOYEE table.
SELECT Super_ssn FROM Employee GROUP BY Super_ssn HAVING Super_ssn IS NOT NULL;

-- 7. Show the distinct first letters of employee first names.
SELECT DISTINCT LEFT(Fname, 1) AS First_Letter FROM Employee;

-- 8. Find the average salary of employees in each department.
SELECT Dno, AVG(Salary) AS Avg_Salary FROM Employee GROUP BY Dno;

-- 9. Find employees who have more than 1 dependent.
SELECT Essn, COUNT(*) AS Dep_Count FROM Dependent GROUP BY Essn HAVING COUNT(*) > 1;

-- 10. List departments whose total salary exceeds 100000.
SELECT Dno, SUM(Salary) AS Total_Salary FROM Employee GROUP BY Dno HAVING SUM(Salary) > 100000;

-- 11. Find the age of each employee.
SELECT Fname, Lname, TIMESTAMPDIFF(YEAR, Bdate, CURDATE()) AS Age FROM Employee;

-- 12. Find the length of each project name.
SELECT Pname, LENGTH(Pname) AS Name_Length FROM Project;

-- 13. Show salaries rounded down to the nearest thousand.
SELECT Fname, Lname, FLOOR(Salary/1000)*1000 AS Rounded_Salary FROM Employee;

-- 14. Find projects where the total hours worked exceed 50.
SELECT Pno, SUM(Hours) AS Total_Hours FROM Works_on GROUP BY Pno HAVING SUM(Hours) > 50;

-- 15. Find employees whose birthdays are in January.
SELECT * FROM Employee WHERE MONTH(Bdate) = 1;
