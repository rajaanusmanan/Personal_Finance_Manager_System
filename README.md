# Personal Finance & Expense Tracking System

A full-stack database-driven web application that helps users manage their personal finances efficiently. The system enables expense tracking, budget management, income logging, savings goal monitoring, and AI-powered spending predictions through an interactive dashboard.

---

## 📌 Project Overview

The Personal Finance & Expense Tracking System is designed to help users gain better control over their financial activities. It provides tools for recording daily expenses, managing budgets, tracking income, setting savings goals, and analyzing spending behavior through visual reports and AI-based forecasting.

The project demonstrates database design, normalization, SQL implementation, RESTful API development, and front-end integration.

---

## 🚀 Features

### Expense Management

* Add, update, view, and delete expenses
* Categorize expenses (Food, Transport, Bills, Entertainment, etc.)
* Store payment methods and transaction details
* Filter expenses by date and category

### Budget Management

* Set monthly budget limits
* Monitor spending against budgets
* Receive alerts when spending approaches limits

### Income Tracking

* Record multiple income sources
* Track salary, freelance work, gifts, and other earnings
* View monthly income summaries

### Savings Goals

* Create savings targets
* Track progress toward goals
* Set priorities and deadlines

### AI-Based Spending Predictions

* Forecast future spending using historical data
* Category-wise spending analysis
* Confidence score for predictions

### Reporting & Analytics

* Interactive dashboard
* Pie charts and bar charts
* Monthly spending summaries
* Export reports in PDF and CSV formats

---

## 🏗️ System Architecture

Frontend (HTML, CSS, JavaScript)

↓

Flask REST API

↓

MySQL Database

↓

AI Prediction Module

---

## 🛠 Technology Stack

| Layer           | Technology            |
| --------------- | --------------------- |
| Frontend        | HTML, CSS, JavaScript |
| Backend         | Python Flask          |
| Database        | MySQL                 |
| Charts          | Chart.js              |
| Authentication  | Flask-Login, bcrypt   |
| Version Control | Git & GitHub          |
| Deployment      | Localhost / Render    |

---

## 📊 Database Design

### Main Entities

#### Strong Entities

* USER
* CATEGORY
* INCOME

#### Weak Entities

* EXPENSES
* SAVING_GOALS

#### Associative Entity

* AI_PREDICTION

#### ISA Hierarchy

* ADMIN_USER
* REGULAR_USER

---

## 🔗 Entity Relationships

| Relationship             | Cardinality          |
| ------------------------ | -------------------- |
| USER → INCOME            | 1 : N                |
| USER → EXPENSES          | 1 : N                |
| USER → SAVING_GOALS      | 1 : N                |
| USER → AI_PREDICTION     | 1 : N                |
| CATEGORY → EXPENSES      | 1 : N                |
| CATEGORY → AI_PREDICTION | 1 : N                |
| USER ↔ CATEGORY          | M : N (via EXPENSES) |

---

## 🧩 Normalization

The database is normalized up to **Third Normal Form (3NF)**:

* **1NF:** Atomic attributes only
* **2NF:** No partial dependencies
* **3NF:** No transitive dependencies

This design eliminates redundancy and improves data integrity.

---

## 📂 Project Structure

```text
Finance-Manager-DB/
│
├── database/
│   ├── create_tables.sql
│   ├── sample_data.sql
│   └── queries.sql
│
├── backend/
│   ├── app.py
│   ├── routes/
│   ├── models/
│   └── services/
│
├── frontend/
│   ├── index.html
│   ├── css/
│   ├── js/
│   └── assets/
│
├── erd/
│   ├── EERD.png
│   ├── EERD.pdf
│   └── EERD.html
│
├── docs/
│   ├── Project_Report.pdf
│   └── Proposal.pdf
│
└── README.md
```

---

## 🔍 Key SQL Operations

The project implements:

* CREATE TABLE
* INSERT INTO
* SELECT with WHERE
* INNER JOIN (2 and 3 tables)
* GROUP BY
* HAVING
* ORDER BY
* Subqueries
* Aggregate Functions
* Date Functions
* UPDATE
* DELETE
* ALTER TABLE
* CASE Statements
* Window Functions

---

## 📈 Dashboard Components

### Main Dashboard

* Total Spending Card
* Monthly Budget Summary
* Remaining Balance
* Expense Trends
* Recent Transactions

### Analytics

* Category-wise Pie Chart
* Spending Comparison Bar Chart
* Monthly Trends
* AI Forecast Reports

---

## 🔐 Security Features

* Password hashing using bcrypt
* Parameterized SQL queries
* User authentication and authorization
* Role-based access control (Admin / Regular User)

---

## ⚙️ Installation

### Clone Repository

```bash
git clone https://github.com/rui-dev-ai/Finance-Manager-DB.git
cd Finance-Manager-DB
```

### Create Virtual Environment

```bash
python -m venv venv
```

### Activate Environment

Windows:

```bash
venv\Scripts\activate
```

Linux/Mac:

```bash
source venv/bin/activate
```

### Install Dependencies

```bash
pip install -r requirements.txt
```

### Configure Database

Create a MySQL database:

```sql
CREATE DATABASE finance_manager;
```

Update database credentials in:

```python
config.py
```

### Run Application

```bash
python app.py
```

Open:

```text
http://localhost:5000
```

---

## 📅 Project Timeline

| Phase    | Task                  |
| -------- | --------------------- |
| Phase 1  | Project Planning      |
| Phase 2  | Database & ERD Design |
| Phase 3  | SQL Implementation    |
| Phase 4  | Query Development     |
| Phase 5  | Flask API Development |
| Phase 6  | Frontend Development  |
| Phase 7  | Integration           |
| Phase 8  | Testing               |
| Phase 9  | Documentation         |
| Phase 10 | Final Presentation    |

---

## 🎯 Learning Outcomes

* Relational Database Design
* Enhanced ERD Modeling
* SQL Query Development
* Database Normalization
* REST API Development
* Front-End and Back-End Integration
* Data Visualization
* Team Collaboration using GitHub

---

## 📜 License

This project is developed for academic purposes as part of the Database Systems Project Based Learning (PBL) course at NUTECH.

---

