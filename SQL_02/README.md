## build

```sql

CREATE TABLE Warehouses (
	Code INTEGER NOT NULL,
	Location VARCHAR(255) NOT NULL ,
	Capacity INTEGER NOT NULL,
	PRIMARY KEY (Code)
);
CREATE TABLE Boxes (
    Code CHAR(4) NOT NULL,
    Contents VARCHAR(255) NOT NULL ,
    Value REAL NOT NULL ,
    Warehouse INTEGER NOT NULL,
    PRIMARY KEY (Code),
    FOREIGN KEY (Warehouse) REFERENCES Warehouses(Code)
);
 
INSERT INTO Warehouses(Code,Location,Capacity) VALUES(1,'Chicago',3);
INSERT INTO Warehouses(Code,Location,Capacity) VALUES(2,'Chicago',4);
INSERT INTO Warehouses(Code,Location,Capacity) VALUES(3,'New York',7);
INSERT INTO Warehouses(Code,Location,Capacity) VALUES(4,'Los Angeles',2);
INSERT INTO Warehouses(Code,Location,Capacity) VALUES(5,'San Francisco',8);

INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('0MN7','Rocks',180,3);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4H8P','Rocks',250,1);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4RT3','Scissors',190,4);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('7G3H','Rocks',200,1);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8JN6','Papers',75,1);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8Y6U','Papers',50,3);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('9J6F','Papers',175,2);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('LL08','Rocks',140,4);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P0H6','Scissors',125,1);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P2T6','Scissors',150,2);
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('TU55','Papers',90,5);

```

## Questions

-	3.1 Select all warehouses.
-	3.2 Select all boxes with a value larger than $150.
-	3.3 Select all distinct contents in all the boxes.
-	3.4 Select the average value of all the boxes.
-	3.5 Select the warehouse code and the average value of the boxes in each warehouse.
-	3.6 Same as previous exercise, but select only those warehouses where the average value of the boxes is greater than 150.
-	3.7 Select the code of each box, along with the name of the city the box is located in.
-	3.8 Select the warehouse codes, along with the number of boxes in each warehouse. Optionally, take into account that some warehouses are empty (i.e., the box count should show up as zero, instead of omitting the warehouse from the result).
-	3.9 Select the codes of all warehouses that are saturated (a warehouse is saturated if the number of boxes in it is larger than the warehouse's capacity).
-	3.10 Select the codes of all the boxes located in Chicago.
-	3.11 Create a new warehouse in New York with a capacity for 3 boxes.
-	3.12 Create a new box, with code "H5RT", containing "Papers" with a value of $200, and located in warehouse 2.
-	3.13 Reduce the value of all boxes by 15%.
-	3.14 Remove all boxes with a value lower than $100.
-	3.15 Remove all boxes from saturated warehouses.
-	3.16 Add Index for column "Warehouse" in table "boxes" !!!NOTE!!!: index should NOT be used on small tables in practice
-	3.17 Print all the existing indexes !!!NOTE!!!: index should NOT be used on small tables in practice
-	3.18 Remove (drop) the index you added just !!!NOTE!!!: index should NOT be used on small tables in practice


## Solution

-	3.1 Select all warehouses.

```sql
SELECT * FROM Warehouses;
```

```
┌──────┬───────────────┬──────────┐
│ Code │   Location    │ Capacity │
├──────┼───────────────┼──────────┤
│ 1    │ Chicago       │ 3        │
│ 2    │ Chicago       │ 4        │
│ 3    │ New York      │ 7        │
│ 4    │ Los Angeles   │ 2        │
│ 5    │ San Francisco │ 8        │
└──────┴───────────────┴──────────┘
```

-	3.2 Select all boxes with a value larger than $150.

```sql
SELECT * FROM Boxes WHERE Value > 150;
```

```
┌──────┬──────────┬───────┬───────────┐
│ Code │ Contents │ Value │ Warehouse │
├──────┼──────────┼───────┼───────────┤
│ 0MN7 │ Rocks    │ 180.0 │ 3         │
│ 4H8P │ Rocks    │ 250.0 │ 1         │
│ 4RT3 │ Scissors │ 190.0 │ 4         │
│ 7G3H │ Rocks    │ 200.0 │ 1         │
│ 9J6F │ Papers   │ 175.0 │ 2         │
└──────┴──────────┴───────┴───────────┘
```

-	3.3 Select all distinct contents in all the boxes.

```sql
SELECT DISTINCT Contents FROM Boxes;
```

```
┌──────────┐
│ Contents │
├──────────┤
│ Rocks    │
│ Scissors │
│ Papers   │
└──────────┘
```

-	3.4 Select the average value of all the boxes.

```sql
SELECT avg(Value) FROM Boxes;
```

```
┌──────────────────┐
│    avg(Value)    │
├──────────────────┤
│ 147.727272727273 │
└──────────────────┘
```

-	3.5 Select the warehouse code and the average value of the boxes in each warehouse.

```sql
SELECT avg(b.Value) FROM Boxes b INNER JOIN Warehouses w ON b.Warehouse = w.Code GROUP BY w.Code;
```

```
┌──────────────┐
│ avg(b.Value) │
├──────────────┤
│ 162.5        │
│ 162.5        │
│ 115.0        │
│ 165.0        │
│ 90.0         │
└──────────────┘
```

-	3.6 Same as previous exercise, but select only those warehouses where the average value of the boxes is greater than 150.

```sql
SELECT avg(b.Value) as avg FROM Boxes b INNER JOIN Warehouses w ON b.Warehouse = w.Code GROUP BY w.Code HAVING avg > 150;;
```

```
┌───────┐
│  avg  │
├───────┤
│ 162.5 │
│ 162.5 │
│ 165.0 │
└───────┘
```

-	3.7 Select the code of each box, along with the name of the city the box is located in.

```sql
SELECT b.Code, w.Location FROM Boxes b INNER JOIN Warehouses w ON b.Warehouse = w.Code;
```

```
┌──────┬───────────────┐
│ Code │   Location    │
├──────┼───────────────┤
│ 0MN7 │ New York      │
│ 4H8P │ Chicago       │
│ 4RT3 │ Los Angeles   │
│ 7G3H │ Chicago       │
│ 8JN6 │ Chicago       │
│ 8Y6U │ New York      │
│ 9J6F │ Chicago       │
│ LL08 │ Los Angeles   │
│ P0H6 │ Chicago       │
│ P2T6 │ Chicago       │
│ TU55 │ San Francisco │
└──────┴───────────────┘
```

-	3.8 Select the warehouse codes, along with the number of boxes in each warehouse. 

```sql
    -- Optionally, take into account that some warehouses are empty (i.e., the box count should show up as zero, instead of omitting the warehouse from the result).
SELECT Warehouse AS Code, count(*) AS Boxes FROM Boxes GROUP BY Warehouse;
```

```
┌──────┬───────┐
│ Code │ Boxes │
├──────┼───────┤
│ 1    │ 4     │
│ 2    │ 2     │
│ 3    │ 2     │
│ 4    │ 2     │
│ 5    │ 1     │
└──────┴───────┘
```

-	3.9 Select the codes of all warehouses that are saturated (a warehouse is saturated if the number of boxes in it is larger than the warehouse's capacity).

```sql
SELECT w.Code, count(*) AS Filled FROM Warehouses w INNER JOIN Boxes b on w.Code = b.Warehouse GROUP BY b.Warehouse HAVING Filled = w.Capacity;
```

```
┌──────┬────────┐
│ Code │ Filled │
├──────┼────────┤
│ 4    │ 2      │
└──────┴────────┘
```

-	3.10 Select the codes of all the boxes located in Chicago.

```sql
SELECT b.Code FROM Boxes b INNER JOIN Warehouses w ON b.Warehouse = w.Code WHERE w.Location = "Chicago";
```

```
┌──────┐
│ Code │
├──────┤
│ 4H8P │
│ 7G3H │
│ 8JN6 │
│ 9J6F │
│ P0H6 │
│ P2T6 │
└──────┘
```

-	3.11 Create a new warehouse in New York with a capacity for 3 boxes.

```sql
INSERT INTO Warehouses(Code, Location, Capacity) VALUES (6, "New York", 3);
```

-	3.12 Create a new box, with code "H5RT", containing "Papers" with a value of $200, and located in warehouse 2.

```sql
insert into boxes(Code, Contents, Value, Warehouse) values ("H5RT", "Papers", 200, 2);
```

-	3.13 Reduce the value of all boxes by 15%.

```sql
update Boxes set Value = (0.85 * Value);
```

-	3.14 Remove all boxes with a value lower than $100.

```sql
delete from Boxes where Value < 100;
```

-	3.15 Remove all boxes from saturated warehouses.

```sql
delete from Boxes where Warehouse in (SELECT w.Code FROM Warehouses w INNER JOIN Boxes b on w.Code = b.Warehouse GROUP BY b.Warehouse HAVING count(*) = w.Capacity);
```

-	3.16 Add Index for column "Warehouse" in table "boxes" !!!NOTE!!!: index should NOT be used on small tables in practice

```sql
create index WarehouseIndex on boxes(Warehouse);
```

-	3.17 Print all the existing indexes !!!NOTE!!!: index should NOT be used on small tables in practice

```sql
select * from SQLITE_MASTER WHERE Type = "index";
```

```
┌───────┬──────────────────────────┬──────────┬──────────┬─────────────────────────────────────────────────┐
│ type  │           name           │ tbl_name │ rootpage │                       sql                       │
├───────┼──────────────────────────┼──────────┼──────────┼─────────────────────────────────────────────────┤
│ index │ sqlite_autoindex_Boxes_1 │ Boxes    │ 4        │                                                 │
│ index │ WarehouseIndex           │ Boxes    │ 5        │ CREATE INDEX WarehouseIndex on boxes(Warehouse) │
└───────┴──────────────────────────┴──────────┴──────────┴─────────────────────────────────────────────────┘
```

-	3.18 Remove (drop) the index you added just !!!NOTE!!!: index should NOT be used on small tables in practice

```sql
drop index WarehouseIndex;
```