CREATE PROCEDURE CreateOrder
    @EmployeeID INT,
    @OrderDate DATE
AS
BEGIN
    -- Check if EmployeeID exists in Employees table
    IF EXISTS (SELECT 1 FROM Employees WHERE EmployeeID = @EmployeeID)
    BEGIN
        -- Insert order if it doesn't exist
        IF NOT EXISTS (
            SELECT 1
            FROM Orders
            WHERE EmployeeID = @EmployeeID
            AND OrderDate = @OrderDate
        )
        BEGIN
            INSERT INTO Orders (OrderDate, EmployeeID)
            VALUES (@OrderDate, @EmployeeID);
            PRINT 'Order created successfully.';
        END
        ELSE
        BEGIN
            PRINT 'Order already exists.';
        END
    END
    ELSE
    BEGIN
        PRINT 'Invalid EmployeeID. Employee not found.';
    END
END;

EXEC CreateOrder @EmployeeID = 1, @OrderDate = '2023-11-22';

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
DECLARE @TotalOrderCost DECIMAL(10,2);
SET @TotalOrderCost = dbo.GetOrderTotal(30); -- Replace 456 with the desired order ID
PRINT @TotalOrderCost;

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