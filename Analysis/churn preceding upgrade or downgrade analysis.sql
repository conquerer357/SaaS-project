SELECT
  precedingupgrade,
  precedingdowngrade,
  COUNT(*) AS churnevents
FROM public."Churn_events"
GROUP BY 1, 2
ORDER BY churnevents DESC;
