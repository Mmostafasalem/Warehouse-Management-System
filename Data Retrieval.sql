SELECT --Aggregate 
    SupplierID, 
    COUNT(*) AS TotalProducts, 
    SUM(Price * QuantityInStock) AS TotalStockValue, 
    AVG(Price) AS AveragePrice
FROM Products
GROUP BY SupplierID;

SELECT * FROM Products --Pagination
ORDER BY ProductID
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

SELECT * FROM Products
ORDER BY Price DESC;
--Sorting