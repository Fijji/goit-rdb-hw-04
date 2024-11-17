SELECT COUNT(*) AS total_rows
FROM orders o
         INNER JOIN customers c ON o.customer_id = c.id
         INNER JOIN employees e ON o.employee_id = e.id
         INNER JOIN shippers s ON o.shipper_id = s.id
         INNER JOIN order_details od ON o.id = od.order_id
         INNER JOIN products p ON od.product_id = p.id
         INNER JOIN categories cat ON p.category_id = cat.id
         INNER JOIN suppliers sup ON p.supplier_id = sup.id;

# ---------- P4-2  -----------
SELECT COUNT(*) AS total_rows
FROM orders o
         LEFT JOIN customers c ON o.customer_id = c.id
         LEFT JOIN employees e ON o.employee_id = e.id
         LEFT JOIN shippers s ON o.shipper_id = s.id
         LEFT JOIN order_details od ON o.id = od.order_id
         LEFT JOIN products p ON od.product_id = p.id
         RIGHT JOIN categories cat ON p.category_id = cat.id
         RIGHT JOIN suppliers sup ON p.supplier_id = sup.id;

SELECT o.*
FROM orders o
         LEFT JOIN customers c ON o.customer_id = c.id
WHERE c.id IS NULL;

# ---------- P4-3  -----------

SELECT *
FROM orders o
         INNER JOIN employees e ON o.employee_id = e.id
WHERE e.id > 3 AND e.id <= 10;

SELECT
    cat.name AS category_name,
    COUNT(*) AS row_count,
    AVG(od.quantity) AS avg_quantity
FROM order_details od
         INNER JOIN products p ON od.product_id = p.id
         INNER JOIN categories cat ON p.category_id = cat.id
GROUP BY cat.name;

SELECT
    cat.name AS category_name,
    COUNT(*) AS row_count,
    AVG(od.quantity) AS avg_quantity
FROM order_details od
         INNER JOIN products p ON od.product_id = p.id
         INNER JOIN categories cat ON p.category_id = cat.id
GROUP BY cat.name
HAVING AVG(od.quantity) > 21;

SELECT
    cat.name AS category_name,
    COUNT(*) AS row_count,
    AVG(od.quantity) AS avg_quantity
FROM order_details od
         INNER JOIN products p ON od.product_id = p.id
         INNER JOIN categories cat ON p.category_id = cat.id
GROUP BY cat.name
HAVING AVG(od.quantity) > 21
ORDER BY row_count DESC;


SELECT
    cat.name AS category_name,
    COUNT(*) AS row_count,
    AVG(od.quantity) AS avg_quantity
FROM order_details od
         INNER JOIN products p ON od.product_id = p.id
         INNER JOIN categories cat ON p.category_id = cat.id
GROUP BY cat.name
HAVING AVG(od.quantity) > 21
ORDER BY row_count DESC
LIMIT 4 OFFSET 1;



