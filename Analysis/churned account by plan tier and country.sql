SELECT
  a.plantier,
  a.country,
  COUNT(DISTINCT c.accountid) AS churnedaccounts
FROM public."Churn_events" c
JOIN public."AccountDetails" a
  ON a.accountid = c.accountid
GROUP BY a.plantier, a.country
ORDER BY churnedaccounts DESC;
