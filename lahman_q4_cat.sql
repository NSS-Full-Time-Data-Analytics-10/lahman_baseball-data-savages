---Using the fielding table, group players into three groups based on their position: 
------label players with position OF as "Outfield", 
------those with position "SS", "1B", "2B", and "3B" as "Infield", 
------and those with position "P" or "C" as "Battery". 
---Determine the number of putouts made by each of these three groups in 2016.

---???can we put multiple conditions in one single case statment

SELECT Pos, 
	COUNT(CASE WHEN Pos = 'OF' 
		  THEN 'Outfield'END) AS outfield_count,
	COUNT(CASE WHEN Pos = 'SS' OR Pos = '1B' 
		  		 OR Pos = '2B' OR Pos = '3B' 
		  THEN 'Infield'END) AS infield_count,
	COUNT(CASE WHEN Pos = 'P' OR Pos = 'C' 
		  THEN 'Battery'END) AS battery_count 
FROM fielding
GROUP BY Pos
