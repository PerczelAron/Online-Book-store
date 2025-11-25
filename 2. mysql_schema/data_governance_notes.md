# Data Governance Notes

This document summarizes the data governance principles applied to the Bookstore Database Project.  
The goal is to ensure data quality, consistency, security, and compliance throughout the system.

---

## 1. Data Quality Controls

### 1.1 Referential Integrity
- All foreign keys are explicitly defined.
- Cascade deletes are intentionally **not** used to prevent accidental data loss.
- Junction tables (e.g., `books_genres`) enforce many-to-many relationships with composite primary keys.

### 1.2 Data Validation
During the Python ETL:
- Invalid email formats were detected and flagged.
- Missing customer details were filled using defined rules or excluded.
- Duplicate rows were identified and removed.
- Incorrect date formats and impossible values were corrected where possible.

### 1.3 Inventory Consistency
- Inventory is tracked at the warehouse level.
- Stored procedures and triggers ensure stock deduction is always consistent.
- A safeguard mechanism prevents double-deduction.

---

## 2. Metadata & Documentation

- Each table includes clear naming conventions (snake_case).
- Columns have descriptive names (e.g., `order_date`, `house_no`, `unit_price_discount`).
- Logical grouping of schema into folders (schema, procedures, triggers, views).
- The ER diagram in `data_model/` serves as the authoritative source of structural metadata.

---

## 3. Privacy & Security

### 3.1 Role-Based Access Control (RBAC)
Two key database roles were created:
- **readonly_user** → SELECT-only privileges
- **data_entry_user** → INSERT privileges on orders and order_items

This reduces the risk of unauthorized modifications.

### 3.2 Principle of Least Privilege
Each user has the minimum required permissions:
- No global permissions.
- No ALTER, DROP, or DELETE permissions for operational users.
- No administrative access outside their scope.

### 3.3 Sensitive Data
- Customer addresses and emails are stored, but no passwords or payment data.
- Payment types are stored as category values, not sensitive transaction details.
- Documentation notes that in production, hashing/anonymization may be required.

---

## 4. Change Management

### 4.1 Version Control
- All schema changes are stored in separate SQL files.
- Stored procedures, triggers, and views have individual versioned files.
- GitHub commit history documents structural changes.

### 4.2 Reproducibility
- Full schema rebuild can be executed via a single SQL script.
- Python notebooks provide reproducible ETL and data-cleaning steps.

---

## 5. Governance Summary

The project demonstrates:
- Consistent and high-quality data design.
- Clear validation and cleaning steps.
- Strict security and access control.
- Production-style governance aligned with modern data engineering practices.

