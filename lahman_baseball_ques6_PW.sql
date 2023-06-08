SELECT *
FROM batting;
SELECT MAX (yearid),MAX(playerid),MAX(stint)
FROM batting;

SELECT playerid,yearid,sb
FROM batting
INNER JOIN people
USING (playerid)
GROUP BY batting.playerid,people.playerid,yearid,sb
ORDER BY MAX(sb),MAX(yearid)DESC;
SELECT namefirst,namelast,*
FROM people
INNER JOIN batting
USING(playerid)
GROUP BY batting.playerid,people.playerid,yearid,sb,namefirst,namelast,stint
ORDER BY MAX(sb),MAX(yearid)DESC


SELECT people.playerid, people.namefirst, people.namelast, (SUM(batting.sb)+SUM(batting.cs)/100) AS sucess_stolen_bases
FROM batting
INNER JOIN people USING(playerid)
WHERE batting.sb >=20 AND batting.yearid =2016
GROUP BY people.playerid, people.namefirst, people.namelast
ORDER BY sucess_stolen_bases DESC;
--Villar,Jonathan has 62 stolen bases

