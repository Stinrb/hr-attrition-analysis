# Employee Attrition Analysis


## Overview

A data-driven understanding of the workforce is key to addressing employee attrition. This project aims to analyze employee attrition patterns using SQL for exploratory data analysis (EDA) and Power BI for visualization. The dataset, sourced from Kaggle, contains various employee attributes, including demographics, job satisfaction, career growth, and work-life balance. By leveraging SQL queries, we extract key insights that help organizations understand factors influencing employee retention and turnover.

This is a synthetic dataset generated by the IBM Data Scientists.
(Data source: https://www.kaggle.com/pavansubhasht/ibm-hr-analytics-attrition-dataset.)


## Objectives:

- Identify key drivers of employee attrition using descriptive analysis.

- Provide actionable insights for improving employee retention strategies.

- Utilize SQL for data extraction, transformation, and analysis.

- Visualize findings in Power BI for better representation of data insights.


## Dataset Overview:


### Who Are Our Employees?

The dataset consists of 1,470 employees, reflecting a diverse workforce across different backgrounds and career stages.


**Gender & Age:**

The workforce is 60% male (882 employees) and 40% female (588 employees). Employees range from 18 to 60 years old, with an average age of 37. The majority (over 70%) are between 25 and 44, the prime working years where career growth and stability are critical factors in retention.

**Gender Distribution**
<p align="center">
  <img src="https://github.com/Stinrb/hr-attrition-analysis/blob/main/visualizations/gender_proportions.png" width="45%" />
</p>

**Age Group Distribution**
<p align="center">
  <img src="https://github.com/Stinrb/hr-attrition-analysis/blob/main/visualizations/age_group.png" width="45%" />
</p>


**Education Background:**

A well-educated workforce is a key asset. Nearly 39% hold a bachelor’s degree (572 employees), while 27% have a master’s degree (398 employees). However, 19% are undergraduates (282 employees), and 12% are from high school level (170 employees). Lastly, doctorate degree holds a small portion of 3% (48 employees), this data highlights a mix of academic qualifications that contribute to workplace diversity.

<p align="center">
  <img src="https://github.com/Stinrb/hr-attrition-analysis/blob/main/visualizations/education_level.png" width="45%" />
</p>


**Marital Status & Work Commitments:**

Life stages vary across the workforce: 46% are married (673 employees), 32% are single (470 employees), and 22% are divorced (327 employees). These personal circumstances can influence career decisions, with single employees often being more mobile, while married employees may prioritize stability.

<p align="center">
  <img src="https://github.com/Stinrb/hr-attrition-analysis/blob/main/visualizations/marital_status.png" width="45%" />
</p>


## Data Standardization & Definitions

To improve clarity and ensure consistency, certain ambiguous labels in the dataset were standardized to align with common HR terminology:


- Education Standardization:

    - "Below College" → High School
    - "College" → Undergraduate
    - Other higher education levels remain unchanged.  


- Column Name Adjustments:

    - employee_satisfaction → Renamed to environment_satisfaction to match the actual column name in the dataset.


- Monthly Income Distribution:

    - Since income distribution is skewed, with most employees earning below $6K, we categorized salaries into percentiles (25th, 50th, 75th) for a more balanced analysis.


- Variable Definitions:

    *environment_satisfaction:* Reflects contentment with the overall work environment, including workspace conditions and available resources.  

    *job_involvement:* Measures an employee’s commitment to their work and engagement level. Higher scores indicate a greater sense of responsibility and dedication to job tasks.  

    *job_satisfaction:* Reflects how content an employee is with their job, work environment, and responsibilities. Higher scores indicate greater satisfaction.  

    *percent_salary_hike:* Represents the percentage increase in an employee’s salary over time, which may impact retention and motivation.  
    relationship_satisfaction: Measures an employee’s satisfaction with workplace relationships (colleagues, supervisors, subordinates).  

    *work_life_balance:* Represents how employees perceive their ability to balance work responsibilities with personal life, which can be a significant factor in employee satisfaction and retention. Higher scores indicates better balance and satisfaction.  


The dataset originates from Kaggle, while additional metadata and variable interpretations were referenced from INSEAD Analytics' project on IBM HR Attrition to ensure alignment with the dataset's intended use.  
(Link: https://inseaddataanalytics.github.io/INSEADAnalytics/groupprojects/January2018FBL/IBM_Attrition_VSS.html)


## Dataset Limitations

1. The dataset does not contain date columns, limiting our ability to analyze trends over time.

2. It does not track the number of promotions an employee has received, only the years since their last promotion.

3. Employees with 0 years_since_last_promotion are assumed to have been recently promoted, but without a timeline, we cannot confirm when the promotion occurred.

These limitations affect how we interpret career progression and promotion recency trends.


## Key Insights

Employee attrition is a complex issue influenced by various personal, professional, and organizational factors. By analyzing patterns across demographics, work-life balance, career growth, job satisfaction, and workload history, we can uncover the key drivers of employee turnover.


### Overall Attrition Rate

- The total attrition rate is 16.12% (237 out of 1,470 employees).

<p align="center">
  <img src="https://github.com/Stinrb/hr-attrition-analysis/blob/main/visualizations/attrition_proportion.png" width="45%" />
</p>


## SECTION 1: Employee Demographics vs. Attrition


**Gender**

- Male employees account for 63.29% of overall attrition cases, which aligns with their larger representation in the company.

- However, when examining attrition rates within each gender group, males have a slightly higher rate (17.01%) compared to females (14.80%).


<p align="center">
  <img src="https://github.com/Stinrb/hr-attrition-analysis/blob/main/visualizations/gender_vs_attrition.png" width="45%" />
</p>


**Age**

- 18–24 year-olds show the highest attrition rate at 39.18%, indicating a strong tendency to leave despite being the smallest group by population size. This could reflect early-career instability or dissatisfaction with entry-level roles.

- The 25–34 group has the second-highest rate at 20.22%. Given that this group also has the largest population, this suggests that not only is attrition relatively high here, but it also affects the company more broadly.

- Older age groups (35–44, 45–54, and 55–64) display much lower attrition rates (around 10–16%), suggesting stronger job stability, possible career satisfaction, or more investment in long-term tenure.

<p align="center">
  <img src="https://github.com/Stinrb/hr-attrition-analysis/blob/main/visualizations/age_group_count_and_attrition_rate.png" width="45%" />
</p>


**Education Level**

- Employees with a High School education have the highest attrition rate (18.24%), though they account for a smaller portion of overall attrition (13.08%).

- Those with a Bachelor’s degree show a slightly lower attrition rate (17.31%) but contribute the most to total attrition (41.77%) due to their large population size.

- Undergraduate and Master’s degree holders have moderate attrition rates (15.60% and 14.57%, respectively), suggesting more stability.

- Employees with a Doctorate have the lowest attrition rate (10.42%) and the smallest overall impact (2.11%).

<p align="center">
  <img src="https://github.com/Stinrb/hr-attrition-analysis/blob/main/visualizations/education_level_count_and_attrition_rate.png" width="45%" />
</p>


**Marital Status**

- Single employees have the highest attrition rate at 25.53% and contribute 50.63% of overall attrition, which could be linked to early career transitions or life changes.

- Married employees have a lower attrition rate (12.48%) and make up 35.44% of overall attrition, indicating more stability in this group.

- Divorced employees have the lowest attrition rate (10.09%) but still contribute 13.92% to overall attrition.

<p align="center">
  <img src="https://github.com/Stinrb/hr-attrition-analysis/blob/main/visualizations/marital_status_count_and_attrition_rate.png" width="45%" />
</p>


**Age Group & Marital Status**

- Young single employees (18–24) have the highest attrition rate at 50.00%, contributing 11.81% to overall attrition. Similarly, single employees aged 25–34 also show a high attrition rate of 32.07%, with the largest group contribution at 24.89%.

- Married employees aged 18–24 and single employees aged 55–64 also show elevated attrition rates at 30.00% and 26.32%, respectively, though their overall contributions are smaller.

- Married employees aged 25–34 show a moderate attrition rate of 16.05%, contributing 16.46% to total attrition. This is notably lower than their single counterparts in the same age group.

- Other groups, including divorced and married employees across older age groups (35–64), have attrition rates below 15%, with smaller impacts on overall attrition.

<p align="center">
  <img src="https://github.com/Stinrb/hr-attrition-analysis/blob/main/visualizations/single_count_and_attrition_rate.png" width="45%" />
</p>

<p align="center">
  <img src="https://github.com/Stinrb/hr-attrition-analysis/blob/main/visualizations/married_count_and_attrition_rate.png" width="45%" />
</p>

<p align="center">
  <img src="https://github.com/Stinrb/hr-attrition-analysis/blob/main/visualizations/divorced_count_and_attrition_rate.png" width="45%" />
</p>

**Age Group and Gender**

- Male employees in the 25-34 age group have the highest attrition rate (20.47%), contributing 29.11% of overall attrition for males.

- Female employees in the 18-24 age group have the highest attrition rate (48.65%), which significantly impacts overall female attrition (though their overall contribution is smaller compared to males).


**Age Group & Education Level**

- Employees with a Bachelor’s degree in the 25-34 age group have the highest attrition rate (20.69%) and contribute 20.25% of overall attrition for this age group.

- Employees with a Master’s degree in the 25-34 age group also have a high attrition rate (23.31%), contributing 13.08% to overall attrition.


**Key Summary for Section 1:**

- Young, single employees are at the highest risk of leaving (~39%), highlighting the need for engagement and growth opportunities.

- Higher education levels help with retention, especially at later career stages, suggesting career development programs such as upskilling/training could improve retention.

- Marriage reduces attrition risk significantly (~12%).

- Life stability (age, marriage, and financial responsibilities) reduces attrition, retention strategies can factor in these variables.


## SECTION 2: Work-Life Balance and Environment vs. Attrition


**Distance from Home**

- Employees who live far (21+ km) have the highest attrition rate (22.06%), making up 19% of overall attrition.

- Those living moderately far (11-20 km) also have a high attrition rate (20%), accounting for 20.25% of overall attrition.

- Interestingly, employees living very close (0-5 km) still experience attrition (13.77%), but they make up the largest portion (36.71%) of total attrition cases.


**Environment Satisfaction**

- Low environment satisfaction leads to the highest attrition (25.35%), making up 30.38% of total attrition.

- Employees with medium to very high satisfaction (13.45%-14.98%) have similar but lower attrition rates, meaning satisfaction likely influences retention.


**Relationship Satisfaction**

- Employees with low relationship satisfaction have an attrition rate of 20.65%, higher than those with better relationships.

- Employees with high, medium, or very high satisfaction show similar attrition rates (14.81% - 15.47%), suggesting that relationship satisfaction has a moderate but noticeable impact on retention.


**Work-life Balance**

- "Bad" work-life balance (31.25%) results in the highest attrition rate — nearly 1 out of 3 employees with "Bad" work-life balance leave.

- Even employees with the "Best" work-life balance (17.65%) leave at a notable rate, meaning other factors might be at play.

- Employees with a "Better" work-life balance (14.22%) make up the majority (53.59%) of overall attrition cases, likely because this is the largest group.


**Distance From Home and Work-life Balance**

- "Bad" work-life balance with long commutes = Highest Attrition

    - Employees with both a "Bad" work-life balance and a long commute (11-20 km) have the highest attrition rate (50%), highlighting the strain of long commutes and poor work-life balance.

    - Those living far (21+ km) with a "Bad" work-life balance also have high attrition (30.77%), reinforcing the need for flexible work arrangements.

- "Better" and "Best" work-life balance regardless of distance commute

    - Employees with a "Better" or "Best" work-life balance have much lower attrition rates across all distance categories—showing the importance of work-life balance in employee retention.


**Environment Satisfaction Level and Work-life Balance**

- "Bad" work-life balance and "Low" environment satisfaction = highest attrition

    - Employees with "Low" environment satisfaction and a "Bad" work-life balance have the highest attrition (45%), meaning an unfavourable work atmosphere and poor work-life balance are strong drivers of turnover.

- Ideal environment vs. "Bad" work-life balance
    - Even employees with "Very High" environment satisfaction but a "Bad" work-life balance still leave at a high rate (36%), suggesting that work-life balance alone can outweigh a positive work environment.

- Best of both world
    - Employees with both "High"/"Very High" environment satisfaction and a "Better" or "Best" work-life balance have the lowest attrition (below 13%), proving that these two factors together create a strong retention effect.


**Key Summary for Section 2:**

- Work-life balance plays a major role in attrition, especially when combined with factors like distance from home or poor environment satisfaction.

- Even employees with very high environment satisfaction leave if their work-life balance is poor.

- Distance from Home Plays a Role – Employees close to work and with better work-life balance tend to stay longer. The farther employees live, the more likely they are to leave. Employees need flexible work arrangements to help lessen the attrition.

- Addressing Relationship Satisfaction – While not as strong of a factor, improving relationships at work could still lower attrition.


## SECTION 3: Career Growth and Development vs. Attrition


**Department and Job Role**

- Sales Representatives have the highest attrition rate (39.76%), indicating this is a high-turnover role.

- Laboratory Technicians also experience high attrition (23.94%), making them the most at-risk employees in R&D.

- Sales Executives (17.48%) and Research Scientists (16.10%) show moderate attrition.

- Managers and Directors in R&D and Sales have the lowest attrition (≤5.56%), meaning experienced employees in leadership roles tend to stay longer.


**Training Count from Previous Year**

- Employees with no training have the highest attrition (27.78%), suggesting that lack of development opportunities leads to turnover.

- Those with low training (1-2 sessions) still show a high attrition rate (17.31%).

- Moderate training (3-4 sessions) reduces attrition (15.47%), and

- High training (5+ sessions) has the lowest attrition rate (10.87%), reinforcing the role of continuous learning in retention.


**Company and Job Role Tenure**

- Attrition is highest for newly hired employees (36.36%) and remains high for those in the early career phase (24.88%) — this suggests that employees in their first few years might leave due to unmet expectations, lack of job fit, or career uncertainty.

- Attrition gradually declines as tenure increases, meaning employees who stay longer are less likely to leave, reinforcing the idea that stability increases retention.

- However, even experienced professionals (11-15 years tenure) show some attrition (7.04%)—likely due to career stagnation, lack of opportunities, or work dissatisfaction.


**Company Tenure and Years Since Last Promotion**

- Recently promoted early-career employees have a high attrition rate (27.68%), which might suggest some dissatisfaction even after promotions. One possible cause is that these groups expected more growth or income increase.

- Mid-career employees (7-10 years) who haven’t been promoted in 6+ years (19.30% attrition rate) seem at risk, reinforcing that delayed promotions can contribute to turnover.

- Veteran employees (16+ years) with stagnant growth (11.27%) still leave, though at lower rates—possibly due to late-career job fatigue or retirement plans.

- Employees with recent promotions generally have lower attrition, confirming that promotions help retain talent.


**Key Summary of Section 3:**

- Sales & Entry-Level Roles Need Attention – Sales reps, lab technicians, and early-career employees have the highest attrition.

- Training Helps Retention – Lack of training is a major attrition factor, while employees with 5+ training sessions leave less. This shows that upskilling/training is a big factor for retaining employees in the organization.

- Early Attrition is the Biggest Challenge – The first 2 years in a role or company are when most employees leave. This reinforces the need for engagement for young employees.

- Promotions Aren’t a Silver Bullet – Recently promoted employees still leave, meaning other factors like workload, satisfaction, or pay might play a role.


## **SECTION 4: Job Satisfaction and Compensation vs. Attrition**


**Job Satisfaction and Attrition**

- Employees with Low Job Satisfaction (22.84% attrition rate) have a significantly higher attrition rate than those with Very High Job Satisfaction (11.33%).

- Even employees with High or Medium Job Satisfaction (~16%) show notable attrition, but it drops as satisfaction increases.


**Job Involvement and Attrition**

- Employees with Low Job Involvement (33.73% attrition rate) are leaving at an alarming rate, nearly four times the rate of those with Very High Job Involvement (9.03%).

- Those with High (14.40%) and Medium (18.93%) Job Involvement also experience noticeable attrition, but they fare better than low-involvement employees.


**Income Level and Attrition**

- Employees in the lowest income quartile ("<= 25%", 29.27% attrition rate) are the most likely to leave, showing a threefold difference from those in the highest quartile ("> 75%", 10.33%).

- There’s a steep decline in attrition as income increases, suggesting financial compensation is a strong factor in retention.


**Salary Hike and Attrition**

- The lowest salary hike group (11%-15%, 16.32%) has the highest number of employees but also one of the highest attrition rates.

- Employees who received higher salary hikes (21%-25%, 17.54%) still had a high attrition rate, indicating that salary hikes alone may not be enough to retain employees.


**Overtime and Attrition**

- Employees who work overtime (30.53%) are leaving at nearly three times the rate of those who do not (10.44%).

- Even among highly satisfied employees, overtime leads to higher attrition, emphasizing the negative impact of excessive workload on retention.


**Job Satisfaction and Income Level**

- Low Job Satisfaction & Low Income ("<= 25%") is a double risk: attrition reaches 42.86% in this group.

- Even employees with High or Very High Job Satisfaction in lower-income brackets (~22%-29%) are still leaving at a high rate, reinforcing the idea that low income overrides job satisfaction as a retention factor.


**Job Satisfaction and Salary Hike**

- Employees with Low Job Satisfaction continue to leave despite receiving the highest salary hikes. Those who received a 21%-25% increase still have an attrition rate of 32.43%, while those with 16%-20% hikes see 27.14% attrition.

- In contrast, employees with Very High Job Satisfaction are less likely to leave, even with smaller raises. Those with a 11%-15% hike show an attrition rate of just 12.46%, and with 16%-20% hikes, attrition drops further to 8.55%.


**Job Satisfaction and Overtime**

- Low Satisfaction + Overtime employees (35.71%) are leaving significantly more than High Satisfaction + No Overtime (9.97%), confirming that excessive work hours and dissatisfaction drive turnover.


**Job Involvement and Income Level**

- Employees with Low Job Involvement and Low Income (bottom 25%) have the highest attrition rate at 57.14%, with more than half leaving. Even those with Medium Job Involvement but low salaries experience 37.89% attrition.

- However, for employees with High Job Involvement, attrition remains low across income groups. Those in the top 25% salary bracket have an attrition rate of just 8.84%, while even those with a below-average income (≤ 50%) show only 13.91% attrition.


**Job Involvement and Salary Hike**

- For employees with Low Job Involvement, salary hikes do not prevent attrition. Even with a 21%-25% salary hike, 30.77% still leave, and with 11%-15% hikes, attrition is even higher at 39.58%.

- For Highly Involved employees, salary hikes are more effective. Those with a 11%-15% increase have an attrition rate of just 9.21%, and at 21%-25% hikes, attrition falls further to 7.14%—one of the lowest rates overall.


**Job Involvement and Overtime**

- Low Involvement + Overtime (52% attrition rate!) is the most vulnerable group.

- Even High Involvement employees with Overtime (28.16%) are at risk, showing that even motivated employees leave when overworked.


**Income Level and Overtime**

- Lowest income employees working overtime (58.49% attrition rate!) have the highest attrition in the dataset.

- Even at higher income levels, employees working overtime leave at nearly double the rate of those not working overtime.


**Key Summary of Section 4:**

- Low job satisfaction, low job involvement, low income, and overtime remain the strongest predictors of attrition. Employees experiencing one or more of these factors are at the highest risk of leaving.

- Financial compensation plays a major role, but increasing salaries alone is not enough. Employees with low satisfaction or involvement continue to leave despite high salary hikes. Job satisfaction, involvement, and workload balance are equally crucial.

- Overtime is one of the most critical factors influencing attrition. Even highly engaged and well-paid employees experience significantly higher attrition rates when working overtime.

- Higher salary hikes reduce attrition—but only for engaged employees. For those with low job involvement, even a 21%-25% salary increase does little to prevent turnover, whereas highly engaged employees are more likely to stay with even modest salary increases.


## **SECTION 5: Workload and Career History vs. Attrition


**Business Travel**

- Employees who travel frequently have the highest attrition rate (24.91%), indicating that frequent travel may contribute to job dissatisfaction or burnout.

- Employees who travel rarely still have a moderate attrition rate (14.96%), while non-traveling employees have the lowest attrition (8.00%).


**Years with Current Manager**

- Employees with short-term tenure (0-3 years) under their current manager leave at the highest rate (20.00%).

- Those who have stayed 11+ years with the same manager show very low attrition (4.11%), reinforcing the idea that strong leadership and long-term stability reduce turnover.


**Number of Companies Worked**

Employees who have worked at 7-10 companies before are the most likely to leave (20.00%), suggesting that job-hopping behavior continues.

Even those with 4-6 companies have a relatively high attrition rate (18.01%), compared to those with 0-3 companies (14.96%), who are slightly more stable.


**Total Working Years**

As expected, early-career employees (1-5 years) face the highest attrition (28.20%), with fresh graduates being the most unstable (45.45%).

More experienced professionals (11-20 years) show lower attrition (11.47%), and veterans (21+ years) have the lowest rates (~6-10%), indicating career stability over time.


**Total Working Years and Number of Companies Worked**

- Early-career employees, especially those who have switched multiple companies, show the highest attrition rates. Fresh graduates with 0-3 companies already have a high attrition rate (45.45%), but early-career employees who have worked at 4-6 companies hit an alarming 50.00%.

- Job-hopping amplifies attrition risk across all experience levels—employees who have worked at 7-10 companies tend to leave more often, even among industry veterans (22.22%).

- On the other hand, experienced professionals with long tenure at fewer companies have significantly lower attrition, reinforcing that stability builds retention. Early-career employees need higher engagement and growth opportunities to be retained.


**Key Summary of Section 5:**

- Frequent business travel and short tenure with managers significantly increase attrition risk.

- Employees in their early career phase are most likely to leave, especially those who have switched multiple companies.

- Stability in both tenure and career history is linked to lower attrition, reinforcing the need for strong employee engagement in the early years.
