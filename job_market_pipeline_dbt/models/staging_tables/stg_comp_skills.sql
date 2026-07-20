{{ config(materialized = 'table') }}

SELECT
    TRY_TO_NUMBER(importance) AS importance,
    TRY_TO_NUMBER(skill_level) AS skill_level,
    job_zone,
    occupation_code,
    occupation_name
FROM {{ source('raw', 'COMP_SKILLS_CLEAN') }}

