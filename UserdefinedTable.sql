-- Create the employee table
CREATE TABLE employee (
  Id INT PRIMARY KEY IDENTITY(1, 1), 
  Name VARCHAR(100), 
  Place VARCHAR(50)
); 

-- Create the user-defined table type
CREATE TYPE UT_employee_details AS TABLE (
  Name VARCHAR(100), 
  Place VARCHAR(50)
);

-- Create the stored procedure
CREATE PROCEDURE details
  @ps UT_employee_details READONLY
AS 
BEGIN 
  INSERT INTO employee (Name, Place)
  SELECT Name, Place 
  FROM @ps;
END;

-- Declare and populate the table variable @s
DECLARE @s AS UT_employee_details;
INSERT INTO @s (Name, Place) VALUES ('raja', 'Puducherry');

-- Execute the stored procedure with the table variable @s
EXEC details @s;

-- Select data from the employee table to verify the insertion
SELECT * FROM employee;
