import occupation_data
import boto3

s3 = boto3.client('s3')
bucket = 'gio-job-market-pipeline'

s3.upload_file(
    'All_Occupations.csv',
    bucket,
    'raw_files/occupations_raw.csv'
)

s3.upload_file(
    'Computers_and_Electronics.csv',
    bucket,
    'raw_files/comp_skills_raw.csv'
)

s3.upload_file(
    'Job_Zones.csv',
    bucket,
    'raw_files/job_zones_raw.csv'
)

s3.upload_file(
    'national_M2025_dl.xlsx',
    bucket,
    'raw_files/salary_raw.xlsx'
)

occupations = occupation_data.load_occupations('All_Occupations.csv')
occupations.to_csv('occupations_clean.csv', index=False)
s3.upload_file(
    'occupations_clean.csv',
    bucket,
    'clean_files/occupations_clean.csv'
)

comp_skills = occupation_data.load_computer_skills('Computers_and_Electronics.csv')
comp_skills.to_csv('comp_skills_clean.csv', index=False)
s3.upload_file(
    'comp_skills_clean.csv',
    bucket,
    'clean_files/comp_skills_clean.csv'
)

job_zones = occupation_data.load_job_zones('Job_Zones.csv')
job_zones.to_csv('job_zones_clean.csv', index=False)
s3.upload_file(
    'job_zones_clean.csv',
    bucket,
    'clean_files/job_zones_clean.csv'
)

salary = occupation_data.load_salary('national_M2025_dl.xlsx')
salary.to_csv('salary_clean.csv', index=False)
s3.upload_file(
    'salary_clean.csv',
    bucket,
    'clean_files/salary_clean.csv'
)