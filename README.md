# Job Market Intelligence Pipeline

## Overview
A data engineering pipeline that ingests, transforms, and analyzes job market data using Python, AWS S3, Snowflake, dbt, SQL, and Power BI.

## Tech Stack
- Python
- AWS S3
- Snowflake
- dbt
- SQL
- Power BI

## Pipeline
Raw Data (CSV/XLSX) → Python → S3 → Snowflake → dbt → Power BI

## Features
- Cleans and standardizes job market datasets
- Loads raw and cleaned data into Snowflake
- Uses dbt for staging and analytics models
- Builds a Power BI dashboard using dbt models

## Repository Structure
- occupation_data.py
- s3.py
- job_market_warehouse.sql
- job_market_visualizations.pbix
- job_market_pipeline_dbt/

## Dashboard
![Job Market Intelligence Dashboard](./powerbi_dashboard.png)
