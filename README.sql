# 📚 Online Bookstore — SQL Database Project

A relational database project built using **MySQL** that simulates the backend of an online bookstore. It covers database design, table creation, data relationships, and a wide range of SQL queries — from basic filtering to advanced aggregations and joins.

---

## 🗂️ Project Overview

This project models a fully functional online bookstore system where:
- Books are listed with their genre, author, price, and stock
- Customers can be registered with their contact and location details
- Orders link customers to books they've purchased

The project demonstrates real-world SQL skills including schema design, foreign key relationships, aggregate functions, joins, filtering, and business-level reporting queries.

---

## 🛠️ Tech Stack

- **Database:** MySQL
- **Language:** SQL
- **Concepts Used:** DDL, DML, Joins, Aggregations, Subqueries, GROUP BY, ORDER BY, HAVING, COALESCE

---

## 🗃️ Database Schema

The database `OnlineBookstore` contains **3 tables**:

### 1. `Books`
Stores information about all available books.

| Column           | Type            | Description                     |
|------------------|-----------------|---------------------------------|
| Book_ID          | INT (PK)        | Unique identifier for each book |
| Title            | VARCHAR(100)    | Title of the book               |
| Author           | VARCHAR(100)    | Author's name                   |
| Genre            | VARCHAR(50)     | Book genre (e.g., Fiction)      |
| Published_Year   | INT             | Year the book was published     |
| Price            | NUMERIC(10,2)   | Price of the book               |
| Stock            | INT             | Number of copies in stock       |

---

### 2. `Customers`
Stores registered customer details.

| Column       | Type            | Description                        |
|--------------|-----------------|------------------------------------|
| Customer_ID  | SERIAL (PK)     | Auto-incremented unique customer ID|
| Name         | VARCHAR(100)    | Full name of the customer          |
| Email        | VARCHAR(100)    | Email address                      |
| Phone        | VARCHAR(15)     | Contact number                     |
| City         | VARCHAR(50)     | City of residence                  |
| Country      | VARCHAR(150)    | Country of residence               |

---

### 3. `Orders`
Tracks every order placed by customers.

| Column        | Type            | Description                              |
|---------------|-----------------|------------------------------------------|
| Order_ID      | SERIAL (PK)     | Auto-incremented unique order ID         |
| Customer_ID   | INT (FK)        | References `Customers(Customer_ID)`      |
| Book_ID       | INT (FK)        | References `Books(Book_ID)`              |
| Order_Date    | DATE            | Date the order was placed                |
| Quantity      | INT             | Number of copies ordered                 |
| Total_Amount  | NUMERIC(10,2)   | Total price for the order                |



## 🔗 Entity Relationship


Customers (Customer_ID) ──< Orders >── Books (Book_ID)


- One customer can place many orders
- One book can appear in many orders
- The `Orders` table acts as a junction/fact table


## 📋 SQL Queries Covered

### 🔹 Basic Queries
| Query | Description |
|-------|-------------|
| Select all books in "Fiction" genre | Filters books by genre |
| Books published after 1950 | Filters by published year |
| All customers from Canada | Filters by country |
| Orders placed in November 2023 | Date range filtering using BETWEEN |
| Orders where quantity > 1 | Filters multi-quantity orders |
| Orders where total amount > $20 | Filters by order value |
| All distinct genres | Lists unique genres in the books table |

### 🔹 Aggregate Queries
| Query | Description |
|-------|-------------|
| Total stock of all books | Uses `SUM()` on stock column |
| Total revenue from all orders | Uses `SUM()` on Total_Amount |
| Average price of Fantasy books | Uses `AVG()` filtered by genre |
| Most expensive book | Uses `ORDER BY price DESC LIMIT 1` |
| Book with lowest stock | Uses `ORDER BY stock ASC LIMIT 1` |
| Top 3 most expensive Fantasy books | Combines `WHERE`, `ORDER BY`, `LIMIT` |

### 🔹 JOIN Queries
| Query | Description |
|-------|-------------|
| Total books sold per genre | Joins Orders + Books, groups by Genre |
| Total quantity sold per author | Joins Orders + Books, groups by Author |
| Cities of customers who spent over $30 | Joins Orders + Customers, filters by amount |
| Customer who spent the most | Joins Orders + Customers, sums and ranks |
| Remaining stock after fulfilling orders | LEFT JOIN with COALESCE to handle no-order books |

### 🔹 GROUP BY / HAVING Queries
| Query | Description |
|-------|-------------|
| Customers with at least 2 orders | Uses `HAVING COUNT >= 2` |
| Most frequently ordered book | Groups by Book_ID, orders by count descending |


## 📈 Key Business Insights the Queries Answer

- **Which genre sells the most?** → Revenue and quantity analysis by genre
- **Who are the top customers?** → Ranked by total spend
- **What is the current inventory?** → Remaining stock after all orders
- **Where are our customers located?** → City/country breakdown of big spenders
- **Which books need restocking?** → Lowest stock query


## 🚀 How to Run

1. Open your MySQL client (MySQL Workbench, DBeaver, or CLI)
2. Run the full script to create the database and tables:
```sql
CREATE DATABASE OnlineBookstore;
USE OnlineBookstore;

3. Execute the table creation statements for `Books`, `Customers`, and `Orders`
4. Insert your sample data
5. Run any of the provided queries to explore the data


## 📁 File Structure

SQL_online_bookstore/
│
└── README.sql        # All SQL code — schema + queries

## 💡 Concepts Demonstrated

- ✅ Database and table creation (DDL)
- ✅ Primary keys and foreign keys
- ✅ Serial / auto-increment fields
- ✅ Data filtering with WHERE and BETWEEN
- ✅ Aggregate functions: SUM, AVG, COUNT
- ✅ Sorting with ORDER BY and pagination with LIMIT
- ✅ Grouping with GROUP BY and HAVING
- ✅ INNER JOIN and LEFT JOIN across multiple tables
- ✅ DISTINCT for unique value extraction
- ✅ COALESCE to handle NULL values in LEFT JOINs
