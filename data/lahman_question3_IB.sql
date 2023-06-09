--LIST OF TABLES AND MAINKEY USED: collegeplaying,salaries,people- playerid is the key 
SELECT playerid,salary
FROM salaries;
--names of players that went to vandy
SELECT namelast,namefirst
FROM people
WHERE playerid IN (SELECT playerid
FROM collegeplaying
WHERE schoolid ILIKE '%vandy%'
			 AND people.playerid=collegeplaying.playerid)
--players that went to vandy
SELECT playerid,schoolid
FROM collegeplaying
WHERE schoolid ILIKE '%vandy%';

---total list sum of salary and player first and last name
SELECT namefirst,namelast,SUM(s.salary) AS total_salary
FROM collegeplaying AS cp
INNER JOIN salaries AS s USING(playerid)
INNER JOIN people AS p USING(playerid)
WHERE schoolid IN (SELECT schoolid
				 FROM collegeplaying
				 WHERE schoolid ILIKE '%vandy%')
GROUP BY(namelast,namefirst)
ORDER BY SUM(s.salary)DESC


--top salary sum
SELECT namefirst,namelast,SUM(s.salary) AS total_salary
FROM collegeplaying AS cp
    INNER JOIN salaries AS s USING(playerid)  
    INNER JOIN people AS p USING(playerid)
WHERE schoolid IN 
                 (SELECT schoolid
				 		FROM collegeplaying
				 		WHERE schoolid ILIKE '%vandy%')
GROUP BY(namelast,namefirst)
ORDER BY SUM(s.salary)DESC
LIMIT 1

				 
