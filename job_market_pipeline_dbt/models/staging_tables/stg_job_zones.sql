{{ config(materialized = 'table') }}

SELECT
    job_zone,
    description
FROM {{ source('raw', 'JOB_ZONES_CLEAN') }}
