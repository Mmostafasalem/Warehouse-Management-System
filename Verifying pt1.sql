--tables
SELECT * 
FROM information_schema.tables 
WHERE table_type = 'BASE TABLE' AND table_schema = 'dbo';

--FK constraints
SELECT 
    fk.name AS FK_name,
    tp.name AS Parent_table,
    ref.name AS Referenced_table
FROM sys.foreign_keys fk
JOIN sys.tables tp ON fk.parent_object_id = tp.object_id
JOIN sys.tables ref ON fk.referenced_object_id = ref.object_id;

--  indexes on tables
SELECT 
    t.name AS Table_name,
    i.name AS Index_name,
    i.type_desc AS Index_type
FROM sys.indexes i
JOIN sys.tables t ON i.object_id = t.object_id
WHERE t.name IN ('Orders', 'Shipments', 'Products', 'Employees');

--Data
SELECT TOP 10 * FROM Suppliers;

SELECT TOP 10 * FROM Products;

SELECT TOP 10 * FROM Orders;

SELECT TOP 10 * FROM Shipments;

--Inserted Data for Consistency
-- Check consistency for OrderID in Shipments
SELECT * FROM Shipments WHERE OrderID NOT IN (SELECT OrderID FROM Orders);

-- Check consistency for ProductID in Order_Products
SELECT * FROM Order_Products WHERE ProductID NOT IN (SELECT ProductID FROM Products);

-- Check consistency for EmployeeID in Orders
SELECT * FROM Orders WHERE EmployeeID NOT IN (SELECT EmployeeID FROM Employees);

--Verify Sample Aggregates and Counts
-- Check the total quantity in stock for all products
SELECT SUM(QuantityInStock) AS TotalStock FROM Products;

-- Check the number of orders
SELECT COUNT(*) AS TotalOrders FROM Orders;

-- Check the total price of all orders
SELECT SUM(Price) AS TotalOrderValue FROM Products
JOIN Order_Products ON Products.ProductID = Order_Products.ProductID;

---- Insert a new order
INSERT INTO Orders (OrderDate, EmployeeID) 
VALUES (GETDATE(), 1);

-- Insert a new product
INSERT INTO Products (ProductName, QuantityInStock, Price, SupplierID) 
VALUES ('New Product', 100, 25.99, 5);

--Test update 
-- Update a product's price
UPDATE Products
SET Price = 19.99
WHERE ProductID = 1;

-- Update an order's status
UPDATE Orders
SET OrderStatus = 'Shipped'
WHERE OrderID = 1;



