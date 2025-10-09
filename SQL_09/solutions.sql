-- 10.1 Join table PEOPLE and ADDRESS, but keep only one address information for each person (we don't mind which record we take for each person). 
	-- i.e., the joined table should have the same number of rows as table PEOPLE
select p.*, a.* from PEOPLE p
    inner join (
        select * from ADDRESS group by id
    ) a on p.id = a.id;

id          name        id          a1ddress     updatedate
----------  ----------  ----------  -----------  ----------
1           A           1           address-1-1  2016-01-01
2           B           2           address-2-1  2015-11-01
3           C           3           address-3-1  2016-12-01
4           D           4           address-4-1  2010-05-21
-- 10.2 Join table PEOPLE and ADDRESS, but ONLY keep the LATEST address information for each person. 
	-- i.e., the joined table should have the same number of rows as table PEOPLE
select p.*, a.* from PEOPLE p
    inner join (
        select id, a1ddress, max(updatedate) as updatedate from ADDRESS group by id
    ) a on p.id = a.id;

id          name        id          a1ddress     updatedate
----------  ----------  ----------  -----------  ----------
1           A           1           address-1-2  2016-09-02
2           B           2           address-2-1  2015-11-01
3           C           3           address-3-1  2016-12-01
4           D           4           address-4-3  2015-04-27