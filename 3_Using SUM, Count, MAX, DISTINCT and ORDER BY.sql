/*
Source : http://sqlzoo.net/wiki/Using_SUM,_Count,_MAX,_DISTINCT_and_ORDER_BY
Author : Jiayi Lei
Date   : Oct 26, 2015
	
Table bbc:
	____________________________________________________________________________
	name			region			area		population		gdp
	____________________________________________________________________________
	Afghanistan		Asia			652230		25500100		20343000000
	Albania			Europe			28748		2831741			12960000000
	Algeria			Africa			2381741		37100000		188681000000
	Andorra			Europe			468			78115			3712000000
	Angola			Africa			1246700		20609294		100990000000
	....
	____________________________________________________________________________
*/

-- #1: The total population and GDP of Europe.
select sum(population), sum(gdp)
from bbc
where region = 'Europe';



-- #2: What are the regions?
select distinct region
from bbc;


-- #3: Show the name and population for each country with a population of more 
--     than 100000000. Show countries in descending order of population.
select name, population
from bbc
where population > 100000000
order by population desc;
