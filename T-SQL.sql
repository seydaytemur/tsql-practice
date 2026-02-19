                      ----------TRANSACTION----------

--BEGIN TRANSACTION -- iþlemi baþlat 
--BEGIN TRY 
 
--INSERT INTO dbo.Orders(CustomerID,EmployeeID,ShipAddress,ShipCity,ShipCountry)
--VALUES ('SEYD',1,'Rumano Kazoka','Ýstanbul','Turkey')

--DECLARE @orderID int 
--SET @orderId =@@IDENTITY;

--INSERT INTO dbo.[Order Details](OrderID,ProductID,UnitPrice,Quantity,Discount)
--VALUES(@orderID,5,22.00,5,0);

--COMMIT TRANSACTION ;
--END TRY 

--BEGIN CATCH 
--PRINT 'sipariþ baþarýyla tamamlanamadý.'
--ROLLBACK TRANSACTION 
--END CATCH	

--BEGIN TRANSACTION 
--INSERT INTO dbo.Employees(FirstName,LastName,Title,City)
--VALUES ('Seyda','Ayt','Raven','Ýstanbul')
--select* from Employees
--ROLLBACK 

--BEGIN TRANSACTION 
--INSERT INTO Employees(FirstName,LastName,Notes,City,Country)
--VALUES('Brad','Pit','Education','Ohio','ABD')
--INSERT INTO Employees(FirstName,LastName,Notes,City,Country)
--VALUES('Tate','Mcrae','Sales','Washington','ABD')
--select* from Employees
--commit

                 --------TRIGGER--------

--CREATE TRIGGER Product_Increament
--ON Products
--AFTER INSERT 
--AS 
--UPDATE ProductInc set Inc+=1

--CREATE TRIGGER Product_Decrease
--ON Products
--AFTER DELETE
--AS 
--UPDATE ProductInc set Inc-=1

--CREATE TRIGGER Stock_Degeri
--ON PRODUCTS
--AFTER INSERT
--AS
--UPDATE Products_Stock set UnitStock=(select sum(unitsInStock) from Products) 

--CREATE TRIGGER INCREAMENT
--ON PRODUCTS
--AFTER INSERT 
--AS
--DECLARE @URUNSAYI INT 
--SELECT @URUNSAYI=Inc from inserted
--update ProductInc set Inc +=@URUNSAYI

                     --------VIEW----------
--CREATE VIEW TEST1
--as
--select * from Products

--select * from TEST1

--ALTER VIEW TEST1
--as
--select * from Products where UnitsInStock>50 AND ProductID<15

--select* from test1
 
                      ------------T-SQL------------

--declare @num int
--set @num=8
--select @num as 'Sayý'

--declare @Kisi varchar(20)
--set @Kisi='Mehtap'
--select @Kisi as 'Ýsim'

--declare @sayi1 int,@sayi2 int,@toplam int
--set @sayi1=20
--set @sayi2=30
--set @toplam=@sayi1+@sayi2
--select @toplam

--declare @sayi int,@birler int,@onlar int,@yüzler int,@toplam int
--set @sayi=456
--set @birler=@sayi%10
--set @onlar=(@sayi/10)%10
--set @yüzler=@sayi/100
--set @toplam=@birler+@onlar+@yüzler
--select @birler as 'birler',@onlar as 'onlar',@yüzler 'yüzler',@toplam 'toplam'

--declare @stok int
--set @stok=(select max(UnitsInStock) from Products)
--select @stok

--declare @MaxStock int
--set @MaxStock=(select max(UnitsInStock) from Products)
--select * from Products where UnitsInStock=@MaxStock

--declare @kisiler table
--(
--KisiID int identity(1,1),
--KisiAd varchar(10),
--KisiSehir varchar(15)
--)
--insert into @kisiler (KisiAd,KisiSehir) values ('seyd','istanbul')
--insert into @kisiler (KisiAd,KisiSehir) values ('eslem','Ankara')
--select KisiSehir from @kisiler where KisiSehir like '%i%'

--declare @stock int
--set @stock=(select sum(UnitsInStock) from Products)

--if @stock > 100
--print 'Toplam Ürün Sayisi 100 den büyüktür.'
--else
--print 'Toplam ürün sayisi 100 den küçüktür.'

	                  ------------CASE-------------

--select productname,UnitPrice,supplierId=
--case SupplierID
--when '28' then 'notebook'
--when '15' then 'ssd'
--when '17' then 'ram'
--end 
--from Products

--select shipname,ShipCity,EmployeeID=
--case employeeID
--when '4' then 'kadrolu'
--when '3' then 'emekli'
--when '6' then 'stajyer'
--end
--from orders

--select productname,supplierID,UnitPrice=
--case
--when UnitsInStock >5 and UnitsInStock  <20 then 'KRÝTÝK SEVÝYE'
--when UnitsInStock >=20 and UnitsInStock <30 then 'Ürün stogu orta seviyede'
--when UnitsInStock >=30 and UnitsInStock <50 then 'Ürün stogu tam ve yeterli seviyede'
--end
--from Products

--DECLARE @sayac int
--set @sayac=1
--while @sayac<=5
--begin
--print'T-SQL DERSLERÝ'
--set @sayac=@sayac+1
--end

--declare @i int
--set @i=0
--while @i<10
--begin 
--set @i+=1
--print @i
--end 

--declare @toplam int,@sayac int
--set @sayac=1
--set @toplam=0
--while (@sayac<=10)
--begin 
--set @toplam=@toplam+@sayac
--set @sayac+=1
--end 
--print '1 ile 10 arasýndaki sayýlar toplamý'
--print ''
--print @toplam

                        -------------WHILE---------

--declare @sayac int
--set @sayac=1
--while @sayac<=5
--begin
--print '"SQL Lessons"'
--set  @sayac=@sayac+1
--end

--declare @i int,@toplam int
--set @toplam=0
--set @i=1
--while (@i<10)
--begin
--set @toplam=@toplam+@i
--print '1 ile 10 arasýndaki sayýlar toplamý' 
--print @toplam
--set @i=@i+1
--end 

--while (select avg(UnitsInStock-UnitsOnOrder) from Products where CategoryID=2)<5
--begin
--update Products set UnitsInStock=UnitsInStock * 10/100 + UnitsInStock 
--select * from Products
--end
               -------------------------WAITFOR-------------------
--WAITFOR DELAY '00:00:03'
--INSERT INTO Products (Productname,SupplierID) values ('adaptör','2')
--select * from products

                      -----------------FUNCTIONS-----------

--CREATE FUNCTION STOKINC (@adet int)
--returns int 
--as
--begin
--return @adet+26
--end
--select ProductName,UnitsInStock,dbo.STOKINC(UnitsInStock) AS guncellenmis from Products

--CREATE FUNCTION STOCKSQR (@islem int)
--returns int
--as 
--begin
--return sqrt(@islem)*3
--end 
--select ProductName,productID,UnitsInStock,dbo.stocksqr(UnitsInStock)from products

--ALTER FUNCTION kucukharf (@isim varchar(20))
--returns varchar(20)
--as 
--begin 
--return lower(@isim)
--end 
--select CompanyName,ContactName,dbo.kucukharf(customerID) as kucukharf from Customers

--CREATE FUNCTION KDV (@fiyat decimal(18,2))
--returns decimal (18,2)
--as 
--begin 
--return @fiyat*1.18
--end
--select productname,dbo.KDV(UnitPrice) as kdvliFiyat from Products

--CREATE FUNCTION PINFO (@PID int)
--returns table
--as 
--return select* from Products where ProductID=@PID
--select * from dbo.PINFO(5)

                             ----------------------JOB------------------
--CREATE TABLE JobTablosu
--(
--ID int identity(1,1),
--metin varchar(20)
--)
--select * from jobtablosu

--select * from Categories

            ---------------------------------STORED PROCEDURE--------------------

--CREATE PROCEDURE PROCEDURE_TRIAL
--AS
--select firstname,LastName,CustomerID,shipname,shipcity from Employees
--inner join 
--Orders on employees.employeeID=orders.employeeID
--inner join EmployeeTerritories
--on EmployeeTerritories.EmployeeID=Employees.EmployeeID
--EXECUTE PROCEDURE_TRIAL

WITH(NOLOCK)
--CREATE PROCEDURE STOCK_STATE
--AS
--select ProductID,ProductName,UnitsInStock from Products where UnitsInStock <=10
--execute stock_state

--CREATE PROCEDURE VARIABLE
--@deger int 
--as
--set @deger = 1
--select FirstName,LastName,title,City from Employees where EmployeeID=@deger
 --execute VARIABLE @DEGER=3

                 -----------------------------CURSOR----------------------

 --declare @kategoriad nvarchar(100)
 --declare cursor_yapisi cursor for select categoryname from dbo.categories
 --open cursor_yapisi
 --fetch next from cursor_yapisi into @kategoriad

 --while @@fetch_status=0

 --begin
 --print @kategoriad
 --fetch next from cursor_yapisi into @kategoriad

 --end
 --close cursor_yapisi
 --deallocate cursor_yapisi

                      -----------------------INDEX----------------------

--SELECT * FROM [Order Details] WHERE OrderID=10324
--SET STATISTICS IO ON
--SET STATISTICS TIME ON 
--SELECT * FROM [Order Details] WHERE OrderID=10324

--CREATE CLUSTERED INDEX PRODUCT_GETIR
--ON PRODUCTS(productId)
--select* from products where ProductID=77








				













