-- ==============================
-- Career Progression Analysis
-- ==============================


-- 1. Average Job Tenure by Attrition Status
SELECT
    job_role,
    attrition,
    ROUND(AVG(years_in_current_role), 0) AS average_years_in_current_role,
    COUNT(*) AS count_per_group
FROM dim_employee
GROUP BY attrition, job_role
ORDER BY job_role, average_years_in_current_role DESC;

        

-- 2. Average Year Since Last Promotion by Attrition Status
SELECT
    job_role,
    attrition,
    ROUND(AVG(years_since_last_promotion), 0) AS average_years_since_last_promotion,
    COUNT(*) AS count_per_group
FROM dim_employee
GROUP BY attrition, job_role
ORDER BY job_role, average_years_since_last_promotion DESC;


-- 3. Average Training Count (Previous Year) by Attrition Status
SELECT
    job_role,
    attrition,
    ROUND(AVG(training_count_prev_year), 0) AS average_training_count,
    COUNT(*) AS count_per_group
FROM dim_employee
GROUP BY attrition, job_role
ORDER BY job_role, average_training_count DESC;


-- =====================================
-- Attrition Analysis Across Variables
-- =====================================


-- 1. Average Job Role Tenure and Monthly Income by Attrition Status
SELECT
    job_role,
    attrition,
    ROUND(AVG(years_in_current_role), 0) AS average_years_in_current_role,
    ROUND(AVG(monthly_income), 2) AS average_monthly_income,
    COUNT(*) AS count_per_group
FROM dim_employee
GROUP BY attrition, job_role
ORDER BY job_role, average_years_in_current_role DESC;