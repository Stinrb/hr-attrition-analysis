-- ====================================
-- Work-life Balance Factors Analysis
-- ====================================


-- 1. Attrition Rate by Overtime
SELECT
    CASE
        WHEN overtime = 'Yes' THEN 'Required'
        WHEN overtime = 'No' THEN 'Not Required'
    END AS overtime_category,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY overtime_category
ORDER BY attrition_rate_per_group DESC;


-- 2. Attrition Rate by Work-life Balance
SELECT
    work_life_balance,
    CASE
        WHEN work_life_balance = 1 THEN 'Low'
        WHEN work_life_balance = 2 THEN 'Medium'
        WHEN work_life_balance = 3 THEN 'High'
        WHEN work_life_balance = 4 THEN 'Very High'
    END AS work_life_balance_level,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY work_life_balance, work_life_balance_level
ORDER BY attrition_rate_per_group DESC;


-- 3. Attrition Rate by Business Travel
SELECT
    business_travel,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY business_travel
ORDER BY attrition_rate_per_group DESC;


-- =====================================
-- Attrition Analysis Across Variables
-- =====================================


-- 1. Attrition Rate by Work-life Balance Factors and Demographics


-- 1.1 Business Travel and Age Group
SELECT
    CASE
        WHEN age BETWEEN 18 AND 24 THEN '18-24'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        WHEN age BETWEEN 55 AND 64 THEN '55-64'
        WHEN age >= 65 THEN '65+'
    END AS age_group,
    business_travel,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY age_group, business_travel
ORDER BY age_group ASC, attrition_rate_per_group DESC;


-- 1.2 Business Travel and Marital Status
SELECT
    marital_status,
    business_travel,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY marital_status, business_travel
ORDER BY marital_status DESC,attrition_rate_per_group DESC;


-- 1.3 Overtime and Age Group
SELECT
    CASE
        WHEN age BETWEEN 18 AND 24 THEN '18-24'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        WHEN age BETWEEN 55 AND 64 THEN '55-64'
        WHEN age >= 65 THEN '65+'
    END AS age_group,
    CASE
        WHEN overtime = 'Yes' THEN 'Required'
        WHEN overtime = 'No' THEN 'Not Required'
    END AS overtime_category,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY age_group, overtime_category
ORDER BY age_group ASC, attrition_rate_per_group DESC;


-- 1.4 Overtime and Marital Status
SELECT
    marital_status,
    CASE
        WHEN overtime = 'Yes' THEN 'Required'
        WHEN overtime = 'No' THEN 'Not Required'
    END AS overtime_category,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY marital_status, overtime_category
ORDER BY marital_status DESC,attrition_rate_per_group DESC;


-- 1.6 Work-Life Balance Level and Age Group
SELECT
    CASE
        WHEN age BETWEEN 18 AND 24 THEN '18-24'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        WHEN age BETWEEN 55 AND 64 THEN '55-64'
        WHEN age >= 65 THEN '65+'
    END AS age_group,
    CASE
        WHEN work_life_balance = 1 THEN 'Low'
        WHEN work_life_balance = 2 THEN 'Medium'
        WHEN work_life_balance = 3 THEN 'High'
        WHEN work_life_balance = 4 THEN 'Very High'
    END AS work_life_balance_level,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY age_group, work_life_balance_level
ORDER BY age_group ASC, attrition_rate_per_group DESC;


-- 1.7 Work-Life Balance Level and Marital Status
SELECT
    marital_status,
    CASE
        WHEN work_life_balance = 1 THEN 'Low'
        WHEN work_life_balance = 2 THEN 'Medium'
        WHEN work_life_balance = 3 THEN 'High'
        WHEN work_life_balance = 4 THEN 'Very High'
    END AS work_life_balance_level,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY marital_status, work_life_balance_level
ORDER BY marital_status ASC, attrition_rate_per_group DESC;


-- 2. Work-life Balance Factors and Job Details


-- 2.1 Overtime and Department Attrition Rate
SELECT
    department,
    CASE
        WHEN overtime = 'Yes' THEN 'Required'
        WHEN overtime = 'No' THEN 'Not Required'
    END AS overtime_category,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY department, overtime_category
ORDER BY attrition_rate_per_group DESC;


-- 2.2 Overtime and Job Role Attrition Rate (Segmented by Department)
SELECT
    job_role,
    CASE
        WHEN overtime = 'Yes' THEN 'Required'
        WHEN overtime = 'No' THEN 'Not Required'
    END AS overtime_category,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
WHERE department = 'Sales'
GROUP BY job_role, overtime_category
ORDER BY attrition_rate_per_group DESC;

SELECT
    job_role,
    CASE
        WHEN overtime = 'Yes' THEN 'Required'
        WHEN overtime = 'No' THEN 'Not Required'
    END AS overtime_category,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
WHERE department = 'Research & Development'
GROUP BY job_role, overtime_category
ORDER BY attrition_rate_per_group DESC;

SELECT
    job_role,
    CASE
        WHEN overtime = 'Yes' THEN 'Required'
        WHEN overtime = 'No' THEN 'Not Required'
    END AS overtime_category,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
WHERE department = 'Human Resources'
GROUP BY job_role, overtime_category
ORDER BY attrition_rate_per_group DESC;


-- 2.3 Work-life balance and Department
SELECT
    department,
    CASE
        WHEN work_life_balance = 1 THEN 'Low'
        WHEN work_life_balance = 2 THEN 'Medium'
        WHEN work_life_balance = 3 THEN 'High'
        WHEN work_life_balance = 4 THEN 'Very High'
    END AS work_life_balance_level,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY work_life_balance_level, department
ORDER BY attrition_rate_per_group DESC;


-- 2.4 Work-life balance and Job Role (Segmented by Department)
SELECT
    job_role,
    CASE
        WHEN work_life_balance = 1 THEN 'Low'
        WHEN work_life_balance = 2 THEN 'Medium'
        WHEN work_life_balance = 3 THEN 'High'
        WHEN work_life_balance = 4 THEN 'Very High'
    END AS work_life_balance_level,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
WHERE department = 'Sales'
GROUP BY work_life_balance_level, job_role
ORDER BY attrition_rate_per_group DESC;

SELECT
    job_role,
    CASE
        WHEN work_life_balance = 1 THEN 'Low'
        WHEN work_life_balance = 2 THEN 'Medium'
        WHEN work_life_balance = 3 THEN 'High'
        WHEN work_life_balance = 4 THEN 'Very High'
    END AS work_life_balance_level,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
WHERE department = 'Research & Development'
GROUP BY work_life_balance_level, job_role
ORDER BY attrition_rate_per_group DESC;

SELECT
    job_role,
    CASE
        WHEN work_life_balance = 1 THEN 'Low'
        WHEN work_life_balance = 2 THEN 'Medium'
        WHEN work_life_balance = 3 THEN 'High'
        WHEN work_life_balance = 4 THEN 'Very High'
    END AS work_life_balance_level,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
WHERE department = 'Human Resources'
GROUP BY work_life_balance_level, job_role
ORDER BY attrition_rate_per_group DESC;  


-- 2.5 Business Travel and Job Role
SELECT
    job_role,
    business_travel,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY job_role, business_travel
ORDER BY job_role, attrition_rate_per_group DESC;