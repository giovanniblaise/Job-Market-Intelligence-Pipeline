{{ config(materialized = 'table') }}

SELECT
    job_zone,
    occupation_code,
    occupation_name,
    soc_code
FROM {{ source('raw', 'OCCUPATIONS_CLEAN') }}
