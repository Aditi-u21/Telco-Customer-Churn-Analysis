# 📉 Telco Customer Churn Analysis

This project provides a comprehensive analysis of customer churn for a telecom company using multiple tools: **Python**, **SQL**, and **Power BI**. It includes exploratory data analysis (EDA), churn prediction modeling, SQL-driven business insights, and an interactive dashboard for executive-level decision-making.

---

## 🗃️ Dataset

The dataset includes customer information such as:

- **Demographics** (age, gender, dependents)
- **Service usage** (internet, tech support, security, unlimited data)
- **Account details** (contract type, tenure, offers, charges)
- **Target**: `Churn` (Yes/No)

---

## 📌 Key Objectives

- Understand customer behavior leading to churn  
- Identify high-risk churn segments  
- Quantify revenue impact  
- Build predictive models  
- Provide actionable visual insights  

---

## 📊 Project Overview

| Component        | Tool Used     | Description |
|------------------|---------------|-------------|
| 🔍 EDA & Modeling | Python        | Cleaning, visualization, Random Forest & Logistic Regression |
| 💾 Query Insights | SQL           | Business logic, churn patterns, revenue impact |
| 📈 Visualization  | Power BI      | Interactive dashboard for stakeholder presentation |

---

## 📁 Repository Structure
```
Telco-Customer-Churn-Analysis/
│
├── telco_churn_analysis.ipynb # Python notebook with EDA & ML
├── telco_queries.sql # SQL file with churn insights
├── telco_churn_dashboard.pbix # Power BI dashboard file
├── telco_cleaned.csv # (Optional) Cleaned dataset
├── images/ # Dashboard screenshots
└── README.md # Project description
```

---

## 🧹 Python Workflow Summary

### ✔️ Data Cleaning

- Filled missing values in **Churn Reason** and **Offer**
- Converted `TotalCharges` to numeric
- Dropped irrelevant or leaky columns

### 📊 Exploratory Data Analysis (EDA)

- Churn distribution by:
  - **Contract Type**
  - **Tenure Groups**
  - **Monthly Charges**
  - **Offers**
  - **Unlimited Data**
  - **Customer Lifetime Value (CLTV)**

### 🤖 Modeling

- **Random Forest Classifier** (n=85)
- **Logistic Regression** with `StandardScaler`
- Evaluation metrics:
  - Accuracy
  - Confusion Matrix
  - F1 Score
  - ROC Curve

### 🔍 Key Insights

- Month-to-month contract customers are more likely to churn  
- Higher monthly charges and shorter tenure → high churn risk  
- **Offer A** performs best in reducing churn and boosting CLTV  
- Unlimited data doesn't guarantee retention  

---

## 🧾 SQL Analysis Highlights

📄 File: `telco_queries.sql`

Includes SQL queries for:

- 📉 Total churned customers  
- 💰 Revenue lost due to churn  
- 📈 Churn rate by:
  - Offer  
  - Contract  
  - Satisfaction Score  
  - Online Security  
  - TotalCharges < $500  
- 👨‍👩‍👧‍👦 Demographics-based churn analysis  
- 🧠 CLTV, referrals, and support usage insights


