USE aviWorks;
-- * JOINS --> 

-- List employees with their department names.
SELECT Fname, Dname FROM employee e INNER JOIN department d WHERE e.Dno=d.Dnumber;

-- Show employees and the projects they work on.
SELECT Fname, Pname, Pno FROM employee e INNER JOIN project p INNER JOIN works_on w WHERE e.ssn=w.Essn AND p.Pnumber=w.Pno; 

-- Show each department with its locations.
SELECT Dname, Dlocation FROM dept_locations dl INNER JOIN department d WHERE dl.Dnumber=d.Dnumber;

-- Show employees along with their supervisors.
SELECT Fname, Super_ssn FROM employee;

-- Show department managers and their department names (with employees connected respectively).
SELECT Fname, Mgr_ssn, Dname FROM department d INNER JOIN employee e WHERE e.Dno=d.Dnumber;

-- * SUB-QUERIES --> 

-- Find employees who earn more than the average salary.
SELECT Fname, Salary FROM employee WHERE Salary > (SELECT avg(Salary) FROM employee);

-- List employees who work in the 'Research' department.
SELECT Fname FROM employee WHERE Dno = (SELECT Dnumber FROM department WHERE Dname='Research');

-- Find employees who work on project 'ProductX’.
SELECT Fname FROM employee WHERE ssn IN (SELECT Essn FROM works_on WHERE Pno IN (SELECT Pnumber FROM project WHERE Pname = 'ProductX'));

-- Find employee who earns the highest salary.
SELECT Fname, Salary FROM employee WHERE SALARY = (SELECT max(Salary) FROM employee);

-- Find dependents of employee 'Franklin Wong’.
SELECT Dependent_name FROM dependent WHERE Essn = (SELECT Ssn FROM employee WHERE Fname = 'Franklin');

-- Find projects controlled by the department located in 'Houston’.
SELECT Pname, Dnum FROM project WHERE Plocation = 'Houston';

-- Find employees who do not have any dependents.
SELECT Fname FROM employee WHERE Ssn NOT IN (SELECT Essn FROM dependent);

-- Find employees who work on more than one project.
SELECT Fname FROM employee WHERE Ssn IN (SELECT Essn FROM works_on GROUP BY Essn HAVING COUNT(Pno)>1);

-- Find department managers who manage more than one location.
SELECT Mgr_ssn FROM department WHERE Dnumber IN (SELECT Dnumber FROM dept_locations GROUP BY Dnumber HAVING COUNT(Dnumber)>1);

-- Find employees whose salary is greater than all employees in department 4.
SELECT Fname, Salary FROM employee WHERE Salary > (SELECT max(Salary) FROM employee WHERE Dno=4);

-- Insert all employees of the ‘Research’ department into a new table.
CREATE TABLE ResearchEmployees AS SELECT * FROM employee WHERE Dno = (SELECT Dnumber FROM department WHERE Dname = 'Research');

-- Insert dependents of employees earning more than 40,000 into another table.
CREATE TABLE HighSalaryDependents AS SELECT * FROM dependent WHERE Essn IN (SELECT Ssn FROM employee WHERE E.Salary > 40000);

-- Delete all employees who belong to the ‘Administration’ department.
DELETE FROM employee WHERE Dno IN (SELECT Dnumber FROM Department WHERE Dname = 'Administration');

-- Delete all dependents of employees who earn less than 30,000.
DELETE FROM dependent WHERE Essn IN (SELECT Ssn FROM employee WHERE Salary < 30000);
