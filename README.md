# 🛒 Retail Superstore Analysis Dashboard

An end-to-end data analysis and visualisation project built on 100K+ rows of retail transactional data. This project demonstrates SQL-based data extraction, transformation, and the development of an interactive Power BI dashboard that enables business users to independently explore sales performance.

---

## 📌 Project Overview

Retail businesses generate enormous volumes of transactional data daily — but raw data alone doesn't drive decisions. This project bridges that gap by transforming a large retail dataset into a clean, interactive dashboard that surfaces revenue trends, top-performing products, and regional performance metrics in a self-serve format.

---

## 🎯 Objectives

- Extract and aggregate meaningful business metrics from 100K+ rows of transactional data using SQL
- Build an interactive Power BI dashboard with intuitive filters and drill-down capability
- Enable stakeholders to independently explore KPIs by category, region, and time period
- Identify top-performing SKUs, underperforming regions, and seasonal sales trends

---

## 🛠️ Tech Stack

| Tool | Purpose |
|------|---------|
| **SQL** | Data extraction, joins, subqueries, aggregations |
| **Power BI** | Dashboard development, data modelling |
| **DAX** | Custom KPI measures, calculated columns |
| **Excel** | Initial data exploration and validation |

---

## 📊 Dashboard Features

- **Sales KPI Cards** — Total Revenue, Orders, Average Order Value, Profit Margin
- **Time-Series Trend** — Monthly and quarterly revenue over time
- **Category Breakdown** — Sales and profit by product category and sub-category
- **Regional Performance Map** — Revenue distribution across regions
- **Top SKUs Table** — Best and worst-performing products ranked by revenue
- **Slicers & Drill-throughs** — Filter by date range, category, region, and segment

---

## 🗂️ Project Structure

```
retail_superstore_analysis_sql/
│
├── data/
│   └── superstore_raw.csv          # Source dataset
│
├── sql/
│   ├── exploratory_queries.sql     # Initial EDA queries
│   ├── revenue_trends.sql          # Time-based aggregations
│   ├── regional_performance.sql    # Region-level breakdowns
│   └── top_skus.sql                # Product ranking queries
│
├── dashboard/
│   └── retail_sales_dashboard.pbix # Power BI file
│
├── screenshots/
│   └── dashboard_overview.png      # Dashboard preview
│
└── README.md
```

---

## 🔍 Key SQL Techniques Used

```sql
-- Example: Top 10 products by revenue with category context
SELECT
    p.category,
    p.sub_category,
    p.product_name,
    SUM(o.sales)  AS total_revenue,
    SUM(o.profit) AS total_profit,
    ROUND(SUM(o.profit) / SUM(o.sales) * 100, 2) AS profit_margin_pct
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.category, p.sub_category, p.product_name
ORDER BY total_revenue DESC
LIMIT 10;
```

Techniques applied: `JOINs`, `Subqueries`, `Window Functions`, `GROUP BY`, `HAVING`, `CTEs`

---

## 📈 Key Insights

- **Technology** was the highest revenue-generating category; **Office Supplies** had the best profit margins
- The **West region** consistently outperformed others in both revenue and order volume
- A clear **Q4 seasonal spike** was observed — indicating strong holiday/year-end demand
- Several high-revenue SKUs operated at **negative profit margins**, flagged for pricing review

---

## 💡 DAX Measures (Sample)

```dax
Total Revenue = SUM(Orders[Sales])

Profit Margin % = DIVIDE(SUM(Orders[Profit]), SUM(Orders[Sales])) * 100

MoM Revenue Growth =
VAR CurrentMonth = [Total Revenue]
VAR PrevMonth    = CALCULATE([Total Revenue], DATEADD(Dates[Date], -1, MONTH))
RETURN DIVIDE(CurrentMonth - PrevMonth, PrevMonth)
```

---

## 🚀 How to Run

1. **SQL Queries** — Run scripts in `/sql/` against any SQL-compatible environment (MySQL, PostgreSQL, or SQLite)
2. **Power BI Dashboard** — Open `retail_sales_dashboard.pbix` in Power BI Desktop (free from Microsoft)
3. **Data Source** — Connect Power BI to `superstore_raw.csv` or your SQL database if prompted

---

## 👩‍💻 Author

**Neha Bhan** — Data Analyst | Power BI · SQL · Python
📧 neha.kavi30@gmail.com
🔗 [LinkedIn](https://linkedin.com/in/neha-bhan-9b45151aa) | [GitHub](https://github.com/nehakavi30-pixel)
