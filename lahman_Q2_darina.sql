
---Lahman Q2. 
	--Find the name and height of the shortest player in the database. Edward Carl 43
	--How many games did he play in? What is the name of the team for which he played? played for 1 game SLA 
	SELECT playerid, height, namefirst,namelast, g_all
	FROM people INNER JOIN appearances USING(playerid)
	GROUP BY people.playerid, appearances.playerid, g_all
	ORDER BY MIN(height) ASC