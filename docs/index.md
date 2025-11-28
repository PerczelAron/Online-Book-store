![Bookstore Database Banner](assets/hero.png)

End-to-End Relational Database Implementation (MySQL · Python · Data Governance)
By: Aron Perczel

## ⭐ Project Overview

This project is a complete, production-style implementation of a bookstore relational database system, designed to demonstrate practical skills in:

    Database modeling (ERD, normalization)

    SQL schema creation (MySQL)

    Python-based data loading and cleaning

    Stored procedures, triggers & views

    Indexing and performance considerations

    Security & role-based access control

    Data governance & data quality handling

The goal is to showcase real-world database developer and data engineering competence through an end-to-end, fully documented project.

---

## 📐 Data Model

The project includes a complete ER diagram and schema export created using dbdiagram.io.

![ER Diagram](assets/er_diagram.jpg)

The model follows normalized design (3NF), supports multiple genres per book, warehouse-level inventory tracking, and a realistic order management workflow.

---

## 🗄️ MySQL Schema

Includes:
- Primary & foreign keys
- Junction tables (books_genres)
- Composite keys (inventory)
- Indexing strategy
- Governance notes on referential integrity & quality

### Download SQL file

- [Schema.sql](./assets/schema.sql)
- [Create_tables.sql](./assets/create_tables.sql)
- [Indexes.sql](./assets/Indexes.sql)
- [Sample_queries.sql](./assets/sample_queries.sql)

---

## 📊 Sample Data (CSV)

Realistic data for all tables, including well-known authors and book titles, plus intentionally injected data quality issues to demonstrate governance skills.

### Download Sample Data

- [Authors.csv](./assets/authors.csv)
- [Books.csv](./assets/books.csv)
- [Books_genres.csv](./assets/book_genres.csv)
- [Customers.csv](./assets/customers.csv)
- [Genres.csv](./assets/genres.csv)
- [Inventory.csv](./assets/inventory.csv)
- [Orders.csv](./assets/orders.csv)
- [Order_items.csv](./assets/order_items.csv)
- [Payments.csv](./assets/payments.csv)
- [Warehouses.csv](./assets/warehouses.csv)

---

## 🧹 Python Data Loading & Cleaning

Capabilities:
- Detection of invalid emails
- Missing value handling
- Duplicate removal
- Automatic type correction
- Safe MySQL loading via pymysql

### Download python file

- [Book_store_etl.zip](./assets/book_store_etl.zip)

---

## ⚙️ Stored Procedures

Handles:
- Order creation  
- Multi-item order insertion  
- Transaction-safe logic

### Download SQL file

- [Stored_procedures.sql](./assets/stored_procedures.sql)

---

## 🔄 Triggers

Automatic inventory update when order_items are inserted outside the procedure.

### Download SQL file

- [Triggers.sql](./assets/Triggers.sql)

---

## 👁️ Views

Joins customers, orders, and ordered books into a single analytical structure.

### Download SQL file

- [Views.sql](./assets/Views.sql)

---

## 🔐 Role-Based Access Control (RBAC)

Two database users were created following the *principle of least privilege*:

| Role              | Permissions |
|------------------|-------------|
| `readonly_user`  | SELECT only |
| `data_entry_user`| INSERT into orders + order_items |

### Download SQL file

- [Managing_privileges.sql](./assets/managing_privileges.sql)

---

## 🧑‍💻 Technologies Used
    Databases

    MySQL

    Programming

    Python: Pandas, pymysql

    Tools

    dbdiagram.io

    MySQL Workbench

---

## 👤 About Me

    I’m Áron Perczel – an aspiring Database Developer & Data Engineer with a strong interest in:

    database design

    SQL development

    cloud data platforms

    data governance

    cooperative work with data science teams

---

## 📫 Contact

    📧 Email: perczel.aron@gmail.com

    🔗 LinkedIn: https://www.linkedin.com/in/aronperczel/

---

## 🎉 Thank you for reviewing this project!

---
