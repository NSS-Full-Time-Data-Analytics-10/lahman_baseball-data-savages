---2. Find the name and height of the shortest player in the database. 
------How many games did he play in? What is the name of the team for which he played?
SELECT namefirst, namelast, height
FROM people
ORDER BY height
LIMIT 1;

SELECT namelast, namefirst, * 
FROM people 
WHERE namelast = 'Gaedel';
---playerid = gaedeed01
SELECT *
FROM appearances
WHERE playerid = 'gaedeed01';
---teamid = SLA

SELECT namefirst, namelast, height, teamid, g_all
FROM people
INNER JOIN appearances
	USING (playerid)
WHERE playerid = 'gaedeed01';

---***--- Eddie Gaedel, 43in, SLA, 1 game total
