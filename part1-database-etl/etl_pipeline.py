import os
import pandas as pd
import mysql.connector
import logging
from datetime import datetime

# ---------------- CONFIG ----------------
DB_CONFIG = {
    "host": "localhost",
    "user": "root",
    "password": "Surya@123#",   # 🔴 CHANGE THIS
    "database": "fleximart"
}

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DATA_PATH = os.path.join(BASE_DIR, "data")

# ---------------- LOGGING ----------------
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)

# ---------------- HELPERS ----------------
def parse_date(val):
    try:
        return pd.to_datetime(val, errors="coerce").date()
    except:
        return None

def clean_nan(val):
    return None if pd.isna(val) else val

# ---------------- ETL CUSTOMERS ----------------
def etl_customers(cursor):
    df = pd.read_csv(os.path.join(DATA_PATH, "customers_raw.csv"))
    df = df.drop_duplicates(subset="email")

    df["registration_date"] = df["registration_date"].apply(parse_date)
    df["city"] = df["city"].astype(str).str.title()

    sql = """
        INSERT IGNORE INTO customers
        (first_name, last_name, email, phone, city, registration_date)
        VALUES (%s,%s,%s,%s,%s,%s)
    """

    for _, r in df.iterrows():
        cursor.execute(sql, (
            clean_nan(r["first_name"]),
            clean_nan(r["last_name"]),
            clean_nan(r["email"]),
            clean_nan(r["phone"]),
            clean_nan(r["city"]),
            clean_nan(r["registration_date"])
        ))

    logging.info("Customers loaded successfully")

# ---------------- ETL PRODUCTS ----------------
def etl_products(cursor):
    df = pd.read_csv(os.path.join(DATA_PATH, "products_raw.csv"))
    df = df.drop_duplicates(subset="product_name")

    sql = """
        INSERT IGNORE INTO products
        (product_name, category, price, stock_quantity)
        VALUES (%s,%s,%s,%s)
    """

    for _, r in df.iterrows():
        cursor.execute(sql, (
            clean_nan(r["product_name"]),
            clean_nan(r["category"]),
            clean_nan(r["price"]),
            clean_nan(r["stock_quantity"])
        ))

    logging.info("Products loaded successfully")

# ---------------- ETL SALES ----------------
def etl_sales(cursor):
    df = pd.read_csv(os.path.join(DATA_PATH, "sales_raw.csv"))

    # Column names based on your CSV
    df["transaction_date"] = df["transaction_date"].apply(parse_date)

    # Map customer_code -> customer_id
    cursor.execute("SELECT customer_id, email FROM customers")
    customers = cursor.fetchall()
    customer_map = {email: cid for cid, email in customers}

    # Map product_code -> product_id
    cursor.execute("SELECT product_id, product_name FROM products")
    products = cursor.fetchall()
    product_map = {name: pid for pid, name in products}

    for _, r in df.iterrows():
        customer_id = customer_map.get(r["customer_id"])
        product_id = product_map.get(r["product_id"])

        if customer_id is None or product_id is None:
            continue

        total_amount = r["quantity"] * r["unit_price"]

        cursor.execute(
            """
            INSERT INTO orders (customer_id, order_date, total_amount, status)
            VALUES (%s,%s,%s,%s)
            """,
            (customer_id, r["transaction_date"], total_amount, r["status"])
        )

        order_id = cursor.lastrowid

        cursor.execute(
            """
            INSERT INTO order_items
            (order_id, product_id, quantity, unit_price, subtotal)
            VALUES (%s,%s,%s,%s,%s)
            """,
            (
                order_id,
                product_id,
                r["quantity"],
                r["unit_price"],
                total_amount
            )
        )

    logging.info("Sales loaded successfully")

# ---------------- MAIN ----------------
def main():
    conn = mysql.connector.connect(**DB_CONFIG)
    cursor = conn.cursor()

    etl_customers(cursor)
    etl_products(cursor)
    etl_sales(cursor)

    conn.commit()
    cursor.close()
    conn.close()

    logging.info("ETL PIPELINE COMPLETED SUCCESSFULLY")

# ---------------- RUN ----------------
if __name__ == "__main__":
    main()