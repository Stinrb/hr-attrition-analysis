-- ======================================
-- Data Cleaning and Validation Scrpit
-- ======================================


SELECT
    COUNT(*) AS total_records
FROM dim_employee;


-- ================================
-- Identifying Duplicate Records
-- ================================


-- 1. Checking duplicate count by employee number
SELECT 
    employee_number,
    COUNT(*) AS duplicate_count
FROM dim_employee
GROUP BY employee_number
HAVING COUNT(*) > 1;


-- 2. Alternative Method using row number
WITH duplicate_count AS (
    SELECT
        *,
        ROW_NUMBER () OVER (PARTITION BY age, attrition, monthly_income, department, job_role, job_level, job_satisfaction, marital_status, performance_rating, standard_hours, years_at_company
            ORDER BY employee_number) AS row_num
    FROM dim_employee
)
SELECT
    *
FROM duplicate_count
WHERE row_num > 1;


-- ================================================
-- Identifying NULL or Missing Values in Columns
-- ================================================
/* 
This dynamic SQL script iterates through all columns of the 'dim_employee' table
within the 'hr_analysis' schema. It generates a query that counts NULL values 
for each column and returns a consolidated result set. 
*/
DO $$ 
DECLARE 
    col_name TEXT;
    col_data_type TEXT;
    sql_query TEXT := '';
BEGIN
    FOR col_name, col_data_type IN 
        SELECT c.column_name, c.data_type
        FROM information_schema.columns c
        WHERE c.table_name = 'dim_employee' AND c.table_schema = 'hr_analysis'
    LOOP
        sql_query := sql_query || 
        FORMAT('SELECT ''%s'' AS column_name, 
                        COUNT(*) AS null_count, ', col_name);

        -- Apply TRIM check only for text-based columns
        IF col_data_type IN ('character varying', 'text', 'char') THEN
            sql_query := sql_query || 
            FORMAT('COUNT(*) FILTER (WHERE TRIM(%I) = '''') AS blank_count ', col_name);
        ELSE 
            sql_query := sql_query || 'NULL AS blank_count ';
        END IF;
        
        sql_query := sql_query || 'FROM hr_analysis.dim_employee UNION ALL ';
    END LOOP;
    
    -- Remove the last UNION ALL to avoid syntax error
    sql_query := LEFT(sql_query, LENGTH(sql_query) - 10);
    
    -- Execute the generated SQL
    EXECUTE sql_query;
END $$;


-- ===========================================
-- Inconsistencies and Outliers Detection
-- ===========================================


-- Numerical Columns


-- 1. Age Column
SELECT 
    DISTINCT age
FROM dim_employee
WHERE age < 0 
    OR age > 100;


-- 2. Distance from Home Column
SELECT
    distance_from_home
FROM dim_employee
WHERE distance_from_home < 0;


-- 2. Education Column
SELECT 
    DISTINCT education
FROM dim_employee
WHERE education NOT BETWEEN 1 AND 5;


-- 3. Employee Satisfaction Column
SELECT 
    DISTINCT employee_satisfaction
FROM dim_employee
WHERE employee_satisfaction NOT BETWEEN 1 AND 4;


-- 4. Job Involvement Column
SELECT
    DISTINCT job_involvement
FROM dim_employee
WHERE job_involvement NOT BETWEEN 1 AND 4;


-- 5. Job Level Column
SELECT
    DISTINCT job_level
FROM dim_employee
WHERE job_level NOT BETWEEN 1 AND 5 ;    


-- 6. Job Satisfaction Column
SELECT
    DISTINCT job_satisfaction
FROM dim_employee
WHERE job_satisfaction NOT BETWEEN 1 AND 4;


-- 7. Monthly Income Column
SELECT 
    DISTINCT monthly_income
FROM dim_employee
WHERE monthly_income < 0;


-- 8. Number of Companies Worked Table
SELECT
    DISTINCT num_companies_worked
FROM dim_employee
WHERE num_companies_worked < 0;


-- 9. Percent Salary Hike Column
SELECT
    DISTINCT percent_salary_hike
FROM dim_employee
WHERE percent_salary_hike < 0;


-- 10. Performance Rating Column
SELECT
    DISTINCT performance_rating
FROM dim_employee
WHERE perfo
rmance_rating NOT BETWEEN 1 AND 4;

-- 11. Relationship Satisfaction Column
SELECT
    DISTINCT relationship_satisfaction
FROM dim_employee
WHERE relationship_satisfaction NOT BETWEEN 1 AND 4;


-- 12. Total Working Years Column
SELECT
    DISTINCT total_working_years
FROM dim_employee
WHERE total_working_years < 0;


-- 13. Training Count Previous Year Column
SELECT
    DISTINCT training_count_prev_year
FROM dim_employee
WHERE training_count_prev_year < 0;


-- 14. Work Life Balance Column
SELECT
    DISTINCT work_life_balance
FROM dim_employee
WHERE work_life_balance NOT BETWEEN 1 AND 4;


-- 15. Years at Company
SELECT
    DISTINCT years_at_company
FROM dim_employee
WHERE years_at_company < 0;


-- 16. Years in Current Role
SELECT
    DISTINCT years_in_current_role
FROM dim_employee
WHERE years_in_current_role < 0;


-- 17. Years Since Last Promotion
SELECT
    DISTINCT years_since_last_promotion
FROM dim_employee
WHERE years_since_last_promotion < 0;


-- 18. Years with Current Manager
SELECT
    DISTINCT years_with_curr_manager
FROM dim_employee
WHERE years_with_curr_manager < 0;


-- Categorical Columns


-- 1. Attrition Table
SELECT
    DISTINCT attrition
FROM dim_employee;


-- 2. Business Travel Table
SELECT
    DISTINCT business_travel
FROM dim_employee;


-- 3. Department Table
SELECT
    DISTINCT department
FROM dim_employee;


-- 4. Education Field Table
SELECT
    DISTINCT education_field
FROM dim_employee;


-- 5. Job Role Table
SELECT
    DISTINCT job_role
FROM dim_employee;


-- 6. Marital Status Table
SELECT
    DISTINCT marital_status
FROM dim_employee;


-- 7. Overtime
SELECT
    DISTINCT overtime
FROM dim_employee;