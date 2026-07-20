{{ config(materialized = 'table') }}

SELECT
    occupation_name,
    total_employment,
    comp_skill_importance
FROM {{ ref('mart_analytics') }}
WHERE 
    comp_skill_importance >= 85 AND
    total_employment IS NOT NULL
ORDER BY total_employment DESC
LIMIT 20