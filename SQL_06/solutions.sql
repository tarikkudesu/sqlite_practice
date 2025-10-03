-- 7.1 Who receieved a 1.5kg package? The result is "Al Gore's Head".
select c.Name from Package p inner join Client c on p.Recipient = c.AccountNumber where p.Weight = 1.5;
-- 7.2 What is the total weight of all the packages that he sent?
select sum(Weight) from Package where Sender = (select AccountNumber from Client where Name = "Al Gore's Head");

sum(Weight)
-----------
17.0
-- 7.3 Which pilots transported those packages?
select e.Name from Package p
		inner join Shipment s on p.Shipment = s.ShipmentID
		inner join Employee e on s.ShipmentID = e.EmployeeID
		where p.Sender = (select AccountNumber from Client where Name = "Al Gore's Head");

Name         
-------------
Turanga Leela
Bender Bendin
