--Creation of flight record table
CREATE TABLE Flight_record(
	Flight_no INT PRIMARY KEY, 
	Date_flight DATETIME, 
	NUID INT, 
	Drone_id INT, 
	Truck_id INT
	);

--Creation of a names table
CREATE TABLE Names_table(
	NUID INT PRIMARY KEY, 
	First_name VARCHAR(20),
	Last_name VARCHAR(20), 
	Phone_number BIGINT
	);

--Adding the FOREIGN KEY
ALTER TABLE Flight_record
ADD FOREIGN KEY(NUID)
REFERENCES Names_table(NUID);

--Creation of Drones_names table 
CREATE TABLE Drone_table(
	Drone_id INT PRIMARY KEY, 
	Drone_name VARCHAR(30),
	Date_purchased DATETIME
	);

--Define Drone_id as a foreign key in the Flight_record table
ALTER TABLE Flight_record
ADD FOREIGN KEY(Drone_id)
REFERENCES Drone_table(Drone_id);

--Create Truck Table 
CREATE TABLE Truck_table(
	Truck_id INT PRIMARY KEY, 
	Truck_name VARCHAR(30),
	Truck_plate VARCHAR(10)
	);

--Define Truck_id as a foreign key in the Flights_record table
ALTER TABLE Flight_record
ADD FOREIGN KEY(Truck_id)
REFERENCES Truck_table(Truck_id);

--Insertion of values into a table (will not work until we insert values into the foreign key tables)
INSERT INTO Flight_record VALUES(1, '2020-05-05 11:00:00', 1,1,1);

--Insert values into Tables 
INSERT INTO Names_table VALUES(100, 'John', 'Wick', 3526520474);
INSERT INTO Names_table VALUES(110, 'Peter', 'Parker', 4024053487);
INSERT INTO Names_table VALUES(120, 'Dwayne', 'Johnson', 4319997713);
INSERT INTO Names_table VALUES(130, 'James', 'Bond', 8872131333);

--Return/Display the entries that you have inserted into the table 
SELECT * FROM Names_table; --Selects the entire table
SELECT First_name FROM Names_table; --Selects First_name column from table
SELECT First_name, Last_name FROM Names_table; --Selects First_name and Last_name column from table

--Insert Data into Drone_table
--Syntax to write DATETIME values 'YYYY-MM-DD HR:MM:SC'
INSERT INTO Drone_table VALUES(1, 'DJI Phantom 4', '2020-05-01 13:00:00');
INSERT INTO Drone_table VALUES(2, 'Matrice 300 R', '2020-08-08 13:00:00');
UPDATE Drone_table SET Drone_name = 'DJI Matrice 300 RTK' --update drone name because I messed up when creating the table
Where Drone_name = 'Matrice 300 R'; 

--Return/Display the entries inserted into the Drone_table 
SELECT * FROM Drone_table

--Insert values into the Truck tables 
INSERT INTO Truck_table VALUES(1, 'Ford150', 'UAV123');
INSERT INTO Truck_table VALUES(2, 'RAM200', 'GHI877');
INSERT INTO Truck_table VALUES(3, 'Chevrolet', 'POI900');

--Return/Display the entries inserted into the Truck_table 
SELECT * FROM Truck_table

--Insert values into Flight_record table 
INSERT INTO Flight_record VALUES(1, '2022-05-01 13:00:00', 100, 1, 1);
INSERT INTO Flight_record VALUES(2, '2022-05-81 13:00:00', 110, 2, 2);
INSERT INTO Flight_record VALUES(3, '2022-05-15 13:00:00', 120, 2, 3);
INSERT INTO Flight_record VALUES(4, '2022-05-22 13:00:00', 130, 2, 1);
INSERT INTO Flight_record VALUES(5, '2022-05-29 13:00:00', 100, 1, 2);
INSERT INTO Flight_record VALUES(6, '2022-06-05 13:00:00', 130, 2, 3);
INSERT INTO Flight_record VALUES(7, '2022-06-12 13:00:00', 120, 1, 1);
INSERT INTO Flight_record VALUES(8, '2022-06-19 13:00:00', 120, 2, 2);
INSERT INTO Flight_record VALUES(9, '2022-06-26 13:00:00', 100, 2, 1);
INSERT INTO Flight_record VALUES(10, '2022-07-03 13:00:00', 110, 2, 3);
INSERT INTO Flight_record VALUES(11, '2022-07-10 13:00:00', 100, 1, 1);
INSERT INTO Flight_record VALUES(12, '2022-07-17 13:00:00', 110, 1, 2);
INSERT INTO Flight_record VALUES(13, '2022-07-24 13:00:00', 120, 2, 3);
INSERT INTO Flight_record VALUES(14, '2022-07-31 13:00:00', 130, 1, 2);
INSERT INTO Flight_record VALUES(15, '2022-08-07 13:00:00', 100, 2, 2);
INSERT INTO Flight_record VALUES(16, '2022-08-14 13:00:00', 130, 2, 1);
INSERT INTO Flight_record VALUES(17, '2022-08-21 13:00:00', 120, 2, 2);
INSERT INTO Flight_record VALUES(18, '2022-08-28 13:00:00', 120, 2, 3);
INSERT INTO Flight_record VALUES(19, '2022-09-04 13:00:00', 100, 1, 1);
INSERT INTO Flight_record VALUES(20, '2022-09-11 13:00:00', 110, 2, 1);

--Return/Display the entries inserted into the Flight_record table 
SELECT * FROM Flight_record;

--Example
SELECT First_name FROM Names_table; 
SELECT First_name AS forename FROM  Names_table; --Changes First_name to forename when it displays the results

--Order By 
SELECT * FROM Names_table 
ORDER BY First_name DESC; 

SELECT DISTINCT NUID FROM Flight_record; --displays only one of each NUID 

--Update Names table to change Dwayne Johnson to Harry Styles
UPDATE Names_table SET First_Name = 'Harry'
WHERE First_name = 'Dwayne'; 

UPDATE Names_table SET Last_Name = 'Styles' 
WHERE Last_name = 'Johnson';

--Display Names_table to see that changes were made
SELECT * FROM Names_table;

--START OF ASSIGNMENT 3

--1. Insert the name of a new person into the Names table
INSERT INTO Names_table VALUES(140, 'Timothée', 'Chalamet', 6789998212); 
--1. Return/display all names on the table 
SELECT * FROM Names_table;

--2. Return/display only the NUID and Drone_id in the Flight_record table.
SELECT NUID, Drone_id FROM Flight_record;

--3. Return/display when 'DJI Phantom 4' was purchased 
SELECT Date_purchased FROM Drone_table WHERE Drone_name = 'DJI Phantom 4';

--4. Update the name of 'DJI Matrice 300 RTK' to 'DJI 300' in the Drone-table
UPDATE Drone_Table SET Drone_name = 'DJI 300' WHERE Drone_name = 'DJI Matrice 300 RTK';
--4. Return/display Drone_table to check it was successful 
SELECT * FROM Drone_Table;

--5. Bonus: Return/display NUID, Drone_id, Truck_id for all the dates in July month.
SELECT NUID, Drone_id, Truck_id FROM Flight_record WHERE Date_flight >= '2022-07-01 00:00:00' AND Date_flight <= '2022-07-31 23:59:59';
