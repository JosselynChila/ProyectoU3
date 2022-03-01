Select * From Category;
--Shipper--
Select Distinct ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry,
CompanyName,Phone
From [Order] 
Inner Join Shipper On [Order].ShipVia = Shipper.Id
Group By ShipName;
------------------------------------------------
Select Distinct Id, TerritoryDescription From Territory;
Select * From Region;
Select * From Customer;
Select Id, ProductName, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued From Product;
Select * From Supplier;
Select * From Employee;
--Tabla de hechos
Select [Order].Id As OrderId,Customer.Id As CustomerId, 
Employee.Id As EmployeeId, Product.Id As ProductosId, 
Category.Id As CategoryId, Shipper.Id As ShipperId,
Territory.Id As TerritoryId, Supplier.Id As SupplierId,
OrderDetail.UnitPrice As UnitPrice, OrderDetail.Quantity,
OrderDetail.Discount As Discount
From OrderDetail
Inner Join [Order] On OrderDetail.OrderId = [Order].Id
Inner Join Customer On [Order].CustomerId = Customer.Id
Inner Join Employee On [Order].EmployeeId = Employee.Id
Inner Join Product On OrderDetail.ProductId = Product.Id
Inner Join Category On Product.CategoryId = Category.Id
Inner Join Shipper On [Order].ShipVia = Shipper.Id
Inner Join EmployeeTerritory On EmployeeTerritory.EmployeeId = Employee.Id
Inner Join Territory On EmployeeTerritory.TerritoryId = Territory.Id   
Inner Join Supplier On Product.SupplierId = Supplier.Id
Group By [Order].Id;
------------------------------Copo de nieve------------------------------
--Dim_Categoria
Select * From Category;
--Dim_Producto
Select * From Product;
--Dim_Supplier
Select id, CompanyName, id AS ContactId, id AS DireccionId, Phone, Fax, HomePage From Supplier;
--Dim_ContactSupplier;
Select id As ContactoSupplierID, ContactName, ContactTitle From Supplier;
--Dim_DireccionSupplier
Select id As DireccionSupplierID, Address, City, Region, PostalCode  From Supplier;
--Dim_Shipper
Select * From Shipper;
--Dim_ShipOrder
Select [Order].ShipVia, [Order].ShipName,
[Order].ShipAddress, [Order].ShipCity, [Order].ShipRegion,
[Order].ShipPostalCode, [Order].ShipCountry
From [Order];
--Dim_TitleEmployees
Select Title, TitleOfCourtesy 
From Employee
Group By Title;
--Dim_DireccionEmployees
Select Address, City, Region, PostalCode, Country 
From Employee;
--Dim_Employees
Select Id, LastName,FirstName,BirthDate,HireDate,
HomePhone,Extension, Photo,Notes, ReportsTo,PhotoPath
From Employee;
--Dim_Territories
Select id,TerritoryDescription, RegionId From Territory;
--Dim_EmployeeTerritory
Select * From EmployeeTerritory;
--Dim_Region
Select * From Region;
--Dim_Customer
Select CompanyName, Phone, Fax From Customer;
--Dim_DireccionCustomer
Select Address, City, Region, PostalCode, Country 
From Customer;
--Dim_ContactoCustomer
Select ContactName
From Customer;
--Dim_ContactoTCustomer
Select ContactTitle
From Customer Group By ContactTitle;

Select [Order].Id As OrderId,Customer.Id As CustomerId, 
Employee.Id As EmployeeId, Product.Id As ProductosId,[Order].Freight,
OrderDetail.UnitPrice, OrderDetail.Quantity,OrderDetail.Discount 
From OrderDetail
Inner Join [Order] On OrderDetail.OrderId = [Order].Id
Inner Join Customer On [Order].CustomerId = Customer.Id
Inner Join Employee On [Order].EmployeeId = Employee.Id
Inner Join Product On OrderDetail.ProductId = Product.Id
Inner Join Category On Product.CategoryId = Category.Id
Inner Join Shipper On [Order].ShipVia = Shipper.Id
Inner Join EmployeeTerritory On EmployeeTerritory.EmployeeId = Employee.Id
Inner Join Territory On EmployeeTerritory.TerritoryId = Territory.Id   
Inner Join Supplier On Product.SupplierId = Supplier.Id
Group By [Order].Id;

