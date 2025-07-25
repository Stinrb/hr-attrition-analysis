-- =======================
-- Compensation Analysis
-- =======================


-- 1. Monthly Income Percentile
SELECT 
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY monthly_income) AS income_25th,
    PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY monthly_income) AS income_50th,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY monthly_income) AS income_75th
FROM dim_employee;


-- 2. Percent Salary Hike Percentile
SELECT 
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY percent_salary_hike) AS hike_25th,
    PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY percent_salary_hike) AS hike_50th,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY percent_salary_hike) AS hike_75th
FROM dim_employee;


-- 3. Monthly Income Distribution by Percentile
SELECT 
    CASE 
        WHEN monthly_income <= 2911 THEN '<= 25th Percentile'
        WHEN monthly_income BETWEEN 2912 AND 4919 THEN '<= 50th Percentile'
        WHEN monthly_income BETWEEN 4920 AND 8379 THEN '<= 75th Percentile'
        ELSE '> 75th Percentile' 
    END AS income_group,
    COUNT(*) AS count_per_group,
    ROUND( 100.0 * COUNT(*) * 1.0 / (SELECT COUNT(*) FROM dim_employee), 2) AS percent_of_total
FROM dim_employee
GROUP BY income_group
ORDER BY count_per_group DESC;


-- 4. Monthly income minimum, maximum and average
SELECT
    MIN(monthly_income) AS min_monthly_income,
    MAX(monthly_income) AS max_monthly_income,
    ROUND(AVG(monthly_income), 2) AS avg_monthly_income
FROM dim_employee;


-- 5. Percent Salary Hike Distribution
SELECT
    CASE
        WHEN percent_salary_hike BETWEEN 11 AND 15 THEN '11% - 15%'
        WHEN percent_salary_hike BETWEEN 16 AND 20 THEN '16% - 20%'
        WHEN percent_salary_hike BETWEEN 21 AND 25 THEN '21% - 25%'
    END AS hike_group,
    COUNT(*) AS count_per_group,
    ROUND( 100.0 * COUNT(*) * 1.0 / (SELECT COUNT(*) FROM dim_employee), 2) AS percent_of_total
FROM dim_employee
GROUP BY hike_group
ORDER BY count_per_group DESC;


-- 6. Percent Salary Hike minimum, maximum and average
SELECT
    MIN(percent_salary_hike) AS min_percent_salary_hike,
    MAX(percent_salary_hike) AS max_percent_salary_hike,
    ROUND(AVG(percent_salary_hike), 0) AS avg_percent_salary_hike
FROM dim_employee;


-- ===============================================
-- Compensation by Age Group and Marital Status
-- ===============================================


-- 1. Monthly income minimum, maximum and average by Age Group
SELECT
    CASE
        WHEN age BETWEEN 18 AND 24 THEN '18-24'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        WHEN age BETWEEN 55 AND 64 THEN '55-64'
        WHEN age >= 65 THEN '65+'
    END AS age_group,
    MIN(monthly_income) AS min_monthly_income,
    MAX(monthly_income) AS max_monthly_income,
    ROUND(AVG(monthly_income), 2) AS avg_monthly_income
FROM dim_employee
GROUP BY age_group
ORDER BY avg_monthly_income DESC;


-- 2. Monthly income minimum, maximum and average by Marital Status
SELECT
    marital_status,
    MIN(monthly_income) AS min_monthly_income,
    MAX(monthly_income) AS max_monthly_income,
    ROUND(AVG(monthly_income), 2) AS avg_monthly_income
FROM dim_employee
GROUP BY marital_status
ORDER BY avg_monthly_income DESC;


-- ===============================================
-- Compensation by Department and Job Role
-- ===============================================


-- 1. Monthly Income minimum, maximum and average by department
SELECT
    department,
    COUNT(*) AS count_per_group,
    MIN(monthly_income) AS min_monthly_income,
    MAX(monthly_income) AS max_monthly_income,
    ROUND(AVG(monthly_income), 2) AS avg_monthly_income
FROM dim_employee
GROUP BY department;


-- 2. Percent Salary Hike Distribution by Department
SELECT
    department,
    CASE
        WHEN percent_salary_hike BETWEEN 11 AND 15 THEN '11% - 15%'
        WHEN percent_salary_hike BETWEEN 16 AND 20 THEN '16% - 20%'
        WHEN percent_salary_hike BETWEEN 21 AND 25 THEN '21% - 25%'
    END AS hike_group,
    COUNT(*) AS count_per_group,
    ROUND( 100.0 * COUNT(*) * 1.0 / (SELECT COUNT(*) FROM dim_employee), 2) AS percent_of_total
FROM dim_employee
GROUP BY department, hike_group
ORDER BY department, count_per_group DESC;


-- 3. Percent Salary Hike minimum, maximum and average by Department
SELECT
    department,
    MIN(percent_salary_hike) AS min_percent_salary_hike,
    MAX(percent_salary_hike) AS max_percent_salary_hike,
    ROUND(AVG(percent_salary_hike), 0) AS avg_percent_salary_hike
FROM dim_employee
GROUP BY department
ORDER BY avg_percent_salary_hike DESC;


-- 4. Monthly Income minimum, maximum and average by Job Role
SELECT
    job_role,
    COUNT(*) AS count_per_group,
    MIN(monthly_income) AS min_monthly_income,
    MAX(monthly_income) AS max_monthly_income,
    ROUND(AVG(monthly_income), 2) AS avg_monthly_income
FROM dim_employee
GROUP BY job_role
ORDER BY avg_monthly_income DESC;


-- 5. Percent Salary Hike Distribution Job Role
SELECT
    job_role,
    CASE
        WHEN percent_salary_hike BETWEEN 11 AND 15 THEN '11% - 15%'
        WHEN percent_salary_hike BETWEEN 16 AND 20 THEN '16% - 20%'
        WHEN percent_salary_hike BETWEEN 21 AND 25 THEN '21% - 25%'
    END AS hike_group,
    COUNT(*) AS count_per_group,
    ROUND( 100.0 * COUNT(*) * 1.0 / (SELECT COUNT(*) FROM dim_employee), 2) AS percent_of_total
FROM dim_employee
GROUP BY job_role, hike_group
ORDER BY count_per_group DESC;


-- 6. Percent Salary Hike minimum, maximum and average by Job Role
SELECT
    job_role,
    MIN(percent_salary_hike) AS min_percent_salary_hike,
    MAX(percent_salary_hike) AS max_percent_salary_hike,
    ROUND(AVG(percent_salary_hike), 0) AS avg_percent_salary_hike
FROM dim_employee
GROUP BY job_role
ORDER BY avg_percent_salary_hike DESC;


-- ===========================
-- Compensation by Attrition
-- ===========================

-- 1. Monthly Income minimum, maximum and average by Attrition
SELECT
    ROUND(AVG(monthly_income), 2) AS avg_monthly_income,
    MIN(monthly_income) AS min_monthly_income,
    MAX(monthly_income) AS max_monthly_income,
    attrition,
    COUNT(*) AS count_per_group
FROM dim_employee
GROUP BY attrition
ORDER BY avg_monthly_income DESC;


-- 2. Percent Salary Hike minimum, maximum and average by Attrition
SELECT
    ROUND(AVG(percent_salary_hike), 0) AS avg_percent_salary_hike,
    MIN(percent_salary_hike) AS min_percent_salary_hike,
    MAX(percent_salary_hike) AS max_percent_salary_hike,
    attrition,
    COUNT(*) AS count_per_group
FROM dim_employee
GROUP BY attrition
ORDER BY avg_percent_salary_hike DESC;


-- ==============================================
-- Compensation and Attrition Across Variables
-- ==============================================

-- 1. Attrition Rate by Monthly Income Group
SELECT 
    CASE 
        WHEN monthly_income <= 2911 THEN '<= 25%'
        WHEN monthly_income BETWEEN 2912 AND 4919 THEN '<= 50%'
        WHEN monthly_income BETWEEN 4920 AND 8379 THEN '<= 75%'
        ELSE '> 75%' 
    END AS income_group,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY income_group
ORDER BY attrition_rate_per_group DESC;


-- 2. Compensation and Demographics


-- 2.1 Attrition Rate of Age Group and Monthly Income Percentile
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
        WHEN monthly_income <= 2911 THEN '<= 25%'
        WHEN monthly_income BETWEEN 2912 AND 4919 THEN '<= 50%'
        WHEN monthly_income BETWEEN 4920 AND 8379 THEN '<= 75%'
        ELSE '> 75%' 
    END AS income_group,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY age_group, income_group
ORDER BY attrition_rate_per_group DESC;


-- 2.2 Monthly Income Comparison by Age Group and Attrition Status
SELECT
    CASE
        WHEN age BETWEEN 18 AND 24 THEN '18-24'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        WHEN age BETWEEN 55 AND 64 THEN '55-64'
        WHEN age >= 65 THEN '65+'
    END AS age_group,
    attrition,
    ROUND(AVG(monthly_income), 2) AS avg_monthly_income,
    MIN(monthly_income) AS min_monthly_income,
    MAX(monthly_income) AS max_monthly_income,
    COUNT(*) AS count_per_group
FROM dim_employee
GROUP BY age_group, attrition
ORDER BY age_group, attrition;


-- 2.3 Attrition Rate of Marital Status and Monthly Income Group
SELECT
    marital_status,
    CASE
        WHEN monthly_income <= 2911 THEN '<= 25%'
        WHEN monthly_income BETWEEN 2912 AND 4919 THEN '<= 50%'
        WHEN monthly_income BETWEEN 4920 AND 8379 THEN '<= 75%'
        ELSE '> 75%' 
    END AS income_group,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY marital_status, income_group
ORDER BY attrition_rate_per_group DESC;


-- 2.4 Monthly Income Comparison by Marital Status and Attrition Status
SELECT
    marital_status,
    attrition,
    MIN(monthly_income) AS min_monthly_income,
    MAX(monthly_income) AS max_monthly_income,
    ROUND(AVG(monthly_income), 2) AS avg_monthly_income,
    COUNT(*) AS count_per_group
FROM dim_employee
GROUP BY marital_status, attrition
ORDER BY marital_status DESC, attrition;


-- 3. Compensation and Job Details


-- 3.1 Attrition Rate of Department by Monthly Income Group
SELECT
    department,
    CASE
        WHEN monthly_income <= 2911 THEN '<= 25%'
        WHEN monthly_income BETWEEN 2912 AND 4919 THEN '<= 50%'
        WHEN monthly_income BETWEEN 4920 AND 8379 THEN '<= 75%'
        ELSE '> 75%' 
    END AS income_group,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY income_group, department
ORDER BY attrition_rate_per_group DESC;


-- 3.2 Monthly Income Comparison and Department by Attrition Status
SELECT
    department,
    attrition,
    MIN(monthly_income) AS min_monthly_income,
    MAX(monthly_income) AS max_monthly_income,
    ROUND(AVG(monthly_income), 2) AS avg_monthly_income,
    COUNT(*) AS count_per_group
FROM dim_employee
GROUP BY department, attrition
ORDER BY department, attrition;


-- 3.3 Attrition Rate of Job Role by Monthly Income Group
SELECT
    job_role,
    CASE
        WHEN monthly_income <= 2911 THEN '<= 25%'
        WHEN monthly_income BETWEEN 2912 AND 4919 THEN '<= 50%'
        WHEN monthly_income BETWEEN 4920 AND 8379 THEN '<= 75%'
        ELSE '> 75%' 
    END AS income_group,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY income_group, job_role
ORDER BY attrition_rate_per_group DESC;


-- 3.5 Monthly Income Comparison and Job Role by Attrition Status
SELECT
    job_role,
    attrition,
    MIN(monthly_income) AS min_monthly_income,
    MAX(monthly_income) AS max_monthly_income,
    ROUND(AVG(monthly_income), 2) AS avg_monthly_income,
    COUNT(*) AS count_per_group
FROM dim_employee
GROUP BY job_role, attrition
ORDER BY job_role, attrition DESC;


-- 3.6 Percent Salary Hike and Job Role by Attrition Status
SELECT
    job_role,
    attrition,
    MIN(percent_salary_hike) AS min_percent_salary_hike,
    MAX(percent_salary_hike) AS max_percent_salary_hike,
    ROUND(AVG(percent_salary_hike), 0) AS avg_percent_salary_hike,
    COUNT(*) AS count_per_group
FROM dim_employee
GROUP BY job_role, attrition
ORDER BY job_role, attrition DESC;


-- 4. Compensation and Performance Rating


-- 4.1 Performance Rating Comparison by Attrition Status per Department


-- Sales Department
SELECT
    job_role,
    attrition,
    performance_rating,
    MIN(monthly_income) AS min_monthly_income,
    MAX(monthly_income) AS max_monthly_income,
    ROUND(AVG(monthly_income), 2) AS avg_monthly_income,
    COUNT(*) AS count_per_group
FROM dim_employee
WHERE department = 'Sales'
GROUP BY performance_rating, job_role, attrition
ORDER BY performance_rating, attrition, avg_monthly_income DESC;


-- Research & Development Department
SELECT
    job_role,
    attrition,
    performance_rating,
    MIN(monthly_income) AS min_monthly_income,
    MAX(monthly_income) AS max_monthly_income,
    ROUND(AVG(monthly_income), 2) AS avg_monthly_income,
    COUNT(*) AS count_per_group
FROM dim_employee
WHERE department = 'Research & Development'
GROUP BY performance_rating, job_role, attrition
ORDER BY performance_rating, attrition, avg_monthly_income DESC;


-- Human Resources Department
SELECT
    job_role,
    attrition,
    performance_rating,
    MIN(monthly_income) AS min_monthly_income,
    MAX(monthly_income) AS max_monthly_income,
    ROUND(AVG(monthly_income), 2) AS avg_monthly_income,
    COUNT(*) AS count_per_group
FROM dim_employee
WHERE department = 'Human Resources'
GROUP BY performance_rating, job_role, attrition
ORDER BY performance_rating, attrition, avg_monthly_income DESC;