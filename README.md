# 🧠 Employee Attrition Intelligence & Workforce Risk Analytics

## 📌 Project Overview

**Employee attrition** is one of the most critical challenges faced by HR
teams globally. High turnover leads to increased recruitment costs, loss of
institutional knowledge, and reduced team productivity.

This project analyzes attrition patterns across departments, job roles,
demographics, compensation, and work-life balance factors using the
**IBM HR Analytics Dataset** — helping HR teams make data-driven
retention decisions.

---

## ❓ Problem Statement

Organizations lose significant resources to employee attrition every year.
Although exit interviews provide some insight, the **patterns behind attrition
are rarely analyzed systematically** across departments, tenure, compensation,
and demographics.

**Goal:** Identify high-risk employee segments, analyze attrition drivers,
and provide actionable retention recommendations using data analytics
and visual storytelling.

---

## 📂 Dataset

| Attribute | Details |
|---|---|
| **Source** | IBM HR Analytics (Kaggle) |
| **Total Records** | 1,470 employees |
| **Attrition Cases** | 237 employees (16.1%) |
| **Features** | 35 columns |
| **Coverage** | Departments, Job Roles, Demographics, Compensation |
| **Type** | Cross-sectional HR survey data |

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| **Power BI Desktop** | Dashboard & visualizations |
| **DAX** | Calculated measures & KPIs |
| **Power Query** | Data cleaning & transformation |
| **Excel/CSV** | Raw data storage |

---

## 🔄 Methodology

1. **Data Collection**
└── Downloaded IBM HR Attrition dataset
from Kaggle as Excel (.xlsx) file

2. **Data Cleaning (Microsoft Excel)**
└── Removed unwanted/redundant columns
└── Renamed columns for clarity
└── Checked and corrected data types
└── Verified no duplicate employee records

3. **SQL Analysis (MySQL)**
└── Loaded cleaned Excel into database
└── Solved business questions using SQL queries
└── Analyzed attrition by dept, age,
income, tenure, overtime

4. **Dashboard (Power BI)**
└── Loaded cleaned data into Power BI
└── Created DAX measures & calculated columns
└── Built 3-page interactive dashboard

---

## 💡 Key Insights

| # | Insight | Finding |
|---|---|---|
| 📊 | **Overall Attrition** | 16.1% attrition rate — nearly 1 in 6 employees left the organization |
| 🏢 | **R&D dominates exits** | Research & Development accounts for 133 exits — over half of all attrition cases |
| 💰 | **Salary drives attrition** | Low-income employees record the highest attrition rate at 21.8% |
| ⏰ | **Overtime is critical** | Employees working overtime are ~3× more likely to leave |
| 👶 | **Early tenure is risky** | 0–2 year employees account for 102 exits — the highest tenure risk group |
| 👥 | **Age 25–34 most at risk** | Highest attrition levels across both male and female employees |
| ⚖️ | **Work-life balance matters** | Poor work-life balance (rating 1) shows 31.3% attrition vs 17.6% for Excellent |
| 🔬 | **Lab Technicians lead exits** | 62 exits — highest attrition by job role |

---

## 📊 Dashboard Preview

### 🔹 Page 1 — Executive Overview
![Executive Overview](Executive_overview.png)

### 🔹 Page 2 — Attrition Deep Dive
![Attrition Driver Analysis](Attrition_Driver_Analysis.png)

### 🔹 Page 3 — Workforce Risk Profile
![Workforce Risk & Retention](Workforce_Risk_&_Retention.png)

---

## 📁 Project Structure
📦 HR-Attrition-Intelligence/
┣ 📂 data/
┃ ┣ 📄 HR_Attrition_Raw.xlsx          # Original file downloaded from Kaggle
┃ ┗ 📄 HR_Attrition_Cleaned.xlsx      # After cleaning in Excel
┣ 📂 sql/
┃ ┗ 📄 business_questions.sql         # Business questions solved in SQL
┣ 📂 dashboard/
┃ ┣ 📊 HR_Attrition.pbix              # Power BI dashboard file
┃ ┗ 📂 screenshots/
┃   ┣ 🖼️ page1_executive_overview.png
┃   ┣ 🖼️ page2_workforce_risk.png
┃   ┗ 🖼️ page3_attrition_deepdive.png
┗ 📄 README.md
---

## 🧹 Data Cleaning Highlights

- Validated 1,470 records — no duplicate employee IDs
- Removed static/zero-variance columns
  (e.g., EmployeeCount, StandardHours, Over18)
- Created Age_Band: Under 25 / 25–34 / 35–44 / 45+
- Created Income_Group: Low / Medium / High
- Created Tenure_Band: 0–2 yrs / 3–5 yrs / 6–10 yrs / 10+ yrs
- Created Risk_Category: Low / Medium / High / Critical
  based on overtime + income + tenure combination

---

## 📐 DAX Measures (Power BI)

```dax
--Total Employees
Total Employees =  COUNT(HR_Data[Employee_Number])

--Attrition Count
Attrition Count = CALCULATE(COUNTROWS(HR_Data), HR_Data[Attrition] = "Yes")

--Attrition Rate %
Attrition Rate % = DIVIDE([Attrition Count], [Total Employees]) * 100

--Avg Monthly Income
Avg Monthly Income = AVERAGE(HR_Data[Monthly_Income])

--Avg Tenure Years
Avg Tenure Years = AVERAGE(HR_Data[Years_At_Company])

--High Risk Employees
High Risk Employees =
CALCULATE(
    COUNTROWS(HR_Data),
    HR_Data[Attrition] = "No",
    HR_Data[OverTime] = "Yes",
    HR_Data[Job_Satisfaction] <= 2
)

--Cumulative Attrition
Cumulative Attrition % = 
VAR CurrentAttrition =
    [Attrition Count]
VAR RunningTotal =
    CALCULATE(
        [Attrition Count],
        FILTER(
            ALL(HR_Data[Job_Role]),
            [Attrition Count] >= CurrentAttrition
        )
    )
VAR TotalAttrition =
    CALCULATE(
        [Attrition Count],
        ALL(HR_Data[Job_Role])
    )
RETURN
DIVIDE(
    RunningTotal,
    TotalAttrition
) * 100

```

---


## 👤 Author

**Khushi Duggelwar**
📧 khushivrao61@gmail.com
🔗 [LinkedIn](https://linkedin.com/in/khushiduggelwar)
🐙 [GitHub](https://github.com/khushiduggelwar)

---

## 📃 License

This project is for educational and portfolio purposes.
Dataset: [IBM HR Analytics Employee Attrition Dataset](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset)

---

⭐ **If you found this project useful, please give it a star!** ⭐
