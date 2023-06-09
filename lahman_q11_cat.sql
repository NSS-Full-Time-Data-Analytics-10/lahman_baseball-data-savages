---Is there any correlation between number of wins and team salary? 
---Use data from 2000 and later to answer this question. 
---As you do this analysis, keep in mind that salaries across the whole league tend to increase together, 
---so you may want to look on a year-by-year basis.
---------------------------------------------
---wins per team each year
SELECT yearid, teamid, w
FROM teams
WHERE yearid BETWEEN 2000 AND 2016
ORDER BY yearid, teamid;
---avg team salary per year
SELECT yearid, teamid, AVG(salary::numeric)::MONEY
FROM salaries
WHERE yearid BETWEEN 2000 AND 2016
GROUP BY yearid, teamid
ORDER BY yearid, teamid;
-------
WITH team_win_count AS (SELECT yearid, teamid, w
						FROM teams
						WHERE yearid BETWEEN 2000 AND 2016
						ORDER BY yearid, teamid), 
	avg_team_salary AS (SELECT yearid, teamid, AVG(salary::numeric)::MONEY
						FROM salaries
						WHERE yearid BETWEEN 2000 AND 2016
						GROUP BY yearid, teamid
						ORDER BY yearid, teamid)
SELECT * 
FROM team_win_count
INNER JOIN avg_team_salary
USING (yearid, teamid)
ORDER BY teamid