/*
Source : http://sqlzoo.net/wiki/SQLZOO:SELECT_from_WORLD_Tutorial
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

-- #1: Read the notes about this table (http://sqlzoo.net/wiki/Read_the_notes_about_this_table). 
--     Observe the result of running a simple SQL command.
select name, continent, population 
from world;


-- #2: How to use WHERE to filter records (http://sqlzoo.net/wiki/WHERE_filters). 
--     Show the name for the countries that have a population of at least 200 
--     million. 200 million is 200000000, there are eight zeros.
select name
from world
where population > 200000000;


-- #3: Give the name and the per capita GDP for those countries with a 
--     population of at least 200 million.
--     per capita GDP is the GDP divided by the population GDP/population
select name, gdp/population
from world
where population >= 200000000;


-- #4: Show the name and population in millions for the countries of the 
--     continent 'South America'. Divide the population by 1000000 to get 
--     population in millions.
select name, population/1000000
from world
where continent = 'South America';


-- #5: Show the name and population for France, Germany, Italy
select name, population
from world
where name in ('France', 'Germany', 'Italy');


-- #6: Show the countries which have a name that includes the word 'United'
select name
from world
where name like '%United%';


-- #7: Two ways to be big: A country is big if it has an area of more than 3 
--     million sq km or it has a population of more than 250 million.
--     Show the countries that are big by area or big by population. Show name, 
--     population and area.
select name, population, area
from world
where area > 3000000 or population > 250000000;


-- #8: USA, India, and China are big in population and big by area. Exclude 
--     these countries.
--     Show the countries that are big by area or big by population but not both
--     . Show name, population and area.
select name, population, area
from world
where area > 3000000 and population < 250000000 
or population > 250000000 and area < 3000000;


-- #9: Show the name and population in millions and the GDP in billions for the 
--     countries of the continent 'South America'. Use the ROUND function to 
--     show the values to two decimal places.
--     For South America show population in millions and GDP in billions to 2 
--     decimal places. Millions and billions: Divide by 1000000 (6 zeros) for 
--     millions. Divide by 1000000000 (9 zeros) for billions.
select name, round(population/1000000, 2),  round(gdp/1000000000, 2)
from world
where continent = 'South America';


-- #10: Show the per-capita GDP for those countries with a GDP of at least one 
--      trillion (1000000000000; that is 12 zeros). Round this value to the 
--      nearest 1000.
--      Show per-capita GDP for the trillion dollar countries to the nearest 
--      $1000.
select name, round(gdp/population, -3)
from world
where gdp > 1000000000000;


-- #11: The CASE (http://sqlzoo.net/wiki/CASE) statement shown is used to 
--      substitute North America for Caribbean in the third column.
--      Show the name and the continent - but substitute Australasia for Oceania
--      - for countries beginning with N.
select name,
       case when continent = 'Oceania' then 'Australasia'
            else continent end
from world
where name like 'N%';


-- #12: Show the name and the continent - but substitute Eurasia for Europe and 
--      Asia; substitute America - for each country in North America or South 
--      America or Caribbean. Show countries beginning with A or B
select name,
       case 
			when continent = 'Europe' or continent = 'Asia' then 'Eurasia'
	        when continent = 'North America' or continent = 'South America' 
			     or continent = 'Caribbean' then 'America'
			else continent
       end as continent
from world
where name like 'A%' or name like 'B%';


-- #13: Put the continents right...
--      - Oceania becomes Australasia
--      - Countries in Eurasia and Turkey go to Europe/Asia
--      - Caribbean islands starting with 'B' go to North America, other 
--        Caribbean islands go to South America
--      Show the name, the original continent and the new continent of all 
--      countries.
select name, continent,
		case
			when continent = 'Oceania' then 'Australasia'
			when continent = 'Eurasia' or name = 'Turkey' 
			then 'Europe/Asia'
			when continent = 'Caribbean' and name like 'B%' 
			then 'North America'
			when continent = 'Caribbean' and name not like 'B%' 
			then 'South America'
			else continent
		end as 'new continent'
from world
order by name
