import pandas as pd

def load_occupations(file):
    df = pd.read_csv(file)
    df = df[['Job Zone', 'Code', 'Occupation']]
    df.columns = ['job_zone', 'occupation_code', 'occupation_name']
    
    df['occupation_code'] = df['occupation_code'].astype(str)
    df['soc_code'] = df['occupation_code'].str[:7]

    return df

def load_job_zones(file):
    df = pd.read_csv(file)
    df.columns = ['job_zone', 'description']

    return df

def load_computer_skills(file):
    df = pd.read_csv(file)
    df.columns = ['importance', 'level', 'job_zone', 'occupation_code', 'occupation_name']

    df['occupation_code'] = df['occupation_code'].astype(str)

    return df

def load_salary(file):
    df = pd.read_excel(file)
    df = df[['OCC_CODE', 'OCC_TITLE', 'TOT_EMP', 'A_MEAN', 'A_MEDIAN']]
    df.columns = ['soc_code', 'occupation_name', 'total_employment', 'mean_salary', 'median_salary']

    df['soc_code'] = df['soc_code'].astype(str)

    return df

if __name__ == '__main__':
    occupations = load_occupations('All_Occupations.csv')
    job_zones = load_job_zones('Job_Zones.csv')
    comp_skills = load_computer_skills('Computers_and_Electronics.csv')
    salary = load_salary('national_M2025_dl.xlsx')

    print(occupations.head())
    print(job_zones.head())
    print(comp_skills.head())
    print(salary.head())

    print(occupations.shape)
    print(job_zones.shape)
    print(comp_skills.shape)
    print(salary.shape)
