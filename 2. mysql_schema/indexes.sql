-- ===== INDEXEK =====
CREATE INDEX idx_books_title ON books(title);
CREATE INDEX idx_customers_email ON customers(email_address);
CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_order_items_order_id ON order_items(order_id);
CREATE INDEX idx_inventory_book_id ON inventory(book_id);
