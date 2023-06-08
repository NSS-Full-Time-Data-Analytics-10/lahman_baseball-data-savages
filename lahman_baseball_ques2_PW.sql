

SELECT namelast,namefirst, *
FROM people
WHERE namefirst = 'Gaedel';
--playerid = gaedeed01

SELECT *
FROM appearances
WHERE playerid = 'gaedeed01'
--teamid =SLA

SELECT playerid, height, namefirst,namelast, g_all
	FROM people INNER JOIN appearances USING(playerid)
	GROUP BY people.playerid, appearances.playerid, g_all
	ORDER BY MIN(height) ASC