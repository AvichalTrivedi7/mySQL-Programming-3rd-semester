-- PRACTICAL 3: MySQL DDL demonstrating Table, View, Index, Sequence

-- 1. Create Database
CREATE DATABASE IF NOT EXISTS Practical3;
USE Practical3;

-- 2. Create Students Table (Table + AUTO_INCREMENT = Sequence)
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT,
    course_id INT
);

-- 3. Create Courses Table
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT
);

-- 4. Insert some sample data
INSERT INTO courses (course_name, credits) VALUES
('Data Structures', 4),
('Database Systems', 3),
('Artificial Intelligence', 5);

INSERT INTO students (first_name, last_name, age, course_id) VALUES
('Amit', 'Sharma', 20, 1),
('Riya', 'Mehta', 19, 2),
('Karan', 'Patel', 21, 3);

-- 5. Create a View (View of Students with Course Names)
CREATE VIEW student_course_view AS
SELECT s.student_id, s.first_name, s.last_name, c.course_name, c.credits
FROM students s
JOIN courses c ON s.course_id = c.course_id;

-- 6. Create an Index (on last_name for faster searching)
CREATE INDEX idx_students_lastname ON students(last_name);

-- 7. Simulate a Sequence Table (Optional Demo)
CREATE TABLE seq_demo (
    id INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id)
);

-- Insert into seq_demo to generate sequence numbers
INSERT INTO seq_demo VALUES (NULL), (NULL), (NULL);

-- 8. Verification Queries 
SHOW TABLES;
SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM student_course_view;
SHOW INDEXES FROM students;
SELECT * FROM seq_demo;

Try -->
ALTER TABLE <table_name> ADD <column_name> <datatype>;
ALTER TABLE <table_name> DROP COLUMN <column_name>;
ALTER TABLE <table_name> MODIFY COLUMN <column_name> <datatype>;