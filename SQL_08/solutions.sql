-- 9.1 give the total number of recordings in this table
select count(*) as total from Downloads;

total     
----------
62325 

-- 9.2 the number of packages listed in this table?
select count(*) as total from (
    select distinct package from Downloads
);

total     
----------
5608

-- 9.3 How many times the package "Rcpp" was downloaded?
select count(*) as total from Downloads where package = "Rcpp";

total     
----------
867 

-- 9.4 How many recordings are from China ("CN")?
select count(*) as total from Downloads where country = "CN";

total     
----------
6424

-- 9.5 Give the package name and how many times they're downloaded. Order by the 2nd column descently.
select package, count(*) as downloads from Downloads group by package order by downloads desc;

-- 9.6 Give the package ranking (based on how many times it was downloaded) during 9AM to 11AM
select *, dense_rank() over (order by downloads desc) as rank from (
    select package, time, count(*) as downloads from Downloads
        group by package having time like "09%" or time like "10%" or time like "11%"
);

-- 9.7 How many recordings are from China ("CN") or Japan("JP") or Singapore ("SG")?
select count(*) as total from Downloads where country in ("CN", "JP", "SG");

total     
----------
8792 

-- 9.8 Print the countries whose downloaded are more than the downloads from China ("CN")
select country, count(*) as total from Downloads
    group by country having total > (
        select count(*) from Downloads where country = "CN"
    );

country     total     
----------  ----------
FR          6504      
US          20113

-- 9.9 Print the average length of the package name of all the UNIQUE packages
select avg(length(package)) as avg_package_name_length from (
    select package from Downloads group by package having count(*) = 1
);

avg_package_name_length
-----------------------
7.48774193548387

-- 9.10 Get the package whose downloading count ranks 2nd (print package name and it's download count).
select * from (
    select package, count(*) as download_count from Downloads
        group by package
        order by download_count desc limit 2
)order by download_count asc limit 1;

package     download_count
----------  --------------
DBI         973

-- 9.11 Print the name of the package whose download count is bigger than 1000.
select package from Downloads
    group by package having count(*) > 1000;

package   
----------
digest

-- 9.12 The field "r_os" is the operating system of the users.
    --  Here we would like to know what main system we have (ignore version number), the relevant counts, and the proportion (in percentage).
select r_os, count(*) as users_count, round(
    count(*) * 100.0 / (
        select count(*) as total_count from Downloads
    ), 2
) as perc from Downloads group by r_os order by perc desc;
