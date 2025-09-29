-- Create Database aviWorks first, and Use it.

CREATE DATABASE IF NOT EXISTS aviWorks;
USE aviWorks;

-- Create DEPARTMENT table 

CREATE TABLE DEPARTMENT (
    Dname          VARCHAR(15) NOT NULL UNIQUE,
    Dnumber        INT NOT NULL,
    Mgr_ssn        CHAR(9) NOT NULL,
    Mgr_start_date DATE,
    PRIMARY KEY (Dnumber)
);

-- Create EMPLOYEE table

CREATE TABLE EMPLOYEE (
    Fname      VARCHAR(15) NOT NULL,
    Minit      CHAR(1),
    Lname      VARCHAR(15) NOT NULL,
    Ssn        CHAR(9) NOT NULL,
    Bdate      DATE,
    Address    VARCHAR(30),
    Sex        CHAR(1),
    Salary     DECIMAL(10,2),
    Super_ssn  CHAR(9),
    Dno        INT NOT NULL,
    PRIMARY KEY (Ssn)
);

-- Create DEPT_LOCATIONS table

CREATE TABLE DEPT_LOCATIONS (
    Dnumber   INT NOT NULL,
    Dlocation VARCHAR(15) NOT NULL,
    PRIMARY KEY (Dnumber, Dlocation)
);

-- Create DEPENDENT table

CREATE TABLE DEPENDENT (
    Essn           CHAR(9) NOT NULL,
    Dependent_name VARCHAR(15) NOT NULL,
    Sex            CHAR(1),
    Bdate          DATE,
    Relationship   VARCHAR(8),
    PRIMARY KEY (Essn, Dependent_name)
);

-- Create PROJECT table

CREATE TABLE PROJECT (
    Pname     VARCHAR(15) NOT NULL UNIQUE,
    Pnumber   INT NOT NULL,
    Plocation VARCHAR(15),
    Dnum      INT NOT NULL,
    PRIMARY KEY (Pnumber)
);

-- Create WORKS_ON table

CREATE TABLE WORKS_ON (
    Essn  CHAR(9) NOT NULL,
    Pno   INT NOT NULL,
    Hours DECIMAL(3,1) NOT NULL,
    PRIMARY KEY (Essn, Pno)
);

DESCRIBE TABLE DEPARTMENT;
DESCRIBE TABLE EMPLOYEE;
DESCRIBE TABLE DEPT_LOCATIONS;
DESCRIBE TABLE DEPENDENT;
DESCRIBE TABLE PROJECT;
DESCRIBE TABLE WORKS_ON;




