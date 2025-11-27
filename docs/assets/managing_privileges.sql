-- 1. Create users with password
CREATE USER 'read_only_user'@'localhost' IDENTIFIED BY 'Readonly123!';
CREATE USER 'data_entry_user'@'localhost' IDENTIFIED BY 'Dataentry123!';

-- 2. Granting privileges to users
GRANT SELECT ON book_store.* TO 'read_only'@'localhost';
GRANT INSERT, SELECT ON book_store.* TO 'data_entry_user'@'localhost';

-- 3. Commit changes
FLUSH PRIVILEGES;

-- 4. Check results
SHOW GRANTS FOR 'read_only_user'@'localhost';
SHOW GRANTS FOR 'data_entry_user'@'localhost';
