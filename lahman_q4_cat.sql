---Using the fielding table, group players into three groups based on their position: 
------label players with position OF as "Outfield", 
------those with position "SS", "1B", "2B", and "3B" as "Infield", 
------and those with position "P" or "C" as "Battery". 
---Determine the number of putouts made by each of these three groups in 2016.
---ANSWER*-*-*-* 41424	"Battery"
---------*-*-*-* 58934	"Infield"
---------*-*-*-* 29560	"Outfield"

SELECT SUM(po) AS putout_sum,
	CASE WHEN Pos = 'OF' 
		  THEN 'Outfield'
		 WHEN Pos = 'SS' OR Pos = '1B' 
		   OR Pos = '2B' OR Pos = '3B' 
		  THEN 'Infield'
		 WHEN Pos = 'P' OR Pos = 'C' 
		  THEN 'Battery' END AS pos_type
FROM fielding
WHERE yearid = 2016
GROUP BY pos_type




