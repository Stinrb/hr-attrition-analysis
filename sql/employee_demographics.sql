-- Employee Demographics Analysis

-- 1. Employee Count
SELECT COUNT(*)
FROM dim_employee;


-- 2. Gender Distribution
SELECT 
    gender,
    COUNT(*),
    CONCAT(ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM dim_employee), 2), '%') AS percentage
FROM dim_employee
GROUP BY gender;


-- 3. Age Distribution
SELECT
    MIN(age) AS youngest_employee,
    MAX(age) AS oldest_employee,
    ROUND(AVG(age), 0) AS average_age
FROM dim_employee;


-- 4. Age Group Distribution
SELECT
    CASE
        WHEN age BETWEEN 18 AND 24 THEN '18-24'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        WHEN age BETWEEN 55 AND 64 THEN '55-64'
        WHEN age >= 65 THEN '65+'
    END AS age_group,
    COUNT(*),
    CONCAT(ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2), '%') AS percentage
FROM dim_employee
GROUP BY age_group
ORDER BY age_group ASC;


-- 5. Education Level Distribution
SELECT
    education,
    CASE
        WHEN education = 1 THEN 'High School'
        WHEN education = 2 THEN 'Undergraduate'
        WHEN education = 3 THEN 'Bachelor'
        WHEN education = 4 THEN 'Master'
        WHEN education = 5 THEN 'Doctorate'
    END AS education_level,
    COUNT(*) AS count_per_group,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM dim_employee
GROUP BY education
ORDER BY percentage DESC;


-- 6. Marital Status Distribution
SELECT
    marital_status,
    COUNT(*),
    CONCAT(ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM dim_employee), 2), '%') AS percentage
FROM dim_employee
GROUP BY marital_status
ORDER BY percentage DESC;