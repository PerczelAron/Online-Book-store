📚 Bookstore Database Project

End-to-End Relational Database Implementation (MySQL · Python · Data Governance)
By: Aron Perczel

⭐ Project Overview

This project is a complete, production-style implementation of a bookstore relational database system, designed to demonstrate practical skills in:

    Database modeling (ERD, normalization)

    SQL schema creation (MySQL)

    Python-based data loading and cleaning

    Stored procedures, triggers & views

    Indexing and performance considerations

    Security & role-based access control

    Data governance & data quality handling

The goal is to showcase real-world database developer and data engineering competence through an end-to-end, fully documented project.

📐 1. Data Model

The project includes a complete ER diagram and schema export created using dbdiagram.io.

📁 1. data_model/

    bookstore_er_diagram.jpg

    bookstore_schema.sql

    dbdiagram_export.dbml

The model follows normalized design (3NF), supports multiple genres per book, warehouse-level inventory tracking, and a realistic order management workflow.

🗄️ 2. MySQL Schema

📁 2. mysql_schema/
Key files:

    create_tables.sql

    indexes.sql

    sample_queries.sql

    data_governance_notes.md

Includes:
    ✔ Primary & foreign keys
    ✔ Junction tables (books_genres)
    ✔ Composite keys (inventory)
    ✔ Indexing strategy
    ✔ Governance notes on referential integrity & quality

📊 3. Sample Data (CSV)

Realistic data for all tables, including well-known authors and book titles, plus intentionally injected data quality issues to demonstrate governance skills.

📁 3. sample_data/
Includes:

    authors.csv

    books.csv

    genres.csv

    book_genres.csv

    customers.csv

    orders.csv

    order_items.csv

    warehouses.csv

    payments.csv

    inventory.csv

🧹 4. Python Data Loading & Cleaning

📁 4. python_scripts/

    book_store_etl.ipynb

    requirements.txt

Capabilities:
    ✔ Detection of invalid emails
    ✔ Missing value handling
    ✔ Duplicate removal
    ✔ Automatic type correction
    ✔ Safe MySQL loading via pymysql

⚙️ 5. Stored Procedures

📁 5. stored_procedures/

    stored_procedures.sql

Features:
    ✔ Transaction handling
    ✔ Multi-item orders
    ✔ Error checks

🔄 6. Triggers

📁 6. triggers/

    trg_update_inventory_after_insert.sql

Features:
    ✔ Backup mechanism
    ✔ Prevents double-deduction
    ✔ Ensures consistency when orders bypass stored procedures

👁️ 7. Views

📁 7. views/

    vw_customer_orders.sql

Shows:

    Customer name

    Order date

🔐 8. Role-Based Access Control (RBAC)

📁 8. permissions_and_roles/

    managing_privileges.sql

🧑‍💻 Technologies Used
    Databases

    MySQL

    Programming

    Python: Pandas, pymysql

    Tools

    dbdiagram.io

    MySQL Workbench

👤 About Me

    I’m Áron Perczel – an aspiring Database Developer & Data Engineer with a strong interest in:

    database design

    SQL development

    cloud data platforms

    data governance

    cooperative work with data science teams

📫 Contact

    📧 Email: perczel.aron@gmail.com

    🔗 LinkedIn: https://www.linkedin.com/in/aronperczel/

🎉 Thank you for reviewing this project!

Feel free to explore the folders, scripts, and documentation.
