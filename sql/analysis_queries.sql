-- E-Commerce Sales & Customer Analytics
-- SQLite-compatible business analysis queries

-- 01. Customers from Andhra Pradesh
SELECT customer_id, customer_name, city
FROM customers
WHERE state = 'Andhra Pradesh'
ORDER BY customer_name;

-- 02. Revenue excluding cancelled orders
SELECT ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_revenue
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status <> 'Cancelled';

-- 03. Monthly revenue
SELECT strftime('%Y-%m', o.order_date) AS month,
       ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status <> 'Cancelled'
GROUP BY month
ORDER BY month;

-- 04. Top products by units sold and revenue
SELECT p.product_name,
       SUM(oi.quantity) AS units_sold,
       ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status <> 'Cancelled'
GROUP BY p.product_id, p.product_name
ORDER BY units_sold DESC
LIMIT 10;

-- 05. Revenue by product category
SELECT p.category,
       SUM(oi.quantity) AS units_sold,
       ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status <> 'Cancelled'
GROUP BY p.category
ORDER BY revenue DESC;

-- 06. Top customers by lifetime revenue
SELECT c.customer_name,
       COUNT(DISTINCT o.order_id) AS orders_count,
       ROUND(SUM(oi.quantity * oi.unit_price), 2) AS lifetime_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status <> 'Cancelled'
GROUP BY c.customer_id, c.customer_name
ORDER BY lifetime_revenue DESC
LIMIT 10;

-- 07. Average order value
SELECT ROUND(AVG(order_total), 2) AS average_order_value
FROM (
    SELECT o.order_id,
           SUM(oi.quantity * oi.unit_price) AS order_total
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.order_status <> 'Cancelled'
    GROUP BY o.order_id
);

-- 08. Order-status distribution
SELECT order_status, COUNT(*) AS order_count
FROM orders
GROUP BY order_status
ORDER BY order_count DESC;

-- 09. Payment method performance
SELECT payment_method,
       COUNT(*) AS transactions,
       ROUND(SUM(amount), 2) AS total_amount
FROM payments
WHERE payment_status = 'Paid'
GROUP BY payment_method
ORDER BY total_amount DESC;

-- 10. Customers with more than 3 delivered orders (HAVING)
SELECT c.customer_id, c.customer_name,
       COUNT(o.order_id) AS delivered_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 3
ORDER BY delivered_orders DESC;

-- 11. Products priced above the average product price (subquery)
SELECT product_name, category, unit_price
FROM products
WHERE unit_price > (SELECT AVG(unit_price) FROM products)
ORDER BY unit_price DESC;

-- 12. Rank products within each category (window function)
WITH product_sales AS (
    SELECT p.product_id, p.product_name, p.category,
           ROUND(SUM(CASE WHEN o.order_status <> 'Cancelled'
                          THEN oi.quantity * oi.unit_price ELSE 0 END), 2) AS revenue
    FROM products p
    LEFT JOIN order_items oi ON p.product_id = oi.product_id
    LEFT JOIN orders o ON oi.order_id = o.order_id
    GROUP BY p.product_id, p.product_name, p.category
)
SELECT product_name, category, revenue,
       RANK() OVER (PARTITION BY category ORDER BY revenue DESC) AS category_rank
FROM product_sales
ORDER BY category, category_rank;

-- 13. Customers above average customer revenue (CTE)
WITH customer_revenue AS (
    SELECT c.customer_id, c.customer_name,
           SUM(CASE WHEN o.order_status <> 'Cancelled'
                    THEN oi.quantity * oi.unit_price ELSE 0 END) AS revenue
    FROM customers c
    LEFT JOIN orders o ON c.customer_id = o.customer_id
    LEFT JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT customer_name, ROUND(revenue, 2) AS revenue
FROM customer_revenue
WHERE revenue > (SELECT AVG(revenue) FROM customer_revenue)
ORDER BY revenue DESC;

-- 14. Low-stock products
SELECT product_name, category, stock_quantity
FROM products
WHERE stock_quantity < 40
ORDER BY stock_quantity;

-- 15. Customers with no cancelled orders
SELECT c.customer_id, c.customer_name
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
      AND o.order_status = 'Cancelled'
)
ORDER BY c.customer_id;
