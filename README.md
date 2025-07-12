📊 SQL Analysis: Remote Work Trends by Experience Level (2021 vs 2024)

🗂️ Project Overview

This SQL project analyzes how remote work participation varies across experience levels for the years 2021 and 2024 using a dataset sourced from Kaggle. The analysis uses SQL JOIN, GROUP BY, CASE, and ROUND operations to derive insights into workforce trends and remote work percentages.

📁 File Included

use join exp.sql
Contains all SQL queries used for analyzing employee and remote work counts by experience level across two different years, and comparing trends over time.

🧾 Data Source

Dataset: Kaggle - Data Science Salaries Dataset

Table Used: salaries

✅ Highlights

Calculated total number of employees by experience level in 2021 and 2024.

Identified fully remote workers (remote_ratio = 100) for both years.

Computed remote work percentages by experience level using JOIN and ROUND.

Compared remote work participation between 2021 and 2024.

Derived a column to indicate if remote participation increased or decreased across experience levels using CASE statements.

🧮 Key SQL Techniques Used
Subqueries & Aliasing

INNER JOIN

ROUND() for percentage formatting

CASE WHEN logic for change detection

Data grouping via GROUP BY

📌 Sample Output (Conceptual)

Experience Level	  % Remote 2021   	% Remote 2024	     Delta
  Junior            	   45.00	          52.38         INCREASE
  Senior	               60.00	          48.00	        DECREASE

🚀 How to Use

Ensure you have a SQL environment (e.g., MySQL, PostgreSQL) with the salaries table loaded.

Run the queries in use join exp.sql sequentially or as needed.

Analyze the result tables to draw insights about how remote work patterns are changing over time.
