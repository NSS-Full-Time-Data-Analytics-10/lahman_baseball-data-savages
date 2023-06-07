--Lahman Q8. 
--Using the attendance figures from the homegames table, find the teams and parks which had the top 5 average attendance per game in 2016 
--(where average attendance is defined as total attendance divided by number of games). 
--Only consider parks where there were at least 10 games played. Report the park name, team name, and average attendance. 
--Repeat for the lowest 5 average attendance.


--CODE for TOP 5 Average Attendance Per Game in 2016
SELECT team, park, SUM(attendance)/COUNT(games) AS avg_attendance
FROM homegames 
WHERE year = 2016 AND games >=10
GROUP BY team, park
ORDER BY avg_attendance DESC
LIMIT 5;

--CODE for Bottom 5 Average Attendance Per Game in 2016
SELECT team, park, SUM(attendance)/COUNT(games) AS avg_attendance
FROM homegames 
WHERE year = 2016 AND games >=10
GROUP BY team, park
ORDER BY avg_attendance ASC
LIMIT 5;
