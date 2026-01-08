# FlexiMart Data Architecture Project

**Student Name:** Surya Rana  
**Student ID:** BITSOM_BA_2507570  
**Email:** (add your official email here)  
**Date:** January 2026  

---

## Project Overview

This project implements a complete end-to-end data architecture solution for FlexiMart, an e-commerce company. The solution covers raw data ingestion using ETL pipelines, relational database design, NoSQL data modeling, data warehousing with star schema, and advanced analytical queries to support business decision-making.

---

## Repository Structure

bitsom_ba_2507570-fleximart-data-architecture/
│
├── README.md
├── .gitignore
│
├── data/
│   ├── customers_raw.csv
│   ├── products_raw.csv
│   └── sales_raw.csv
│
├── part1-database-etl/
│   ├── etl_pipeline.py
│   ├── schema_documentation.md
│   ├── business_queries.sql
│   ├── data_quality_report.txt
│   └── requirements.txt
│
├── part2-nosql/
│   ├── nosql_analysis.md
│   ├── mongodb_operations.js
│   └── products_catalog.json
│
└── part3-datawarehouse/
├── star_schema_design.md
├── warehouse_schema.sql
├── warehouse_data.sql
└── analytics_queries.sql

---

## Technologies Used

- **Programming:** Python 3.x  
- **Libraries:** pandas, mysql-connector-python  
- **Databases:** MySQL 8.0, MongoDB 6.0  
- **Tools:** VS Code, MongoDB Shell (mongosh)

---

## Setup Instructions

### 1. Relational Database Setup (MySQL)

```bash
# Create databases
mysql -u root -p -e "CREATE DATABASE fleximart;"
mysql -u root -p -e "CREATE DATABASE fleximart_dw;"

# Run Part 1 - ETL Pipeline
python part1-database-etl/etl_pipeline.py

# Run Part 2 - Business Queries
mysql -u root -p fleximart < part1-database-etl/business_queries.sql

# Run Part 3 - Data Warehouse
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_schema.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_data.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/analytics_queries.sql

### MongoDB Setup
mongosh
use fleximart_nosql
mongosh part2-nosql/mongodb_operations.js

## Key Learnings
	# Designed and implemented a robust ETL pipeline with real-world data quality challenges.
	# Applied relational normalization (3NF) and dimensional modeling (star schema).
	# Gained hands-on experience with MongoDB document modeling and aggregations.
	# Developed analytical SQL queries using joins, CTEs, window functions, and CASE logic.

## Challenges Faced
# Handling inconsistent and missing data: Solved using data validation, standardization, and conditional cleaning logic in the ETL pipeline.
# Foreign key mapping across systems: Carefully designed surrogate keys and lookup logic to ensure referential integrity.
# MongoDB setup and shell execution: Resolved environment and shell issues while running MongoDB scripts locally.
