# SaaS Churn Analysis

**Tools:** Python · PostgreSQL · pgAdmin · Tableau Desktop
**Period:** January 2023 – December 2024
**Industry:** B2B SaaS
**Type:** Portfolio Project

---

## Project Overview

End-to-end churn analysis for a SaaS business covering 477 churned accounts and $1.14M in lost MRR across 24 months. Raw data was sourced from Kaggle, cleaned in Python, loaded into PostgreSQL, queried using SQL in pgAdmin, exported as CSVs, and visualised in Tableau across three purpose-built dashboards.

The analysis identifies the root causes of an accelerating churn crisis, quantifies the financial impact, and produces six prioritised business recommendations.

---

## Repository Structure

**data/**
- churn_monthly_trends.csv
- monthly_mrr.csv
- churn_by_tenure.csv
- churn_by_support_metrics.csv
- churn_rate_by_country_and_plantier.csv
- top_churn_reasons.csv
- churned_count_by_plans_and_industries.csv
- Churneventspreceedingupgrade_or_downgrade.csv
- churn_status_by_feature.csv

**Raw data/**
- ravenstack_accounts.csv
- ravenstack_subscriptions.csv
- ravenstack_support_tickets.csv
- ravenstack_feature_usage.csv
- ravenstack_plan_changes.csv
- ravenstack_churn_events.csv_

**tableau/**
- SaaS_project_visualization.twb

---

## Why Three Dashboards Instead of One

A single dashboard was the first option considered and rejected deliberately.

Each audience in a business has a different question. An executive wants to know how bad the problem is and what it is costing. An analyst or department head wants to know why it is happening. An operations team wants to know where to focus and what to do next. Forcing all three questions into one dashboard produces a document that answers none of them clearly, because the layout has to compromise between too many priorities at once.

Three dashboards lets each view breathe. The executive opens Dashboard 1, sees the KPIs and the acceleration trend, and has everything they need in under 30 seconds. The product or support lead opens Dashboard 2 and sees the reasons, the geographic concentration, and the support quality gap without wading through operational tables. The retention team opens Dashboard 3 and gets the segment breakdown, the plan change signals, and the feature usage comparison without irrelevant executive summary material cluttering the view.

This is also how professional BI tools are actually used inside companies. Tableau, Power BI, and Looker all encourage audience-specific dashboard design for this reason. One massive dashboard is a common beginner mistake. Three focused dashboards is deliberate information architecture.

---

## Why the Design is Kept Simple and Clean

Every formatting decision in this project followed one rule: does this element help the viewer understand the data faster, or does it just fill space?

Gradients, drop shadows, decorative icons, heavy colour palettes, and dense annotation boxes all make a dashboard look like effort was spent. They rarely make the data clearer. In most cases they slow the viewer down because the eye has to process visual noise before it reaches the actual numbers.

The design choices made here — white backgrounds, a limited two-colour scheme (red for churn, green for retained), minimal gridlines, left-aligned text, and generous spacing — are the same choices used by teams at companies like Airbnb, Stripe, and Google in their internal analytics tooling. Simplicity is not a shortcut. It is the harder and more deliberate option, because every element that remains has to earn its place.

A second practical reason: simple dashboards are easier to maintain, easier to hand off to a colleague, and easier to update when the underlying data changes. A cluttered dashboard built for visual impression becomes a liability the moment someone else has to edit it.

---

## Dashboards

### Dashboard 1 — Executive Overview

![Critical Window](Tableau/Critical%20Window.png)

*Answers: How bad is the problem and how fast is it growing?*

- KPI cards: 477 churned accounts, $1.17M MRR lost, 61% early churn rate
- Dual-axis line chart: monthly churned accounts and MRR lost on separate scales (Jan 2023 – Dec 2024)
- Horizontal bar chart: churn by customer tenure bucket with percentage labels
- Trend lines on the timeline showing acceleration, not just volume

### Dashboard 2 — Root Cause Analysis

![Root Cause Analysis](Tableau/Root%20Cause%20Analysis.png)

*Answers: Why are customers leaving?*

- Horizontal bar chart: top churn reasons, colour-coded by category (product, service, price, competition)
- Heatmap: churned accounts by country and plan tier
- Four-chart support performance comparison: escalation rate, resolution time, first response time, satisfaction score (churned vs retained)

### Dashboard 3 — Segement-level Insights
*Answers: Where should retention effort be focused?*

![Segment-level Insights](Tableau/Segement%20Level%20Insight.png)

- Vertical bar chart: churned accounts by industry and plan tier
- Vertical bar chart: plan change behaviour preceding churn (upgrade, downgrade, multiple changes, none)
- Comparison table: feature usage for churned vs retained customers with dynamic Top N / Bottom N filter

---

## Key Findings

**1. Churn is accelerating, not plateauing.**
Monthly churn grew from 1 account in January 2023 to 96 accounts in December 2024. MRR lost in December 2024 alone ($574,643) exceeded the combined total of all 2023 losses ($51,495).

**2. The company has an onboarding problem, not a retention problem.**
60.6% of all churned accounts cancelled within the first five months. 39.4% cancelled within the first 60 days. Customers are not reaching perceived value before their patience runs out.

**3. Fixable internal issues drive 79% of identified churn.**
Product feature gaps (104 accounts), support failures (95), budget concerns (94), and pricing (86) account for the vast majority of stated reasons. Only 79 accounts cited a competitor. This is not a competitive problem.

**4. Support quality is hidden behind misleading metrics.**
Resolution time, first response time, and satisfaction scores are nearly identical between churned and retained customers. Escalation rate tells a different story: churned customers escalated 59% more often (6.2% vs 3.9%), indicating that tickets were closed without genuinely solving the underlying problem.

**5. The US Pro segment is the highest-concentration risk.**
80 churned accounts in a single country/plan combination. The three US plan tiers combined account for 206 accounts, or 43% of all churn.

**6. Plan downgrades predict churn.**
45 customers downgraded before cancelling. 115 upgraded before cancelling — a last attempt to find value that failed. Both behaviours are observable in the CRM in real time and neither is being acted on.

---

## Recommendations

**1. Rebuild the first 60-day onboarding experience**
Introduce activation milestones and proactive CSM assignment for all new accounts.

**2. Conduct structured exit interviews with feature-churn accounts**
Interview the 104 accounts who cited feature gaps and reprioritise the product roadmap by churn impact.

**3. Replace resolution time and CSAT as primary support KPIs**
Adopt a 7-day ticket reopening rate as the core support quality metric.

**4. Trigger automatic outreach within 48 hours of any plan downgrade**
Route downgrade events to Customer Success for immediate intervention.

**5. Assign dedicated CSMs to the US Pro book of business**
Run a 90-day intensive retention programme and NPS survey on current active accounts in this segment.

**6. Implement a mandatory cancellation survey**
Reduce the 18% unknown churn reason rate to below 8%.

---

## Raw Data

The raw dataset is the RavenStack Synthetic SaaS Dataset (Multi-Table), sourced from Kaggle. It simulates a relational CRM database for a B2B SaaS business and contains multiple linked tables covering accounts, subscriptions, support tickets, feature usage, plan changes, and cancellation records. No personally identifiable information is included. The dataset was chosen because its multi-table structure reflects how churn data actually lives inside a real CRM — fragmented across entities rather than pre-aggregated into a single flat file, which made it a realistic environment to practice SQL querying and data modelling.

---

## Tools and Why

**Python (pandas)**
Used for initial data profiling and cleaning before loading into PostgreSQL. Pandas made it straightforward to inspect column types, identify nulls, flag inconsistent string values, and verify row counts across tables before any SQL work began. It was the right tool for exploratory cleaning because the feedback loop is fast and the operations are transparent.

**PostgreSQL and pgAdmin**
Used for all analytical querying once the data was clean and loaded. PostgreSQL was chosen over spreadsheet-based analysis because the dataset is relational — answering questions like "what was the churn rate by plan tier among customers who downgraded in their first 90 days" requires joining multiple tables, filtering on conditions across them, and aggregating correctly. Writing that in SQL is precise and reproducible. pgAdmin provided a GUI to manage the database, inspect schemas, and run queries during development.

**Tableau Desktop**
Used for all visualisation and dashboard construction. Tableau was chosen over a code-based option like matplotlib or seaborn because the output is interactive, shareable, and built for business audiences. The drag-and-drop workflow is also faster for iterating on layout and design decisions than writing and rewriting plot code. The final deliverable is three dashboards intended for different business stakeholders, and Tableau is the standard tool for that kind of output in analytics roles.

---

## Data Cleaning

Cleaning was done in Python using pandas before the data was loaded into PostgreSQL.

**Null handling**
Columns with missing values were identified across all tables. Nulls in categorical fields such as cancellation reason were left as-is and later treated as an "Unknown" category in the analysis rather than imputed, because inventing a reason for why a customer churned would introduce false signal. Nulls in numeric fields were investigated individually — most were structural (a customer who never raised a support ticket has no resolution time, for example) and were excluded from relevant aggregations rather than filled.

**Data types**
Date columns were read as objects by default and converted to datetime. Numeric columns stored as objects also, coverted into string with consistent formatting. Boolean columns representing plan change flags were verified to contain only True/False values with no mixed-type entries.

**String consistency**
Categorical values were lowercased and stripped of leading and trailing whitespace to prevent grouping errors downstream. For example, plan tier values were standardised to "basic", "pro", and "enterprise" to ensure consistent GROUP BY behaviour in SQL.

**Deduplication**
Each table was checked for duplicate primary keys. No duplicates were found.

**Range validation**
Numeric fields were checked for out-of-range values. Satisfaction scores outside the expected 1–5 range and negative MRR values were flagged and investigated. None were found after cleaning.

The cleaned tables were then loaded into PostgreSQL using pandas' `to_sql` method, and all subsequent analysis was done in SQL.

---

## Queried Data Files

**churn_monthly_trends.csv**
Monthly churned account counts.

**monthly_mrr.csv**
Monthly MRR lost to churn.

**churn_by_tenure.csv**
Churn grouped by customer tenure at cancellation.

**churn_by_support_metrics.csv**
Support KPIs split by churn status.

**churn_rate_by_country_and_plantier.csv**
Churned accounts by country and plan tier.

**top_churn_reasons.csv**
Self-reported cancellation reasons.

**churned_count_by_plans_and_industries.csv**
Churn by industry and plan tier.

**Churneventspreceedingupgrade_or_downgrade.csv**
Plan change behaviour before cancellation.

**churn_status_by_feature.csv**
Feature usage split by churn status.

---

## Executive Summary

The business is losing customers at an accelerating rate, and the primary causes are internal and fixable. The data does not point to a market problem, a competitive problem, or an economic problem. It points to onboarding that fails to demonstrate value before customers run out of patience, a support function that closes tickets without solving problems, and a product that has identifiable gaps customers are explicitly communicating when they leave.

The six recommendations in this analysis address each of these root causes directly. None of them require significant capital expenditure. Most require process change, measurement change, and focused human attention directed at the right customer segments at the right moment in the lifecycle.

The window to reverse the acceleration curve is narrowing. At the December 2024 trajectory, annual MRR loss will exceed $5M in 2025 if no intervention occurs.
