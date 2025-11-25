This document describes the Role-Based Access Control (RBAC) setup used in the Bookstore Database Project.  
The goal is to demonstrate secure, minimal-privilege access control aligned with enterprise data governance practices.

## 1. Overview

The database implements two operational MySQL users:

| User             | Purpose                                   | Permissions |
|------------------|-------------------------------------------|-------------|
| `read_only_user` | Analysts, reviewers, auditors             | SELECT only |
| `data_entry_user`| Operational staff for order management    | SELECT and INSERT only |

These roles ensure that:

- No user can modify or delete critical data accidentally  
- Analysts cannot modify tables  
- Order entry systems cannot manipulate customer or product data  
- Privileges follow the *principle of least privilege*
