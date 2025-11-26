# Bookstore Database Project  
*A complete SQL + Python ETL + Data Governance portfolio project*

![Hero Banner](assets/hero.png)

---

## 📌 Overview

This project is a full end-to-end database engineering showcase built for a fictional online bookstore.  
It demonstrates skills required for a **Database Developer**, **Data Engineer**, or **SQL Specialist** role:

- Normalized relational data modeling (ERD)
- MySQL database implementation
- Python ETL pipeline with data cleaning
- Role-based access control (RBAC)
- Stored procedures, triggers, views
- Data governance, data quality validation
- Cloud deployment options (Azure, AWS, GCP, Snowflake)
- Professional documentation + GitHub Pages presentation

---

## 🗂️ Project Structure

- data_model/ → ER diagram, DBML, schema
- mysql_schema/ → CREATE TABLE scripts, constraints, indexes
- sample_data/ → CSV sample data (100+ books, authors, customers)
- python_scripts/ → ETL pipeline (pandas + SQLAlchemy)
- stored_procedures/ → Order creation logic
- triggers/ → Inventory update safety trigger
- views/ → Analytical SQL views
- permissions_and_roles/ → RBAC documentation

---

## 🧩 Entity–Relationship Diagram (ERD)

Below is the database structure designed for normalized OLTP workloads:

![ER Diagram](assets/er_diagram.jpg)

Key features:
- Many-to-many book–genre relationship  
- Warehouse-level inventory  
- Multi-item orders  
- Referential integrity with foreign keys  
- Optimized indexing strategy  

---

## 🔄 ETL Pipeline (Python)

A complete ETL process was built in Python using:

- **pandas** for data cleaning  
- **openpyxl** for Excel exports  
- **SQLAlchemy** + **mysql-connector-python** for database loading  
- **dotenv** for secure credential handling  

Main scripts:
1. `01_load_csv.py` – Load raw CSVs  
2. `02_clean_data.py` – Data validation & cleaning  
3. `03_export_excel.py` – Optional Excel verification  
4. `04_load_to_mysql.py` – Bulk upload into MySQL  

Logs and quality checks ensure reliable ingestion.

---

## 🔐 Role-Based Access Control (RBAC)

Two database users were created following the *principle of least privilege*:

| Role              | Permissions |
|------------------|-------------|
| `readonly_user`  | SELECT only |
| `data_entry_user`| INSERT into orders + order_items |

Permissions were tested using `GRANT` and `REVOKE` to verify isolation.

Full documentation:  
`permissions_and_roles/rbac_readme.md`

---

## ⚙️ Stored Procedures & Triggers

### Stored Procedure: `sp_create_order`
Handles:
- Order creation  
- Multi-item order insertion  
- Warehouse-level inventory deduction  
- Transaction-safe logic  
- Error handling  

### Trigger
Automatic inventory update when order_items are inserted outside the procedure.

### View
`vw_customer_orders` joins customers, orders, and ordered books into a single analytical structure.

---

## 🌐 Cloud Deployment Guides

Deployment instructions included for:
- **Azure Database for MySQL**
- **AWS RDS MySQL**
- **GCP Cloud SQL**
- **Snowflake** (analytical warehouse layer)

Guides contain:
- Instance setup  
- Security and networking  
- Migration steps  
- Cost optimization  

---

## 🏁 Summary

This project is designed as a complete, production-style demonstration of:

- Database modeling  
- SQL development  
- Python ETL  
- Governance and data quality  
- Best practices in security and documentation  

It serves as a real-world portfolio piece for database engineering positions.

---

## 🔗 GitHub Repository

👉 View the full project on GitHub:  
**https://github.com/USERNAME/REPO_NAME**

*(Replace with your actual repository link.)*

---

## 🙌 Contact

If you have any questions or feedback, feel free to reach out via LinkedIn — I'm always happy to discuss data engineering and database design topics.
