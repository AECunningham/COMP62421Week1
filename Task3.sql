-- Task3.sql

-- set echoing on

.echo on

-- set spooling out

.output Task3.log

-- Question 12

select name,0.5*population AS halfpop from country limit 10;

-- Question 13

select * from city where name = "Manchester";

-- Question 14

select name from city where name like "Man%";

-- Question 15

select country.name,organization.name
from country,religion,organization
where country.code = religion.country
and religion.name = "Buddhist" and religion.percentage > 0
and country.code = organization.country
and organization.established > "1994-12-01";

-- Question 16
-- NB - answers are clearly not geographically correct (e.g. only one island in Norway).
-- Also, the 'geo_island' table lists islands several times over if they contain more than one 'Province'
-- (e.g. the island of 'Great Britain' is listed repeatedly, once for 'North East', once for 'North West', once for 'Scotland', etc.)
-- For this reason, 'distinct' is used in the select command. 
-- However, there is no way of knowing whether in some cases such entries really do relate to different islands
-- (e.g. a country could have two islands with the same name, each in different provinces.)

select country.name,count(distinct island) as Islands
from country,geo_island
where country.code = geo_island.country
group by country.name,geo_island.country;

