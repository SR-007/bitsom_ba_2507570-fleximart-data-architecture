Section 1: Schema Overview
FACT TABLE: fact_sales
Grain:
One row per product per order line item.
Business Process:
Tracks sales transactions at the most detailed level to support accurate revenue, quantity, and trend analysis.
Measures (Numeric Facts):
	•	quantity_sold: Number of units sold per product in an order
	•	unit_price: Price per unit at the time of sale
	•	discount_amount: Discount applied on the line item
	•	total_amount: Final amount calculated as
(quantity_sold × unit_price − discount_amount)
Foreign Keys:
	•	date_key → dim_date
	•	product_key → dim_product
	•	customer_key → dim_customer
  
DIMENSION TABLE: dim_date
Purpose:
Provides a comprehensive time dimension for analyzing sales trends across days, months, quarters, and years.
Type:
Conformed Dimension (used consistently across fact tables)
Attributes:
	•	date_key (PK): Surrogate key in YYYYMMDD format
	•	full_date: Actual calendar date
	•	day_of_week: Name of the day (Monday–Sunday)
	•	day_of_month: Numeric day of the month
	•	month: Numeric month (1–12)
	•	month_name: Month name (January, February, etc.)
	•	quarter: Quarter of the year (Q1–Q4)
	•	year: Calendar year
	•	is_weekend: Boolean flag indicating weekend


DIMENSION TABLE: dim_product
Purpose:
Stores descriptive information about products for category-wise and product-level analysis.
Attributes:
	•	product_key (PK): Surrogate key
	•	product_id: Business product identifier
	•	product_name: Name of the product
	•	category: High-level category (Electronics, Fashion)
	•	subcategory: Sub-category (Smartphones, Clothing, etc.)
	•	unit_price: Standard product price


DIMENSION TABLE: dim_customer
Purpose:
Stores customer information for segmentation and geographic analysis.
Attributes:
	•	customer_key (PK): Surrogate key
	•	customer_id: Business customer identifier
	•	customer_name: Full customer name
	•	city: Customer city
	•	state: Customer state
	•	customer_segment: Segment such as Retail, Premium, or Corporate


Section 2: Design Decisions 
The star schema is designed at the transaction line-item level to ensure maximum analytical flexibility. This granularity allows accurate calculation of revenue, quantity sold, discounts, and customer behavior at the most detailed level, while still supporting roll-up to daily, monthly, or yearly summaries.
Surrogate keys are used instead of natural keys to improve performance, ensure consistency, and avoid dependency on operational system identifiers that may change over time. Surrogate keys also simplify joins and support slowly changing dimensions in future enhancements.
This design supports drill-down and roll-up operations effectively. Analysts can drill down from yearly to monthly to daily sales using the date dimension, or roll up sales from product to category level using the product dimension. The separation of facts and dimensions ensures query simplicity, faster aggregation, and scalability for future data growth.


Section 3: Sample Data Flow
Source Transaction:
Order #101
Customer: John Doe
Product: Laptop
Quantity: 2
Unit Price: ₹50,000
Order Date: 2024-01-15

Data Warehouse Representation:

fact_sales
{
  date_key: 20240115,
  product_key: 5,
  customer_key: 12,
  quantity_sold: 2,
  unit_price: 50000,
  discount_amount: 0,
  total_amount: 100000
}

dim_date
{
  date_key: 20240115,
  full_date: '2024-01-15',
  month: 1,
  month_name: 'January',
  quarter: 'Q1',
  year: 2024,
  is_weekend: false
}

dim_product
{
  product_key: 5,
  product_name: 'Laptop',
  category: 'Electronics'
}

dim_customer
{
  customer_key: 12,
  customer_name: 'John Doe',
  city: 'Mumbai'
}

