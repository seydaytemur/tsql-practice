--select *from Products
--select* from Products
--where 
--	CategoryID=(select CategoryID from Categories where CategoryName='Seafood')
--	and UnitsInStock>50 or SupplierID=(select supplierID from suppliers where city='germany')

--select ORDERID,COMPANYNAME,ORDERDATE,ShipName FROM Orders

--INNER JOIN 
--	Customers ON ORDERS.CustomerID = Customers.CustomerID

--SELECT LastName,FirstName,Title FROM Employees
--inner join
--EmployeeTerritories on Employees.EmployeeID=EmployeeTerritories.EmployeeID

--select TerritoryDescription,EmployeeID from Territories
--inner join 
--EmployeeTerritories on EmployeeTerritories.TerritoryID=Territories.TerritoryID

--SELECT dbo.Orders.OrderID, dbo.Orders.ShipName, dbo.Orders.CustomerID, dbo.Orders.EmployeeID, dbo.Employees.EmployeeID AS Expr1, dbo.Employees.FirstName, dbo.Employees.LastName, dbo.Customers.Address, 
--                  dbo.EmployeeTerritories.TerritoryID
--FROM     dbo.Orders INNER JOIN
--                  dbo.Employees ON dbo.Orders.EmployeeID = dbo.Employees.EmployeeID INNER JOIN
--                  dbo.Customers ON dbo.Orders.CustomerID = dbo.Customers.CustomerID INNER JOIN
--                  dbo.EmployeeTerritories ON dbo.Employees.EmployeeID = dbo.EmployeeTerritories.EmployeeID
--use Northwind
--select Title from Employees

--select FirstName,LastName from Employees where hiredate > 1998-08-08

--select Title from Employees where EmployeeID>4

--select CompanyName,ContactTitle,City,Country from Customers
--inner join 
--orders on customers.CustomerID=orders.CustomerID

--select OrderDate from Orders where OrderDate>1995
--select CompanyName from Customers where City='london'
 --select ShipCountry from Orders where EmployeeID=4

--select OrderID,orderdate,ShipCity,ShipCity from Orders
--where OrderDate > 1995-08-08

--select CompanyName,Address,City,Country from Customers
--where City LIKE '%BER%'

--select ShipAddress,orderdate,ShipCountry,ShipName from Orders
--where OrderDate < GETDATE()

--select ShipVia as gemiVasitasiyla
--from Orders
--inner join
--Customers on orders.customerID=customers.customerID
--group by 
--ShipVia
--order by 
--gemiVasitasiyla desc

--select UnitPrice as birimfiyat,ProductName as urunadi,UnitsInStock as stokadedi
--from Products
--order by
--urunadi desc
--select OrderID,ShipName,ShipCity from Orders
--where OrderDate<GETDATE()

--insert into 
--Orders(ShipName,ShipCity,ShipCountry)
--values('Gelincik','Ýzmir','TURKEY')

--select ShipCity from Orders
--where ShipCountry LIKE '%TURKEY%'

--update Orders
--set ShipName ='Kuzguncuk'
--where
--orderId=10248;

--update Orders
--set ShipCountry='TURKEY'
--where
--OrderID=10252;

--select shipname,ShipCountry,OrderId from Orders
--where
--OrderID=10252;
 
--delete from Customers
--where 
--CustomerID=CHOPS;

--select CompanyName,
--len(companyName) as isimUzunlugu
--from Customers

--select country,
--UPPER(country) as buyukHarf
--from Customers

--select productID,categoryID,productname as urunadi from Products
--group by 
--productID,categoryID,productname
--order by urunadi asc

--select CustomerID,ShipName,ShipCountry,ShippedDate from Orders
--order by 
--ShippedDate desc

--select ProductName,ProductID,UnitsInStock,UnitsInStock+20 as 'yeniUnitStock' 
--from Products

--select ProductName as 'urunadi',ProductID,CategoryID from Products
--where SupplierID >10

--select Employees.LastName,Employees.firstname,Orders.ShipCountry from Employees,Orders
--select*from Customers
--insert into Customers (CustomerID,ContactName,City,Country)values('RONAL','Asos Process','ronaldinho','Ýzmir','Turkey')

--select CEILING(freight)as yuvarlama from Orders

--select sum(UnitsInStock) as toplamStok from Products

--select datediff(MONTH,'1997-02-02','1998-07-04')

--select ShipName ,count(ShipCountry)  from Orders group by ShipName

--select FirstName,LastName ,count(title)as baslik from Employees group by firstname,LastName

--select TitleOfCourtesy,COUNT(TitleOfCourtesy) as 'adet' from Employees group by TitleOfCourtesy

--select productname,min(UnitsInSTock)as 'enAzUrun',max(UnitsInStock) as 'enFazlaUrun' from Products
--where UnitsInStock<=15
--group by ProductName

--select productname,count(supplierID) as 'saglayiciID' from Products 
--where SupplierID>1
--group by ProductName

--select Country,count(CompanyName)as 'SehirSayisi' from customers group by Country order by Country

--select City,count(CompanyName)as 'firma_sayisi' from Customers group by City

--select UnitPrice,max(UnitPrice) as 'maxBirimFiyati',min(UnitPrice) as 'minBirimFiyati' from Products group by UnitPrice

--select ShipName,count(ShipCountry) as 'ulkeSayisi',
--sum(shipvia)as 'gemiVasitasiyla'
--from orders 
--group by 
--shipname
--having
--sum(ShipVia)>10

--select CompanyName,ShipName from Customers,Orders 
--where 
--customers.CustomerID=Orders.CustomerID

--select city,shipcountry from Orders o inner join customers c
--on 
--o.CustomerID=c.CustomerID2

--select TerritoryDescription from Territories
--except
--select TerritoryID from EmployeeTerritories

--select* from Territories where RegionId=1

--select* from customers 
--where City in(select distinct City from customers where City='london')

--select CompanyName,count(*) as 'sirketSayisi' from Customers group by companyname

--select *  from Products where ProductName=(select productname from Products where ProductID=15)
  
  
--select City ,count(*) as 'sayi'
--from customers
--where customers.Address <> ''
--group by city
--having count(*) > 2

                  
--SELECT CustomerID,EmployeeID,ShipCountry FROM Orders WHERE EmployeeID=1

