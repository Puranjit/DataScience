CREATE TABLE Employee(
    Emp_id INT PRIMARY KEY,
    First_name VARCHAR(15),
    Last_name VARCHAR(15),
    Birth_day DATE,
    Gender VARCHAR(1),
    Salary INT,
    Super_id INT,
    Branch_id INT
);

CREATE TABLE Branch(
    Branch_id INT PRIMARY KEY,
    Branch_name VARCHAR(20),
    Mgr_id INT,
    Mgr_start_date DATE,
    FOREIGN KEY(Mgr_id) REFERENCES Employee(Emp_id) ON DELETE SET NULL
);

ALTER TABLE Employee
ADD FOREIGN KEY(Branch_id)
REFERENCES Branch(Branch_id)
ON DELETE SET NULL;

ALTER TABLE Employee
ADD FOREIGN KEY(Super_id)
REFERENCES Employee(Emp_id)
ON DELETE SET NULL

CREATE TABLE Client(
    Client_id INT Primary Key,
    Client_name VARCHAR(25),
    Branch_id INT,
    FOREIGN Key(Branch_id) REFERENCES Branch(Branch_id) ON DELETE SET NULL
);

CREATE TABLE Works_with(
    Emp_id INT,
    Client_id INT,
    Total_sales INT,
    PRIMARY KEY(Emp_id, Client_id),
    FOREIGN KEY(Emp_id) REFERENCES Employee(Emp_id) ON DELETE CASCADE,
    FOREIGN KEY(Client_id) REFERENCES Client(Client_id) ON DELETE CASCADE
);

CREATE TABLE Branch_supplier(
    Branch_id INT,
    Supplier_name VARCHAR(30),
    Suppy_type VARCHAR(30),
    PRIMARY KEY(Branch_id, Supplier_name),
    FOREIGN KEY(Branch_id) REFERENCES Branch(Branch_id) ON DELETE CASCADE
);

-- Corporate
INSERT INTO Employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);

INSERT INTO Branch VALUES(1, 'Corporate', 100, '2006-02-09');

UPDATE Employee
SET Branch_id = 1 
WHERE Emp_id = 100;

INSERT INTO Employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);

UPDATE Employee
SET Branch_id = 2
WHERE Emp_id = 103

-- Scranton
INSERT INTO Employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

INSERT INTO Branch VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE Employee
SET Branch_id = 2
WHERE Emp_id = 102;

INSERT INTO Employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO Employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO Employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

--Stamford
INSERT INTO Employee VALUES(106, 'Porter', 'Josh', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO Branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE Employee
SET Branch_id = 3
WHERE Emp_id = 106;

INSERT INTO Employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO Employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 69000, 106, 3);

SELECT * FROM Employee;
SELECT * FROM Branch;
SELECT * FROM Client;
SELECT * FROM Works_with;

DROP TABLE Works_with;
DROP TABLE Client;

--CLIENT
INSERT INTO Client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO Client VALUES(401, 'Lackawana Country', 2);
INSERT INTO Client VALUES(402, 'FedEx', 3);
INSERT INTO Client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO Client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO Client VALUES(405, 'Times Newspaper', 3);
INSERT INTO Client VALUES(406, 'FedEx', 2);

--Works_with
INSERT INTO Works_with VALUES(105, 400, 55000);
INSERT INTO Works_with VALUES(102, 401, 267000);
INSERT INTO Works_with VALUES(108, 402, 22500);
INSERT INTO Works_with VALUES(107, 403, 5000);
INSERT INTO Works_with VALUES(108, 403, 12000);
INSERT INTO Works_with VALUES(105, 404, 33000);
INSERT INTO Works_with VALUES(107, 405, 26000);
INSERT INTO Works_with VALUES(102, 406, 15000);
INSERT INTO Works_with VALUES(105, 406, 130000);

--Branch_supplier
INSERT INTO Branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO Branch_supplier VALUES(2, 'Uni-ball', 'Writing utensils');
INSERT INTO Branch_supplier VALUES(3, 'Patriot paper', 'Paper');
INSERT INTO Branch_supplier VALUES(2, 'J.T. Forms and Labels', 'Custom forms');
INSERT INTO Branch_supplier VALUES(3, 'Uni-ball', 'Writing utensils');
INSERT INTO Branch_supplier VALUES(3, 'Hammer mill', 'Paper');
INSERT INTO Branch_supplier VALUES(3, 'Stamford Labels', 'Custom forms');


SELECT * FROM Works_with
ORDER BY Client_id ASC

SELECT * 
FROM Employee
LIMIT 5;
--ORDER BY Gender, First_name, Last_name

SELECT First_name
FROM Employee;

SELECT First_name AS Forename, Last_name AS Surname
FROM Employee;

SELECT DISTINCT Gender
FROM Employee;

SELECT DISTINCT Branch_id
FROM Employee;

-- FUNCTIONS IN SQL
-- Find the number of Employess
SELECT COUNT(Emp_id)
FROM Employee;

SELECT COUNT(Super_id)
FROM Employee;

-- Find the number of female employees born after 1970
SELECT COUNT(Emp_id)
FROM Employee
WHERE Gender = 'F' AND Birth_day > '1971-01-01';

SELECT * FROM Employee

-- FIND the avg of salaries of all employees
SELECT AVG(Salary)
FROM Employee
WHERE Gender = 'M';

SELECT SUM(Salary)
FROM Employee;

-- AGGREGATION
-- FIND NO OF MALES AND FEMALES WORKING IN COMPANY
SELECT COUNT(Gender), Gender
FROM Employee
GROUP BY Gender;

-- FIND TOTAL SALES OF EACH SALESMAN
SELECT SUM(Total_sales), Emp_id
FROM Works_with
GROUP BY Emp_id;

SELECT SUM(Total_sales), Client_id
FROM Works_with
GROUP BY Client_id;

--WILDCARDS (Searching Application)
-- FIND ANY CLIENT'S WHO ARE AN LLC
SELECT *
FROM CLIENT
WHERE Client_name LIKE '%LLC';

SELECT *
FROM Employee
WHERE Birth_day LIKE '____-10-__';

SELECT * 
FROM Client 
WHERE Client_name LIKE '%school%';


--UNIONS (Combine multiple select statements)
--RULE - BOTH STATEMENTS SHOULD HAVE SAME NO OF COLUMNS THAT ARE RETURNED AS WELL AS DATATYPE
-- FIND A LIST OF EMPLOYEE AND BRANCH NAMES
SELECT First_name
FROM Employee
UNION
SELECT Branch_name FROM Branch;

--Find a list of all clients and branch suppliers names
SELECT Client_name, Client.Branch_id
FROM Client
UNION
SELECT Supplier_name, Branch_supplier.Branch_id
FROM Branch_supplier;

--FIND ALL THE MONEY SPENT OR EARNED BY THE COMPANY
SELECT Salary FROM Employee UNION SELECT Total_sales FROM Works_with;

SELECT * FROM Employee;
SELECT * FROM Branch;
SELECT * FROM Client;
SELECT * FROM Works_with;
SELECT * FROM Branch_supplier;

--JOINS
INSERT INTO Branch VALUES(4, 'Buffalo', NULL, NULL);

--FIND ALL BRANCHES AND NAMES OF THEIR MANAGERS
-- INNER, LEFT, RIGHT, FULL OUTER (Not Supported by  MySQL)
SELECT Employee.Emp_id, Employee.First_name, Branch.Branch_name
SELECT Emp_id, First_name, Branch_name
FROM Employee
JOIN Branch 
ON Employee.Emp_id = Branch.Mgr_id;

--Find names of all employess who have sold over 30k to a single client
SELECT Works_with.Emp_id
FROM Works_with
WHERE Works_with.Total_sales > 30000;

SELECT Employee.First_name, Employee.Last_name
FROM Employee
WHERE Employee.Emp_id IN(
    SELECT Works_with.Emp_id
    FROM Works_with
    WHERE Works_with.Total_sales > 30000
);

--FIND ALL CLIENTS WHO ARE HANDLED BY THE BRANCH
--THAT MICHAEL SCOTT MANAGES
--ASSUME MICHAELS ID IS KNOWN
SELECT Client.Client_name
FROM Client
WHERE Client.Branch_id = 2;

SELECT Client.Client_name
FROM Client
WHERE Client.Branch_id = (
    SELECT Branch.Branch_id
    FROM Branch
    WHERE Branch.Mgr_id = 102
    LIMIT 1
);

SELECT Client.Client_name
FROM Client
WHERE Client.Branch_id = (
    SELECT Branch.Branch_id
    FROM Branch
    WHERE Branch.Mgr_id = (
        SELECT Employee.Emp_id
        FROM Employee
        WHERE Employee.Last_name LIKE '%Scott%'
        LIMIT 1
    )
);

SELECT Client.Client_name
FROM Client
WHERE Client.Branch_id = 2;

SELECT Employee.Emp_id
FROM Employee
WHERE Employee.Last_name LIKE '%Scott%';

DELETE FROM Employee
WHERE Emp_id = 102;

SELECT * FROM Branch;
SELECT * FROM Employee;
SELECT * FROM Branch_supplier;

DELETE FROM Branch
WHERE Branch_id = 4;

DELETE FROM Branch_supplier
WHERE Branch_id = 2;