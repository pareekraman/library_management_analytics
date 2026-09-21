/* ============================================================
   Library Management Analitics — SQL Project 
 ==============================================================*/
 
--  Database : library_management_db
--  Tool     : MySQL
--  Dataset  : Library Management Analytics
--  Source   : Kaggle

-- Tables Used:
--  1. Books  -> company department wise data
--  2. Issued Status    -> company industry wise data
--  3. Return Status   -> company clint_id, employee wise project_id data
--  4. Members -> company technology, project_id wise technology_id
--  5. Emoloyees -> company country, state, city, employees wise office_id      
--  6. Branch -> company year, quarter, revenue, profit, employees wise financial_id

-- Purpose:
--  Library Management Analytics data for SQL analysis.

-- ===========================================================================
--    DATABASE SETUP
-- ===========================================================================

CREATE DATABASE library_management_db;
USE library_management_db;

-- ===========================================================================
-- Project Overview
-- ===========================================================================
--    Library Management Analytics is a SQL-based data analytics project designed to analyze and evaluate
--    key library operations across books, members, employees, branches, issue records, and return records.

--    The project uses multiple interconnected datasets covering books, members, employees, branches,
--    issued books, and returned books. SQL is used to explore book availability, rental prices,
--    member activity, employee performance, book issue patterns, and return information.

--    The primary objective of this project is to demonstrate how SQL can be used to transform library
--    management data into meaningful insights that support data-driven analysis and operational decision-making.

-- Key Areas of Analysis
--  1. Book & Category Analysis
--  2. Rental Price Analysis
--  3. Book Availability Analysis
--  4. Member Registration & Activity Analysis
--  5. Book Issue Analysis
--  6. Employee Performance Analysis
--  7. Branch & Employee Analysis
--  8. Book Return Analysis
--  9. Most Frequently Issued Books
--  10. Member Issue Performance

--    The project progresses from basic SQL queries to advanced data analysis, using concepts such as
--    SELECT, WHERE, ORDER BY, LIMIT, aggregate functions, GROUP BY, HAVING, JOINs, LEFT JOINs,
--    subqueries, and calculated metrics.

-- ===============================================================================
--   Library Management System — 20 SQL Questions
-- ===============================================================================

-- ========================================
-- EASY — Questions 1–7
-- ========================================

-- 1. Display all records from the books table.
SELECT *
FROM books;

-- 2. Show the title and author of every book.
SELECT book_title, author
FROM books;

-- 3. Find all books belonging to the Classic category.
SELECT *
FROM books
WHERE category = 'Classic';

-- 4. Find books whose rental price is greater than 5.
SELECT book_title, rental_price
FROM books
WHERE rental_price > 5;

-- 5. Display all books from highest to lowest rental price.
SELECT book_title, rental_price
FROM books
ORDER BY rental_price DESC;

-- 6. Find the total number of books in the library.
SELECT COUNT(*) AS total_books
FROM books;

-- 7. Find the average rental price of all books.
SELECT ROUND(AVG(rental_price), 2) AS average_rental_price
FROM books;

-- 8. Find how many books are available in each category.
SELECT 
    category,
    COUNT(*) AS total_books
FROM books
GROUP BY category;

-- 9. Display the top 5 books with the highest rental price.
SELECT 
    book_title,
    rental_price
FROM books
ORDER BY rental_price DESC
LIMIT 5;

-- 10. Display all books whose status is yes.
SELECT 
    book_title,
    author,
    status
FROM books
WHERE status = 'yes';

-- 11. Find members who registered after 2023-01-01.
SELECT 
    member_id,
    member_name,
    reg_date
FROM members
WHERE reg_date > '2023-01-01';

-- 12. Display employees whose salary is greater than 50,000
SELECT 
    emp_id,
    emp_name,
    position,
    salary
FROM employees
WHERE salary > 50000;

-- 13. Display the member name, book name and issue date.
SELECT
    m.member_name,
    i.issued_book_name,
    i.issued_date
FROM members m
JOIN issued_status i
    ON m.member_id = i.issued_member_id;
    
-- 14. Display employee name, position and branch address.
SELECT
    e.emp_name,
    e.position,
    b.branch_address
FROM employees e
JOIN branch b
    ON e.branch_id = b.branch_id;
    
-- 15. Find how many books each member has issued.
SELECT
    m.member_id,
    m.member_name,
    COUNT(i.issued_id) AS books_issued
FROM members m
LEFT JOIN issued_status i
    ON m.member_id = i.issued_member_id
GROUP BY
    m.member_id,
    m.member_name;
    
-- 16. Find the books that have been issued the highest number of times.
SELECT
    issued_book_name,
    COUNT(*) AS times_issued
FROM issued_status
GROUP BY issued_book_name
ORDER BY times_issued DESC;

-- 17. Find books that have never appeared in the issue records.
SELECT
    b.isbn,
    b.book_title,
    b.author
FROM books b
LEFT JOIN issued_status i
    ON b.isbn = i.issued_book_isbn
WHERE i.issued_book_isbn IS NULL;

-- 18. Display the member name, issued book and return date for returned books.
SELECT
    m.member_name,
    i.issued_book_name,
    r.return_date
FROM members m
JOIN issued_status i
    ON m.member_id = i.issued_member_id
JOIN return_status r
    ON i.issued_id = r.issued_id;
    
-- 19. Find employees who have issued more than 5 books.
SELECT
    e.emp_id,
    e.emp_name,
    COUNT(i.issued_id) AS books_issued
FROM employees e
JOIN issued_status i
    ON e.emp_id = i.issued_emp_id
GROUP BY
    e.emp_id,
    e.emp_name
HAVING COUNT(i.issued_id) > 5;

-- 20. Find members whose number of issued books is greater than the average number of books issued per member.
SELECT
    m.member_id,
    m.member_name,
    COUNT(i.issued_id) AS books_issued
FROM members m
JOIN issued_status i
    ON m.member_id = i.issued_member_id
GROUP BY
    m.member_id,
    m.member_name
HAVING COUNT(i.issued_id) >
(
    SELECT AVG(book_count)
    FROM
    (
        SELECT
            issued_member_id,
            COUNT(*) AS book_count
        FROM issued_status
        GROUP BY issued_member_id
    ) AS member_counts
);



-- ===========================================================================
-- Project Insights
-- ===========================================================================

-- 1. Book Inventory Insights
--    Analyzed total books available in the library and identified
--    category-wise distribution to understand collection strength.

-- 2. Rental Price Analysis
--    Evaluated average rental prices and identified premium books
--    with the highest rental costs.

-- 3. Book Availability Insights
--    Determined which books are currently available and which
--    books are frequently issued.

-- 4. Member Activity Insights
--    Tracked member registrations and analyzed borrowing behavior
--    to identify active library users.

-- 5. Employee Performance Insights
--    Evaluated employee contribution by measuring the number of
--    books issued by each employee.

-- 6. Branch-Level Insights
--    Connected employees with branch information to analyze
--    workforce distribution across library branches.

-- 7. Book Issue Analysis
--    Identified the most frequently issued books, helping the
--    library understand reader preferences and demand patterns.

-- 8. Unused Book Identification
--    Detected books that have never been issued, which can help
--    in inventory optimization and future purchasing decisions.

-- 9. Return Analysis
--    Monitored returned books and return dates to track circulation
--    efficiency and member activity.

-- 10. Advanced Member Analysis
--     Identified members whose issued books exceeded the average
--     borrowing level using subqueries and aggregate functions.

-- ===========================================================================
-- Business Impact
-- ===========================================================================

-- • Improved understanding of library usage patterns.
-- • Supported inventory management and book demand analysis.
-- • Helped identify active members and employee performance.
-- • Enabled data-driven decision-making for library operations.
-- • Demonstrated practical use of SQL for real-world analytics.

-- ===========================================================================
-- SQL Concepts Applied
-- ===========================================================================

-- SELECT, WHERE, ORDER BY, LIMIT
-- COUNT(), AVG(), ROUND()
-- GROUP BY, HAVING
-- INNER JOIN, LEFT JOIN
-- Aggregate Functions
-- Subqueries
-- Business KPI Analysis


-- ===========================================================================
-- Conclusion
-- ===========================================================================

--    The Library Management Analytics project demonstrates how SQL can be used
--    to analyze and understand different aspects of library operations.

--    Through the analysis of books, members, employees, branches, issue records,
--    and return records, the project provides insights into book availability,
--    rental prices, member activity, employee performance, and book issue patterns.

--    The project also demonstrates the practical use of SQL concepts such as
--    filtering, sorting, aggregation, GROUP BY, HAVING, JOINs, LEFT JOINs,
--    and subqueries to solve real-world analytical problems.

--    Overall, this project shows how structured library data can be transformed
--    into meaningful information that can support inventory management,
--    member engagement, employee monitoring, and day-to-day library operations.

--    The project successfully demonstrates the application of SQL for
--    data exploration, analysis, and extracting actionable insights from
--    relational datasets.


-- =================================================================================================================================
--      END OF IT Company Business & Workforce Analytics — SQL Project
-- ================================================================================================================================= 