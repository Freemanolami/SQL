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


UPDATE Wine1
SET Year = '2022-12-15'
WHERE Wine_id = 'W003';

ALTER TABLE Wine1
ADD Price DECIMAL(6, 2);



ALTER TABLE Wine1
ALTER COLUMN Degree FLOAT;


DELETE FROM Harvest1
WHERE Prod_num = 'P030';

DELETE FROM Producers1
WHERE Prod_num = 'P030';


DELETE FROM Harvest1
WHERE Wine_id IN (
  SELECT Wine_id
  FROM Wine1
  WHERE Category = 'Blue wine'
);

DELETE FROM Wine1
WHERE Category = 'Blue wine';


SELECT *
FROM Wine1
WHERE YEAR(Year) = 2023 AND Degree > 10;


SELECT *
FROM Producers1
ORDER BY Last_name DESC;


SELECT Harvest_id, Wine_id, Prod_num, Units / 10 AS Units_Multiple_of_10
FROM Harvest1;
