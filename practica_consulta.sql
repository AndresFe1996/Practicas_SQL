
SELECT TOP(100) 
CONCAT (A.FirstName,' ',A.LastName) AS Name_sales,
B.OrderID,
B.OrderDate,
B.RequiredDate,
B.ShippedDate,
B.EmployeeID,
A.Title,
C.SaleAmount,
C.CompanyName
FROM dbo.Orders B

INNER JOIN dbo.Employees A
	ON A.EmployeeID=B.EmployeeID
INNER JOIN dbo.[Sales Totals by Amount] C
	ON B.OrderID=C.OrderID


SELECT TOP(100) * FROM dbo.Invoices