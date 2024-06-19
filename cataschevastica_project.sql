create database Cataschevastica;

use Cataschevastica;

-- define data types of the table


CREATE TABLE dbo.Supplier (
    SupplierID INT PRIMARY KEY,
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
	Email NVARCHAR(100) NOT NULL
);


CREATE TABLE dbo.RawMaterial (
    RawMaterialID INT PRIMARY KEY,
	SupplierID INT FOREIGN KEY REFERENCES Supplier(SupplierID),
    [Name] NVARCHAR(100),
    MeasureUnit NVARCHAR(50)
);



CREATE TABLE dbo.Customer (
    CustomerID INT PRIMARY KEY,
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
	PhoneNumber NVARCHAR(100),
	Email NVARCHAR(100) NOT NULL
);


CREATE TABLE dbo.Product (
    ProductID INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(100) ,
    SKU NVARCHAR(50) UNIQUE NOT NULL,
    [Length] DECIMAL(10, 2) ,
    Width DECIMAL(10, 2) ,
    Thickness DECIMAL(10, 2) ,
    [Weight] DECIMAL(10, 2) ,
    ColorFinish NVARCHAR(50),
    Compliance NVARCHAR(255) NOT NULL,
    CostPerUnit DECIMAL(10, 2) NOT NULL,
    ConstructionTime INT NOT NULL
);



CREATE TABLE dbo.[Order] (
    OrderID INT PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID),
	OrderDate DATETIME,
    [Status] NVARCHAR(50),
	LogisticID NVARCHAR(50),
	MemberID NVARCHAR(50),
	CompletionDate DATETIME,
    DeliveryDate DATETIME,
    CancellationDate DATETIME,
	);



CREATE TABLE dbo.ProductRawMaterial (
    ProductID INT,
    RawMaterialID INT,
	Quantity INT,
    PRIMARY KEY (ProductID, RawMaterialID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (RawMaterialID) REFERENCES RawMaterial(RawMaterialID)
);
CREATE TABLE dbo.OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT FOREIGN KEY REFERENCES [Order](OrderID),
    ProductID INT FOREIGN KEY REFERENCES Product(ProductID),
    Quantity INT
);



CREATE TABLE dbo.LogisticsPartner (
    LogisticID INT PRIMARY KEY,
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
    Email NVARCHAR(255) NOT NULL
);



CREATE TABLE dbo.ProdTeamMember (
    MemberID NVARCHAR(100) PRIMARY KEY,
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
	Email NVARCHAR(255) NOT NULL
);



-- populate the tables with values


INSERT INTO Product ([Name], SKU, [Length], Width, Thickness, [Weight], ColorFinish, Compliance, CostPerUnit, ConstructionTime)
VALUES 
    ('Concrete Mixer', 'SKU1001', 100.00, 50.00, 75.00, 300.00, 'Yellow', 'ISO 9001', 1500.00, 30),
    ('Cement Bag', 'SKU1002', 50.00, 50.00, 10.00, 50.00, 'Gray', 'ISO 9001', 5.00, 1),
    ('Steel Rebar', 'SKU1003', 1200.00, 1.00, 1.00, 25.00, 'Steel', 'ASTM A615', 2.50, 0),
    ('Construction Helmet', 'SKU1004', 30.00, 20.00, 15.00, 0.50, 'White', 'ANSI Z89.1', 10.00, 0),
    ('Safety Gloves', 'SKU1005', 25.00, 15.00, 5.00, 0.20, 'Blue', 'EN 388', 3.00, 0),
    ('Electric Drill', 'SKU1006', 40.00, 10.00, 15.00, 2.00, 'Black', 'CE', 75.00, 2),
    ('PVC Pipes', 'SKU1007', 200.00, 10.00, 10.00, 5.00, 'White', 'ASTM D1785', 12.00, 1),
    ('Insulation Foam', 'SKU1008', 100.00, 50.00, 10.00, 1.00, 'Green', 'ISO 9001', 20.00, 0),
    ('Wood Planks', 'SKU1009', 2400.00, 100.00, 25.00, 50.00, 'Natural', 'FSC', 15.00, 0),
    ('Brick Pallet', 'SKU1010', 100.00, 100.00, 50.00, 500.00, 'Red', 'ISO 9001', 300.00, 5);



INSERT INTO Supplier (SupplierID, FirstName, LastName, Email)
VALUES 
    (101, 'John', 'Pitt', 'john.pitt@gmail.com'),
    (102, 'Jane', 'Taylor', 'jane.taylor@hotmail.com'),
    (103, 'Serena', 'Johnson', 'serena.johnson@gmail.com'),
    (104, 'Emily', 'Paris', 'emily.paris@hotmail.com'),
    (105, 'Daniel', 'Grey', 'daniel.grey@gmail.com'),
    (106, 'Linda', 'Wilson', 'linda.wilson@outlook.com'),
    (107, 'Robert', 'Taylor', 'robert.taylor@gmail.com'),
    (108, 'Jeniffer', 'Anderson', 'jeniffer.anderson@hotmail.com'),
    (109, 'Charles', 'Thomas', 'charles.thomas@hotmail.com'),
    (110, 'Michael', 'Jackson', 'michael.jackson@hotmail.com');



INSERT INTO RawMaterial (RawMaterialID, SupplierID, [Name], MeasureUnit)
VALUES 
    (1, 101, 'Portland Cement', 'kg'),
    (2, 102, 'Coarse Aggregate', 'ton'),
    (3, 103, 'Fine Sand', 'kg'),
    (4, 104, 'Reinforcing Steel', 'meter'),
    (5, 105, 'Copper Wiring', 'meter'),
    (6, 103, 'PVC Conduit', 'meter'),
    (7, 107, 'Plywood Sheets', 'sheet'),
    (8, 108, 'Gypsum Board', 'sheet'),
    (9, 109, 'Structural Steel', 'ton'),
    (10, 102, 'Glass Panels', 'panel');



INSERT INTO LogisticsPartner (LogisticID, FirstName, LastName, Email) 
VALUES
    (1, 'Sophia', 'Williams', 'sophia.williams@speedylogistics.com'),
    (2, 'William', 'Jones', 'william.jones@fasttracktransit.com'),
    (3, 'Olivia', 'Garcia', 'olivia.garcia@globalfreight.com'),
    (4, 'James', 'Martinez', 'james.martinez@expressdeliveries.com'),
    (5, 'Ava', 'Hernandez', 'ava.hernandez@translogistics.com'),
    (6, 'Alexander', 'Young', 'alexander.young@quickshiplogistics.com'),
    (7, 'Mia', 'King', 'mia.king@freightmasters.com'),
    (8, 'William', 'Walker', 'william.walker@rapidtransport.com'),
    (9, 'Charlotte', 'Adams', 'charlotte.adams@efficientcarriers.com'),
    (10, 'Benjamin', 'Hall', 'benjamin.hall@swiftlogistics.com');

INSERT INTO ProdTeamMember (MemberID, FirstName, LastName, Email)
VALUES 
    ('M001', 'David', 'Miller', 'david.miller@cataschevastica.com'),
    ('M002', 'Emma', 'Thompson', 'emma.thompson@cataschevastica.com'),
    ('M003', 'Matthew', 'Clark', 'matthew.clark@cataschevastica.com'),
    ('M004', 'Olivia', 'White', 'olivia.white@cataschevastica.com'),
    ('M005', 'Andrew', 'Martin', 'andrew.martin@cataschevastica.com'),
    ('M006', 'Sophie', 'Harris', 'sophie.harris@cataschevastica.com'),
    ('M007', 'Ethan', 'Moore', 'ethan.moore@cataschevastica.com'),
    ('M008', 'Ava', 'Allen', 'ava.allen@cataschevastica.com'),
    ('M009', 'James', 'Young', 'james.young@cataschevastica.com'),
    ('M010', 'Grace', 'Roberts', 'grace.roberts@cataschevastica.com');



INSERT INTO Customer (CustomerID, FirstName, LastName, PhoneNumber, Email)
VALUES 
    (1001, 'Alice', 'Johnson', '123-456-7890', 'alice.johnson@gmail.com'),
    (1002, 'Bob', 'Smith', '234-567-8901', 'bob.smith@outlook.com'),
    (1003, 'Eva', 'Williams', '345-678-9012', 'eva.williams@hotmail.com'),
    (1004, 'Max', 'Brown', '456-789-0123', 'max.brown@gmail.com'),
    (1005, 'Sophie', 'Miller', '567-890-1234', 'sophie.miller@outlook.com'),
    (1006, 'David', 'Robinson', '678-901-2345', 'david.robinson@hotmail.com'),
    (1007, 'Sarah', 'Taylor', '789-012-3456', 'sarah.taylor@gmail.com'),
    (1008, 'Jake', 'Anderson', '890-123-4567', 'jake.anderson@hotmail.com'),
    (1009, 'Emma', 'Thomas', '901-234-5678', 'emma.thomas@hotmail.com'),
    (1010, 'Oliver', 'Davis', '012-345-6789', 'oliver.davis@gmail.com');



-- completion date when prodteam member confirms the order completion
--delivery date when the logistic partner makes the delivery
INSERT INTO [Order] (OrderID, CustomerID, OrderDate, [Status], LogisticID, MemberID, CompletionDate ,DeliveryDate , CancellationDate ) VALUES
(1, 1001, '2024-05-21 08:00:00', 'completed', 2, 'M001', '2024-05-21 14:00:00', '2024-05-22 10:00:00', NULL),
(2, 1002, '2024-05-21 10:00:00', 'in process', NULL, 'M004',NULL, NULL, NULL),
(3, 1002, '2024-05-3 12:00:00', 'cancelled', NULL, 'M004', NULL, NULL, '2024-05-3 14:00:00'),
(4, 1004, '2024-04-24 14:00:00', 'in delivery', 3, 'M001', '2024-04-24 18:00:00', NULL, NULL),
(5, 1005, '2024-05-5 16:00:00', 'completed', 4, 'M007', '2024-05-6 10:00:00', '2024-05-7 12:00:00', NULL),
(6, 1006, '2024-05-6 08:00:00', 'in process', NULL, 'M004', NULL, NULL, NULL),
(7, 1007, '2024-05-7 10:00:00', 'completed', 2, 'M005', '2024-05-8 14:00:00', '2024-05-9 10:00:00', NULL),
(8, 1008, '2024-05-8 12:00:00', 'in delivery', 1, 'M003', '2024-05-9 16:00:00', NULL, NULL),
(9, 1009, '2024-05-21 14:00:00', 'in process', NULL, 'M004', NULL, NULL, NULL),
(10, 1010, '2024-04-30 16:00:00', 'in process', NULL, 'M004', NULL, NULL, NULL );


INSERT INTO ProductRawMaterial (ProductID, RawMaterialID, Quantity) VALUES
(1, 1, 50),
(2, 2, 30),
(3, 3, 40),
(4, 4, 20),
(5, 5, 60),
(6, 6, 15),
(7, 1, 25),
(8, 3, 35),
(9, 2, 45),
(10, 4, 55);
 
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(1, 1, 1, 10),
(2, 2, 2, 5),
(3, 3, 3, 20),
(4, 4, 4, 15),
(5, 5, 1, 8),
(6, 6, 5, 12),
(7, 7, 2, 6),
(8, 8, 3, 10),
(9, 9, 4, 25),
(10, 10, 5, 18);
 

-- We consider that a new order has a state 'in process'
-- query ran on 22nd May
-- 4.a. List of all products ordered yesterday (so that production can start)
SELECT P.SKU, P.[Name], OD.Quantity
FROM [Order] O
INNER JOIN OrderDetails OD ON O.OrderID = OD.OrderID
INNER JOIN Product P ON OD.ProductID = P.ProductID
WHERE CAST(O.OrderDate AS DATE) = CAST(GETDATE() - 1 AS DATE) AND O.Status = 'in process' ;



--4.b. List of all finished orders ready to deliver
-- Completion date is defined to be the date when the products of the order have been produced
-- Delivery date is defined to be the date when the products have been delivered
SELECT O.OrderID
FROM [Order] O
WHERE CompletionDate IS NOT NULL AND DeliveryDate IS NULL AND CancellationDate IS NULL ;

--4.c List of all orders per customer, completed, pending, cancelled

SELECT CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName, O.Status, COUNT(*) AS OrderCount
FROM [Order] O
INNER JOIN Customer C ON O.CustomerID = C.CustomerID
WHERE O.[Status] IN ('completed', 'in process', 'cancelled')
GROUP BY CONCAT(C.FirstName, ' ', C.LastName), O.Status, C.CustomerID
ORDER BY C.CustomerID



-- 4 d. List of all products with quantities, ordered and delivered, ordered and pending, cancelledSELECT P.SKU, P.Name, O.Status, SUM(OD.Quantity) AS TotalQuantity
FROM Product P
INNER JOIN OrderDetails OD ON P.ProductID = OD.ProductID
INNER JOIN [Order] O ON OD.OrderID = O.OrderID
WHERE O.Status IN ('completed', 'in process', 'cancelled')
GROUP BY P.SKU, P.Name, P.ProductID, O.StatusORDER BY P.SKU--4 e. List of orders per production team employee, completed, pending, cancelledSELECT CONCAT(PTM.FirstName, ' ', PTM.LastName) AS MemberName, O.Status, COUNT(*) AS OrderCount
FROM [Order] O
INNER JOIN ProdTeamMember PTM ON O.MemberID = PTM.MemberID
WHERE O.Status IN ('completed', 'in process', 'cancelled')
GROUP BY    CONCAT(PTM.FirstName, ' ', PTM.LastName) , O.Status
ORDER BY OrderCount DESC;

 -- 4 f Daily order and production report 

-- Number of orders with their corresponding status per OrderDate (Daily Order Report)
select O.[Status] AS [Status] , CAST(O.OrderDate AS DATE) AS OrderDate, COUNT(*) AS NumberOfOrders
from [Order] O
group by  [Status], CAST(O.OrderDate AS DATE)

-- We extract the Quantity and Names of the Products that have been produced and are ready for being delivered (Daily Production Report)
SELECT P.[Name], OD.Quantity, CAST(O.CompletionDate AS [DATE]) AS CompletionDate
FROM [Order] O
INNER JOIN OrderDetails OD ON O.OrderID = OD.OrderID
INNER JOIN Product P ON OD.ProductID = P.ProductID
WHERE [Status] ='in delivery' 
ORDER BY CompletionDate

  --4 g List of new orders per week and monthSELECT  DATEPART (WEEK, OrderDate) AS WeekNumber,    DATEPART(MONTH, OrderDate) AS MonthNumber,    COUNT(*) AS NumberOfNewOrders
FROM [ORDER]
WHERE  Status = 'in process' 
GROUP BY    DATEPART(WEEK, OrderDate), DATEPART(MONTH, OrderDate)
ORDER BY    WeekNumber, MonthNumber;--4 h List of completed orders per week and monthSELECT  DATEPART (WEEK, OrderDate) AS WeekNumber,    DATEPART(MONTH, OrderDate) AS MonthNumber,    COUNT(*) AS NumberOfNewOrders
FROM [ORDER]
WHERE  Status = 'completed'
GROUP BY    DATEPART(WEEK, OrderDate), DATEPART(MONTH, OrderDate)
ORDER BY    WeekNumber, MonthNumber; --5  Provision of the necessary command statements to
--a. Create an order--Populate the Order table with the necessary values

INSERT INTO [Order] (OrderID, CustomerID, OrderDate, [Status], LogisticID, MemberID, CompletionDate, DeliveryDate, CancellationDate)
VALUES (15, 1001, '2024-05-23 09:00:00', 'in process', NULL, 'M001', NULL, NULL, NULL);

--Finalise production

--basic requirement to know which orderid we would like to finalize in production

-- When the production ends, A logistic partner will be assigned the order
UPDATE [Order]
SET [Status] = 'in delivery',
CompletionDate = '2024-05-23 14:00:00', LogisticID = 2
WHERE OrderID = 15;

 


-- Delivery has been Completed successfully (Delivery Finalized)

UPDATE [Order]
SET [Status] = 'completed',DeliveryDate ='2024-05-24 18:00:00'
WHERE OrderID = 15;

 
