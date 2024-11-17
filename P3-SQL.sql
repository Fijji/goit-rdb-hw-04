use mydb;
ALTER TABLE customers
    ADD CONSTRAINT pk_customers PRIMARY KEY (id);

ALTER TABLE suppliers
    ADD CONSTRAINT pk_suppliers PRIMARY KEY (id);

ALTER TABLE categories
    ADD CONSTRAINT pk_categories PRIMARY KEY (id);

ALTER TABLE products
    ADD CONSTRAINT pk_products PRIMARY KEY (id);

ALTER TABLE shippers
    ADD CONSTRAINT pk_shippers PRIMARY KEY (id);

ALTER TABLE orders
    ADD CONSTRAINT pk_orders PRIMARY KEY (id);

ALTER TABLE order_details
    ADD CONSTRAINT pk_order_details PRIMARY KEY (id);

ALTER TABLE employees
    ADD CONSTRAINT pk_employees PRIMARY KEY (id);

ALTER TABLE orders
    ADD CONSTRAINT fk_orders_customers
        FOREIGN KEY (customer_id) REFERENCES customers(id)
            ON DELETE CASCADE;

ALTER TABLE orders
    ADD CONSTRAINT fk_orders_employees
        FOREIGN KEY (employee_id) REFERENCES employees(id)
            ON DELETE SET NULL;

ALTER TABLE orders
    ADD CONSTRAINT fk_orders_shippers
        FOREIGN KEY (shipper_id) REFERENCES shippers(id)
            ON DELETE SET NULL;

ALTER TABLE order_details
    ADD CONSTRAINT fk_order_details_orders
        FOREIGN KEY (order_id) REFERENCES orders(id)
            ON DELETE CASCADE;

ALTER TABLE order_details
    ADD CONSTRAINT fk_order_details_products
        FOREIGN KEY (product_id) REFERENCES products(id)
            ON DELETE CASCADE;

ALTER TABLE products
    ADD CONSTRAINT fk_products_categories
        FOREIGN KEY (category_id) REFERENCES categories(id)
            ON DELETE SET NULL;

ALTER TABLE products
    ADD CONSTRAINT fk_products_suppliers
        FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
            ON DELETE SET NULL;

SELECT
    o.id AS order_id,
    o.date AS order_date,
    c.name AS customer_name,
    c.contact AS customer_contact,
    c.address AS customer_address,
    e.first_name AS employee_first_name,
    e.last_name AS employee_last_name,
    s.name AS shipper_name,
    p.name AS product_name,
    p.unit AS product_unit,
    p.price AS product_price,
    cat.name AS category_name,
    sup.name AS supplier_name,
    od.quantity AS quantity
FROM
    orders o
        INNER JOIN customers c ON o.customer_id = c.id
        INNER JOIN employees e ON o.employee_id = e.id
        INNER JOIN shippers s ON o.shipper_id = s.id
        INNER JOIN order_details od ON o.id = od.order_id
        INNER JOIN products p ON od.product_id = p.id
        INNER JOIN categories cat ON p.category_id = cat.id
        INNER JOIN suppliers sup ON p.supplier_id = sup.id;
