-- Per month, per raveler, what % yarn and how many projects did you use out of your total vs everyone’s total.

WITH tot AS (
  SELECT TRIM(SUBSTR(prj.enddate,1,2),'/') AS endmonth,
         COUNT(prj.id) AS proj_complete,
         SUM(pat.gauge) AS tot_yarn
  FROM project AS prj
  LEFT JOIN pattern AS pat
      ON prj.pattern = pat.id
  GROUP BY TRIM(SUBSTR(prj.enddate,1,2),'/')
),
ind AS (
  SELECT rav.ravelname,
         TRIM(SUBSTR(prj.enddate,1,2),'/') AS endmonth,
         COUNT(prj.id) AS proj_complete,
         SUM(pat.gauge) AS tot_yarn
  FROM project AS prj
  LEFT JOIN pattern AS pat
      ON prj.pattern = pat.id
  LEFT JOIN raveler AS rav
      ON rav.id = prj.raveler
  GROUP BY rav.ravelname,
           TRIM(SUBSTR(prj.enddate,1,2),'/')
)
SELECT ind.ravelname,
       ind.endmonth,
       ind.proj_complete AS indiv_proj,
--       SUM(ind.proj_complete) OVER ( PARTITION BY ind.ravelname ORDER BY ind.endmonth ) AS yearly_proj,
       tot.proj_complete AS tot_proj,
       ROUND(ind.proj_complete*100./tot.proj_complete,1) AS proj_perc,
       ind.tot_yarn AS indiv_used,
       tot.tot_yarn AS tot_used,
       ROUND(ind.tot_yarn*100./tot.tot_yarn,1) AS yarn_perc
FROM ind
LEFT JOIN tot
    ON ind.endmonth = tot.endmonth
ORDER BY proj_perc DESC
LIMIT 10;
