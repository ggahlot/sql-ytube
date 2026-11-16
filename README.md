# SQL with Gaurav: course files

Files for the YouTube course **SQL with Gaurav: Learn SQL Server from Zero**:
https://www.youtube.com/playlist?list=PLYJOoqQqSPRE

## Setup script: `00_fablemango_schema.sql`

Builds **FableMangoDB**, the practice database used in every lesson: 5 tables (Categories, Products, Customers, Orders, OrderItems) with a small set of rows.

### How to run it

1. Install SQL Server (Express or Developer edition) and SQL Server Management Studio (SSMS). Lesson 1 shows how: https://youtu.be/XvDNOwEulVc
2. Open `00_fablemango_schema.sql` in SSMS, connect to your server, and click **Execute**.
3. In Object Explorer, refresh **Databases**. You should see **FableMangoDB**.

Run it once. The script starts with `CREATE DATABASE FableMangoDB`, so it stops with an error if a database with that name already exists. To start again from scratch on your own practice server, run `DROP DATABASE FableMangoDB;` first (this deletes the database and its rows).

Use a practice or development server, not a server that holds real data.

## Lessons

1. What Is SQL? DDL, DML and Your First SQL Server Lab: https://youtu.be/XvDNOwEulVc
2. Your First SQL Query: SELECT, FROM, AS and DISTINCT: https://youtu.be/2pWSnosGZsI
3. SQL WHERE Explained: AND, OR, IN, BETWEEN and LIKE: https://youtu.be/ixBuxz0tmpI
4. SQL ORDER BY, TOP and OFFSET FETCH: Sorting and Paging: https://youtu.be/oVfisNzc4oY
5. SQL Aggregate Functions: COUNT, SUM, AVG, MIN, MAX: https://youtu.be/Yd9Z5f3X7Zc

## Notes

- FableMango and all of its people, products, emails and orders are fictitious. Email addresses use the reserved example.com domain.
- Not affiliated with or endorsed by Microsoft. SQL Server and other product names are trademarks of their respective owners.
- Software, downloads and licence terms change: check Microsoft's website for the latest information.

© 2026 Gaurav Gahlot. Produced by FableMango Studio.
