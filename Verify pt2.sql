-- Delete a product and verify the corresponding order product is also deleted
DELETE FROM Products WHERE ProductID = 10;

-- Delete an order and check if related shipments and order products are deleted (with cascading)
DELETE FROM Orders WHERE OrderID = 1;

-- Join Products and Orders with aggregate function
SELECT p.ProductName, SUM(op.Quantity) AS TotalSold
FROM Products p
JOIN Order_Products op ON p.ProductID = op.ProductID
GROUP BY p.ProductName
ORDER BY TotalSold DESC;

-- Join Orders, Employees, and Shipments
SELECT o.OrderID, e.FirstName, s.Status
FROM Orders o
JOIN Employees e ON o.EmployeeID = e.EmployeeID
JOIN Shipments s ON o.OrderID = s.OrderID
WHERE s.Status = 'Shipped'
ORDER BY o.OrderDate DESC;

-- Paginate the first 10 orders
SELECT * FROM Orders
ORDER BY OrderDate DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

