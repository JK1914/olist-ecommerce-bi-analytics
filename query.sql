SELECT 
    TO_CHAR(o.order_purchase_timestamp, 'YYYY-MM') AS order_month,
    o.order_id,
    oi.price,
    t.product_category_name_english AS category_en,
    c.customer_state AS state,
    EXTRACT(DAY FROM (o.order_delivered_customer_date - o.order_purchase_timestamp)) AS delivery_days
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON oi.product_id = p.product_id
JOIN product_category_name_translation t ON p.product_category_name = t.product_category_name
WHERE o.order_status = 'delivered'
