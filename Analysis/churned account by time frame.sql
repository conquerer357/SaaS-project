SELECT
  CASE
    WHEN tenuremonths < 3 THEN '0-2 months'
    WHEN tenuremonths < 6 THEN '3-5 months'
    WHEN tenuremonths < 12 THEN '6-11 months'
    ELSE '12+ months'
  END AS tenurebucket,
  COUNT(DISTINCT t.accountid) AS churnedaccounts
FROM (
  SELECT
    c.accountid,
    (date_part('year', age(c.churndate, a.signupdate)) * 12
     + date_part('month', age(c.churndate, a.signupdate))) AS tenuremonths
  FROM public."Churn_events" c
  JOIN public."AccountDetails" a
    ON a.accountid = c.accountid
) t
GROUP BY tenurebucket
ORDER BY tenurebucket
