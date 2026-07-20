{{ config(materialized = 'table') }}

SELECT
    occupation_name,
    job_zone,
    mean_salary,
    median_salary,
    comp_skill_importance
FROM {{ ref('mart_analytics') }}
WHERE 
    comp_skill_importance < 85 AND 
    mean_salary IS NOT NULL AND 
    median_salary IS NOT NULL
ORDER BY mean_salary DESC, median_salary DESC 
LIMIT 20