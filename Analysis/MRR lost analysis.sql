SELECT
  DATE_TRUNC('month', enddate) :: date AS month,
  SUM(mrramount) AS mrrlost
FROM public."SubscriptionDetails"
WHERE churnflag = TRUE
  AND enddate IS NOT NULL
GROUP BY month
ORDER BY month;
