-- Drop database if it exists and create a new one
DROP DATABASE IF EXISTS employee;
CREATE DATABASE employee;
USE employee;

-- 1. Departments Table Creation
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

-- 2. Location Table Creation
CREATE TABLE Location (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    location VARCHAR(30) NOT NULL UNIQUE
);

-- 3. Employees Table Creation
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    gender ENUM('M', 'F'),
    age INT CHECK (age >= 18),
    hire_date DATE DEFAULT (CURRENT_DATE),
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10,2),
    
    -- Foreign Key constraints linking to Departments and Location
    FOREIGN KEY (department_id) REFERENCES Departments(department_id),
    FOREIGN KEY (location_id) REFERENCES Location(location_id)
);
-- Add a new column named "email"
ALTER TABLE Employees
ADD email VARCHAR(150);

-- Modify the data type of the "designation" column
ALTER TABLE Employees
MODIFY designation VARCHAR(150);

-- Drop the "age" column from the Employees table
ALTER TABLE Employees
DROP COLUMN age;

-- Rename the "hire_date" column to "date_of_joining"
ALTER TABLE Employees
RENAME COLUMN hire_date TO date_of_joining;
-- Rename Departments to Departments_Info
RENAME TABLE Departments TO Departments_Info;

-- Rename Location to Locations
RENAME TABLE Location TO Locations;
TRUNCATE TABLE Employees;
-- Drop the Employees table
DROP TABLE Employees;

-- Drop the employee database
DROP DATABASE employee;