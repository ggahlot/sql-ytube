# SQL with Gaurav: course files

Files for the YouTube course **SQL with Gaurav: Learn SQL Server from Zero**:
https://www.youtube.com/playlist?list=PLYJOoqQqSPRE

## Lessons 1–5 learner pack

[Download learner pack v03 (ZIP)](https://github.com/ggahlot/sql-ytube/raw/refs/heads/main/downloads/SQL-with-Gaurav_T01-T05_Learner-Pack_v03.zip)

Includes the lesson SQL, setup and lesson guides, practice questions and a separate answer key. Extract the ZIP and open `START_HERE.md` before running any SQL. The bundled files are MIT licensed; see `CREDITS_AND_LIMITS.md` for verification and third-party material limits.

SHA-256: `5136A93B9B573B075C0ED382D8AB411E7DFE3D60DCF4DFA6382C361AAFB1F701`

## Setup script: `00_fablemango_schema.sql`

Builds **FableMangoDB**, the practice database used in every lesson: 5 tables (Categories, Products, Customers, Orders, OrderItems) with a small set of rows.

### How to run it

1. Install SQL Server (Express or Developer edition) and SQL Server Management Studio (SSMS). Lesson 1 shows how: https://youtu.be/XvDNOwEulVc
2. In SSMS, connect to your server. In Object Explorer, expand **Databases**. If **FableMangoDB** is already listed, don't run this script (see below).
3. Open `00_fablemango_schema.sql`. Select the first part, from the top down to and including the first `GO`, and click **Execute**. Messages should say the commands completed successfully. If you see any error, stop here.
4. Select the rest of the script and click **Execute**.
5. Refresh **Databases**. You should see **FableMangoDB**.

Run the script only once. It doesn't check whether FableMangoDB already exists: if you run it again, the first step fails but the rest still runs and adds a second copy of the products and orders to your database, so the lesson results won't match.

To start again from scratch on your own practice server, run the following, then follow the steps above. It deletes FableMangoDB and anything you added to it.

```sql
USE master;
DROP DATABASE FableMangoDB;
```

Use a practice or development server, not a server that holds real data.

## Lessons

1. Lesson 1: What Is SQL? DDL, DML and Your First SQL Server Lab: https://youtu.be/XvDNOwEulVc
2. Lesson 2: Your First SQL Query: SELECT, FROM, AS and DISTINCT: https://youtu.be/2pWSnosGZsI
3. Lesson 3: SQL WHERE Explained: AND, OR, IN, BETWEEN and LIKE: https://youtu.be/ixBuxz0tmpI
4. Lesson 4: SQL ORDER BY, TOP and OFFSET FETCH: Sorting and Paging: https://youtu.be/oVfisNzc4oY
5. Lesson 5: SQL Aggregate Functions: COUNT, SUM, AVG, MIN, MAX: https://youtu.be/Yd9Z5f3X7Zc

## Notes

- FableMango and all of its people, products, emails and orders are fictitious. Email addresses use the reserved example.com domain.
- Not affiliated with or endorsed by Microsoft. SQL Server and other product names are trademarks of their respective owners.
- Software, downloads and licence terms change: check Microsoft's website for the latest information.

© 2026 Gaurav Gahlot. Produced by FableMango Studio.
