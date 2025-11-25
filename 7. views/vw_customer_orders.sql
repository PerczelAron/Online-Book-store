CREATE OR REPLACE VIEW vw_customer_orders AS
SELECT 
    c.id AS customer_id,
    c.name AS customer_name,
    o.id AS order_id,
    o.order_date,
    GROUP_CONCAT(b.title SEPARATOR ', ') AS ordered_books,
    SUM(od.line_total) AS total_amount
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_items od ON o.id = od.order_id
JOIN books b ON od.book_id = b.id
GROUP BY c.id, c.name, o.id, o.order_date;
