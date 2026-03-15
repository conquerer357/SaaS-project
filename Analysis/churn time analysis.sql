SELECT
  CASE WHEN c.accountid IS NULL THEN 'notchurned' ELSE 'churned' END AS churnstatus,
  COUNT(t.ticketid) AS tickets,
  AVG(t.resolutionhrs) AS avgresolutionhours,
  AVG(t."1stresponsemins") AS avg1stresponseminutes,
  AVG(t.satisfactionscore) AS avgsatisfaction,
  AVG(CASE WHEN t.escalationflag THEN 1 ELSE 0 END) AS escalationrate
FROM public."support_tickets" t
LEFT JOIN public."Churn_events" c
  ON c.accountid = t.accountid
GROUP BY churnstatus
ORDER BY churnstatus;
