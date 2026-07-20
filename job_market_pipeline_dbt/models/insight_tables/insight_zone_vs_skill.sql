{{ config(materialized = 'table') }}

SELECT 
    job_zone,
    MAX(job_zone_description) AS job_zone_description,
    COUNT(*) AS occupation_count,
    TRUNCATE(AVG(comp_skill_importance), 0) AS avg_skill_importance,
    TRUNCATE(AVG(mean_salary), 2) AS avg_salary
FROM {{ ref('mart_analytics') }}
WHERE 
    comp_skill_importance IS NOT NULL AND 
    mean_salary IS NOT NULL
GROUP BY job_zone
ORDER BY job_zone