CREATE DATABASE job_market;

USE DATABASE job_market;

CREATE SCHEMA analytics;
CREATE SCHEMA raw;

USE SCHEMA raw;

CREATE STORAGE INTEGRATION s3_int
    TYPE = EXTERNAL_STAGE
    STORAGE_PROVIDER = S3
    ENABLED = TRUE
    STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::<AWS_ACCOUNT_ID>:role/SnowflakeS3Role'
    STORAGE_ALLOWED_LOCATIONS = ('s3://<YOUR_BUCKET_NAME>/');

CREATE STAGE raw_stage
URL = 's3://<YOUR_BUCKET_NAME>/clean_files'
STORAGE_INTEGRATION = s3_int;

CREATE TABLE occupations_clean (
    job_zone STRING,
    occupation_code STRING,
    occupation_name STRING,
    soc_code STRING 
);

CREATE TABLE comp_skills_clean (
    importance NUMBER,
    skill_level STRING,
    job_zone STRING,
    occupation_code STRING,
    occupation_name STRING
);

CREATE TABLE salary_clean (
    soc_code STRING,
    occupation_name STRING,
    total_employment STRING,
    mean_salary STRING,
    median_salary STRING
);

CREATE TABLE job_zones_clean (
    job_zone STRING,
    description STRING  
);

COPY INTO occupations_clean
FROM @raw_stage/occupations_clean.csv
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"');

COPY INTO comp_skills_clean
FROM @raw_stage/comp_skills_clean.csv
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"');

COPY INTO salary_clean
FROM @raw_stage/salary_clean.csv
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"');

COPY INTO job_zones_clean
FROM @raw_stage/job_zones_clean.csv
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"');

USE SCHEMA analytics;