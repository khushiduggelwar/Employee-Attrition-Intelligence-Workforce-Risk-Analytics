CREATE TABLE hr_attrition (

Age INT,
Attrition VARCHAR(10),
Business_Travel VARCHAR(50),
Daily_Rate INT,
Department VARCHAR(50),
Distance_From_Home INT,
Education INT,
Education_Field VARCHAR(50),
Employee_Number INT,
Environment_Satisfaction INT,
Gender VARCHAR(20),
Hourly_Rate INT,
Job_Involvement INT,
Job_Level INT,
Job_Role VARCHAR(100),
Job_Satisfaction INT,
Marital_Status VARCHAR(20),
Monthly_Income INT,
Monthly_Rate INT,
Num_Companies_Worked INT,
OverTime VARCHAR(10),
Percent_Salary_Hike INT,
Performance_Rating INT,
Relationship_Satisfaction INT,
Stock_Option_Level INT,
Total_Working_Years INT,
Training_Times_LastYear INT,
Work_Life_Balance INT,
Years_At_Company INT,
Years_In_Current_Role INT,
Years_Since_Last_Promotion INT,
Years_With_Curr_Manager INT,
Attrition_Flag INT,
Income_Group VARCHAR(20),
Age_Band VARCHAR(20),
Tenure_Band VARCHAR(20)

);

SELECT COUNT(*) FROM hr_attrition;

-- Q1 Where is attrition happening the most?
SELECT Department,
       COUNT(*) AS total_emp,
       SUM(Attrition_Flag) AS employees_left,
       ROUND(100.0 * SUM(Attrition_Flag) / COUNT(*), 1) AS attrition_rate_pct,
       ROUND(AVG(Monthly_Income), 0) AS avg_salary,
       ROUND(AVG(Job_Satisfaction), 2) AS avg_satisfaction
FROM hr_attrition
GROUP BY Department;

-- Q2 At what career stage do people leave?
SELECT Tenure_Band,
COUNT(*) AS total_employees,
SUM(Attrition_Flag) AS employees_left,
COUNT(*) - SUM(Attrition_Flag) AS employees_stayed,
ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*),1) AS attrition_rate_pct
FROM hr_attrition
GROUP BY Tenure_Band
ORDER BY attrition_rate_pct DESC;

-- Q3 Which job roles have the highest attrition risk?
SELECT Job_Role, COUNT(*) AS total_employees,
SUM(Attrition_Flag) AS employees_left,
ROUND(SUM(Attrition_Flag)*100.0/COUNT(*),1) AS attrition_rate_pct
FROM hr_attrition GROUP BY Job_Role ORDER BY attrition_rate_pct DESC;

-- Q4 Does salary predict attrition?
SELECT Income_Group, COUNT(*) AS total_employees,
SUM(Attrition_Flag) AS employees_left,
ROUND(SUM(Attrition_Flag)* 100.0/COUNT(*),1) AS attrition_rate_pct,
AVG(Monthly_Income) AS Avg_monthly_income FROM hr_attrition
GROUP BY Income_Group
ORDER BY attrition_rate_pct;

-- Q5 Does overtime cause attrition?
SELECT Overtime, COUNT(*) AS total_employees,
SUM(Attrition_Flag) AS employee_left,
ROUND(SUM(Attrition_Flag)*100.0/COUNT(*),1) AS attrition_rate_pct
FROM hr_attrition GROUP BY Overtime;

-- Q6 Does work-life balance affect retention?
SELECT Work_Life_Balance, COUNT(*) AS total_employees,
SUM(Attrition_Flag) AS employee_left,
ROUND(SUM(Attrition_Flag)*100.0/COUNT(*),1) AS attrition_rate_pct
FROM hr_attrition GROUP BY Work_Life_Balance;