-- ==========================
-- Job Fulfillment Analysis
-- ==========================


-- 1. Environment Satisfaction
SELECT
    environment_satisfaction,
    CASE
        WHEN environment_satisfaction = 1 THEN 'Low'
        WHEN environment_satisfaction = 2 THEN 'Medium'
        WHEN environment_satisfaction = 3 THEN 'High'
        WHEN environment_satisfaction = 4 THEN 'Very High'
    END AS environment_satisfaction_level,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY environment_satisfaction
ORDER BY attrition_rate_per_group DESC;


-- 2. Job Satisfaction
SELECT
    job_satisfaction,
    CASE
        WHEN job_satisfaction = 1 THEN 'Low'
        WHEN job_satisfaction = 2 THEN 'Medium'
        WHEN job_satisfaction = 3 THEN 'High'
        WHEN job_satisfaction = 4 THEN 'Very High'
    END AS job_satisfaction_level,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY job_satisfaction
ORDER BY attrition_rate_per_group DESC;


-- 3. Relationship Satisfaction
SELECT
    relationship_satisfaction,
    CASE
        WHEN relationship_satisfaction = 1 THEN 'Low'
        WHEN relationship_satisfaction = 2 THEN 'Medium'
        WHEN relationship_satisfaction = 3 THEN 'High'
        WHEN relationship_satisfaction = 4 THEN 'Very High'
    END AS relationship_satisfaction_level,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY relationship_satisfaction
ORDER BY attrition_rate_per_group DESC;


-- =====================================
-- Attrition Analysis Across Variables
-- =====================================

-- 1. Job Fulfillment Factors and Age Group Analysis

-- 1.1 Environment Satisfaction
SELECT
    environment_satisfaction,
    CASE
        WHEN environment_satisfaction = 1 THEN 'Low'
        WHEN environment_satisfaction = 2 THEN 'Medium'
        WHEN environment_satisfaction = 3 THEN 'High'
        WHEN environment_satisfaction = 4 THEN 'Very High'
    END AS environment_satisfaction_level,
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
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY environment_satisfaction, age_group
ORDER BY attrition_rate_per_group DESC;


-- 1.2 Job Satisfaction
SELECT
    job_satisfaction,
    CASE
        WHEN job_satisfaction = 1 THEN 'Low'
        WHEN job_satisfaction = 2 THEN 'Medium'
        WHEN job_satisfaction = 3 THEN 'High'
        WHEN job_satisfaction = 4 THEN 'Very High'
    END AS job_satisfaction_level,
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
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY job_satisfaction, age_group
ORDER BY attrition_rate_per_group DESC;


-- 1.3 Relationship Satisfaction
SELECT
    relationship_satisfaction,
    CASE
        WHEN relationship_satisfaction = 1 THEN 'Low'
        WHEN relationship_satisfaction = 2 THEN 'Medium'
        WHEN relationship_satisfaction = 3 THEN 'High'
        WHEN relationship_satisfaction = 4 THEN 'Very High'
    END AS relationship_satisfaction_level,
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
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY relationship_satisfaction, age_group
ORDER BY attrition_rate_per_group DESC;


-- 2. Job Fulfillment Factors and Marital Status Analysis

-- 2.1 Environment Satisfaction
SELECT
    environment_satisfaction,
    CASE
        WHEN environment_satisfaction = 1 THEN 'Low'
        WHEN environment_satisfaction = 2 THEN 'Medium'
        WHEN environment_satisfaction = 3 THEN 'High'
        WHEN environment_satisfaction = 4 THEN 'Very High'
    END AS environment_satisfaction_level,
    marital_status,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY environment_satisfaction, marital_status
ORDER BY attrition_rate_per_group DESC;


-- 2.2 Job Satisfaction
SELECT
    job_satisfaction,
    CASE
        WHEN job_satisfaction = 1 THEN 'Low'
        WHEN job_satisfaction = 2 THEN 'Medium'
        WHEN job_satisfaction = 3 THEN 'High'
        WHEN job_satisfaction = 4 THEN 'Very High'
    END AS job_satisfaction_level,
    marital_status,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY job_satisfaction, marital_status
ORDER BY attrition_rate_per_group DESC;


-- 2.3 Relationship Satisfaction
SELECT
    relationship_satisfaction,
    CASE
        WHEN relationship_satisfaction = 1 THEN 'Low'
        WHEN relationship_satisfaction = 2 THEN 'Medium'
        WHEN relationship_satisfaction = 3 THEN 'High'
        WHEN relationship_satisfaction = 4 THEN 'Very High'
    END AS relationship_satisfaction_level,
    marital_status,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY relationship_satisfaction, marital_status
ORDER BY attrition_rate_per_group DESC;


-- 3. Job Fulfillment Factors and Department Analysis

-- 3.1 Environment Satisfaction
SELECT
    environment_satisfaction,
    CASE
        WHEN environment_satisfaction = 1 THEN 'Low'
        WHEN environment_satisfaction = 2 THEN 'Medium'
        WHEN environment_satisfaction = 3 THEN 'High'
        WHEN environment_satisfaction = 4 THEN 'Very High'
    END AS environment_satisfaction_level,
    department,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY environment_satisfaction, department
ORDER BY attrition_rate_per_group DESC;


-- 3.2 Job Satisfaction
SELECT
    job_satisfaction,
    CASE
        WHEN job_satisfaction = 1 THEN 'Low'
        WHEN job_satisfaction = 2 THEN 'Medium'
        WHEN job_satisfaction = 3 THEN 'High'
        WHEN job_satisfaction = 4 THEN 'Very High'
    END AS job_satisfaction_level,
    department,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY job_satisfaction, department
ORDER BY attrition_rate_per_group DESC;


-- 3.3 Relationship Satisfaction
SELECT
    relationship_satisfaction,
    CASE
        WHEN relationship_satisfaction = 1 THEN 'Low'
        WHEN relationship_satisfaction = 2 THEN 'Medium'
        WHEN relationship_satisfaction = 3 THEN 'High'
        WHEN relationship_satisfaction = 4 THEN 'Very High'
    END AS relationship_satisfaction_level,
    department,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
GROUP BY relationship_satisfaction, department
ORDER BY attrition_rate_per_group DESC;


-- 4. Job Fulfillment Factors and Job Role Analysis
-- This section is similar to the previous section, but focuses on job roles within each department.

-- 4.1 Environment Satisfaction

-- Sales Department
SELECT
    environment_satisfaction,
    CASE
        WHEN environment_satisfaction = 1 THEN 'Low'
        WHEN environment_satisfaction = 2 THEN 'Medium'
        WHEN environment_satisfaction = 3 THEN 'High'
        WHEN environment_satisfaction = 4 THEN 'Very High'
    END AS environment_satisfaction_level,
    job_role,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
WHERE department = 'Sales'
GROUP BY environment_satisfaction, job_role
ORDER BY attrition_rate_per_group DESC;


-- Research & Development Department
SELECT
    environment_satisfaction,
    CASE
        WHEN environment_satisfaction = 1 THEN 'Low'
        WHEN environment_satisfaction = 2 THEN 'Medium'
        WHEN environment_satisfaction = 3 THEN 'High'
        WHEN environment_satisfaction = 4 THEN 'Very High'
    END AS environment_satisfaction_level,
    job_role,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
WHERE department = 'Research & Development'
GROUP BY environment_satisfaction, job_role
ORDER BY attrition_rate_per_group DESC;


-- Human Resources Department
SELECT
    environment_satisfaction,
    CASE
        WHEN environment_satisfaction = 1 THEN 'Low'
        WHEN environment_satisfaction = 2 THEN 'Medium'
        WHEN environment_satisfaction = 3 THEN 'High'
        WHEN environment_satisfaction = 4 THEN 'Very High'
    END AS environment_satisfaction_level,
    job_role,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
WHERE department = 'Human Resources'
GROUP BY environment_satisfaction, job_role
ORDER BY attrition_rate_per_group DESC;


-- 4.2 Job Satisfaction

-- Sales Department
SELECT
    job_satisfaction,
    CASE
        WHEN job_satisfaction = 1 THEN 'Low'
        WHEN job_satisfaction = 2 THEN 'Medium'
        WHEN job_satisfaction = 3 THEN 'High'
        WHEN job_satisfaction = 4 THEN 'Very High'
    END AS job_satisfaction_level,
    job_role,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
WHERE department = 'Sales'
GROUP BY job_satisfaction, job_role
ORDER BY attrition_rate_per_group DESC;


-- Research & Development Department
SELECT
    job_satisfaction,
    CASE
        WHEN job_satisfaction = 1 THEN 'Low'
        WHEN job_satisfaction = 2 THEN 'Medium'
        WHEN job_satisfaction = 3 THEN 'High'
        WHEN job_satisfaction = 4 THEN 'Very High'
    END AS job_satisfaction_level,
    job_role,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
WHERE department = 'Research & Development'
GROUP BY job_satisfaction, job_role
ORDER BY attrition_rate_per_group DESC;


-- Human Resources Department
SELECT
    job_satisfaction,
    CASE
        WHEN job_satisfaction = 1 THEN 'Low'
        WHEN job_satisfaction = 2 THEN 'Medium'
        WHEN job_satisfaction = 3 THEN 'High'
        WHEN job_satisfaction = 4 THEN 'Very High'
    END AS job_satisfaction_level,
    job_role,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
WHERE department = 'Human Resources'
GROUP BY job_satisfaction, job_role
ORDER BY attrition_rate_per_group DESC;


-- 4.3 Relationship Satisfaction

-- Sales Department
SELECT
    relationship_satisfaction,
    CASE
        WHEN relationship_satisfaction = 1 THEN 'Low'
        WHEN relationship_satisfaction = 2 THEN 'Medium'
        WHEN relationship_satisfaction = 3 THEN 'High'
        WHEN relationship_satisfaction = 4 THEN 'Very High'
    END AS relationship_satisfaction_level,
    job_role,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
WHERE department = 'Sales'
GROUP BY relationship_satisfaction, job_role
ORDER BY attrition_rate_per_group DESC;


-- Research & Development Department
SELECT
    relationship_satisfaction,
    CASE
        WHEN relationship_satisfaction = 1 THEN 'Low'
        WHEN relationship_satisfaction = 2 THEN 'Medium'
        WHEN relationship_satisfaction = 3 THEN 'High'
        WHEN relationship_satisfaction = 4 THEN 'Very High'
    END AS relationship_satisfaction_level,
    job_role,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
WHERE department = 'Research & Development'
GROUP BY relationship_satisfaction, job_role
ORDER BY attrition_rate_per_group DESC;


-- Human Resources Department
SELECT
    relationship_satisfaction,
    CASE
        WHEN relationship_satisfaction = 1 THEN 'Low'
        WHEN relationship_satisfaction = 2 THEN 'Medium'
        WHEN relationship_satisfaction = 3 THEN 'High'
        WHEN relationship_satisfaction = 4 THEN 'Very High'
    END AS relationship_satisfaction_level,
    job_role,
    COUNT(*) AS count_per_group,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_yes,
    SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS attrition_no,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_per_group,
    ROUND(100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)) OVER (), 2) AS attrition_rate_overall
FROM dim_employee
WHERE department = 'Human Resources'
GROUP BY relationship_satisfaction, job_role
ORDER BY attrition_rate_per_group DESC;