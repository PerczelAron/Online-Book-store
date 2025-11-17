📚 Bookstore Database Project

End-to-End Relational Database Implementation (MySQL · Python · Cloud · Data Governance)
By: Aron Perczel

⭐ Project Overview

This project is a complete, production-style implementation of a bookstore relational database system, designed to demonstrate practical skills in:

    Database modeling (ERD, normalization)

    SQL schema creation (MySQL)

    Python-based data loading and cleaning

    Stored procedures, triggers & views

    Indexing and performance considerations

    Security & role-based access control

    Cloud deployment (Azure)

    Data governance & data quality handling

The goal is to showcase real-world database developer and data engineering competence through an end-to-end, fully documented project.

📐 1. Data Model

The project includes a complete ER diagram and schema export created using dbdiagram.io.

📁 data_model/

    bookstore_er_diagram.png

    bookstore_schema.sql

    dbdiagram_export.dbml

The model follows normalized design (3NF), supports multiple genres per book, warehouse-level inventory tracking, and a realistic order management workflow.

🗄️ 2. MySQL Schema

📁 mysql_schema/
Key files:

    create_tables.sql

    constraints_indexes.sql

    sample_queries.sql

    data_governance_notes.md

Includes:
    ✔ Primary & foreign keys
    ✔ Junction tables (books_genres)
    ✔ Composite keys (inventory)
    ✔ Indexing strategy
    ✔ Governance notes on referential integrity & quality

🧹 3. Python Data Loading & Cleaning

📁 python_scripts/

    data_cleaning.ipynb

    load_data_to_mysql.ipynb

    mysql_connection_setup.py

    requirements.txt

Capabilities:
    ✔ Detection of invalid emails
    ✔ Missing value handling
    ✔ Duplicate removal
    ✔ Automatic type correction
    ✔ Safe MySQL loading via mysql-connector-python

📊 4. Sample Data (CSV)

Realistic data for all tables, including well-known authors and book titles, plus intentionally injected data quality issues to demonstrate governance skills.

📁 sample_data/
Includes:

    authors.csv

    books.csv

    genres.csv

    books_genres.csv

    customers.csv

    orders.csv

    order_items.csv

    warehouses.csv

    inventory.csv

⚙️ 5. Stored Procedures

📁 stored_procedures/

    sp_create_order_with_warehouse.sql

Features:
    ✔ Transaction handling
    ✔ Multi-item orders
    ✔ Warehouse-level inventory deduction
    ✔ Error checks
    ✔ Safe rollback logic

🔄 6. Triggers

📁 triggers/

    trg_update_inventory_after_insert.sql

Features:
    ✔ Backup mechanism
    ✔ Prevents double-deduction
    ✔ Ensures consistency when orders bypass stored procedures

👁️ 7. Views

📁 views/

    vw_customer_orders.sql

Shows:

    Customer name

    Order date

☁️ 8. Cloud Deployment Guides

📁 cloud_deployment_guides/
Fully written, step-by-step guides:

    azure_mysql_deployment.md

The guide includes:
    ✔ Instance creation
    ✔ Networking configuration
    ✔ Secure user & role setup
    ✔ Migration steps
    ✔ Cost-optimization tips (important for portfolio projects)

🖼️ 9. Screenshots

📁 screenshots/
Contains documentation images:

    ER diagram

    Workbench table view

    Stored procedure executions

    Cloud instance setup pages

    Query outputs

🧑‍💻 Technologies Used
    Databases

    MySQL

    Azure Database for MySQL

    Programming

    Python: Pandas, NumPy, mysql-connector-python

    Tools

    dbdiagram.io

    MySQL Workbench

    Power BI (optional reporting)

    GitHub Pages

🛡️ Security & Data Governance

This project demonstrates:

    Role-based access control (RBAC)

    Read-only and data-entry user roles

    GRANT / REVOKE logic

    Referential integrity validation

    Data quality remediation (email fixes, NULL-handling, duplicate removal)

✨ Project Status

    ✔ Completed
    ✔ Fully documented
    ✔ Ready for review
    ✔ Suitable for LinkedIn and portfolio highlights

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