-- AGGREGATE AND SCALAR FUNCTIONS

-- AVG(): It returns average value after calculating from values in a numeric column.Syntax:
-- SELECT AVG(column_name) FROM table_name;

SELECT AVG(MARKS) AS AvgMarks FROM Students;

-- COUNT(): It is used to count the number of rows returned in a SELECT statement. Syntax:
-- SELECT COUNT(column_name) FROM table_name;

SELECT COUNT(*) AS NumStudents FROM Students;

SELECT COUNT(DISTINCT AGE) AS NumStudents FROM Students;

-- FIRST(): The FIRST() function returns the first value of the selected column. Syntax:
-- SELECT FIRST(column_name) FROM table_name;

SELECT FIRST(MARKS) AS MarksFirst FROM Students;

-- LAST(): The LAST() function returns the last value of the selected column. Syntax:
-- SELECT LAST(column_name) FROM table_name;

SELECT LAST(MARKS) AS MarksLast FROM Students;

-- MAX(): The MAX() function returns the maximum value of the selected column. Syntax:
-- SELECT MAX(column_name) FROM table_name;

SELECT MAX(MARKS) AS MaxMarks FROM Students;

-- MIN(): The MIN() function returns the minimum value of the selected column. Syntax:
-- SELECT MIN(column_name) FROM table_name;

SELECT MIN(MARKS) AS MinMarks FROM Students;

-- SUM(): The SUM() function returns the sum of all the values of the selected column. Syntax:
-- SELECT SUM(column_name) FROM table_name;

SELECT SUM(MARKS) AS TotalMarks FROM Students;

-- UCASE(): It converts the value of a field to uppercase. Syntax:
-- SELECT UCASE(column_name) FROM table_name;

SELECT UCASE(NAME) FROM Students;

-- LCASE(): It converts the value of a field to lowercase. Syntax:
-- SELECT LCASE(column_name) FROM table_name;

SELECT LCASE(NAME) FROM Students;

-- MID(): The MID() function extracts texts from the text field. Syntax:
-- SELECT MID(column_name,start,length) AS some_name FROM table_name; //specifying length is optional here

SELECT MID(NAME,1,4) FROM Students;

-- LEN(): The LEN() function returns the length of the value in a text field. Syntax:
-- SELECT LENGTH(column_name) FROM table_name;

SELECT LENGTH(NAME) FROM Students;

-- ROUND(): The ROUND() function is used to round a numeric field to the number of decimals .Syntax:
-- SELECT ROUND(column_name,decimals) FROM table_name;

SELECT ROUND(MARKS,0) FROM table_name;

-- NOW(): The NOW() function returns the current system date and time. Syntax:
-- SELECT NOW() FROM table_name;

SELECT NAME, NOW() AS DateTime FROM Students;

-- FORMAT(): The FORMAT() function is used to format how a field is to be displayed. Syntax:
-- SELECT FORMAT(column_name,format) FROM table_name;

SELECT NAME, FORMAT(Now(),'YYYY-MM-DD') AS Date FROM Students;

-- GROUP BY CLAUSE

-- 1. Total salary per department (using EMPLOYEE)

SELECT Dno, SUM(Salary) AS Total_Salary FROM EMPLOYEE GROUP BY Dno;

-- 2. Total hours per employee per project (GROUP BY multiple columns)

SELECT Essn, Pno, SUM(Hours) AS Hours_Worked FROM WORKS_ON GROUP BY Essn, Pno;

-- HAVING CLAUSE

-- 1. salary per department (using EMPLOYEE)

SELECT Dno, SUM(Salary) AS Total_Salary FROM EMPLOYEE GROUP BY Dno;

-- 2. Total hours per employee per project (GROUP BY multiple columns)

SELECT Essn, Pno, SUM(Hours) AS Hours_Worked FROM WORKS_ON GROUP BY Essn, Pno;

-- SOME BASIC QUERIES

-- 1. Get full name and year of birth of all employees

SELECT CONCAT(Fname, ' ', Lname) AS FullName, YEAR(Bdate) AS BirthYear FROM EMPLOYEE;

-- 2. Convert address to uppercase and calculate monthly salary

SELECT Fname, Lname, UPPER(Address) AS UppercaseAddress, ROUND(Salary / 12, 2) AS MonthlySalary FROM EMPLOYEE;

-- 3. Age of employees:

SELECT Fname, Lname, TIMESTAMPDIFF(YEAR, Bdate, CURDATE()) AS Age FROM EMPLOYEE;