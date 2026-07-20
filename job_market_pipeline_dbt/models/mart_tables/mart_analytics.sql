{{ config(materialized = 'table') }}

SELECT
    o.occupation_code AS occupation_code,
    o.occupation_name AS occupation_name,
    j.job_zone AS job_zone,
    j.description AS job_zone_description,
    s.total_employment AS total_employment,
    s.mean_salary AS mean_salary,
    s.median_salary AS median_salary,
    c.importance AS comp_skill_importance, 
    c.skill_level AS comp_skill_level
FROM {{ ref('stg_occupations') }} AS o
INNER JOIN {{ ref('stg_comp_skills') }} AS c 
    ON o.occupation_code = c.occupation_code
INNER JOIN {{ ref('stg_salary') }} AS s 
    ON o.soc_code = s.soc_code
INNER JOIN {{ ref('stg_job_zones') }} AS j 
    ON o.job_zone = j.job_zone

