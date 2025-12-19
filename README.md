# 🛒 Blinkit Sales Analysis and Retail Performance Dashboard

A data analysis project focused on understanding sales performance, customer ratings, and outlet characteristics of Blinkit using Python, Power BI Excel.

---

##  Table of Contents
- [Overview](#overview)
- [Business Problem](#business-problem)
- [Dataset](#dataset)
- [Tools & Technologies](#tools--technologies)
- [Project Structure](#project-structure)
- [Data Cleaning & Preparation](#data-cleaning--preparation)
- [Exploratory Data Analysis (EDA)](#exploratory-data-analysis-eda)
- [Key KPIs & Metrics](#key-kpis--metrics)
- [Dashboard](#dashboard)
- [Key Insights](#key-insights)
- [How to Run the Project](#how-to-run-the-project)
- [Final Recommendations](#final-recommendations)
- [Author & Contact](#author--contact)

---

## Overview

This project focuses on analyzing Blinkit’s grocery sales data to evaluate overall business performance, customer preferences, and outlet efficiency.
The analysis was performed using Python for Exploratory Data Analysis (EDA), Excel for initial data inspection, and Power BI for interactive dashboard creation and visualization.

The objective of the project is to transform raw sales data into meaningful insights by identifying key trends, performance drivers, and optimization opportunities that support data-driven business decisions.

---

## Business Problem

The objective of this project is to address the following business problems:

- Identify key factors influencing total sales and average sales across different products and outlets.

- Analyze customer purchasing behavior based on item characteristics such as fat content and item type.

- Evaluate outlet performance across different sizes, locations, and outlet types.

- Understand how outlet establishment year impacts long-term sales trends

- Detect patterns and anomalies in sales data through Exploratory Data Analysis (EDA).

- Support inventory optimization, product prioritization, and expansion strategy using data-driven insights.

This analysis combines Python-based EDA for deep data understanding, Excel for data validation, and Power BI dashboards to deliver actionable business insights for decision-makers.

---

## Dataset

The dataset consists of Blinkit grocery sales data in CSV and Excel format, including:

- Item details (Item Type, Fat Content, Item Visibility, Item Weight)
- Outlet information (Outlet Size, Location Tier, Outlet Type, Establishment Year)
- Sales values and customer ratings

---

## Tools & Technologies
- **Python**
  - Pandas, Numpy, Matplotlib, Seaboarn
- **Power BI**
  - Data modeling
  - DAX measures
  - Interactive dashboards and slicers
- **Excel**
  - Data validation and exploration
- **GitHub**
  - Project version control and portfolio hosting

---

## Project Structure

```
blinkit-sales-data-analysis/
│
├── README.md
├── .gitignore
├── requirements.txt
├── blinkit-sales-data-analysis.pdf
│
├── notebooks/                  # Jupyter notebooks
│   ├── exploratory_data_analysis.ipynb
│   ├── vblinkit.ipynb
│
├── dashboard/                  # Power BI dashboard file
│   └── blinkit.pbix 
```
##  Data Cleaning & Preparation
- Standardized Item Fat Content values:
  - Converted variations such as low fat, LF, and lf → Low Fat.
  - Converted reg → Regular.

- Ensured uniform naming conventions across categorical columns.

- Checked for missing, inconsistent values and removed them.


- Created calculated columns and measures using DAX.


---

##  Exploratory Data Analysis (EDA)

The EDA phase focused on understanding data distribution and patterns before visualization.

### Key Observations:
- Certain item categories significantly outperform others in sales
- Regular-fat products dominate total sales compared to low-fat items
- Tier 3 outlets generate higher revenue than Tier 1 and Tier 2
- Medium-sized outlets consistently outperform small and large outlets
- Sales peaked around 2018 and stabilized afterward

EDA helped guide KPI selection and dashboard design.

---

##  Key KPIs & Metrics

- **Total Sales** – Overall revenue generated
- **Average Sales** – Average revenue per sale
- **Number of Items** – Total items sold
- **Average Rating** – Customer satisfaction indicator

---

##  Dashboard

The Power BI dashboard provides:

- KPI cards for quick performance overview
- Sales analysis by item type and fat content
- Outlet analysis by size, type, and location
- Trend analysis using outlet establishment year
- Interactive slicers for dynamic filtering
![Dashboard](https://github.com/karimshaik09/blinkit-sales-analysis-and-retail-performance-dashboard/blob/ec6a1e123dcd302e810f5108f8b1814627632569/Images/Screenshot%202025-12-16%20130526.png)
![Dashboard](https://github.com/karimshaik09/blinkit-sales-analysis-and-retail-performance-dashboard/blob/bf7f10dafad8e3ce975fe58d863d9b5ebf5eb3b9/Images/Screenshot%202025-12-16%20130500.png)
---

## Key Insights

- Fruits & Vegetables and Snack Foods are top-selling categories
- Tier 3 outlets generate the highest total sales
- Medium-sized outlets contribute the most revenue
- Regular-fat products outperform low-fat products
- Older outlets show stronger and more stable sales performance

---
##  How to Run the Project

1. Clone the repository:

- `git clone https://github.com/yourusername/blinkit-sales-data-analysis.git`


2. Excel Analysis:

- Open ```blinkit excel.xlsx```

- Review pivot tables and summaries

3. Python EDA:

- Open ```blinkit.ipynb```

- Run all cells in Jupyter Notebook

4. Power BI Dashboard:

- Open ```blinkit.pbix``` in Power BI Desktop


---

##  Final Recommendations

- Focus expansion on Tier 3, medium-sized outlets
- Prioritize high-demand product categories
- Optimize inventory based on customer fat-content preference
- Improve low-performing categories through targeted promotions

---

##  Author & Contact

**Karimulla Shaik**  
  

Email: karimshaik1905@gmail.com 

🔗 [LinkedIn](#www.linkedin.com/in/karimshaik17)
