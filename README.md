# MySQL Weekly Practice Tasks

This repository contains my weekly MySQL practice tasks, SQL queries, and hands-on technical assessments as I learn database management and SQL.

## Week 1 – SQL Fundamentals and Database Practice

Completed five practical SQL tasks to strengthen my understanding of database creation, table management, constraints, and SQL queries.

### Tasks Covered

1. **Student Management System** – `Student Management System Task1.sql`
2. **Online Shopping Database** – `Online Shopping Database task3.sql`
3. **Employee Records Management** – `Employee Records Management task2.sql`
4. **Banking Transaction System** – `Banking Transaction System task4.sql`
5. **Product Inventory Management** – `Product Inventory Management task5.sql`

### Topics Practised

- Database and table creation
- DDL and DML commands
- `CREATE`, `ALTER`, and `INSERT`
- Primary key and foreign key constraints
- Data types and column modifications
- Basic SQL queries and data management

## Week 2 – MySQL Technical Assessment

Completed four practical SQL assessment tasks covering employee data cleaning, sales analysis, student performance, and hospital appointment management.

### Tasks Covered

1. **Employee Data Cleaning and Salary Analysis** – `Employee Data Cleaning and Salary Analysis (2) task-1.sql`
2. **Online Store Sales and Product Analysis** – `Online Store Sales and Product Analysis (2) task-2.sql`
3. **Student Performance and Registration Analysis** – `Student Performance and Registration Analysis (2) task-3.sql`
4. **Hospital Appointment and Patient Record Analysis** – `Hospital Appointment and Patient Record Analysis (2) task-4.sql`

### Topics Practised

- Database and table creation using `CREATE DATABASE` and `CREATE TABLE`
- DDL and DML commands
- `ALTER TABLE` and column modifications
- Constraints: `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `UNIQUE`, and `CHECK`
- Inserting sample records using `INSERT INTO`
- Filtering and sorting using `WHERE`, `ORDER BY`, and `BETWEEN`
- String functions: `UPPER()`, `LOWER()`, `TRIM()`, `LEFT()`, `LENGTH()`, `CONCAT()`, and `SUBSTRING_INDEX()`
- Aggregate functions: `COUNT()`, `SUM()`, `AVG()`, `MIN()`, and `MAX()`
- Grouping and filtering aggregated results using `GROUP BY` and `HAVING`
- Pattern matching using `LIKE`
- Date functions: `YEAR()`, `MONTH()`, `CURDATE()`, and `DATEDIFF()`
- Calculating product revenue using `Price * Quantity`
- Analysing employee salaries, student marks, product sales, and hospital appointments

## Week 3 – SQL Joins and Advanced Query Practice

Completed two practical SQL tasks focused on joining related tables, conditional logic, date filtering, and aggregate calculations using real-world scenarios.

### Tasks Covered

1. **AI Model and API Usage Analysis** – AI model details, API usage records, estimated API costs, response-time classification, and usage analysis.
2. **Customer and Chatbot Interaction Analysis** – customer information, chatbot interactions, response status, satisfaction scores, and resolution-time analysis.

### Topics Practised

- `INNER JOIN` – retrieving matching records from two tables
- `LEFT JOIN` – retrieving all records from the left table and matching records from the right table
- `RIGHT JOIN` – retrieving all records from the right table and matching records from the left table
- `UNION` and `UNION ALL` – combining query results
- Simulating `FULL OUTER JOIN` in MySQL using `LEFT JOIN`, `RIGHT JOIN`, and `UNION`
- Conditional logic and NULL handling using `CASE WHEN`, `ELSE`, `COALESCE()`, `IFNULL()`, and `NULLIF()`
- Handling missing values using `NULL` and `IS NULL`
- Aggregate functions: `COUNT()`, `SUM()`, `AVG()`, `MIN()`, and `MAX()`
- Grouping data using `GROUP BY`
- Calculating estimated API costs using token counts and model pricing
- Classifying API response times as Fast, Moderate, Slow, or Not Available
- Date filtering using `CURDATE()`, `YEAR()`, `MONTH()`, and date comparisons
- String functions: `UPPER()`, `SUBSTRING_INDEX()`, and `LENGTH()`
- Analysing API usage, customer interactions, and chatbot performance

## Week 4 – Employee Performance and Project Management System

Completed an intermediate-level MySQL technical assessment consisting of 12 practical SQL problems focused on employee management, department-wise salary analysis, project allocation, and business reporting.

### Tasks Covered

1. **Employee and Department Report** – Display employee details, department names, salaries, joining dates, and years of experience.
2. **Salary Classification** – Classify employees into Low, Medium, and High salary categories.
3. **Department-wise Salary Analysis** – Calculate total salary, average salary, highest salary, and employee count. Filter departments using `HAVING`.
4. **Employee and Manager Details** – Display employee names with their respective manager names and identify employees without managers.
5. **Employee and Project Allocation Report** – Display employee-project combinations, including employees without projects and projects without employees.
6. **Company and Department Salary Comparison** – Identify employees earning more than the company's average salary and their respective department's average salary.
7. **Department and IT Salary Analysis** – Find employees working in the same department as a given employee and employees earning more than the IT department's average salary.
8. **Salary Ranking Analysis** – Identify the second-highest-paid employee and the highest-paid employee in each department.
9. **Project Budget Analysis** – Find employees assigned to projects with budgets greater than the average project budget.
10. **Project Working Hours Analysis** – Identify employees working on projects with more hours than the average project working hours.
11. **Employee Project Count Analysis** – Calculate the total number of projects assigned to each employee and identify employees with above-average project counts.
12. **Employee and Project Combinations** – Display all possible employee-project combinations using `CROSS JOIN`.

### Topics Practised

- Advanced JOIN operations using `INNER JOIN`, `LEFT JOIN`, and `RIGHT JOIN`
- Simulating `FULL OUTER JOIN` using `LEFT JOIN`, `RIGHT JOIN`, and `UNION`
- `CROSS JOIN` – generating all possible combinations between employees and projects
- Subqueries using `IN`, `ANY`, and `ALL` operators
- Nested subqueries – writing a subquery inside another subquery for multi-level filtering
- Correlated subqueries – comparing employee salaries with their respective department averages
- Single-row and multiple-row subqueries
- Using `IN` and `=` operators with subqueries
- Aggregate functions: `COUNT()`, `SUM()`, `AVG()`, `MIN()`, and `MAX()`
- Rounding numerical results using `ROUND()`
- Department-wise and employee-wise aggregation using `GROUP BY`
- Filtering aggregated results using `HAVING`
- Calculating company-wide and department-wise average salaries
- Calculating average project budgets and working hours using subqueries
- Calculating average projects per employee using `COUNT()` and division
- Using `LEFT JOIN` to include employees without assigned projects
- Identifying missing records using `IS NULL`
- Combining JOINs, aggregate functions, and subqueries in practical business queries
- Using `CASE WHEN` and `ELSE` for conditional report classification
- Sorting query results using `ORDER BY ASC` and `DESC`
- Understanding the difference between `WHERE` and `HAVING`
- Analysing employee performance, salary distribution, project budgets, project allocation, and working hours

## Week 5 – Advanced MySQL Technical Assessment

Completed a five-question intermediate-to-advanced MySQL technical assessment covering HR analytics, employee management, project and budget analysis, advanced employee data analysis, and database operations.

### Assessment Questions Covered

1. **Employee Performance and Salary Analysis** – Analyse employee salary distribution, compare salaries with department averages, generate department-wise salary reports, classify employees using `CASE`, and identify the second-highest salary.

2. **Employee Management and Reporting Hierarchy** – Display employee-manager relationships, compare employee and manager salaries, perform nested subqueries, and generate employee hierarchies using recursive CTEs.

3. **Project and Budget Analysis** – Analyse employee project allocations, project budgets, project status, employee-wise project budgets, and project start dates.

4. **Advanced Employee Data Analysis** – Rank employees by salary, calculate department-wise rankings, compare salaries with company averages, identify the highest-paid employee in each department, and calculate salary differences using window functions.

5. **Business Database Operations and Management** – Modify employee table structures, update salaries, handle NULL values, filter and sort employee records, use CTEs, demonstrate transactions, create views, and understand database constraints.

### Topics Practised

**1. Common Table Expressions (CTEs)**

- Regular CTE using `WITH`
- Recursive CTE using `WITH RECURSIVE`
- Using CTEs for temporary result sets
- Using CTEs with aggregate functions and subqueries
- Finding company-wide average salary using a CTE
- Identifying the highest-paid employee in each department using a CTE
- Generating employee reporting hierarchies using recursive CTEs

**2. Window Functions**

- `OVER()` – applying window calculations without grouping individual rows
- `PARTITION BY` – dividing rows into groups for separate calculations
- `ORDER BY` inside window functions – defining the order of calculation
- `ROW_NUMBER()` – assigning a unique row number
- `RANK()` – ranking records with gaps after ties
- `DENSE_RANK()` – ranking records without gaps after ties
- `LAG()` – retrieving the previous row's value
- `LEAD()` – retrieving the next row's value
- `NTILE()` – dividing records into a specified number of groups
- `FIRST_VALUE()` – retrieving the first value in a window
- `LAST_VALUE()` – retrieving the last value in a window

**3. Views**

- Creating views using `CREATE VIEW`
- Retrieving records from views using `SELECT`
- Joining multiple tables inside a view
- Creating employee reports using views
- Displaying employee name, department name, salary, and location through a view

**4. Data Control Language (DCL)**

- `GRANT` – providing database privileges to users
- `REVOKE` – removing database privileges from users
- Understanding database access permissions and user privileges

**5. Transaction Control Language (TCL)**

- `START TRANSACTION` – starting a transaction
- `COMMIT` – saving transaction changes
- `ROLLBACK` – cancelling uncommitted changes
- Understanding transaction management and data consistency
- Performing salary updates within transactions
- Understanding the difference between `COMMIT` and `ROLLBACK`

**6. Additional SQL Concepts**

- Self joins for employee-manager relationships
- Nested and correlated subqueries
- Subqueries using `ANY` and `ALL`
- Aggregate functions: `COUNT()`, `SUM()`, `AVG()`, `MIN()`, and `MAX()`
- Conditional expressions using `CASE WHEN` and `ELSE`
- NULL handling using `COALESCE()` and `IFNULL()`
- Date calculations using `DATEDIFF()` and date functions
- Filtering using `WHERE`, `BETWEEN`, `LIKE`, `IN`, and logical operators
- Sorting using `ORDER BY DESC`
- Limiting results using `LIMIT`
- Adding columns and modifying table structures using `ALTER TABLE`
- Updating records using `UPDATE`
- Database constraints: `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `NOT NULL`, `DEFAULT`, and `CHECK`
- Maintaining data integrity using constraints
- Creating a positive salary validation rule using `CHECK`

## Overall SQL Concepts Learned

- **DDL (Data Definition Language):** `CREATE`, `ALTER`, `DROP`, `TRUNCATE`, and `RENAME`
- **DML (Data Manipulation Language):** `INSERT`, `UPDATE`, and `DELETE`
- **DQL (Data Query Language):** `SELECT`
- **DCL (Data Control Language):** `GRANT` and `REVOKE`
- **TCL (Transaction Control Language):** `START TRANSACTION`, `COMMIT`, and `ROLLBACK`

## Goal

To strengthen my SQL fundamentals through consistent practice, practical assessments, and real-world database scenarios while developing my database querying, problem-solving, database management, and data analysis skills.

## Tools Used

- MySQL
- MySQL Workbench
- Visual Studio Code
- Git and GitHub

I will continue updating this repository with new weekly tasks as I progress in my SQL learning journey.