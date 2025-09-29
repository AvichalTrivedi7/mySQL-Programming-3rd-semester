USE aviWorks;

-- 1. Insert into a new table all employees who work in the 'Research' department.

CREATE TABLE ResearchEmployees AS
SELECT * 
FROM EMPLOYEE 
WHERE Dno = (SELECT Dnumber FROM DEPARTMENT WHERE Dname = 'Research');

-- 2. Insert dependents of employees who earn more than 40,000 into a separate table.

CREATE TABLE HighSalaryDependents AS
SELECT D.* 
FROM DEPENDENT D
JOIN EMPLOYEE E ON D.Essn = E.Ssn
WHERE E.Salary > 40000;

-- 3. Increase the salary by 10% for all employees in the 'Research' department.

UPDATE EMPLOYEE
SET Salary = Salary * 1.10
WHERE Dno = (SELECT Dnumber FROM DEPARTMENT WHERE Dname = 'Research');

-- 4. Set project location to 'Headquarters' for all projects managed by 'James Borg’.

UPDATE PROJECT
SET Plocation = 'Headquarters'
WHERE Dnum = (SELECT Dno FROM EMPLOYEE WHERE Fname = 'James' AND Lname = 'Borg');

-- 5. Set hours = 0 for employees who work on projects located in 'Houston’.

UPDATE WORKS_ON W
JOIN PROJECT P ON W.Pno = P.Pnumber
SET W.Hours = 0
WHERE P.Plocation = 'Houston';

-- 6. Set the birthdate of dependents to NULL where the employee earns less than 30000.

UPDATE DEPENDENT D
JOIN EMPLOYEE E ON D.Essn = E.Ssn
SET D.Bdate = NULL
WHERE E.Salary < 30000;

-- 7. Set location of all departments with fewer than 2 employees to 'Closed'.

UPDATE DEPT_LOCATIONS DL
SET DL.Dlocation = 'Closed'
WHERE DL.Dnumber IN (
    SELECT Dno FROM EMPLOYEE
    GROUP BY Dno
    HAVING COUNT(*) < 2
);

-- 8. Delete all dependents of employees working in the 'Administration' department.

DELETE D
FROM DEPENDENT AS D
JOIN EMPLOYEE AS E ON D.Essn = E.Ssn
JOIN DEPARTMENT AS DEP ON E.Dno = DEP.Dnumber
WHERE DEP.Dname = 'Administration';

-- 9. Delete employees who have a salary less than the minimum salary in the 'Research' department.

DELETE FROM EMPLOYEE
WHERE Salary < (
    SELECT MIN(Salary)
    FROM (
        SELECT Salary
        FROM EMPLOYEE
        WHERE Dno = (
            SELECT Dnumber 
            FROM DEPARTMENT 
            WHERE Dname = 'Research'
        )
    ) AS temp
);

-- 10. Delete departments that do not have any assigned employees.

DELETE FROM DEPARTMENT
WHERE Dnumber NOT IN (SELECT DISTINCT Dno FROM EMPLOYEE);
 
 -- Checking for everything
SELECT * FROM ResearchEmployees;
SELECT * FROM HighSalaryDependents;
SELECT * FROM DEPARTMENT;
SELECT * FROM EMPLOYEE;
SELECT * FROM DEPT_LOCATIONS;
SELECT * FROM PROJECT;
SELECT * FROM DEPENDENT;
SELECT * FROM WORKS_ON;
