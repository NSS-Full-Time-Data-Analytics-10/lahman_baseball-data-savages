-- 9 .Which managers have won the TSN Manager of the Year award in both the National League (NL) 
--and the American League (AL)? Give their full name and the teams that they were 
--managing when they won the award.

--TABLES NEEDED
SELECT namefirst,namelast
FROM people;


SELECT playerid,yearid,teamid
FROM managers;

SELECT *
FROM awardsmanagers
WHERE awardid ILIKE '%TSN%';


--- combine table give mathching year from awards,matching lgid given that year,and player id

WITH news AS (SELECT Playerid, namefirst,namelast,awardid,awardsmanagers.lgid,managers.teamid,awardsmanagers.yearid
FROM awardsmanagers 
INNER JOIN managers USING(playerid)
INNER JOIN people USING(playerid)
						WHERE awardsmanagers.yearid=managers.yearid 
						AND awardsmanagers.lgid=managers.lgid 
						AND awardid ILIKE '%TSN%'
						ORDER BY playerid),
						
nl_league AS (SELECT playerid,teamid,yearid,namefirst,namelast,lgid
FROM news
WHERE lgid= 'NL'),

 al_league AS (SELECT playerid,teamid,yearid,namefirst,namelast,lgid
FROM news
WHERE lgid='AL')

SELECT  nl_league.namefirst,nl_league.namelast,nl_league.teamid as nl_team, nl_league.lgid as nl,al_league.teamid as al_team,al_league.lgid as al
FROM nl_league 
INNER JOIN al_league USING(playerid)
