CREATE TABLE orders (
    order_id VARCHAR(50) NOT NULL,
    customer_id VARCHAR(20) NOT NULL,
    seller_id VARCHAR(20) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    product_name VARCHAR(20),
    quantity INT,
    price VARCHAR(20),
    order_date TIMESTAMP,
    shipping_name VARCHAR(20),
    shipping_date VARCHAR(20),
    shipping_zipcode VARCHAR(10),
    shipping_address VARCHAR(50),
    PRIMARY KEY (order_id)
);

DROP TABLE orders;