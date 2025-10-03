-- 5.1 Select the name of all the pieces. 
select Name from pieces;
┌──────────┐
│   Name   │
├──────────┤
│ Sprocket │
│ Screw    │
│ Nut      │
│ Bolt     │
└──────────┘
-- 5.2  Select all the providers' data. 
select * from Providers;
┌──────┬──────────────────────┐
│ Code │         Name         │
├──────┼──────────────────────┤
│ HAL  │ Clarke Enterprises   │
│ RBT  │ Susan Calvin Corp.   │
│ TNBC │ Skellington Supplies │
└──────┴──────────────────────┘
-- 5.3 Obtain the average price of each piece (show only the piece code and the average price).
select Piece, avg(Price) as avg from Provides group by Piece;
┌───────┬──────────────────┐
│ Piece │       avg        │
├───────┼──────────────────┤
│ 1     │ 12.5             │
│ 2     │ 16.3333333333333 │
│ 3     │ 47.5             │
│ 4     │ 6.0              │
└───────┴──────────────────┘
-- 5.4  Obtain the names of all providers who supply piece 1.
select Providers.Name from Provides inner join Providers on Provides.Provider = Providers.Code where Piece = 1;
┌────────────────────┐
│        Name        │
├────────────────────┤
│ Clarke Enterprises │
│ Susan Calvin Corp. │
└────────────────────┘
-- 5.5 Select the name of pieces provided by provider with code "HAL".
select o.Name from provides p inner join pieces o on o.Code = p.Piece where Provider = 'HAL';
┌──────────┐
│   Name   │
├──────────┤
│ Sprocket │
│ Screw    │
│ Bolt     │
└──────────┘
-- 5.6 !!! Interesting and important one !!! For each piece, find the most expensive offering of that piece and include the piece name, provider name, and price  (note that there could be two providers who supply the same piece at the most expensive price).
select s.Code, s.Name, j.Name, p.Price
from Provides p
inner join Pieces s on s.Code = p.Piece
inner join Providers j on j.Code = p.Provider
where p.Price = (select max(Price) from Provides where Piece = p.Piece);
Code        Name        Name                Price     
----------  ----------  ------------------  ----------
1           Sprocket    Susan Calvin Corp.  15        
2           Screw       Clarke Enterprises  20        
3           Nut         Susan Calvin Corp.  50        
4           Bolt        Susan Calvin Corp.  7         
-- 5.7 Add an entry to the database to indicate that "Skellington Supplies" (code "TNBC") will provide sprockets (code "1") for 7 cents each.
insert into Provides (Piece, Provider, Price) values (1, "TNBC", 7);
-- 5.8 Increase all prices by one cent.
update Provides set Price = (Price + 1);
Piece       Provider    Price     
----------  ----------  ----------
1           HAL         11        
1           RBT         16        
2           HAL         21        
2           RBT         16        
2           TNBC        15        
3           RBT         51        
3           TNBC        46        
4           HAL         6         
4           RBT         8         
1           TNBC        8  
-- 5.9 Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply bolts (code 4).
delete from Provides where Provider = "RBT" and Piece = 4;
-- 5.10 Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply any pieces (the provider should still remain in the database).
delete from Provides where Provider = "RBT";
