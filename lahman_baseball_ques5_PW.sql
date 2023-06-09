

SELECT CONCAT((yearid - (yearid % 10))) AS decade,ROUND(AVG(SO),2) AS avg_strikeouts,ROUND(AVG(hr),2) AS avg_homeruns
FROM batting 
WHERE yearid BETWEEN 1920 AND 2016
GROUP BY decade
ORDER BY decade ASC;

--the average strikeouts was 13.04 in 1920 & homeruns was 1.86. I noticed that numbers increased each decade.



