--Lahman Q5. Find the average number of strikeouts per game by decade since 1920. 
	--Round the numbers you report to 2 decimal places. 
	--Do the same for home runs per game. 
	--Do you see any trends? For about six decades the average homeruns have hovered steadily around 3.
SELECT CONCAT((yearid - (yearid % 10))) AS decade,ROUND(AVG(SO),2) AS avg_strikeouts,ROUND(AVG(hr),2) AS avg_homeruns
FROM batting 
WHERE yearid BETWEEN 1920 AND 2016
GROUP BY decade
ORDER BY decade ASC



