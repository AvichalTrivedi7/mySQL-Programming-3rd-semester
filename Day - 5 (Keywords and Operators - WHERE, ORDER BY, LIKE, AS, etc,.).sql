USE aviWorks;

-- DISTINCT KEYWORD

SELECT DISTINCT Salary FROM Employee;
SELECT DISTINCT Plocation FROM Project;
SELECT DISTINCT Essn, Pno FROM Works_on;

-- AND & OR OPERATORS

SELECT * FROM Project WHERE Plocation = 'Houston' AND Dnum = 5;
SELECT * FROM Dependent WHERE Sex = 'F' OR Relationship = 'Daughter';
SELECT * FROM Employee WHERE Dno = 5 AND (Salary BETWEEN 30000 AND 40000);
SELECT * FROM Employee WHERE (Dno = 4 AND Salary>40000) OR Dno = 5;

-- PATTERN MATCHING (LIKE)

SELECT * FROM Employee WHERE Address LIKE "%Houston%";
SELECT * FROM Employee WHERE Fname LIKE "J%";
SELECT * FROM Dependent WHERE Dependent_name LIKE "__ice";

-- ARITHMETIC OPERATORS 

SELECT Essn, Pno, Hours+5 AS Bonus_Hours FROM Works_on;
SELECT *, Salary/30 AS Daily_Salary FROM Employee;
-- If you want to replace the old salary column with daily salary instead of just adding the column then you can write the above line as -->
SELECT Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary/30 AS Daily_Salary, Super_ssn, Dno FROM Employee;

-- ORDER BY (FOR ARRANGING IN ASC OR DESC)

SELECT * FROM Employee ORDER BY Salary ASC;
SELECT * FROM Employee ORDER BY Salary DESC;
SELECT * FROM Employee ORDER BY Dno, Fname;
SELECT * FROM Employee ORDER BY Dno ASC, Salary DESC;

-- SET OPERATORS 

SELECT Fname AS Name FROM Employee
UNION
SELECT Dependent_name AS Name FROM Dependent;

SELECT Fname AS Name FROM EMPLOYEE
UNION ALL SELECT 
Dependent_name AS Name FROM DEPENDENT;