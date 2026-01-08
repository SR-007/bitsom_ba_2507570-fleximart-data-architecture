## Objective
This part focuses on building a data warehouse using a star schema and performing analytical queries to derive business insights.

---

## Data Warehouse Design
- Star schema implemented
- Fact table: `fact_sales`
- Dimension tables:
  - `dim_customer`
  - `dim_product`
  - `dim_date`

---

## Schema Files
- `warehouse_schema.sql` – Table definitions
- `warehouse_data.sql` – Sample data insertion

---

## Analytical Queries
Implemented in `analytics_queries.sql`:
- Revenue by customer segment
- Top-selling products
- Monthly sales trends
- Customer value segmentation

---

## Execution
```bash
mysql -u root -p fleximart_dw < warehouse_schema.sql
mysql -u root -p fleximart_dw < warehouse_data.sql
mysql -u root -p fleximart_dw < analytics_queries.sql