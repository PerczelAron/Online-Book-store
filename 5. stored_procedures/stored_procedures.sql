DELIMITER $$

CREATE PROCEDURE sp_create_order_multi_warehouse(
    IN p_customer_id INT,
    in p_payment_id INT,
    IN p_items_json JSON  -- e.g. '[{"book_id":1,"warehouse_id":2,"quantity":3}, ...]'
)
BEGIN
    DECLARE v_order_id INT;
    DECLARE v_idx INT DEFAULT 0;
    DECLARE v_items_count INT;
    DECLARE v_book_id INT;
    DECLARE v_quantity INT;
    DECLARE v_warehouse_id INT;
    DECLARE v_unit_price FLOAT;
	DECLARE v_message_text VARCHAR(255);

    -- Create new order
    INSERT INTO orders (order_date, customer_id, payment_id, total_items, total_amount)
    VALUES (NOW(), p_customer_id, p_payment_id, 0, 0);

    SET v_order_id = LAST_INSERT_ID();
    SET v_items_count = JSON_LENGTH(p_items_json);

    -- Iterate through JSON
    WHILE v_idx < v_items_count DO
        SET v_book_id = JSON_EXTRACT(p_items_json, CONCAT('$[', v_idx, '].book_id'));
        SET v_quantity = JSON_EXTRACT(p_items_json, CONCAT('$[', v_idx, '].quantity'));
        SET v_warehouse_id = JSON_EXTRACT(p_items_json, CONCAT('$[', v_idx, '].warehouse_id'));

        -- Query price
        SELECT list_price INTO v_unit_price
        FROM books
        WHERE id = v_book_id;

        -- Check inventory in the given warehouse
        IF (SELECT quantity FROM inventory WHERE book_id = v_book_id AND warehouse_id = v_warehouse_id) < v_quantity THEN
			SET v_message_text = CONCAT('There is not enough book with ID ', v_book_id, ' in the ', v_warehouse_id, ' warehouse.');
            SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = v_message_text;

        END IF;

        -- Add row data to order_items table
        INSERT INTO order_items (order_id, book_id, warehouse_id, order_quantity, unit_price, unit_price_discount)
        VALUES (v_order_id, v_book_id, v_warehouse_id, v_quantity, v_unit_price, 0);

        SET v_idx = v_idx + 1;
    END WHILE;

    -- Update total_items and total_amount values in orders table
    UPDATE orders
    SET total_items = (
            SELECT SUM(order_quantity)
            FROM order_items
            WHERE order_id = v_order_id
        ),
        total_amount = (
            SELECT SUM(line_total)
            FROM order_items
            WHERE order_id = v_order_id
        )
    WHERE id = v_order_id;

END $$

DELIMITER ;

-- Execute procedure
SET @order_items = JSON_ARRAY(
    JSON_OBJECT('book_id', 1, 'warehouse_id', 3, 'quantity', 3),
    JSON_OBJECT('book_id', 3, 'warehouse_id', 3, 'quantity', 1),
    JSON_OBJECT('book_id', 2, 'warehouse_id', 3, 'quantity', 2)
);

CALL sp_create_order_multi_warehouse(7, 2, @order_items);
