/*
Source : https://leetcode.com/problems/rising-temperature/
Author : Jiayi Lei
Date   : Oct 27, 2015
Description:
	Given a Weather table, write a SQL query to find all dates' Ids with higher 
	temperature compared to its previous (yesterday's) dates.

	+---------+------------+------------------+
	| Id(INT) | Date(DATE) | Temperature(INT) |
	+---------+------------+------------------+
	|       1 | 2015-01-01 |               10 |
	|       2 | 2015-01-02 |               25 |
	|       3 | 2015-01-03 |               20 |
	|       4 | 2015-01-04 |               30 |
	+---------+------------+------------------+

For example, return the following Ids for the above Weather table:
	+----+
	| Id |
	+----+
	|  2 |
	|  4 |
	+----+
*/

-- # Write your MySQL query statement below
-- version 1
select w1.Id
from Weather as w1, Weather as w2
where to_days(w1.Date) = to_days(w2.Date) + 1
and w1.Temperature > w2.Temperature;

-- version 2
select w1.Id
from Weather as w1 join Weather as w2 
on (date_sub(w1.Date, interval 1 day) = w2.Date)
where w1.temperature > w2.temperature;
