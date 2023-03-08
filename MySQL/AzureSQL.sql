-- 1. CREATION OF A TABLE - Syntax
CREATE TABLE (Table_name)(
	(Attribute_name1) (Data_type1) (IFF Key),
	(Attribute_name2) (Data_type2),
	(Attribute_name3) (Data_type3) (IFF Key),
	);

CREATE TABLE Student(
	NUID INT PRIMARY KEY,
	First_name VARCHAR(12),
	Last_name VARCHAR(12),
	Drone_id INT
	);

-- Adding and removing an attrbiute to the table
ALTER TABLE Student ADD Gpa DECIMAL(3,2);
ALTER TABLE Student DROP COLUMN Gpa;

-- 3. Inserting an attribute in a table
ALTER TABLE (Table_name) ADD (Attribute_name) (Data_type);
ALTER TABLE Student ADD Gpa DECIMAL(3,2);
SELECT * FROM Student;

INSERT INTO Student VALUES(94849312, 'Puranjit', 'Singh', 2, 3.2)

-- DELETING A TABLE
DROP TABLE (Table_name);
DROP TABLE Student;

-- 4. INSERTING DATA INTO A TABLE (enter eleements in the correct order)
INSERT INTO (Table_name) VALUES()

INSERT INTO Student VALUES(6, 'Jack', 'Singh', 2);
INSERT INTO Student VALUES(7, 'Nancy', 'Singh', 1);
INSERT INTO Student VALUES(8, 'Paul', 'Singh', 1);
INSERT INTO Student VALUES(9, 'Henry', 'Singh', 2);
INSERT INTO Student VALUES(10, 'Katie', 'Singh', 2);
INSERT INTO Student VALUES(6, 'JB', NULL, 2);

-- DISPLAY THE TABLE
SELECT * FROM (Table_name)
SELECT * FROM Student;

CREATE TABLE Drone(
	Drone_id INT PRIMARY KEY,
	Drone_name VARCHAR(30),
	Date_p DATETIME
	);

-- INSERTING VALUES INTO THE TABLE
INSERT INTO Drone VALUES(1, 'DJI_Phantom_4', '08-04-2019 13:00:00');
INSERT INTO Drone VALUES(2, 'DJI Matric 300 RTK', '08-04-2021 11:00:00');

-- 5. Displaying the full table
SELECT * FROM Drone;
-- Displaying limited columns
SELECT Drone_name, Date_p FROM Drone;

-- 6. UPDATE VALUES IN A TABLE
UPDATE (Table_name) SET (Attribute_name) = '__'
WHERE (Attribute_name) = '____'

UPDATE Drone SET Drone_name = 'DJI_300'
WHERE Drone_name = 'DJI Matric 300 RTK';

-- 7. DELETING ROWS IN A TABLE
DELETE FROM (Table_name);

DELETE FROM (Table_name)
WHERE (Attribute_name) = '____'

DELETE FROM Drone
WHERE Drone_id = 2;

DELETE FROM Student;
SELECT * FROM Student;

--FILTERING IN A DATABASE
SELECT First_name, Drone_id
FROM Student WHERE NUID <= 3;

SELECT Drone_name, Date_p  FROM
Drone ORDER BY Date_p DESC;

-- MULTIPLE CONDITIONS
SELECT First_name, Drone_id
FROM Student WHERE NUID <= 3 AND Drone_id = 1;

SELECT * FROM Student
WHERE First_name IN ('Jack', 'Nancy', 'Paul'); 
