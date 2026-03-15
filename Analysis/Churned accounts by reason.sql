SELECT
  reason,
  COUNT(DISTINCT accountid) AS churnedaccounts
FROM public."Churn_events"
GROUP BY reason
ORDER BY churnedaccounts DESC;
