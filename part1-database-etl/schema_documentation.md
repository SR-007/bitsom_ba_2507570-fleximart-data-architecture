# Database Schema Documentation – FlexiMart

## Overview
This document describes the relational database schema used in the FlexiMart ETL pipeline.  
The schema is designed to store customer, product, and sales transaction data in a normalized format.

---

## Entity-Relationship Description

### ENTITY: customers
**Purpose:** Stores customer information.

**Attributes:**
- customer_id (PK): Unique identifier for each customer
- first_name: Customer’s first name
- last_name: Customer’s last name
- email: Unique email address
- phone: Contact number
- city: City of residence
- registration_date: Date of registration

**Relationships:**
- One customer can place MANY orders (1:M with orders table)

---

### ENTITY: products
**Purpose:** Stores product catalog details.

**Attributes:**
- product_id (PK): Unique identifier for each product
- product_name: Name of the product
- category: Product category
- price: Product price
- stock_quantity: Available stock

**Relationships:**
- One product can appear in MANY order items (1:M with order_items table)

---

### ENTITY: orders
**Purpose:** Stores customer order information.

**Attributes:**
- order_id (PK): Unique order identifier
- customer_id (FK): References customers.customer_id
- order_date: Date of order
- total_amount: Total order value
- status: Order status (Pending/Completed)

**Relationships:**
- One order belongs to ONE customer (M:1)
- One order can contain MANY order items (1:M)

---

### ENTITY: order_items
**Purpose:** Stores individual items within an order.

**Attributes:**
- order_item_id (PK): Unique order item identifier
- order_id (FK): References orders.order_id
- product_id (FK): References products.product_id
- quantity: Quantity purchased
- unit_price: Price per unit
- subtotal: Calculated line total

---

## Normalization Explanation (3NF)

The FlexiMart database schema follows **Third Normal Form (3NF)** principles:

1. **First Normal Form (1NF):**
   - All tables contain atomic values.
   - No repeating groups or multi-valued attributes.

2. **Second Normal Form (2NF):**
   - All non-key attributes depend on the full primary key.
   - Composite dependencies are removed by separating order_items from orders.

3. **Third Normal Form (3NF):**
   - No transitive dependencies exist.
   - Customer details are stored only in the customers table.
   - Product details are stored only in the products table.
   - Order financial data is stored only in orders.

### Functional Dependencies
- customer_id → first_name, last_name, email, phone, city
- product_id → product_name, category, price, stock_quantity
- order_id → customer_id, order_date, total_amount, status

### Anomaly Prevention
- **Insert anomaly:** New customers/products can be added independently.
- **Update anomaly:** Updating customer or product data does not affect sales records.
- **Delete anomaly:** Deleting an order does not remove customer or product information.

---

## Sample Data Representation

### customers
| customer_id | first_name | last_name | email              | city      |
|------------|-----------|-----------|--------------------|-----------|
| 1 | Rahul | Sharma | rahul@gmail.com | Delhi |
| 2 | Priya | Patel | priya@gmail.com | Mumbai |

### products
| product_id | product_name | category | price |
|-----------|--------------|----------|-------|
| 1 | Smartphone | Electronics | 25000 |
| 2 | Headphones | Electronics | 3000 |

### orders
| order_id | customer_id | order_date | total_amount |
|---------|------------|-----------|--------------|
| 1 | 1 | 2024-01-10 | 28000 |
| 2 | 2 | 2024-01-15 | 3000 |

### order_items
| order_item_id | order_id | product_id | quantity | subtotal |
|--------------|----------|------------|----------|----------|
| 1 | 1 | 1 | 1 | 25000 |
| 2 | 1 | 2 | 1 | 3000 |