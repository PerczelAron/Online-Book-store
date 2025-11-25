-- Update inventory after inserting in order_items table

DELIMITER $$

CREATE TRIGGER trg_update_inventory_after_order
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
	DECLARE v_message_text VARCHAR(255);
	IF (SELECT quantity FROM inventory WHERE book_id = NEW.book_id AND warehouse_id = NEW.warehouse_id) < NEW.order_quantity THEN
		SET v_message_text = CONCAT('Nincs elegendő készlet a könyv ID ', NEW.book_id, ' esetén a raktár ', NEW.warehouse_id, ' alatt.');
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = v_message_text;
	END IF;
    
    UPDATE inventory
    SET quantity = quantity - NEW.order_quantity
    WHERE book_id = NEW.book_id AND warehouse_id = NEW.warehouse_id;
END $$

DELIMITER ;

-- Test
INSERT INTO order_items (order_id, book_id, warehouse_id, order_quantity, unit_price, unit_price_discount)
        VALUES (65, 3, 4, 44, 32.58, 3);
