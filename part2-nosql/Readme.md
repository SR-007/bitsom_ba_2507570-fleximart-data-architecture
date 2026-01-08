# Part 2: NoSQL Database (MongoDB)

## Objective
This part demonstrates the use of MongoDB to store and analyze semi-structured product catalog data using a document-based data model.

---

## Dataset
- `products_catalog.json`
- Contains Electronics and Fashion products
- Includes nested documents and arrays (reviews, specifications)

---

## MongoDB Design
- Database: `fleximart_nosql`
- Collection: `products`
- Embedded documents used for reviews and specifications

---

## Operations Implemented
- Bulk insert of product data
- Querying by category and price
- Updating nested review data
- Aggregation pipelines for analytics

---

## Files Description
- `mongodb_operations.js` – MongoDB insert, update, query, aggregation scripts
- `products_catalog.json` – Product catalog dataset
- `nosql_analysis.md` – Explanation of NoSQL modeling choices

---

## Execution
```bash
mongosh mongodb_operations.js