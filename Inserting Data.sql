INSERT INTO Suppliers (SupplierName, ContactName, ContactEmail)
VALUES
    ('ABC Supplies', 'John Doe', 'johndoe@abc.com'),
    ('XYZ Corp', 'Jane Smith', 'janesmith@xyz.com'),
    ('Tech Warehouse', 'Michael Johnson', 'mjohnson@techwh.com'),
    ('Global Merchants', 'Sara Lee', 'sara.lee@global.com'),
    ('Fast Parts', 'David White', 'david@fastparts.com'),
    ('Elite Goods', 'Anna Brown', 'anna@elitegoods.com'),
    ('Prime Products', 'James Black', 'james@prime.com'),
    ('Quick Supplies', 'Linda Green', 'linda@quicksupplies.com'),
    ('Advanced Tools', 'Chris Blue', 'chris@advancedtools.com'),
    ('Top Sellers', 'Robert Clark', 'robert@topsellers.com'),
    ('Innovative Supplies', 'Alice Walker', 'alice@innovativesupplies.com'),
    ('Best Tools', 'Gregory Scott', 'greg@besttools.com'),
    ('Durable Goods', 'Laura King', 'laura@durablegoods.com'),
    ('Worldwide Products', 'Steven Harris', 'steven@wwproducts.com'),
    ('Express Parts', 'Rachel Evans', 'rachel@expressparts.com'),
    ('Modern Supplies', 'Eric Turner', 'eric@modernsupplies.com'),
    ('Next Gen Supplies', 'Tom Harris', 'tom@nextgen.com'),
    ('Eco-Friendly Goods', 'Megan Lee', 'megan@ecofriendlygoods.com'),
    ('Reliable Products', 'Peter Young', 'peter@reliableproducts.com');

	INSERT INTO Products (ProductName, QuantityInStock, Price, SupplierID)
VALUES
    ('Laptop', 100, 799.99, 1),
    ('Mouse', 200, 19.99, 2),
    ('Keyboard', 150, 49.99, 2),
    ('Monitor', 80, 199.99, 1),
    ('External Hard Drive', 120, 59.99, 3),
    ('USB Flash Drive', 500, 15.99, 4),
    ('Webcam', 75, 89.99, 5),
    ('Router', 60, 129.99, 6),
    ('Smartphone', 50, 699.99, 7),
    ('Tablet', 90, 299.99, 8),
    ('Desk Chair', 40, 129.99, 9),
    ('Office Desk', 30, 259.99, 10),
    ('Printer', 70, 150.99, 2),
    ('Projector', 25, 399.99, 5),
    ('HDMI Cable', 600, 10.99, 6),
    ('Headphones', 150, 79.99, 7),
    ('Router Cable', 500, 5.99, 4),
    ('Gaming Mouse', 120, 39.99, 3),
    ('Wireless Keyboard', 100, 69.99, 2);

	INSERT INTO Employees (FirstName, LastName, Position, DateHired)
VALUES
    ('John', 'Doe', 'Warehouse Manager', '2018-03-10'),
    ('Jane', 'Smith', 'Inventory Clerk', '2020-01-15'),
    ('Michael', 'Johnson', 'Stock Associate', '2021-06-05'),
    ('Sara', 'Lee', 'Shipping Coordinator', '2019-11-20'),
    ('David', 'White', 'Operations Manager', '2017-08-25'),
    ('Anna', 'Brown', 'Logistics Supervisor', '2022-09-12'),
    ('James', 'Black', 'Warehouse Worker', '2023-02-18'),
    ('Linda', 'Green', 'Inventory Specialist', '2020-04-09'),
    ('Chris', 'Blue', 'Order Fulfillment', '2021-07-11'),
    ('Robert', 'Clark', 'Quality Control', '2023-05-15');

	INSERT INTO Orders (OrderDate, EmployeeID)
VALUES
    ('2024-12-01', 1),
    ('2024-12-02', 2),
    ('2024-12-03', 3),
    ('2024-12-04', 4),
    ('2024-12-05', 5),
    ('2024-12-06', 6),
    ('2024-12-07', 7),
    ('2024-12-08', 8),
    ('2024-12-09', 9),
    ('2024-12-10', 10);

	INSERT INTO Shipments (OrderID, ShipmentDate, Status)
VALUES
    (1, '2024-12-03', 'Shipped'),
    (2, '2024-12-04', 'Pending'),
    (3, '2024-12-05', 'Shipped'),
    (4, '2024-12-06', 'Delivered'),
    (5, '2024-12-07', 'Pending'),
    (6, '2024-12-08', 'Shipped'),
    (7, '2024-12-09', 'Pending'),
    (8, '2024-12-10', 'Shipped'),
    (9, '2024-12-11', 'Delivered'),
    (10, '2024-12-12', 'Shipped');

	INSERT INTO Order_Products (OrderID, ProductID, Quantity)
VALUES
    (1, 1, 2),
    (1, 3, 3),
    (2, 2, 5),
    (2, 4, 2),
    (3, 5, 1),
    (3, 6, 4),
    (4, 7, 2),
    (4, 8, 1),
    (5, 9, 2),
    (5, 10, 3),
    (6, 11, 1),
    (6, 12, 2),
    (7, 13, 1),
    (7, 14, 3),
    (8, 15, 4),
    (8, 16, 2),
    (9, 17, 2),
    (9, 18, 3),
    (10, 19, 5),
    (10, 20, 2);

	DECLARE @Counter INT = 0;

WHILE @Counter < 200
BEGIN
    INSERT INTO Suppliers (SupplierName, ContactName, ContactEmail)
    VALUES
        ('Supplier ' + CAST(@Counter AS VARCHAR), 
        'Contact ' + CAST(@Counter AS VARCHAR), 
        'contact' + CAST(@Counter AS VARCHAR) + '@supplier.com');
    SET @Counter = @Counter + 1;
END

DECLARE @Counter INT = 0;

WHILE @Counter < 200
BEGIN
    INSERT INTO Products (ProductName, QuantityInStock, Price, SupplierID)
    VALUES
        ('Product ' + CAST(@Counter AS VARCHAR), 
        (RAND() * 500) + 1, -- Random quantity from 1 to 500
        (RAND() * 200) + 10, -- Random price from 10 to 210
        (ABS(CHECKSUM(NEWID())) % 20) + 1); -- Random SupplierID between 1 and 20
    SET @Counter = @Counter + 1;
END

DECLARE @Counter INT = 0;

WHILE @Counter < 200
BEGIN
    INSERT INTO Employees (FirstName, LastName, Position, DateHired)
    VALUES
        ('Employee' + CAST(@Counter AS VARCHAR), 
        'Lastname' + CAST(@Counter AS VARCHAR), 
        CASE 
            WHEN @Counter % 5 = 0 THEN 'Manager'
            WHEN @Counter % 5 = 1 THEN 'Clerk'
            WHEN @Counter % 5 = 2 THEN 'Worker'
            WHEN @Counter % 5 = 3 THEN 'Supervisor'
            ELSE 'Coordinator'
        END, 
        DATEADD(DAY, - (ABS(CHECKSUM(NEWID())) % 3650), GETDATE())); -- Random hire date in the last 10 years
    SET @Counter = @Counter + 1;
END

DECLARE @Counter INT = 0;

WHILE @Counter < 200
BEGIN
    INSERT INTO Orders (OrderDate, EmployeeID)
    VALUES
        (DATEADD(DAY, - (ABS(CHECKSUM(NEWID())) % 30), GETDATE()), -- Random order date within the last month
        (ABS(CHECKSUM(NEWID())) % 20) + 1); -- Random EmployeeID between 1 and 20
    SET @Counter = @Counter + 1;
END

DECLARE @Counter INT = 0;

WHILE @Counter < 200
BEGIN
    INSERT INTO Shipments (OrderID, ShipmentDate, Status)
    VALUES
        (ABS(CHECKSUM(NEWID())) % 200 + 1, -- Random OrderID between 1 and 200
        DATEADD(DAY, - (ABS(CHECKSUM(NEWID())) % 30), GETDATE()), -- Random shipment date within the last month
        CASE 
            WHEN @Counter % 3 = 0 THEN 'Shipped'
            WHEN @Counter % 3 = 1 THEN 'Pending'
            ELSE 'Delivered'
        END);
    SET @Counter = @Counter + 1;
END

DECLARE @Counter INT = 0;

WHILE @Counter < 200
BEGIN
    INSERT INTO Order_Products (OrderID, ProductID, Quantity)
    VALUES
        ((ABS(CHECKSUM(NEWID())) % 200) + 1, -- Random OrderID between 1 and 200
        (ABS(CHECKSUM(NEWID())) % 200) + 1, -- Random ProductID between 1 and 200
        (ABS(CHECKSUM(NEWID())) % 10) + 1); -- Random quantity between 1 and 10
    SET @Counter = @Counter + 1;
END
