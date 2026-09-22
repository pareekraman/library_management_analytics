# 📚 Library Management Analytics — MySQL

> A SQL-based data analytics project designed to analyze library operations, member activity, book circulation, employee performance, and branch-level information using MySQL.

---

## 📌 Project Overview

**Library Management Analytics** is a SQL-based data analytics project focused on analyzing key operations of a library management system.

The project works with interconnected datasets covering **books, members, employees, branches, issued books, and returned books**. SQL is used to explore book availability, rental prices, member activity, employee performance, book issue patterns, and return information.

The primary objective is to demonstrate how SQL can transform structured relational data into meaningful insights that can support **data-driven library management and operational decision-making**.

---

## 🎯 Project Objectives

* Analyze the library's book inventory and categories
* Examine book rental prices and availability
* Understand member registration and borrowing activity
* Analyze book issue and return records
* Evaluate employee contribution through book-issue activity
* Connect employees with their respective branches
* Identify frequently issued books
* Identify books that have never been issued
* Compare individual member borrowing activity with the average

---

## 🗂️ Dataset & Tables

The project uses the following core tables:

| Table           | Purpose                                                                          |
| --------------- | -------------------------------------------------------------------------------- |
| `books`         | Book information such as title, author, category, ISBN, rental price, and status |
| `members`       | Member information and registration details                                      |
| `employees`     | Employee information, position, salary, and branch relationship                  |
| `branch`        | Library branch information and branch address                                    |
| `issued_status` | Book issue transactions, members, employees, and issue dates                     |
| `return_status` | Returned-book information and return dates                                       |

The SQL project is configured for the `library_management_db` database using MySQL.

---

## 🔍 Key Areas of Analysis

### 1. 📖 Book & Category Analysis

* Retrieve complete book records
* Analyze books by category
* Calculate total books
* Calculate average rental price
* Identify the highest-priced books

### 2. 💰 Rental Price Analysis

* Filter books based on rental price
* Sort books from highest to lowest rental price
* Identify the top 5 books by rental price

### 3. 📚 Book Availability Analysis

* Identify books currently marked as available
* Analyze category-wise book counts

### 4. 👥 Member Analysis

* Identify members who registered after a specified date
* Analyze the number of books issued by each member
* Identify members whose borrowing activity is above the average

### 5. 📤 Book Issue Analysis

* Identify books issued most frequently
* Analyze member-book issue relationships
* Analyze employee involvement in book issues

### 6. 👨‍💼 Employee Analysis

* Identify employees earning above a specified salary
* Analyze the number of books issued by employees
* Identify employees who issued more than 5 books

### 7. 🏢 Branch Analysis

* Connect employees with branch information
* Analyze employee and branch relationships

### 8. 📥 Return Analysis

* Connect members, issued books, and return records
* Analyze returned books and return dates

### 9. 🔎 Unused Book Analysis

* Identify books that have never appeared in issue records
* Use the results to understand potentially low-demand inventory

These analysis areas are directly represented by the project's SQL questions and insight sections.

---

## 🧠 SQL Concepts Used

This project demonstrates a progression from basic SQL querying to more advanced analytical techniques.

### Basic SQL

* `SELECT`
* `WHERE`
* `ORDER BY`
* `LIMIT`

### Aggregate Functions

* `COUNT()`
* `AVG()`
* `ROUND()`

### Grouping & Filtering

* `GROUP BY`
* `HAVING`

### Joins

* `INNER JOIN`
* `LEFT JOIN`
* Multiple-table joins

### Advanced SQL

* Subqueries
* Aggregate-based comparisons
* Calculated analytical metrics

The project explicitly applies these concepts throughout its 20 questions.

---

## 📊 Project Structure

The SQL analysis contains **20 questions**, progressing from easy to advanced.

| Level           | Questions | Main Concepts                           |
| --------------- | --------: | --------------------------------------- |
| 🟢 Easy         |       1–7 | SELECT, WHERE, ORDER BY, COUNT, AVG     |
| 🟡 Intermediate |      8–12 | GROUP BY, LIMIT, filtering, aggregation |
| 🔵 Advanced     |     13–20 | JOINs, LEFT JOINs, HAVING, subqueries   |

This progression makes the project suitable for demonstrating practical SQL learning from fundamentals through relational and analytical queries.

---
## 📸 Project Screenshots

### 1. Books_data_analysis
![Books_data_analysis](screenshots/books_data_analysis.png.png)

### 2. Category_analysis
![Category_analysis](screenshots/category_analysis.png.png)

### 3. Member_book_join_analysis
![Member_book_join_analysis](screenshots/member_book_join_analysis.png.png)

### 4. most_issued_books.
![most_issued_books](screenshots/most_issued_books..png.png)

### 5.Books_never_issued
![Books_never_issued](screenshots/Books_never_issued.png.png)

### 6. Advanced_member_analysis.
![advanced_member_analysis](screenshotsadvanced_member_analysis..png.png)

---

## 💡 Key Project Insights

The analysis focuses on:

* Book inventory and category distribution
* Rental price patterns
* Book availability
* Member registration and borrowing behavior
* Employee contribution
* Branch-level workforce relationships
* Frequently issued books
* Books that have never been issued
* Returned books and return dates
* Members with above-average borrowing activity

These insights are documented in the SQL project itself.

---

## 📈 Business Impact

The analysis can support:

* Better understanding of library usage patterns
* Inventory and book-demand analysis
* Identification of active members
* Employee activity monitoring
* Understanding of book circulation
* Data-driven operational decisions

The project describes these areas as its intended business impact.

---

## 🛠️ Tools & Technologies

* **Database:** MySQL
* **Language:** SQL
* **Data Source:** Kaggle
* **Version Control:** GitHub

---

## ▶️ How to Run the Project

### Step 1 — Open MySQL

Open **MySQL Workbench** or another MySQL client.

### Step 2 — Create the database

Run:

```sql
CREATE DATABASE library_management_db;
USE library_management_db;
```

These database commands are included in the project file.

### Step 3 — Load the required tables

Import/create the required project tables:

```text
books
members
employees
branch
issued_status
return_status
```

### Step 4 — Run the SQL queries

Execute the 20 analytical queries in sequence.

### Step 5 — Analyze the results

Review the query outputs to understand:

* Book inventory
* Rental prices
* Member activity
* Employee activity
* Issue patterns
* Return records
* Branch relationships

---

## 📁 Repository Structure

```text
library-management-analytics/
│
├── library_management_Analytics.sql
│
└── README.md
```

---

## 🎓 Learning Outcomes

Through this project, the following practical SQL skills are demonstrated:

* Writing SQL queries for data retrieval
* Filtering and sorting data
* Performing aggregations
* Grouping analytical results
* Using `HAVING` for grouped filtering
* Joining multiple relational tables
* Using `LEFT JOIN` to identify unmatched records
* Writing subqueries
* Performing business-oriented data analysis

---

## 🏁 Conclusion

The **Library Management Analytics** project demonstrates how SQL can be applied to analyze different aspects of library operations.

By working with books, members, employees, branches, issue records, and return records, the project explores book availability, rental prices, member activity, employee performance, and book circulation patterns.

Overall, the project demonstrates the practical application of SQL for **data exploration, relational analysis, and extracting meaningful insights from structured datasets**.

---

## 👨‍💻 Author

**Raman Pareek**

**Aspiring Data Analyst | SQL | Excel | Power BI | Python**

---

⭐ If you find this project useful, feel free to explore the SQL queries and analysis.

