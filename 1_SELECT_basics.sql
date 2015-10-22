/*
Source : http://sqlzoo.net/wiki/SELECT_basics
Author : Jiayi Lei
Date   : Oct 22, 2015
	
Table world:
	____________________________________________________________________________
	name			continent		area		population		gdp
	____________________________________________________________________________
	Afghanistan		Asia			652230		25500100		20343000000
	Albania			Europe			28748		2831741			12960000000
	Algeria			Africa			2381741		37100000		188681000000
	Andorra			Europe			468			78115			3712000000
	Angola			Africa			1246700		20609294		100990000000
	....
	____________________________________________________________________________
*/

-- #1: Show the population of Germany
select population
from world
where name = 'Germany';

-- #2: Show the name and per capita gdp: gdp/population for each country where 
--     the area is over 5,000,000 km^2
select name, gdp/population
from world
where area > 5000000;

-- #3: Show the name and continent where the area is less than 2000 and the gdp 
--     is more than 5000000000
select name, continent
from world
where area < 2000 and gdp > 5000000000;

-- #4: Show the name and the population for 'Denmark', 'Finland', 'Norway', 
--     'Sweden'
select name, population
from world
where name in ('Denmark', 'Finland', 'Norway', 'Sweden');

-- #5: Show each country that begins with G
select name
from world
where name like 'G%';

-- #6: Which countries are not too small and not too big? Show the country and 
--     the area for countries with an area between 200000 and 250000. BETWEEN 
--     allows range checking - note that it is inclusive.
--     Show the area in 1000 square km. Show area/1000 instead of area
select name, area/1000
from world
where area/1000 between 200000/1000 and 250000/1000;
