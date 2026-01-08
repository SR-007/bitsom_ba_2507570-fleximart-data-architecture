# Part 1: Relational Database & ETL Pipeline

## Objective
The objective of this part is to design a relational database schema for FlexiMart and implement an ETL pipeline to load raw CSV data into MySQL tables while ensuring data quality and integrity.

---

## Data Sources
- `customers_raw.csv`
- `products_raw.csv`
- `sales_raw.csv`

---

## Key Components

### 1. ETL Pipeline
- Implemented in `etl_pipeline.py`
- Extracts data from CSV files
- Cleans and validates data
- Loads data into MySQL tables

### 2. Database Design
- Normalized schema (3NF)
- Tables: customers, products, orders, order_items
- Primary and foreign key relationships enforced

### 3. Data Quality Handling
- Missing values handled appropriately
- Duplicate records removed
- Invalid records logged in `data_quality_report.txt`

---

## Files Description
- `etl_pipeline.py` – Main ETL script
- `schema_documentation.md` – Database schema explanation
- `business_queries.sql` – SQL queries for business insights
- `data_quality_report.txt` – ETL data quality issues
- `requirements.txt` – Python dependencies

---

## Execution
```bash
python etl_pipeline.py