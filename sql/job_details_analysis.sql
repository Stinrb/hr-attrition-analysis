-- ======================
-- Job Details Analysis
-- ======================


-- 1. Department Distribution
SELECT
    department,
    COUNT(*) AS count_per_group,
    ROUND( 100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM dim_employee
GROUP BY department
ORDER BY percentage DESC;


-- 2. Job Role Distribution
SELECT
    job_role,
    COUNT(*) AS count_per_group,
    ROUND( 100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM dim_employee
GROUP BY job_role
ORDER BY percentage DESC;


-- ===========================
-- Job Details vs. Attrition 
-- ===========================


-- 1. Department 
SELECT
    department,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND( 100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND( 100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY department
ORDER BY attrition_rate_per_group DESC;


-- 2. Job Role
SELECT
    job_role,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND( 100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND( 100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER(), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY job_role
ORDER BY attrition_rate_per_group DESC;


-- =====================================
-- Attrition Analysis Across Variables
-- =====================================


-- 1. Department and Age Group Analysis
SELECT
    department,
    CASE
        WHEN age BETWEEN 18 AND 24 THEN '18-24'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        WHEN age BETWEEN 55 AND 64 THEN '55-64'
        WHEN age >= 65 THEN '65+'
    END AS age_group,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND( 100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND( 100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY department, age_group
ORDER BY attrition_rate_per_group DESC;


-- 2. Department and Marital Status Analysis
SELECT
    marital_status,
    department,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND( 100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND( 100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY marital_status, department
ORDER BY attrition_rate_per_group DESC;


-- 3. Job Role and Age Group Analysis
SELECT
    job_role,
    CASE
        WHEN age BETWEEN 18 AND 24 THEN '18-24'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        WHEN age BETWEEN 55 AND 64 THEN '55-64'
        WHEN age >= 65 THEN '65+'
    END AS age_group,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND( 100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND( 100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY job_role, age_group
ORDER BY attrition_rate_per_group DESC;


-- Job Role and Marital Status Analysis
SELECT
    job_role,
    marital_status,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND( 100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND( 100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY job_role, marital_status
ORDER BY attrition_rate_per_group DESC;