{{ config(materialized = 'table') }}

SELECT
    soc_code,
    occupation_name,
    TRY_TO_NUMBER(total_employment) AS total_employment,
    TRY_TO_NUMBER(mean_salary) AS mean_salary,
    TRY_TO_NUMBER(median_salary) AS median_salary
FROM {{ source('raw', 'SALARY_CLEAN') }}