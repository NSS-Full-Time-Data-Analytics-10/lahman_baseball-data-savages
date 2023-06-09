

SELECT hr,playerid,stint,*
FROM batting
INNER JOIN people
USING (playerid)
GROUP BY people.playerid,batting.playerid,hr,namefirst,namelast,stint,yearid
ORDER BY MAX(hr)DESC;




(SELECT namefirst,namelast, MAX(hr) AS most_hr
FROM batting
INNER JOIN people
USING (playerid)
WHERE hr > 0 AND (finalgame::DATE - debut::DATE) >= 3650 AND yearid = 2016
GROUP BY hr,playerid,namefirst,namelast,yearid)
ORDER BY hr DESC;



