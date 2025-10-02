CREATE TABLE Manufacturers (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL,
  PRIMARY KEY (Code)
);

CREATE TABLE Products (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL ,
  Price DECIMAL NOT NULL ,
  Manufacturer INTEGER NOT NULL,
  PRIMARY KEY (Code),
  FOREIGN KEY (Manufacturer) REFERENCES Manufacturers(Code)
);

┌──────┬─────────────────┬───────┬──────────────┐
│ Code │      Name       │ Price │ Manufacturer │
├──────┼─────────────────┼───────┼──────────────┤
│ 1    │ Hard drive      │ 240   │ 5            │
│ 2    │ Memory          │ 120   │ 6            │
│ 3    │ ZIP drive       │ 150   │ 4            │
│ 4    │ Floppy disk     │ 5     │ 6            │
│ 5    │ Monitor         │ 240   │ 1            │
│ 6    │ DVD drive       │ 180   │ 2            │
│ 7    │ CD drive        │ 90    │ 2            │
│ 8    │ Printer         │ 270   │ 3            │
│ 9    │ Toner cartridge │ 66    │ 3            │
│ 10   │ DVD burner      │ 180   │ 2            │
└──────┴─────────────────┴───────┴──────────────┘

--   1.1 Select the names of all the products in the store.
SELECT Name FROM Products;
┌─────────────────┐
│      Name       │
├─────────────────┤
│ Hard drive      │
│ Memory          │
│ ZIP drive       │
│ Floppy disk     │
│ Monitor         │
│ DVD drive       │
│ CD drive        │
│ Printer         │
│ Toner cartridge │
│ DVD burner      │
└─────────────────┘
--   1.2 Select the names and the prices of all the products in the store.
SELECT Name, Price FROM Products;
┌─────────────────┬───────┐
│      Name       │ Price │
├─────────────────┼───────┤
│ Hard drive      │ 240   │
│ Memory          │ 120   │
│ ZIP drive       │ 150   │
│ Floppy disk     │ 5     │
│ Monitor         │ 240   │
│ DVD drive       │ 180   │
│ CD drive        │ 90    │
│ Printer         │ 270   │
│ Toner cartridge │ 66    │
│ DVD burner      │ 180   │
└─────────────────┴───────┘
--   1.3 Select the name of the products with a price less than or equal to $200.
SELECT Name FROM Products WHERE Price <= 200;
┌─────────────────┐
│      Name       │
├─────────────────┤
│ Memory          │
│ ZIP drive       │
│ Floppy disk     │
│ DVD drive       │
│ CD drive        │
│ Toner cartridge │
│ DVD burner      │
└─────────────────┘
--   1.4 Select all the products with a price between $60 and $120.
SELECT * FROM Products WHERE Price BETWEEN 60 AND 120;
┌──────┬─────────────────┬───────┬──────────────┐
│ Code │      Name       │ Price │ Manufacturer │
├──────┼─────────────────┼───────┼──────────────┤
│ 2    │ Memory          │ 120   │ 6            │
│ 7    │ CD drive        │ 90    │ 2            │
│ 9    │ Toner cartridge │ 66    │ 3            │
└──────┴─────────────────┴───────┴──────────────┘
--   1.5 Select the name and price in cents (i.e., the price must be multiplied by 100).
SELECT Name, (Price * 100) AS cents FROM Products;
┌─────────────────┬───────┐
│      Name       │ cents │
├─────────────────┼───────┤
│ Hard drive      │ 24000 │
│ Memory          │ 12000 │
│ ZIP drive       │ 15000 │
│ Floppy disk     │ 500   │
│ Monitor         │ 24000 │
│ DVD drive       │ 18000 │
│ CD drive        │ 9000  │
│ Printer         │ 27000 │
│ Toner cartridge │ 6600  │
│ DVD burner      │ 18000 │
└─────────────────┴───────┘
--   1.6 Compute the average price of all the products.
SELECT AVG(Price) as avg FROM Products;
┌───────┐
│  avg  │
├───────┤
│ 154.1 │
└───────┘
--   1.7 Compute the average price of all products with manufacturer code equal to 2.
SELECT AVG(Price) FROM Products WHERE Manufacturer = 2;
┌────────────┐
│ AVG(Price) │
├────────────┤
│ 150.0      │
└────────────┘
--   1.8 Compute the number of products with a price larger than or equal to $180.
SELECT COUNT(*) FROM Products WHERE Price >= 180;
┌──────────┐
│ COUNT(*) │
├──────────┤
│ 5        │
└──────────┘
--   1.9 Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).
SELECT Name, Price FROM Products WHERE Price >= 180 ORDER BY Price DESC, Name ASC;
┌────────────┬───────┐
│    Name    │ Price │
├────────────┼───────┤
│ Printer    │ 270   │
│ Hard drive │ 240   │
│ Monitor    │ 240   │
│ DVD burner │ 180   │
│ DVD drive  │ 180   │
└────────────┴───────┘
--   1.10 Select all the data from the products, including all the data for each product's manufacturer.
SELECT p.*, m.Name as ManufacturerName FROM Products p INNER JOIN Manufacturers m ON p.Manufacturer = m.Code;
SELECT Products.*, Manufacturers.Name as ManufacturerName FROM Products, Manufacturers WHERE Products.Manufacturer = Manufacturers.Code;
┌──────┬─────────────────┬───────┬──────────────┬──────────────────┐
│ Code │      Name       │ Price │ Manufacturer │ ManufacturerName │
├──────┼─────────────────┼───────┼──────────────┼──────────────────┤
│ 1    │ Hard drive      │ 240   │ 5            │ Fujitsu          │
│ 2    │ Memory          │ 120   │ 6            │ Winchester       │
│ 3    │ ZIP drive       │ 150   │ 4            │ Iomega           │
│ 4    │ Floppy disk     │ 5     │ 6            │ Winchester       │
│ 5    │ Monitor         │ 240   │ 1            │ Sony             │
│ 6    │ DVD drive       │ 180   │ 2            │ Creative Labs    │
│ 7    │ CD drive        │ 90    │ 2            │ Creative Labs    │
│ 8    │ Printer         │ 270   │ 3            │ Hewlett-Packard  │
│ 9    │ Toner cartridge │ 66    │ 3            │ Hewlett-Packard  │
│ 10   │ DVD burner      │ 180   │ 2            │ Creative Labs    │
└──────┴─────────────────┴───────┴──────────────┴──────────────────┘
--   1.11 Select the product name, price, and manufacturer name of all the products.
SELECT p.Name, p.Price, m.Name as Manufacturer FROM Products p INNER JOIN Manufacturers m ON p.Manufacturer = m.Code;
┌─────────────────┬───────┬─────────────────┐
│      Name       │ Price │  Manufacturer   │
├─────────────────┼───────┼─────────────────┤
│ Hard drive      │ 240   │ Fujitsu         │
│ Memory          │ 120   │ Winchester      │
│ ZIP drive       │ 150   │ Iomega          │
│ Floppy disk     │ 5     │ Winchester      │
│ Monitor         │ 240   │ Sony            │
│ DVD drive       │ 180   │ Creative Labs   │
│ CD drive        │ 90    │ Creative Labs   │
│ Printer         │ 270   │ Hewlett-Packard │
│ Toner cartridge │ 66    │ Hewlett-Packard │
│ DVD burner      │ 180   │ Creative Labs   │
└─────────────────┴───────┴─────────────────┘
--   1.12 Select the average price of each manufacturer's products, showing only the manufacturer's code.
SELECT AVG(Price), Manufacturer FROM Products GROUP BY Manufacturer;
┌────────────┬──────────────┐
│ AVG(Price) │ Manufacturer │
├────────────┼──────────────┤
│ 240.0      │ 1            │
│ 150.0      │ 2            │
│ 168.0      │ 3            │
│ 150.0      │ 4            │
│ 240.0      │ 5            │
│ 62.5       │ 6            │
└────────────┴──────────────┘
--   1.13 Select the average price of each manufacturer's products, showing the manufacturer's name.
SELECT AVG(p.Price), m.name
	FROM Products p
	INNER JOIN Manufacturers m
	ON m.Code = p.Manufacturer
	GROUP BY m.name;
┌────────────┬──────────────┐
│ AVG(Price) │ Manufacturer │
├────────────┼──────────────┤
│ 240.0      │ 1            │
│ 150.0      │ 2            │
│ 168.0      │ 3            │
│ 150.0      │ 4            │
│ 240.0      │ 5            │
│ 62.5       │ 6            │
└────────────┴──────────────┘
--   1.14 Select the names of manufacturer whose products have an average price larger than or equal to $150.
SELECT m.Name, AVG(p.Price) AS avg
	FROM Manufacturers m
	INNER JOIN Products p  
	ON m.Code = p.Manufacturer
	GROUP BY m.Name
	HAVING avg >= 150;
┌─────────────────┬───────┐
│      Name       │  avg  │
├─────────────────┼───────┤
│ Creative Labs   │ 150.0 │
│ Fujitsu         │ 240.0 │
│ Hewlett-Packard │ 168.0 │
│ Iomega          │ 150.0 │
│ Sony            │ 240.0 │
└─────────────────┴───────┘
--   1.15 Select the name and price of the cheapest product.
SELECT Name, MIN(Price) FROM Products;
┌─────────────┬────────────┐
│    Name     │ MIN(Price) │
├─────────────┼────────────┤
│ Floppy disk │ 5          │
└─────────────┴────────────┘
--   1.16 Select the name of each manufacturer along with the name and price of its most expensive product.
select m.Name, p.Name, min(p.Price)
from Manufacturers m
inner join Products p
on m.Code = p.Manufacturer
group by m.Name;
┌─────────────────┬─────────────────┬──────────────┐
│      Name       │      Name       │ min(p.Price) │
├─────────────────┼─────────────────┼──────────────┤
│ Creative Labs   │ CD drive        │ 90           │
│ Fujitsu         │ Hard drive      │ 240          │
│ Hewlett-Packard │ Toner cartridge │ 66           │
│ Iomega          │ ZIP drive       │ 150          │
│ Sony            │ Monitor         │ 240          │
│ Winchester      │ Floppy disk     │ 5            │
└─────────────────┴─────────────────┴──────────────┘
--   1.17 Add a new product: Loudspeakers, $70, manufacturer 2.
insert into Products(Name, Price, Manufacturer) values("Loudspeakers", 70, 2);
┌──────┬─────────────────┬───────┬──────────────┐
│ Code │      Name       │ Price │ Manufacturer │
├──────┼─────────────────┼───────┼──────────────┤
│ 1    │ Hard drive      │ 240   │ 5            │
│ 2    │ Memory          │ 120   │ 6            │
│ 3    │ ZIP drive       │ 150   │ 4            │
│ 4    │ Floppy disk     │ 5     │ 6            │
│ 5    │ Monitor         │ 240   │ 1            │
│ 6    │ DVD drive       │ 180   │ 2            │
│ 7    │ CD drive        │ 90    │ 2            │
│ 8    │ Printer         │ 270   │ 3            │
│ 9    │ Toner cartridge │ 66    │ 3            │
│ 10   │ DVD burner      │ 180   │ 2            │
│ 11   │ Loudspeakers    │ 70    │ 2            │
└──────┴─────────────────┴───────┴──────────────┘
--   1.18 Update the name of product 8 to "Laser Printer".
update Products set Name = "Laser Printer" where Code = 8;
┌──────┬─────────────────┬───────┬──────────────┐
│ Code │      Name       │ Price │ Manufacturer │
├──────┼─────────────────┼───────┼──────────────┤
│ 1    │ Hard drive      │ 240   │ 5            │
│ 2    │ Memory          │ 120   │ 6            │
│ 3    │ ZIP drive       │ 150   │ 4            │
│ 4    │ Floppy disk     │ 5     │ 6            │
│ 5    │ Monitor         │ 240   │ 1            │
│ 6    │ DVD drive       │ 180   │ 2            │
│ 7    │ CD drive        │ 90    │ 2            │
│ 8    │ Laser Printer   │ 270   │ 3            │
│ 9    │ Toner cartridge │ 66    │ 3            │
│ 10   │ DVD burner      │ 180   │ 2            │
│ 11   │ Loudspeakers    │ 70    │ 2            │
└──────┴─────────────────┴───────┴──────────────┘
--   1.19 Apply a 10% discount to all products.
update Products set Price = (0.9 * Price);
┌──────┬─────────────────┬───────┬──────────────┐
│ Code │      Name       │ Price │ Manufacturer │
├──────┼─────────────────┼───────┼──────────────┤
│ 1    │ Hard drive      │ 216   │ 5            │
│ 2    │ Memory          │ 108   │ 6            │
│ 3    │ ZIP drive       │ 135   │ 4            │
│ 4    │ Floppy disk     │ 4.5   │ 6            │
│ 5    │ Monitor         │ 216   │ 1            │
│ 6    │ DVD drive       │ 162   │ 2            │
│ 7    │ CD drive        │ 81    │ 2            │
│ 8    │ Laser Printer   │ 243   │ 3            │
│ 9    │ Toner cartridge │ 59.4  │ 3            │
│ 10   │ DVD burner      │ 162   │ 2            │
│ 11   │ Loudspeakers    │ 63    │ 2            │
└──────┴─────────────────┴───────┴──────────────┘
--   1.20 Apply a 10% discount to all products with a price larger than or equal to $120.
update Products set Price = (0.9 * Price) where Price >= 120;
┌──────┬─────────────────┬───────┬──────────────┐
│ Code │      Name       │ Price │ Manufacturer │
├──────┼─────────────────┼───────┼──────────────┤
│ 1    │ Hard drive      │ 194.4 │ 5            │
│ 2    │ Memory          │ 108   │ 6            │
│ 3    │ ZIP drive       │ 121.5 │ 4            │
│ 4    │ Floppy disk     │ 4.5   │ 6            │
│ 5    │ Monitor         │ 194.4 │ 1            │
│ 6    │ DVD drive       │ 145.8 │ 2            │
│ 7    │ CD drive        │ 81    │ 2            │
│ 8    │ Laser Printer   │ 218.7 │ 3            │
│ 9    │ Toner cartridge │ 59.4  │ 3            │
│ 10   │ DVD burner      │ 145.8 │ 2            │
│ 11   │ Loudspeakers    │ 63    │ 2            │
└──────┴─────────────────┴───────┴──────────────┘
