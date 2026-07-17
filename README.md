# ☕ Coffee Shop Sales Analysis using SQL

This project contains SQL queries for analyzing a Coffee Shop Sales dataset. The queries provide business insights such as total sales, order volume, product performance, monthly growth, hourly trends, and store performance.

<img width="725" height="484" alt="coffee shop sales dashbord" src="https://github.com/user-attachments/assets/6604ff4c-5eda-4121-85eb-a5f21d3b42e1" />

<img width="728" height="482" alt="tooltip show" src="https://github.com/user-attachments/assets/d62ea380-8cb4-4db2-93df-6b540302cea5" />

<img width="730" height="484" alt="hour map tooltip" src="https://github.com/user-attachments/assets/35dfef50-48e9-4919-a488-0b8da3574afa" />



---

## 📌 Project Overview

The objective of this project is to analyze coffee shop transaction data using SQL to answer common business questions and generate meaningful insights.

The analysis includes:

- Total Sales
- Total Orders
- Total Quantity Sold
- Month-over-Month (MoM) Sales Growth
- Daily Sales Analysis
- Weekday vs Weekend Sales
- Store Location Performance
- Product Category Performance
- Product Type Performance
- Hourly Sales Trends

---

## 🛠️ Technologies Used

- SQL (MySQL 8+)
- Common Table Expressions (CTE)
- Window Functions
- Aggregate Functions
- Date & Time Functions

---

## 📂 Dataset

**Table Name:** `coffee_shop_sales`

### Main Columns

| Column | Description |
|---------|-------------|
| transaction_id | Unique transaction identifier |
| transaction_date | Date of transaction |
| transaction_time | Time of transaction |
| transaction_qty | Quantity purchased |
| unit_price | Price per unit |
| store_location | Store branch |
| product_category | Product category |
| product_type | Product type |

---

# 📊 SQL Analysis

## 1. Total Sales (May)

Calculates the total revenue generated in May.

```sql
SELECT
    CONCAT(ROUND(SUM(transaction_qty * unit_price)/1000,2),'K') AS total_sales
FROM coffee_shop_sales
WHERE MONTH(transaction_date)=5;
```

---

## 2. Total Orders (May)

Counts the total number of orders.

```sql
SELECT
    CONCAT(ROUND(COUNT(transaction_id)/1000),'K') AS total_orders
FROM coffee_shop_sales
WHERE MONTH(transaction_date)=5;
```

---

## 3. Total Quantity Sold

Calculates the total number of products sold.

```sql
SELECT
    CONCAT(ROUND(SUM(transaction_qty)/1000),'K') AS total_qty_sold
FROM coffee_shop_sales
WHERE MONTH(transaction_date)=5;
```

---

## 4. Month-over-Month Sales Growth

Compares monthly sales using SQL Window Functions.

Uses:

- CTE
- LAG()
- Percentage Growth Calculation

---

## 5. Daily KPI

Returns:

- Total Sales
- Total Quantity Sold
- Total Orders

for a specific day (May 18).

---

## 6. Weekday vs Weekend Sales

Classifies sales into:

- Weekday
- Weekend

using `DAYOFWEEK()`.

---

## 7. Store Performance

Shows total sales for each store location.

---

## 8. Daily Sales Trend

Displays total sales for each day of the month.

---

## 9. Product Category Performance

Ranks product categories by total sales.

---

## 10. Top Product Types

Returns the Top 10 product types based on sales.

---

## 11. Hourly Sales Analysis

Analyzes sales performance by hour.

Returns:

- Total Sales
- Total Quantity Sold
- Total Orders

for every hour of the day.

---

# 📈 Business Insights Generated

This analysis helps answer questions such as:

- Which month generated the highest revenue?
- How fast are sales growing month over month?
- Which store performs best?
- Which products generate the most revenue?
- Which product types are most popular?
- What are the busiest hours?
- Do weekends outperform weekdays?
- Which days have the highest sales?

---

# 📁 Project Structure

```
Coffee-Shop-Sales-Analysis/
│
├── README.md
├── coffee_shop_sales.sql
└── dataset/
    └── coffee_shop_sales.csv
```

---

# 🚀 How to Use

1. Import the dataset into MySQL.
2. Create the `coffee_shop_sales` table.
3. Run each SQL query individually.
4. Analyze the output for business insights.

---

# 📚 SQL Concepts Covered

- SELECT
- WHERE
- GROUP BY
- ORDER BY
- LIMIT
- Aggregate Functions
- CONCAT()
- ROUND()
- SUM()
- COUNT()
- MONTH()
- DAY()
- HOUR()
- DAYOFWEEK()
- Common Table Expressions (CTE)
- Window Functions (`LAG()`)

---

# 🎯 Learning Outcomes

After completing this project, you will understand how to:

- Perform sales analysis using SQL
- Build KPI queries
- Analyze trends over time
- Use Window Functions for growth analysis
- Work with date and time functions
- Generate business reports from transactional data

---

## ⭐ If you found this project helpful

Feel free to ⭐ star this repository and fork it to explore additional SQL analytics and dashboard projects.

---

## 👤 Author

**Ashad Hazary**

GitHub:https://github.com/ashadhazary
