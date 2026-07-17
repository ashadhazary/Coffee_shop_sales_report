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
Output: <img width="446" height="140" alt="image" src="https://github.com/user-attachments/assets/b212ba57-0502-466c-aa12-3305cdb23d67" />

---

## 2. Total Orders (May)

Counts the total number of orders.

```sql
SELECT
    CONCAT(ROUND(COUNT(transaction_id)/1000),'K') AS total_orders
FROM coffee_shop_sales
WHERE MONTH(transaction_date)=5;
```
Output: <img width="449" height="153" alt="image" src="https://github.com/user-attachments/assets/a916aa42-7762-4c8e-b41b-67f9e8988beb" />

---

## 3. Total Quantity Sold

Calculates the total number of products sold.

```sql
SELECT
    CONCAT(ROUND(SUM(transaction_qty)/1000),'K') AS total_qty_sold
FROM coffee_shop_sales
WHERE MONTH(transaction_date)=5;
```
Output: <img width="454" height="176" alt="image" src="https://github.com/user-attachments/assets/c2f3f0e7-38f9-48c0-83a4-dcdb7af009d3" />

---

## 4. Month-over-Month Sales Growth

Compares monthly sales using SQL Window Functions.

Uses:

- CTE
- LAG()
- Percentage Growth Calculation

---
```sql
with monthly_sales as(
select 
	month(transaction_date) as cm,
    round(sum(transaction_qty*unit_price)) as cm_sales
from coffee_shop_sales
group by cm
)
select 
cm,
cm_sales,
round(lag(cm_sales) over(order by cm)) as pm_sales,
concat(round(((cm_sales-lag(cm_sales) over(order by cm))/lag(cm_sales) over(order by cm))*100,2),'%') as mom_sales_growth
from monthly_sales;
```
Output: <img width="533" height="242" alt="image" src="https://github.com/user-attachments/assets/dc36fa81-0aab-4c81-be1a-bde6b7f8f86a" />


## 5. Daily KPI

Returns:

- Total Sales
- Total Quantity Sold
- Total Orders

for a specific day (May 18).

--- 
``` sql
select 
round(sum(transaction_qty*unit_price)) as total_sales,
sum(transaction_qty) as total_qty_sold,
count(transaction_id) as total_orders
from coffee_shop_sales
where
month(transaction_date)=5 and day(transaction_date)=18;

```
Output: <img width="443" height="158" alt="image" src="https://github.com/user-attachments/assets/99b97beb-2146-48a2-8146-53f0a8a3ea58" />

## 6. Weekday vs Weekend Sales

Classifies sales into:

- Weekday
- Weekend

using `DAYOFWEEK()`.

---
```sql
select 
case when
dayofweek(transaction_date) in(1,7) then 'Weekend'
else 'Weekday'
end as day_type,
concat(round(sum(transaction_qty*unit_price)/1000,1),'K') as total_sales
from coffee_shop_sales
where month(transaction_date) = 5
group by day_type
;
```
Output: <img width="403" height="177" alt="image" src="https://github.com/user-attachments/assets/7157e902-bb74-4ef6-9918-7677e125cbe9" />


## 7. Store Performance

Shows total sales for each store location.

---
```sql
SELECT 
 store_location,
    concat(round(sum(transaction_qty*unit_price)/1000,1),'K') as total_sales
FROM
    coffee_shop_sales
where month(transaction_date) = 5
group by store_location;
```
Output: <img width="378" height="192" alt="image" src="https://github.com/user-attachments/assets/02ad4442-30ca-4cd0-83a7-1dc9505bd6b5" />


## 8. Daily Sales Trend

Displays total sales for each day of the month.

---
```sql
SELECT 
 day(transaction_date) as day_of_month,
    concat(round(sum(transaction_qty*unit_price)/1000,1),'K') as total_sales
FROM
    coffee_shop_sales
where month(transaction_date) = 5
group by day_of_month;
```
Output: <img width="367" height="460" alt="image" src="https://github.com/user-attachments/assets/8cc992db-c7c8-4723-95d0-fa035613c1c5" />
<img width="332" height="495" alt="image" src="https://github.com/user-attachments/assets/6487837e-5107-42bb-aa83-b131543c8aa8" />



## 9. Product Category Performance

Ranks product categories by total sales.

---
```sql
SELECT 
 product_category,
concat(round(sum(transaction_qty*unit_price)/1000,2),'K') as total_sales
FROM coffee_shop_sales
WHERE month(transaction_date) = 5
GROUP BY product_category
ORDER BY sum(transaction_qty*unit_price) DESC;
```
Output: <img width="412" height="337" alt="image" src="https://github.com/user-attachments/assets/c0c20399-6bb3-4b27-b7f0-e7c40637b4a7" />


## 10. Top Product Types

Returns the Top 10 product types based on sales.

---
```sql
SELECT 
 product_type,
concat(round(sum(transaction_qty*unit_price)/1000,2),'K') as total_sales
FROM coffee_shop_sales
WHERE month(transaction_date) = 5
GROUP BY product_type
ORDER BY sum(transaction_qty*unit_price) DESC
LIMIT 10;
```
Output: <img width="441" height="378" alt="image" src="https://github.com/user-attachments/assets/be2397e2-c448-4dd9-95dd-0df279029e0f" />


## 11. Hourly Sales Analysis

Analyzes sales performance by hour.

Returns:

- Total Sales
- Total Quantity Sold
- Total Orders

for every hour of the day.

---
```sql
select 
hour(transaction_time) as hour_number,
round(sum(transaction_qty*unit_price)) as total_sales,
sum(transaction_qty) as total_qty_sold,
count(transaction_id) as total_orders
from coffee_shop_sales
where
month(transaction_date)=5 
group by hour(transaction_time);
```
Output: <img width="550" height="477" alt="image" src="https://github.com/user-attachments/assets/23cb774c-b174-4696-9b4d-c68d27a8129d" />


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
