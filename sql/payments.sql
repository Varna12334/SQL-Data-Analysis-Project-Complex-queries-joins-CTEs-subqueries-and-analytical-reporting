-- Generate payment records from order totals.
-- Run after schema.sql, data.sql and order_items.sql.

INSERT INTO payments (order_id, payment_method, amount, payment_status)
SELECT o.order_id,
       CASE (o.order_id % 4)
           WHEN 0 THEN 'UPI'
           WHEN 1 THEN 'Credit Card'
           WHEN 2 THEN 'Debit Card'
           ELSE 'Net Banking'
       END AS payment_method,
       ROUND(COALESCE(SUM(oi.quantity * oi.unit_price), 0), 2) AS amount,
       CASE WHEN o.order_status = 'Cancelled' THEN 'Refunded' ELSE 'Paid' END AS payment_status
FROM orders o
LEFT JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, o.order_status;
