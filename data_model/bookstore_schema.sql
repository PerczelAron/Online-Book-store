USE book_store;

-- ===== AUTHORS =====
CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL,
    date_of_birth DATE
);

-- ===== GENRES =====
CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    genre VARCHAR(100) UNIQUE NOT NULL
);

-- ===== BOOKS =====
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_date DATE,
    description TEXT,
    author_id INT NOT NULL REFERENCES authors(id) ON DELETE CASCADE,
    list_price NUMERIC(10,2) NOT NULL CHECK (list_price >= 0)
);

-- ===== BOOKS_GENRES (link table) =====
CREATE TABLE books_genres (
    book_id INT NOT NULL REFERENCES books(id) ON DELETE CASCADE,
    genre_id INT NOT NULL REFERENCES genres(id) ON DELETE CASCADE,
    PRIMARY KEY (book_id, genre_id)
);

-- ===== CUSTOMERS =====
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    gender VARCHAR(10),
    date_of_birth DATE,
    postal_code VARCHAR(10),
    country VARCHAR(100),
    region VARCHAR(100),
    city VARCHAR(100),
    street VARCHAR(100),
    house_no VARCHAR(10),
    email_address VARCHAR(255) UNIQUE NOT NULL,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ===== PAYMENTS =====
CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    method VARCHAR(50) NOT NULL
);

-- ===== ORDERS =====
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ship_date TIMESTAMP,
    customer_id INT NOT NULL REFERENCES customers(id) ON DELETE CASCADE,
    payment_id INT REFERENCES payments(id),
    total_items INT CHECK (total_items >= 0),
    total_amount NUMERIC(12,2) CHECK (total_amount >= 0)
);

-- ===== ORDER_ITEMS =====
CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INT NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
    book_id INT NOT NULL REFERENCES books(id) ON DELETE CASCADE,
    warehouse_id INT REFERENCES warehouses(id) ON DELETE CASCADE,
    order_quantity INT NOT NULL CHECK (order_quantity > 0),
    unit_price NUMERIC(10,2) NOT NULL CHECK (unit_price >= 0),
    unit_price_discount NUMERIC(5,2) DEFAULT 0 CHECK (unit_price_discount >= 0),
    line_total NUMERIC(12,2) GENERATED ALWAYS AS (order_quantity * unit_price * (1 - unit_price_discount/100)) STORED
);

-- ===== WAREHOUSES =====
CREATE TABLE warehouses (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    country VARCHAR(100)
);

-- ===== INVENTORY =====
CREATE TABLE inventory (
    book_id INT NOT NULL REFERENCES books(id) ON DELETE CASCADE,
    warehouse_id INT NOT NULL REFERENCES warehouses(id) ON DELETE CASCADE,
    quantity INT NOT NULL CHECK (quantity >= 0),
    PRIMARY KEY (book_id, warehouse_id)
);

-- ===== INDEXEK =====
CREATE INDEX idx_books_title ON books(title);
CREATE INDEX idx_customers_email ON customers(email_address);
CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_order_items_order_id ON order_items(order_id);
CREATE INDEX idx_inventory_book_id ON inventory(book_id);
