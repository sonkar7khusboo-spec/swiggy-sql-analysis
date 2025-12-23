# 🍔 Swiggy Data Analysis using SQL

## 📌 Project Overview
This project focuses on analyzing Swiggy food delivery data using **pure SQL**.  
The objective is to clean raw data, design a **star schema**, calculate key business KPIs, and perform deep-dive business analysis to understand ordering patterns, revenue distribution, and food performance.

---

## ❓ Business Problem
Raw Swiggy data contains:
- Null and blank values  
- Duplicate records  
- No structured data model for analytics  

**Goal:**  
Transform raw transactional data into a structured analytical model and generate insights useful for business decision-making.

---

## 🛠 Tools Used
- MySQL  
- SQL (CTE, Window Functions, Joins, Aggregations)

---

## 🔄 Data Cleaning & Validation
- Checked NULL values across critical columns  
- Identified and removed duplicate records using `ROW_NUMBER()`  
- Validated blank and empty strings  

---

## 🧱 Data Modeling (Star Schema)

### Dimension Tables
- `dim_date`
- `dim_location`
- `dim_restaurant`
- `dim_category`
- `dim_dish`

### Fact Table
- `fact_swiggy_orders`

---

## 📊 KPIs Calculated
- Total Orders  
- Total Revenue  
- Average Dish Price  
- Average Rating  

---

## 📈 Business Analysis
- Monthly, Quarterly & Yearly order trends  
- Orders by day of the week  
- Top cities by order volume  
- Revenue contribution by state  
- Top restaurants, categories & dishes  
- Price range analysis  
- Rating distribution  

---

## ✅ Key Insights
- Certain cities and states contribute major revenue  
- Few restaurants and food categories dominate order volume  
- Mid-price range dishes generate maximum orders  
- Customer ratings are mostly concentrated between 3–5  

---

## 🚀 Conclusion
This project demonstrates strong SQL skills including data cleaning, data modeling, KPI development, and business analysis.  
It follows an **industry-standard analytical workflow** suitable for Data Analyst roles.

---

## 👤 Author
**Khushboo**  
Aspiring Data Analyst  
Skills: SQL | Data Cleaning | Data Modeling | Business Analysis
