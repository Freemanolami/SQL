-- ASSIGNMENT SOLUTION

-- Use the database
USE Wine;

-- Create the Wine table
CREATE TABLE Wine1 (
  Wine_id VARCHAR(50) PRIMARY KEY,
  Category VARCHAR(50),
  Year DATE,
  Degree INT
);

-- Create the Producers table
CREATE TABLE Producers1 (
  Prod_num VARCHAR(50) PRIMARY KEY,
  First_name VARCHAR(50),
  Last_name VARCHAR(50),
  Region VARCHAR(50)
);

-- Create the Harvest table
CREATE TABLE Harvest1 (
  Harvest_id VARCHAR(50) PRIMARY KEY,
  Wine_id VARCHAR(50),
  Prod_num VARCHAR(50),
  Units INT,
  FOREIGN KEY (Wine_id) REFERENCES Wine1(Wine_id),
  FOREIGN KEY (Prod_num) REFERENCES Producers1(Prod_num)
);

-- Insert values into the Wine table
INSERT INTO Wine1 (Wine_id, Category, Year, Degree)
VALUES 
('W001','Red wine','2023-05-02',9),
('W002','Red wine','2023-04-02',14),
('W003','Black wine','2023-02-03',22),
('W004','Blue wine','2023-07-23',10),
('W005','Black wine','2023-08-25',9),
('W006','Black wine','2023-07-13',20),
('W012','Blue wine','2023-07-06',11),
('W008','Black wine','2023-06-11',10),
('W009','Blue wine','2023-07-04',12),
('W010','Red wine','2023-06-10',13);

-- Insert values into the Producers table
INSERT INTO Producers1 (Prod_num, First_name, Last_name, Region)
VALUES 
('P020','Bunusa','Ombugadu','Awonge'),
('P021','Echuku','Kasuwa','Shinge'),
('P022','Anna','Angbalaga','Lagos'),
('P023','Atari','Ebuga','Sousse'),
('P024','Innocent','Agabi','Nasarawa Eggon'),
('P025','Olusha','Bala','Awonge'),
('P026','Precious','Dasen','Railway Axis'),
('P027','Nicholas','Yunana','Ikoyi'),
('P029','Dolapo','Musbau','Sousse'),
('P030','Kenneth','Eze','Benue');

-- Insert values into the Harvest table
INSERT INTO Harvest1 (Harvest_id, Wine_id, Prod_num, Units)
VALUES 
('Harv001','W002','P020',230),
('Harv002','W003','P023',365),
('Harv003','W005','P025',450),
('Harv004','W004','P026',200),
('Harv005','W001','P029',310),
('Harv006','W006','P030',120),
('Harv007','W008','P024',280),
('Harv008','W009','P021',314),
('Harv009','W012','P022',417),
('Harv010','W009','P027',166);


SELECT * FROM Wine1

SELECT * FROM Producers1

SELECT * FROM Harvest1

--	The year of the wine with Wine_id = 'W003' was incorrectly recorded. Update it to '2022-12-15'.
  
UPDATE Wine1
SET Year = '2022-12-15'
WHERE Wine_id = 'W003';

-- The Wine table is missing a column to store the price per bottle. Write an SQL statement to add a Price DECIMAL(6,2) column to the Wine table.

ALTER TABLE Wine1
ADD Price DECIMAL(6, 2);

-- 	The Degree column in the Wine table should be changed to FLOAT instead of INT to allow decimal values. Write the SQL statement to modify the column type.

ALTER TABLE Wine1
ALTER COLUMN Degree FLOAT;

-- The producer with Prod_num = 'P030' has retired and should be removed from the database. Write the SQL statement to delete this producer.

DELETE FROM Harvest1
WHERE Prod_num = 'P030';

DELETE FROM Producers1
WHERE Prod_num = 'P030';

-- All Blue wines should be removed from the database. Write the SQL statement to delete them.

DELETE FROM Harvest1
WHERE Wine_id IN (
  SELECT Wine_id
  FROM Wine1
  WHERE Category = 'Blue wine'
);

DELETE FROM Wine1
WHERE Category = 'Blue wine';


-- Retrieve all wines produced in 2023 with an alcohol degree greater than 10.

SELECT *
FROM Wine1
WHERE YEAR(Year) = 2023 AND Degree > 10;

-- 9.	Retrieve a list of all producers sorted by their last name in descending order.

SELECT *
FROM Producers1
ORDER BY Last_name DESC;

-- Write an SQL statement to show the units harvested in multiples of 10 (Divide the unites by 10)

SELECT Harvest_id, Wine_id, Prod_num, Units / 10 AS Units_Multiple_of_10
FROM Harvest1;
