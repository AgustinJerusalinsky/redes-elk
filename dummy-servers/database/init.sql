CREATE TABLE IF NOT EXISTS items (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

INSERT INTO items (name, price) VALUES
    ('Cheese', 9.99),
    ('Bread', 1.99),
    ('Milk', 2.99),
    ('Apple', 0.99),
    ('Banana', 0.99),
    ('Coffee', 7.99),
    ('Orange Juice', 3.99);
