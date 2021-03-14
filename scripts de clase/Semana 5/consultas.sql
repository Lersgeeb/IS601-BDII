
/* Cambiar tabla de Hechos Order  (le faltaba una columna) */
DROP TABLE Hechos_Orders;

CREATE TABLE Hechos_Orders (
    codigoId INT IDENTITY PRIMARY KEY,
    OrderID INT NOT NULL,
    EmployeesID INT NOT NULL,
    tiempoId DATE NOT NULL,
    ProductID INT NOT NULL,
    ShipVia INT NOT NULL,
    total_ventas_producto FLOAT
);



---------------------- PARA LA TABLA PRODUCTOS ----------------------
select ProductID, ProductName FROM Products

---------------------- PARA LA TABLA EMPLEADOS ----------------------
select EmployeeID, CONCAT( FirstName, ' ', LastName ) Nombre FROM Employees

---------------------- PARA LA TABLA TRANSPORTISTAS ----------------------
select shipperID, CompanyName FROM Shippers

---------------------- PARA LA TABLA TIEMPO ----------------------
SELECT CONVERT(DATE, OrderDate) tiempoId, DATEPART(YEAR, OrderDate) año,
DATEPART(MONTH, OrderDate) mes, DATEPART(WEEK, OrderDate) semana, 
DATEPART(QUARTER, OrderDate) trimestre, DATENAME(WEEKDAY, OrderDate) dia_semana 
From Orders
GROUP BY  Orders.OrderDate


---------------------- PARA LA TABLA HECHOS ORDENES ----------------------
SELECT Orders.OrderID, Orders.EmployeeID, Shippers.ShipperID, CONVERT(DATE, Orders.OrderDate) tiempoId, Products.ProductID,
SUM( [Order Details].Quantity * [Order Details].UnitPrice * (1-[Order Details].Discount))  total_venta_producto
FROM Orders
INNER JOIN [Order Details] ON Orders.OrderID=[Order Details].OrderID   
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
INNER JOIN Products ON Products.ProductID = [Order Details].ProductID
GROUP BY Orders.OrderID, Orders.EmployeeID, Shippers.ShipperID, Products.ProductID, Orders.OrderDate


--LIMPIAR TABLAS DE DIMENSIONES
DELETE FROM EMPLOYEES WHERE EmployeeID=?
DELETE FROM Products WHERE ProductID=?
DELETE FROM Shippers WHERE ShipperID=?
DELETE FROM tbltiempo WHERE tiempoId=?

DELETE FROM Hechos_Orders WHERE codigoId=?

