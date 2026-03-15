WITH churntenure AS (
  SELECT
    c.accountid,
    (date_part('year', age(c.churndate, a.signupdate)) * 12
     + date_part('month', age(c.churndate, a.signupdate)))::int AS tenuremonths
  FROM public."Churn_events" c
  JOIN public."AccountDetails" a
    ON a.accountid = c.accountid
),
bucketed AS (
  SELECT
    CASE
      WHEN tenuremonths < 3  THEN '0-2 months'
      WHEN tenuremonths < 6  THEN '3-5 months'
      WHEN tenuremonths < 12 THEN '6-11 months'
      ELSE '12+ months'
    END AS tenurebucket,
    CASE
      WHEN tenuremonths < 3  THEN 1
      WHEN tenuremonths < 6  THEN 2
      WHEN tenuremonths < 12 THEN 3
      ELSE 4
    END AS sortkey,
    accountid
  FROM churntenure
)
SELECT
  tenurebucket,
  COUNT(DISTINCT accountid) AS churnedaccounts,
  ROUND(
    100.0 * COUNT(DISTINCT accountid)
    / SUM(COUNT(DISTINCT accountid)) OVER (),
    2
  ) AS pctofallchurn
FROM bucketed
GROUP BY tenurebucket, sortkey
ORDER BY sortkey;
