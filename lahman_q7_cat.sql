---From 1970 – 2016, what is the largest number of wins for a team that did not win the world series? 
---*-*-*---ANSWER = 116
SELECT W
FROM teams
WHERE WSWin IS NOT NULL
	AND yearid BETWEEN 1970 AND 2016
	AND WSWin = 'N'
ORDER BY W DESC
LIMIT 1;
---What is the smallest number of wins for a team that did win the world series? Doing this will probably
---result in an unusually small number of wins for a world series champion – determine why this is the case. 
---Then redo your query, excluding the problem year.
---*-*-*- ANSWER: The smallest number of wins for a given World Series winning team is 63 wins.
---However, the 1981 season incurred a MLB strike that resulted in regular season games being cancelled. 
---Without the problem year, the result for smallest wins for a world series team is 83 wins. 

SELECT w 
FROM teams
WHERE yearid BETWEEN 1970 AND 2016
	AND WSWin = 'Y'
ORDER BY w
LIMIT 1;
---corrected for anomoly
SELECT W 
FROM teams
WHERE yearid BETWEEN 1970 AND 2016
	AND WSWin = 'Y'
	AND yearid != 1981
ORDER BY w
LIMIT 1;
---How often from 1970 – 2016 was it the case that a team with the most wins also won the world series? 
---*-*-*-* 12
WITH ws_champs AS (SELECT yearid, w AS wschamp_wins
				   FROM teams
 				   WHERE yearid BETWEEN 1970 AND 2016
          	       AND wswin ='Y'
				   ORDER BY YEARID),
	 most_wins AS (SELECT DISTINCT yearid, MAX(W) AS reg_high_win
				   FROM teams
				   WHERE yearid BETWEEN 1970 AND 2016
					 AND yearid != 1994
				   GROUP BY DISTINCT yearid
				   ORDER BY YEARID)
SELECT COUNT(CASE WHEN wschamp_wins >= reg_high_win THEN 'chicken_dinner'END) AS winner_winner
FROM ws_champs
FULL JOIN most_wins
	 USING (yearid)
---What percentage of the time?
---*-*-*- ANSWER: 26.09%
WITH ws_champs AS (SELECT yearid, w AS wschamp_wins
				   FROM teams
 				   WHERE yearid BETWEEN 1970 AND 2016
          	       AND wswin ='Y'
				   ORDER BY YEARID),
	 most_wins AS (SELECT DISTINCT yearid, MAX(W) AS reg_high_win
				   FROM teams
				   WHERE yearid BETWEEN 1970 AND 2016
					 AND yearid != 1994
				   GROUP BY DISTINCT yearid
				   ORDER BY YEARID)
SELECT COUNT(CASE WHEN wschamp_wins >= reg_high_win THEN 'chicken_dinner'END)/(SELECT COUNT(*)
																				FROM teams
																				WHERE yearid BETWEEN 1970 AND 2016
																				AND WSWin ='Y')::numeric *100 AS percentage_win
FROM ws_champs
FULL JOIN most_wins
	 USING (yearid)







