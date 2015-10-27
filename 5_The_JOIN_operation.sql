/*
Source : http://sqlzoo.net/wiki/The_JOIN_operation
Author : Jiayi Lei
Date   : Oct 26, 2015
	
Table game:
	____________________________________________________________________________
	id		mdate			stadium						team1	team2
	____________________________________________________________________________
	1001	8 June 2012		National Stadium, Warsaw	POL		GRE
	1002	8 June 2012		Stadion Miejski (Wroclaw)	RUS		CZE
	1003	12 June 2012	Stadion Miejski (Wroclaw)	GRE		CZE
	1004	12 June 2012	National Stadium, Warsaw	POL		RUS
	...
	____________________________________________________________________________

Table goal:
	____________________________________________________________________________
	matchid		teamid		player					gtime
	____________________________________________________________________________
	1001		POL			Robert Lewandowski		17
	1001		GRE			Dimitris Salpingidis	51
	1002		RUS			Alan Dzagoev			15
	1001		RUS			Roman Pavlyuchenko		82
	...
	____________________________________________________________________________

Table eteam:
	____________________________________________________________________________
	id		teamname			coach
	____________________________________________________________________________
	POL		Poland				Franciszek Smuda
	RUS		Russia				Dick Advocaat
	CZE		Czech Republic		Michal Bilek
	GRE		Greece				Fernando Santos
	...
	____________________________________________________________________________

*/

-- #1: Show matchid and player name for all goals scored by Germany.
select matchid, player
from goal
where teamid = 'GER';



-- #3: Show the player, teamid and mdate and for every German goal.
select player, teamid, mdate
from game join goal on (id = matchid)
where teamid = 'GER';


-- #4: Show the team1, team2 and player for every goal scored by a player called
--     Mario
select team1, team2, player
from game join goal on (id = matchid)
where player like '%Mario%';


-- #5: Show player, teamid, coach, gtime for all goals scored in the first 10 
--     minutes
select player, teamid, coach, gtime
from goal join eteam on (teamid = id)
where gtime <= 10;


-- #6： List the the dates of the matches and the name of the team in which 
--      'Fernando Santos' was the team1 coach.
select game.mdate, eteam.teamname
from game join eteam on (game.team1 = eteam.id)
where coach =  'Fernando Santos';


-- #7: List the player for every goal scored in a game where the stadium was 
--     'National Stadium, Warsaw'
select goal.player
from goal join game on (goal.matchid = game.id)
where game.stadium = 'National Stadium, Warsaw';


-- #8: Show the name of all players who scored a goal against Germany.
-- version 1:
select distinct goal.player
from goal join game on (goal.matchid = game.id)
where game.team1 = goal.teamid and game.team2 = 'GER'
or game.team1 = 'GER' and game.team2 = goal.teamid;

-- version 2:
select distinct goal.player
from goal join game on (goal.matchid = game.id)
where goal.teamid != 'GER' and (game.team1 = 'GER' or game.team2 = 'GER');


-- #9: Show teamname and the total number of goals scored.
select eteam.teamname, count(goal.teamid)
from eteam join goal on (eteam.id = goal.teamid)
group by goal.teamid;


-- #10: Show the stadium and the number of goals scored in each stadium.
select game.stadium, count(goal.matchid)
from game join goal on (game.id = goal.matchid)
group by game.stadium;













