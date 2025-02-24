
---- Table Customer

CREATE TABLE CUSTOMER
(
CUSTOMER_ID INT,
FIRST_NAME VARCHAR(50),
LAST_NAME VARCHAR(50),
MIDDLE_NAME VARCHAR(50),
ADDRESS_LINE1 VARCHAR(80),
ADDRESS_LINE2 VARCHAR(80),
CITY VARCHAR(40),
COUNTRY VARCHAR(50),
DATE_ADDED DATE,
REGION VARCHAR(10)
);

SELECT * FROM CUSTOMER

---- Table product

CREATE TABLE PRODUCT
( PRODUCT_ID INT,
PRODUCT_NAME VARCHAR(100),
STANDARD_COST DECIMAL(10,2),
COLOR VARCHAR(20),
LIST_PRICE DECIMAL(10,2),
PRODUCT_SIZE DECIMAL(8,2),
WEIGHT DECIMAL(10,2),
PRODUCT_CATEGORY VARCHAR(20)
);

--- Table Sales 

CREATE TABLE SALES
( SALES_DATE DATE,
ORDER_ID INT,
PRODUCT_ID INT,
CUSTOMER_ID DECIMAL(5,0),
SALESPERSON_ID DECIMAL(5,0),
QUANTITY DECIMAL(4,0),
UNIT_PRICE DECIMAL(10,2),
SALES_AMOUNT DECIMAL(10,2),
TAX_AMOUNT DECIMAL(10,2),
TOTAL_AMOUNT DECIMAL(10,2)
);

--- Table Sales History 

CREATE TABLE SALES_HISTORY
( SALES_DATE DATE,
ORDER_ID INT,
PRODUCT_ID INT,
CUSTOMER_ID DECIMAL(5,0),
SALESPERSON_ID DECIMAL(5,0),
QUANTITY DECIMAL(4,0),
UNIT_PRICE DECIMAL(10,2),
SALES_AMOUNT DECIMAL(10,2),
TAX_AMOUNT DECIMAL(10,2),
TOTAL_AMOUNT DECIMAL(10,2)
);

--- Table  Salesperson

CREATE TABLE SALESPERSON
( SALESPERSON_ID INT,
JOB_TITLE VARCHAR(80),
FIRST_NAME VARCHAR(50),
LAST_NAME VARCHAR(50),
MIDDLE_NAME VARCHAR(50),
ADDRESS_LINE1 VARCHAR(80),
ADDRESS_LINE2 VARCHAR(80),
CITY VARCHAR(40),
COUNTRY VARCHAR(50),
DATE_ADDED DATE,
MANAGER VARCHAR(20)
);


INSERT INTO CUSTOMER(CUSTOMER_ID,FIRST_NAME,LAST_NAME,MIDDLE_NAME,ADDRESS_LINE1,ADDRESS_LINE2,CITY,
COUNTRY,DATE_ADDED,REGION)
VALUES(10,'JOHN','AMIRTHRAJ','T','2345 PETERDRIVE',null,'Atlanta','USA','12-JAN-15','SOUTH'),
(11,'TOM','JOSEPH','A','123SANDY DRIVE',null,'New York','USA','12-JAN-15','SOUTH'),
(12,'PETER','MANN','J','3456 GATES DRIVE',null,'Washington','USA','13-JAN-15','NORTH'
);

INSERT INTO PRODUCT(PRODUCT_ID,PRODUCT_NAME,STANDARD_COST,COLOR,LIST_PRICE,PRODUCT_SIZE,WEIGHT,
PRODUCT_CATEGORY)
VALUES(100,'Mobile Cover',30,null,35,10,100,'Mobile'),
(200,'Samsung F7100',80,'BLACK',35,6,50,'Mobile'),
(106,'Microsoft Keyboard 7865',50,'BLACK',60,3,20,'Computer'),
(501,'Microsoft Mouse 7863',30,'GREY',40,1,25,'Computer'),
(101,'iPhone',500,'GOLD',600,6,20,'Mobile');

SELECT * FROM PRODUCT




SELECT * FROM SALES


INSERT INTO SALES_HISTORY(SALES_DATE,ORDER_ID,PRODUCT_ID,CUSTOMER_ID,SALESPERSON_ID,QUANTITY,UNIT_PRICE,
SALES_AMOUNT,TAX_AMOUNT,TOTAL_AMOUNT)
VALUES('01-JAN-15',1267,100,10,1000,2,20,40,4,44),
('01-JAN-15',1267,101,10,1000,2,30,60,6,66),
('07-JAN-15',1268,100,11,2000,10,30,300,30,330);

SELECT * FROM SALES_HISTORY


INSERT INTO SALESPERSON(SALESPERSON_ID,JOB_TITLE,FIRST_NAME,LAST_NAME,MIDDLE_NAME,ADDRESS_LINE1,ADDRESS_LINE2,CITY,COUNTRY,DATE_ADDED,MANAGER)
VALUES(1000,'Supervisor','Peter','Mann','R','4567 ashfordroad',null,'Atlanta','USA','12-JAN-14','Tom'),
(2000,'Supervisor','John','King','A','67 dunwoody road',null,'Las Vegas','USA','14-JAN-14','Tom'),
(3000,'Supervisor','Bob','Moris','A','679 glendrigedr',null,'Orlando','USA','14-FEB-14','Raj'),
(4000,'President','Jeff','Afonso','B','234 peachtreetree st',null,'California','USA','14-FEB-14',null),
(5000,'Manager','Raj','Kishore','J','456 walTers cir',null,'Miami','USA','15-FEB-14','Jeff'),
(6000,'Entry Level','Sonu','Agarwal','I','458+ gandhi road',null,'New York','USA','16-FEB-14','Peter'),
(7000,'Supervisor','Greg','Chappel','U','345 seneca ct',null,'Boston','USA','17-FEB-14','Raj'),
(8000,'Entry Level','Rehman','Ahmed','E','908 peter drive',null,'Atlanta','USA','18-FEB-14','Bob'), 
(9000,'Entry Level','Patel','Hari',null,'47890 hammond dr',null,'Orlando','USA','19-FEB-14','Peter'),
(10000,'Manager','Tom','Joseph','O','789 califooor st',null,'California','USA','20-FEB-14','Jeff'),
(11000,'Entry Level','Anil','Krishna','P','2354 king st',null,'Miami','USA','21-FEB-14','Greg'),
 (12000,'Entry Level','James','Gavin','W','456 chris ave',null,'New York','USA','22-FEB-14','John'),
(13000,'Entry Level','Sara','K','E','678 larawd st',null,'Mississippi','USA','23-FEB-14','Bob');

SELECT * FROM SALESPERSON


-- Customer & Sales Analysis:

-- Find the total number of customers by country.

SELECT COUNTRY, COUNT(*) AS TotalCustomers 
FROM CUSTOMER 
GROUP BY COUNTRY 
ORDER BY TotalCustomers DESC;


--  Identify the total sales revenue generated in each region.

SELECT C.REGION, SUM(S.TOTAL_AMOUNT) AS TotalRevenue
FROM SALES S
JOIN CUSTOMER C ON S.CUSTOMER_ID = C.CUSTOMER_ID
GROUP BY C.REGION
ORDER BY TotalRevenue DESC;

-- Find the top 3 customers who have spent the most.

SELECT TOP 3 C.CUSTOMER_ID, C.FIRST_NAME, C.LAST_NAME, SUM(S.TOTAL_AMOUNT) AS TotalSpent
FROM SALES S
JOIN CUSTOMER C ON S.CUSTOMER_ID = C.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID, C.FIRST_NAME, C.LAST_NAME
ORDER BY TotalSpent DESC;

-- Product Performance & Sales Insights:

-- Which product category generates the highest revenue?

SELECT P.PRODUCT_CATEGORY, SUM(S.TOTAL_AMOUNT) AS TotalRevenue
FROM SALES S
JOIN PRODUCT P ON S.PRODUCT_ID = P.PRODUCT_ID
GROUP BY P.PRODUCT_CATEGORY
ORDER BY TotalRevenue DESC;

-- Find the top-selling product by quantity.

SELECT TOP 1 P.PRODUCT_NAME, SUM(S.QUANTITY) AS TotalQuantitySold
FROM SALES S
JOIN PRODUCT P ON S.PRODUCT_ID = P.PRODUCT_ID
GROUP BY P.PRODUCT_NAME
ORDER BY TotalQuantitySold DESC;

-- Salesperson Performance

-- Find the top-performing salesperson based on total sales.

SELECT TOP 1 SP.FIRST_NAME, SP.LAST_NAME, SUM(S.TOTAL_AMOUNT) AS TotalSales
FROM SALES S
JOIN SALESPERSON SP ON S.SALESPERSON_ID = SP.SALESPERSON_ID
GROUP BY SP.FIRST_NAME, SP.LAST_NAME
ORDER BY TotalSales DESC;

-- Count how many orders each salesperson has handled

SELECT SP.FIRST_NAME, SP.LAST_NAME, COUNT(DISTINCT S.ORDER_ID) AS TotalOrders
FROM SALES S
JOIN SALESPERSON SP ON S.SALESPERSON_ID = SP.SALESPERSON_ID
GROUP BY SP.FIRST_NAME, SP.LAST_NAME
ORDER BY TotalOrders DESC;

-- Historical Sales Trends

-- Compare sales revenue between current and past sales records

SELECT 
    'Current Sales' AS SalesType, SUM(S.TOTAL_AMOUNT) AS TotalRevenue
FROM SALES S
UNION ALL
SELECT 
    'Historical Sales' AS SalesType, SUM(SH.TOTAL_AMOUNT) AS TotalRevenue
FROM SALES_HISTORY SH;


--  Find the average unit price of products sold in each year.

SELECT YEAR(SALES_DATE) AS Year, AVG(UNIT_PRICE) AS AvgUnitPrice
FROM SALES
GROUP BY YEAR(SALES_DATE)
ORDER BY Year;


--  Miscellaneous Challenges

--  Identify customers who have made more than one purchase.

SELECT CUSTOMER_ID, COUNT(*) AS PurchaseCount
FROM SALES
GROUP BY CUSTOMER_ID
HAVING COUNT(*) > 1;

-- Find the most frequently used product color in sales

SELECT TOP 1 P.COLOR, COUNT(*) AS ColorCount
FROM SALES S
JOIN PRODUCT P ON S.PRODUCT_ID = P.PRODUCT_ID
WHERE P.COLOR IS NOT NULL
GROUP BY P.COLOR
ORDER BY ColorCount DESC;

-- Calculate the tax contribution from each country.

SELECT C.COUNTRY, SUM(S.TAX_AMOUNT) AS TotalTax
FROM SALES S
JOIN CUSTOMER C ON S.CUSTOMER_ID = C.CUSTOMER_ID
GROUP BY C.COUNTRY
ORDER BY TotalTax DESC;


-- Create a Stored Procedure to Get Customer Purchase History
-- Write a stored procedure that retrieves all purchases made by a specific customer based on their CUSTOMER_ID.

CREATE PROCEDURE GetCustomerPurchaseHistory 
    @CustomerID INT
AS
BEGIN
    SELECT S.SALES_DATE, S.ORDER_ID, P.PRODUCT_NAME, S.QUANTITY, S.TOTAL_AMOUNT
    FROM SALES S
    JOIN PRODUCT P ON S.PRODUCT_ID = P.PRODUCT_ID
    WHERE S.CUSTOMER_ID = @CustomerID
    ORDER BY S.SALES_DATE DESC;
END;

-- USAGE: 
EXEC GetCustomerPurchaseHistory @CustomerID = 10;


-- Create a Stored Procedure for Monthly Sales Summary
-- Write a stored procedure that returns the total revenue, total quantity sold, and total orders for a given month and year.

CREATE PROCEDURE GetMonthlySalesSummary 
    @Year INT, @Month INT
AS
BEGIN
    SELECT 
        COUNT(DISTINCT ORDER_ID) AS TotalOrders,
        SUM(QUANTITY) AS TotalQuantitySold,
        SUM(TOTAL_AMOUNT) AS TotalRevenue
    FROM SALES
    WHERE YEAR(SALES_DATE) = @Year AND MONTH(SALES_DATE) = @Month;
END;

-- USAGE:
EXEC GetMonthlySalesSummary @Year = 2020, @Month = 1;


-- Create a Trigger to Prevent Negative Sales Amounts
-- Ensure that no negative sales amounts are inserted into the SALES table.

CREATE TRIGGER PreventNegativeSales
ON SALES
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM INSERTED WHERE TOTAL_AMOUNT < 0)
    BEGIN
        RAISERROR('Sales amount cannot be negative!', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;


-- Create a Trigger to Log Sales Changes
-- Create a trigger that logs any updates to the SALES table into a new table SALES_LOG to track changes.

-- Step 1: Create the Log Table

CREATE TABLE SALES_LOG (
    LOG_ID INT IDENTITY(1,1) PRIMARY KEY,
    ORDER_ID INT,
    OLD_TOTAL_AMOUNT DECIMAL(10,2),
    NEW_TOTAL_AMOUNT DECIMAL(10,2),
    UPDATED_AT DATETIME DEFAULT GETDATE()
);


-- Step 2: Create the Trigger

CREATE TRIGGER LogSalesUpdates
ON SALES
AFTER UPDATE
AS
BEGIN
    INSERT INTO SALES_LOG (ORDER_ID, OLD_TOTAL_AMOUNT, NEW_TOTAL_AMOUNT)
    SELECT D.ORDER_ID, D.TOTAL_AMOUNT, I.TOTAL_AMOUNT
    FROM DELETED D
    JOIN INSERTED I ON D.ORDER_ID = I.ORDER_ID
    WHERE D.TOTAL_AMOUNT <> I.TOTAL_AMOUNT;
END;



-- Create a View for Sales Performance by Salesperson
-- Create a view that shows each salesperson's total sales and number of orders.

CREATE VIEW SalesPerformance AS
SELECT 
    SP.SALESPERSON_ID,
    SP.FIRST_NAME + ' ' + SP.LAST_NAME AS Salesperson,
    COUNT(DISTINCT S.ORDER_ID) AS TotalOrders,
    SUM(S.TOTAL_AMOUNT) AS TotalRevenue
FROM SALES S
JOIN SALESPERSON SP ON S.SALESPERSON_ID = SP.SALESPERSON_ID
GROUP BY SP.SALESPERSON_ID, SP.FIRST_NAME, SP.LAST_NAME;


-- USAGE:
SELECT * FROM SalesPerformance ORDER BY TotalRevenue DESC;


-- Create a View for Customer Order Summary
-- Show each customer's total spend, number of orders, and last order date.


CREATE VIEW CustomerOrderSummary AS
SELECT 
    C.CUSTOMER_ID,
    C.FIRST_NAME + ' ' + C.LAST_NAME AS CustomerName,
    COUNT(DISTINCT S.ORDER_ID) AS TotalOrders,
    SUM(S.TOTAL_AMOUNT) AS TotalSpent,
    MAX(S.SALES_DATE) AS LastOrderDate
FROM SALES S
JOIN CUSTOMER C ON S.CUSTOMER_ID = C.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID, C.FIRST_NAME, C.LAST_NAME;


-- USAGE:
SELECT * FROM CustomerOrderSummary ORDER BY TotalSpent DESC;

























