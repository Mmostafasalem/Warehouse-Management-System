SELECT o.OrderID, p.ProductName, op.Quantity
FROM Orders o
INNER JOIN Order_Products op ON o.OrderID = op.OrderID
INNER JOIN Products p ON op.ProductID = p.ProductID;
--Join Two Tables

SELECT o.OrderID, p.ProductName, s.SupplierName, op.Quantity
FROM Orders o
INNER JOIN Order_Products op ON o.OrderID = op.OrderID
INNER JOIN Products p ON op.ProductID = p.ProductID
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID;
--Join Three Tables

--Create a View
CREATE VIEW OrderDetails AS
SELECT o.OrderID, p.ProductName, s.SupplierName, op.Quantity
FROM Orders o
INNER JOIN Order_Products op ON o.OrderID = op.OrderID
INNER JOIN Products p ON op.ProductID = p.ProductID
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID;
