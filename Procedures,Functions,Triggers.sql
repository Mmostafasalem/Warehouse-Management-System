CREATE PROCEDURE CreateOrder
    @EmployeeID INT,
    @OrderDate DATE
AS
BEGIN
    INSERT INTO Orders (OrderDate, EmployeeID)
    VALUES (@OrderDate, @EmployeeID);
END;
--SQL Stored Procedure


CREATE FUNCTION GetOrderTotal (@OrderID INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @Total DECIMAL(10,2);
    SELECT @Total = SUM(p.Price * op.Quantity)
    FROM Order_Products op
    INNER JOIN Products p ON op.ProductID = p.ProductID
    WHERE op.OrderID = @OrderID;
    RETURN @Total;
END;
--Function

CREATE TRIGGER UpdateStockAfterOrder
ON Order_Products
AFTER INSERT
AS
BEGIN
    DECLARE @ProductID INT, @Quantity INT;
    SELECT @ProductID = ProductID, @Quantity = Quantity FROM inserted;
    UPDATE Products
    SET QuantityInStock = QuantityInStock - @Quantity
    WHERE ProductID = @ProductID;
END;
--Trigger

BEGIN TRANSACTION;

INSERT INTO Orders (OrderDate, EmployeeID)
VALUES ('2024-12-12', 1);

DECLARE @OrderID INT = SCOPE_IDENTITY();

INSERT INTO Order_Products (OrderID, ProductID, Quantity)
VALUES (@OrderID, 1, 5);

UPDATE Products
SET QuantityInStock = QuantityInStock - 5
WHERE ProductID = 1;

COMMIT;
--Manual Transaction