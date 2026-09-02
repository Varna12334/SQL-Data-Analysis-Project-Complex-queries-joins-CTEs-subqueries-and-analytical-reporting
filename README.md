# E-Commerce Sales & Customer Analytics using SQL

A portfolio-ready SQL project that models an e-commerce business and answers practical business questions using SQLite. The project demonstrates relational database design, data loading, joins, aggregations, subqueries, CTEs, window functions, filtering, and business-oriented analysis.

## 🎯 Project Objective

Analyze customers, products, orders, order items, and payments to answer questions such as:

- How much revenue did the business generate?
- Which products and categories sell the most?
- Who are the highest-value customers?
- How does revenue change month by month?
- What payment methods contribute the most revenue?
- Which products have low stock?
- Which customers have repeat purchases?

## 🗂️ Database Schema

The database contains five related tables:

```text
customers  1 ────────< orders  1 ────────< order_items >──────── 1 products
                         │
                         └────────────────── 1 payments
```

### Tables

| Table | Purpose |
|---|---|
| `customers` | Customer profile and location information |
| `products` | Product, category, price, and stock information |
| `orders` | Customer orders, dates, and order status |
| `order_items` | Products and quantities belonging to each order |
| `payments` | Payment method, amount, and payment status |

## 📊 Dataset

The project uses a realistic synthetic e-commerce dataset designed for learning and portfolio analysis:

- 30 customers
- 20 products
- 120 orders
- 249 order-item records
- Multiple product categories
- Multiple payment methods
- Delivered, shipped, processing, and cancelled orders

No real customer or payment information is used.

## 🧰 Technologies

- **SQL** — data querying and analysis
- **SQLite** — relational database engine
- **Python / Pandas** — compatible with the original learning workflow

## 📁 Project Structure

```text
SQL/
├── README.md
└── sql/
    ├── schema.sql
    ├── data.sql
    ├── order_items.sql
    ├── payments.sql
    └── analysis_queries.sql
```

## 🚀 How to Run

### Option 1: SQLite CLI

Create a database and run the scripts in this order:

```bash
sqlite3 ecommerce.db
.read sql/schema.sql
.read sql/data.sql
.read sql/order_items.sql
.read sql/payments.sql
.read sql/analysis_queries.sql
.quit
```

### Option 2: Python

```python
import sqlite3

conn = sqlite3.connect("ecommerce.db")

for file in [
    "sql/schema.sql",
    "sql/data.sql",
    "sql/order_items.sql",
    "sql/payments.sql"
]:
    with open(file, "r", encoding="utf-8") as f:
        conn.executescript(f.read())

cursor = conn.cursor()
cursor.execute("""
    SELECT category, ROUND(SUM(quantity * unit_price), 2) AS revenue
    FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id
    JOIN orders o ON oi.order_id = o.order_id
    WHERE o.order_status <> 'Cancelled'
    GROUP BY category
    ORDER BY revenue DESC;
""")

for row in cursor.fetchall():
    print(row)

conn.close()
```

## 🔎 SQL Concepts Demonstrated

### Beginner / Intermediate

- `SELECT`
- `WHERE`
- `ORDER BY`
- `DISTINCT`
- `LIKE`
- `LIMIT`
- `COUNT`, `SUM`, `AVG`
- `GROUP BY`
- `HAVING`
- `INNER JOIN`
- `LEFT JOIN`

### Advanced

- Subqueries
- Common Table Expressions (`WITH` / CTE)
- Window functions (`RANK()`)
- `CASE` expressions
- `NOT EXISTS`
- Date analysis with SQLite `strftime()`
- Constraints and foreign keys
- Indexes

## 💼 Business Questions

The `analysis_queries.sql` file contains 15 practical analyses, including:

1. Customers from Andhra Pradesh
2. Total revenue excluding cancelled orders
3. Monthly revenue
4. Top products by units sold and revenue
5. Revenue by product category
6. Top customers by lifetime revenue
7. Average order value
8. Order-status distribution
9. Payment method performance
10. Customers with more than three delivered orders
11. Products priced above the average price
12. Product ranking within each category
13. Customers above average customer revenue
14. Low-stock products
15. Customers with no cancelled orders

## 📌 Example Query

**Find the top products by revenue:**

```sql
SELECT p.product_name,
       SUM(oi.quantity) AS units_sold,
       ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status <> 'Cancelled'
GROUP BY p.product_id, p.product_name
ORDER BY revenue DESC
LIMIT 10;
```

This demonstrates joins, filtering, aggregation, grouping, calculated metrics, sorting, and limiting results in one business-oriented query.

## 📈 Portfolio Value

This project demonstrates the ability to:

- Design a normalized relational schema
- Work with primary and foreign keys
- Load and query structured data
- Combine multiple tables with joins
- Build business metrics from raw transactional data
- Use intermediate and advanced SQL techniques
- Translate business questions into SQL queries

## 🔮 Future Improvements

- Add a Python data-analysis notebook
- Create visualizations using Pandas and Matplotlib
- Add a Power BI dashboard
- Add automated data-quality checks
- Expand the dataset for more advanced customer segmentation

## 👩‍💻 Author

**Varna Doddigarla**

Computer Science & Engineering | SQL | Python | Data & AI Projects
