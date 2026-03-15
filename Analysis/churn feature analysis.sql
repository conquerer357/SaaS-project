SELECT
  u.featureid,
  CASE WHEN c.accountid IS NULL THEN 'notchurned' ELSE 'churned' END AS churnstatus,
  COUNT(DISTINCT s.accountid) AS accounts,
  AVG(u.usagecount) AS avgusage
FROM public."feature_usage" u
JOIN public."SubscriptionDetails" s
  ON s.subscriptionid = u.subscriptionid
LEFT JOIN public."Churn_events" c
  ON c.accountid = s.accountid
GROUP BY u.featureid, churnstatus
ORDER BY u.featureid, churnstatus;
