## Case Study: BrightTV Viewership Analytics

## Introduction

BrightTV is a subscription-based entertainment platform with a strategic goal to expand its subscriber base during the current financial year. The CEO has tasked the Customer Value Management (CVM) team with uncovering actionable insights from user profile and viewership transaction data. These insights will inform content strategy, user engagement initiatives, and growth opportunities

This case study focuses on analyzing user behavior, identifying content consumption trends, and proposing data-driven strategies to increase engagement and subscriber growth.

## Objectives
This case study aims to address the following:

- Analyze user and usage trends to understand viewing behavior.
- Identify key factors influencing content consumption.
- Recommend content strategies to boost engagement on low-consumption days.
- Propose initiatives to grow BrightTV’s user base through data-driven actions.

## Approach / Methodology

Data Understanding and Preparation

 - Reviewed the raw CSV dataset containing user profile and viewing session data.
 - Converted all timestamps from UTC to South African Standard Time (SAST).
 - Cleaned data to handle missing or inconsistent entries.

Exploratory Data Analysis (EDA)

 - Performed SQL-based analysis to identify top viewing days, peak hours, and content preferences.
 - Used Excel for pivot tables and trend visualization (e.g., user activity by day, content category distribution).

## Tools Used
The following tools were used to analyze and visualize data:

 - SQL – for querying, transforming, and analyzing viewership and user data.
 - Snowflake – as the cloud data warehouse for managing and storing datasets.
 - Excel – for data cleaning, exploration, and pivot analysis.
 - Google Looker Studio & PowerPoint – for creating dashboards and presenting insights effectively.
 - MIRO & CANVA - for project planning and Gantt Chart
   
## Project Structure

BrightTV-Case-Study/
│
├── 0.README.md
│
├── 1.Project Description & Raw Data/
│   ├── BrightTV_Case_Study.pdf
│   └── BrightTV_Raw_Data.csv
│
├── 2.Project Planning/
│   ├── Miro_Flowchart.png
│   └── Gantt_Chart.png
│
├── 3.Data Processing/
│   ├── SQLCode.sql
│   └── BrightTV_Excel_Analysis.xlsx
│
└── 4.Project Presentation/
    ├── Presentation.pdf
    └── Dashboard.pdf

## Key Insights

 - Peak viewership occurs during weekends, particularly on Fridays and Sundays.
 - Weekdays, especially Mondays and Wednesdays, show lower engagement.
 - Drama and sports categories have the highest watch time.
 - Users from Gauteng and Western Cape show the highest activity levels.

## Recommendations
To boost engagement on quieter days like Monday and Wednesday:

 - Catch-Up Capsules: Recap top content from the weekend.
 - Interactive Polls & Quizzes: Gamified formats to spark participation.
 - Behind-the-Scenes or Creator Spotlights: Build emotional connection and loyalty.
 - Countdowns or Teasers: Create anticipation for upcoming drops.
 - Localized Content: Feature region-specific stories or shoutouts (especially for Gauteng, Western Cape, and KZN).

## Conclusion

This analysis provides data-driven recommendations for increasing user engagement and driving subscriber growth for BrightTV. By leveraging insights from user behavior and content trends, BrightTV can optimize content scheduling, strengthen engagement, and achieve its strategic growth objectives.
