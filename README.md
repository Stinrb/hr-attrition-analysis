# Employee Attrition Analysis


## Overview

A data-driven understanding of the workforce is key to addressing employee attrition. This project aims to analyze employee attrition patterns using SQL for exploratory data analysis (EDA) and Power BI for visualization. The dataset, sourced from Kaggle, contains various employee attributes, including demographics, job satisfaction, career growth, and work-life balance. By leveraging SQL queries, we extract key insights that help organizations understand factors influencing employee retention and turnover.

This is a synthetic dataset generated by the IBM Data Scientist.
(Data source: https://www.kaggle.com/pavansubhasht/ibm-hr-analytics-attrition-dataset.)


## Objectives:

- Identify key drivers of employee attrition using descriptive analysis.

- Analyze trends across demographics, job satisfaction, compensation, and career growth.

- Provide actionable insights for improving employee retention strategies.

- Utilize SQL for data extraction, transformation, and analysis.

- Visualize findings in Power BI for better decision-making.


## Dataset Overview:


### Who Are Our Employees?

The dataset consists of 1,470 employees, reflecting a diverse workforce across different backgrounds and career stages.


**Gender & Age:**

The workforce is 60% male (882 employees) and 40% female (588 employees). Employees range from 18 to 60 years old, with an average age of 37. The majority (over 70%) are between 25 and 44, the prime working years where career growth and stability are critical factors in retention.

**Gender Distribution**
<p align="center">
  <img src="https://github.com/Stinrb/hr-attrition-analysis/blob/main/visualizations/gender_proportions.png" width="50%" />
</p>
  
  
**Age Group Distribution**
<p align="center">
  <img src="https://github.com/Stinrb/hr-attrition-analysis/blob/main/visualizations/age_group.png" width="60%" />
</p>

**Education Background:**

A well-educated workforce is a key asset. Nearly 39% hold a bachelor’s degree, while 27% have a master’s degree. However, 19% are undergraduates, and 12% have education below the college level, highlighting a mix of academic qualifications that contribute to workplace diversity.


**Marital Status & Work Commitments:**

Life stages vary across the workforce: 46% are married, 32% are single, and 22% are divorced. These personal circumstances can influence career decisions, with single employees often being more mobile, while married employees may prioritize stability.

With this foundation, we dive deeper into understanding what drives employees to stay or leave. By examining key factors such as job satisfaction, compensation, and career progression, this analysis aims to uncover actionable insights that help businesses foster a thriving work environment.


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

- The dataset does not track the number of promotions an employee has received, only the years since the last promotion.

- Employees with 0 years_since_last_promotion are assumed to be recently promoted, but we lack a timeline to confirm when the promotion occurred.

- This limitation affects how we interpret career progression and promotion recency trends.


## Key Insights

Employee attrition is a complex issue influenced by various personal, professional, and organizational factors. By analyzing patterns across demographics, work-life balance, career growth, job satisfaction, and workload history, we can uncover the key drivers of employee turnover.


### Overall Attrition Rate

- The total attrition rate is 16.12% (237 out of 1,470 employees).


## SECTION 1: Employee Demographics vs. Attrition


**Gender**

- Males have a higher attrition rate (17.01%) compared to females (14.80%).

- Males also make up the majority of overall attrition (63.29%).  


**Age**

- Younger employees (18-24) have the highest attrition rate (39.18%), meaning almost 4 in 10 employees in this age group leave.

- Employees aged 25-34 also have a high attrition rate (20.22%), which aligns with career transitions, exploration and job-hopping trends.

- Stability sets in with age - attrition decreases significantly as employees get older (e.g., 35-44: 10.10%, 45-54: 10.20%, 55-64: 15.94%), showing that those who stay past their early career years are more likely to commit long-term.


**Education Level**

- High school graduates (18.24%) and bachelor’s degree holders (17.31%) have higher attrition compared to those with a master’s (14.57%) or doctorate (10.42%), suggesting career mobility is common among those with general education backgrounds.

- Meanwhile, employees with a master’s (14.57%) or doctorate (10.42%) are more likely to stay, possibly due to specialized skills and limited alternative job options.

- Doctorate holders are the most stable employees, making up only 2.11% of overall attrition.


**Marital Status**

- Single employees are more likely to leave thus, have the highest attrition rate (25.53%), accounting for half (50.63%) of all attrition cases. This could be due to their flexibility and fewer financial commitments.

- Married (12.48%) and divorced (10.09%) employees have much lower attrition, likely due to increased family responsibilities and financial/job stability.


**Age Group & Marital Status**

- Young & Single = Highest Attrition

    - 18-24 Single employees have a 50% attrition rate, the highest among all groups.

    - 25-34 Single employees follow at 32.07% attrition—still high.

- Married employees have significantly lower attrition

    - 25-34 Married attrition drops to 16.05% (half of their single counterparts).

    - 35-44 Married employees have only a 7.53% attrition rate—showing long-term career stability.

- Older employees (45+) have lower attrition, regardless of status

    - Even 55-64 Single employees (26.32%) have a lower attrition rate than younger singles.


**Age Group & Education Level**

- Higher education reduces attrition

    - 18-24 Bachelor's holders have a 48.65% attrition rate, nearly half leave.

    - High school graduates (38.89%) also show high attrition, suggesting fewer growth opportunities.

    - In contrast, Master’s degree holders in the 35-44 age group have only an 8.50% attrition rate.

- Higher education with higher age group further decreases attrition rate.

    - 35-44: 4.55% attrition rate.

    - 55-64: 0% attrition rate.


**Gender and Marital Status**

- Single Males have the highest attrition rate (26.94%)

    - Single Females also have high attrition (23.62%), but lower than males.

- Married employees show strong job stability

    - Married Males (13.22%) and Females (11.40%) have much lower attrition than singles.

- Divorced employees have the lowest attrition

    - Divorced Females (7.69%) and Males (11.43%) stay longer.


**Key Summary for Section 1:**

- Young, single employees are at the highest risk of leaving (~39%), highlighting the need for engagement and growth opportunities.

- Higher education levels help with retention, especially at later career stages, suggesting career development programs such as upskilling/training could improve retention.

- Marriage reduces attrition risk significantly (~12%).

- Gender alone isn’t a major factor, but when combined with marital status, single males tend to leave more.

- Life stability (age, marriage, and financial responsibilities) reduces attrition, meaning HR teams can tailor retention efforts based on these trends.


## SECTION 2: Work-Life Balance and Environment vs Attrition


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


**Job Satisfaction + Income Level**

- Low Job Satisfaction & Low Income ("<= 25%") is a double risk: attrition reaches 42.86% in this group.

- Even employees with High or Very High Job Satisfaction in lower-income brackets (~22%-29%) are still leaving at a high rate, reinforcing the idea that low income overrides job satisfaction as a retention factor.


**Job Satisfaction + Salary Hike**

- Employees with Low Job Satisfaction continue to leave despite receiving the highest salary hikes. Those who received a 21%-25% increase still have an attrition rate of 32.43%, while those with 16%-20% hikes see 27.14% attrition.

- In contrast, employees with Very High Job Satisfaction are less likely to leave, even with smaller raises. Those with a 11%-15% hike show an attrition rate of just 12.46%, and with 16%-20% hikes, attrition drops further to 8.55%.


**Job Satisfaction + Overtime**

- Low Satisfaction + Overtime employees (35.71%) are leaving significantly more than High Satisfaction + No Overtime (9.97%), confirming that excessive work hours and dissatisfaction drive turnover.


**Job Involvement + Income Level**
- Employees with Low Job Involvement and Low Income (bottom 25%) have the highest attrition rate at 57.14%, with more than half leaving. Even those with Medium Job Involvement but low salaries experience 37.89% attrition.

- However, for employees with High Job Involvement, attrition remains low across income groups. Those in the top 25% salary bracket have an attrition rate of just 8.84%, while even those with a below-average income (≤ 50%) show only 13.91% attrition.


**Job Involvement + Salary Hike**
- For employees with Low Job Involvement, salary hikes do not prevent attrition. Even with a 21%-25% salary hike, 30.77% still leave, and with 11%-15% hikes, attrition is even higher at 39.58%.

- For Highly Involved employees, salary hikes are more effective. Those with a 11%-15% increase have an attrition rate of just 9.21%, and at 21%-25% hikes, attrition falls further to 7.14%—one of the lowest rates overall.


**Job Involvement + Overtime**

- Low Involvement + Overtime (52% attrition rate!) is the most vulnerable group.

- Even High Involvement employees with Overtime (28.16%) are at risk, showing that even motivated employees leave when overworked.


**Income Level + Overtime**

- Lowest income employees working overtime (58.49% attrition rate!) have the highest attrition in the dataset.

- Even at higher income levels, employees working overtime leave at nearly double the rate of those not working overtime.


**Key Summary of Section 4:**

- Low job satisfaction, low job involvement, low income, and overtime remain the strongest predictors of attrition. Employees experiencing one or more of these factors are at the highest risk of leaving.

- Financial compensation plays a major role, but increasing salaries alone is not enough. Employees with low satisfaction or involvement continue to leave despite high salary hikes. Job satisfaction, involvement, and workload balance are equally crucial.

- Overtime is one of the most critical factors influencing attrition. Even highly engaged and well-paid employees experience significantly higher attrition rates when working overtime.

- Higher salary hikes reduce attrition—but only for engaged employees. For those with low job involvement, even a 21%-25% salary increase does little to prevent turnover, whereas highly engaged employees are more likely to stay with even modest salary increases.

