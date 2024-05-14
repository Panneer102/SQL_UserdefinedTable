
--======================-User Defined Table========================
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


--======================-Joins========================
-- Create the Cricket table
CREATE TABLE Cricket (
    Name VARCHAR(50) NOT NULL,
    Age INT NOT NULL
);

-- Create the Football table
CREATE TABLE Football (
    Name VARCHAR(50) NOT NULL,
    Age INT NOT NULL
)
--Inner Join: Retrieves rows that have matching values in both tables
SELECT *
FROM Cricket
INNER JOIN Football ON Cricket.Name = Football.Name


--Left Join (or Left Outer Join): Retrieves all rows from the left table (Cricket) and 
--the matched rows from the right table (Football)
SELECT *
FROM Cricket
LEFT JOIN Football ON Cricket.Name = Football.Name


--Right Join (or Right Outer Join): Retrieves all rows from the right table (Football) and 
--the matched rows from the left table (Cricket).
SELECT *
FROM Cricket
RIGHT JOIN Football ON Cricket.Name = Football.Name


--Full Outer Join (or Full Join): Retrieves all rows from both tables
SELECT *
FROM Cricket
FULL OUTER JOIN Football ON Cricket.Name = Football.Name


--Cross Join (or Cartesian Join): Produces the Cartesian product of both tables, meaning 
--it combines each row from the first table with every row from the second table
SELECT *
FROM Cricket
CROSS JOIN Football


--A self join is when a table is joined with itself

SELECT c1.name AS player1_name, c2.name AS player2_name, c1.age
FROM Cricket c1
JOIN Cricket c2 ON c1.age = c2.age
WHERE c1.name <> c2.name; -- Ensures we don't match a player with themselves
