Create database EsameEpicode;

use EsameEpicode;

CREATE TABLE Category(
CategoryId INT auto_increment Primary Key,
CategoryName VARCHAR(45) not null);

CREATE TABLE Product (
ProductId INT auto_increment Primary Key,
ProductName VARCHAR(45) not null,
CategoryId INT not null,
Price DOUBLE ,
ProductCost DOUBLE,
constraint FK_productCategory foreign Key (CategoryId)
References Category(CategoryId));

 CREATE TABLE Region (
 RegionId INT auto_increment Primary Key,
 RegionName VARCHAR(45) not null);
 
 CREATE TABLE State (
 StateId INT auto_increment Primary Key ,
 StateName VARCHAR(45) not null,
 RegionId INT not null,
 constraint FK_StateRegion foreign key (RegionId)
 References Region(RegionId));
 
 CREATE TABLE Sales (
 SalesId INT auto_increment Primary Key,
 OrderQuantity INT not null,
 OrderDate date not null ,
 ProductId INT not null ,
 StateId INT not null ,
 constraint FK_ProductSales foreign key (ProductId)
 references Product(ProductId),
 constraint FK_StateSales foreign key (StateId)
 references State(StateId));
 
 INSERT INTO Category (CategoryName) VALUES ('Elettronica'), ('Abbigliamento'), ('Casa'), ('Sport'), ('Libri');

INSERT INTO Region (RegionName) VALUES ('Nord'), ('Centro'), ('Sud'), ('Isole');

INSERT INTO State (StateName, RegionId) VALUES 
('Lombardia', 1), ('Veneto', 1), ('Piemonte', 1), 
('Toscana', 2), ('Lazio', 2), 
('Campania', 3), ('Puglia', 3), 
('Sicilia', 4), ('Sardegna', 4);

INSERT INTO Product (ProductName, CategoryId, Price, ProductCost) VALUES 
('Smartphone', 1, 500.0, 300.0), ('Laptop', 1, 1000.0, 700.0),
('Giacca', 2, 80.0, 30.0), ('Scarpe', 2, 60.0, 20.0),
('Divano', 3, 400.0, 150.0), ('Tavolo', 3, 120.0, 50.0),
('Palla', 4, 15.0, 5.0), ('Bicicletta', 4, 250.0, 100.0),
('Romanzo', 5, 15.0, 7.0), ('Manuale SQL', 5, 35.0, 15.0),
('Sedia', 3, 25.0, 10.0), ('Triciclo', 4, 50.0, 25.0);

INSERT INTO Sales (OrderQuantity, OrderDate, ProductId, StateId)
SELECT 
    FLOOR(1 + RAND() * 10), -- Quantità tra 1 e 10
    DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 731) DAY), -- Data tra 2024 e 2025
    FLOOR(1 + RAND() * 10), -- ProductId casuale tra 1 e 10
    FLOOR(1 + RAND() * 9)   -- StateId casuale tra 1 e 9
FROM (
    
    SELECT a.i FROM (SELECT 0 AS i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) AS a
    CROSS JOIN (SELECT 0 AS i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) AS b
) AS generator;
 


/*TASK 4*/
/*Query 1  Raggruppo per Chiave Primaria contando quante righe ci sono per valore di Chiave primaria*/
/*tabella Product*/ ;

SELECT ProductId,count(*) as LineCount
from product
group by ProductId
having count(*)>1

/*tabella category*/ ;
Select 
CategoryId,count(*) as LineCount
from category
group by CategoryId
having count(*)>1;

/*tabella Region*/ ;
Select 
RegionId,count(*) as LineCount
from region
group by RegionId
having count(*)>1;

/*tabella Sales*/ ;
Select 
SalesId,count(*) as LineCount
from sales
group by SalesId
having count(*)>1

/*tabella State*/ ;
Select 
StateId,count(*) as LineCount
from state
group by StateId
having count(*)>1;

/*Query 2*/ Visualizzo le vendite indicando valori aggiuntivi e indicando se sono scadute da più di 180 giorni
Select 
SalesId
,OrderDate
,ProductName
,CategoryName
,StateName
,RegionName
,if(datediff(curdate(), Orderdate) > 180,"True","False") as Scaduto180giorni
from sales as S
inner join state as ST
on s.stateid=st.stateid
inner join product as P
on s.ProductId=P.ProductId
inner join region as R
on R.RegionId=ST.RegionId
inner join category as C
on P.CategoryId=C.CategoryId;

/*Query3*/
SELECT 
    p.ProductName, 
    SUM(s.OrderQuantity) AS TotaleVenduto
FROM Sales s
inner join product as P
on s.ProductId=p.ProductId
GROUP BY p.ProductName
HAVING SUM(s.OrderQuantity) > (
    SELECT AVG(SommaQuantita)
    FROM (
        SELECT SUM(OrderQuantity) as SommaQuantita
        FROM Sales
        WHERE DATEDIFF((SELECT MAX(OrderDate) FROM Sales), OrderDate) <= 365
        GROUP BY Productid
    ) AS MediaCalcolata);
    
    /*Query4*/
    Select 
    ProductName
    ,Year(orderdate) as Anno
    ,sum(s.orderquantity * p.price) as FatturatoTotale
    from product as P
    inner join Sales as S
    on P.ProductId=S.ProductId
    group by ProductName,Anno;
    
    /*Query5*/
     Select 
	StateName
    ,Year(orderdate) as Anno
    ,sum(s.orderquantity * p.price) as FatturatoTotale
    from product as P
    inner join Sales as S
	on P.ProductId=S.ProductId
    inner join state as ST
    on ST.StateId=S.StateId
    group by StateName,Anno
    order by anno desc, FatturatoTotale desc;
    
    /*query6*/
    Select 
    CategoryName
    ,sum(OrderQuantity) as TotalOrderQuantity
    from sales as S
    inner join Product as P
    on S.ProductId=P.ProductId
    inner join category as C
    on C.CategoryId=P.CategoryId
    group by CategoryName
    Order by TotalOrderQuantity desc;
    /*La categoria più richiesta dal mercato è la categoria Sport*/
    
    /*Query7*/
    Select 
    ProductName
    from product as P
    left join Sales as S
    on P.ProductId=S.ProductId
    where S.productid is null;
    /*Query7 approccio 2*/
    Select 
    ProductName
    from product
    where ProductId not in (
    Select 
    distinct ProductId
    from sales);
    
    /*Query8*/
    Create view ProductInfo as
    select 
    ProductId
    ,ProductName
    ,CategoryName
    from product as P
    Inner join category as C
    on P.CategoryId=C.CategoryId;
    
    /*Query9*/
    Create view StateInfo as
    Select 
	stateId
    ,Statename
    ,RegionName
    from State as ST
    inner join region as R
    on ST.regionId=R.RegionId;
    
   
    
  
    
    
    
    








 
 
 
 
 




