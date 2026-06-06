-- ============================================================
-- FINANCE MANAGER DATABASE SCHEMA & QUERIES
-- ============================================================

-- ============================================================
-- 1. CREATE DATABASE
-- ============================================================
CREATE DATABASE FinanceManager;
GO

USE FinanceManager;
GO

-- ============================================================
-- 2. CREATE TABLES
-- ============================================================

-- Users Table
CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    FullName VARCHAR(100),
    Email VARCHAR(100) UNIQUE
);
GO

-- Categories Table
CREATE TABLE Categories (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL,
    BudgetLimit DECIMAL(10,2)
);
GO

-- Expenses Table
CREATE TABLE Expenses (
    ExpenseID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT,
    CategoryID INT,
    Amount DECIMAL(10,2),
    ExpenseDate DATE,
    Description VARCHAR(255),
    PaymentMethod VARCHAR(50),

    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);
GO

-- Savings Goal Table
CREATE TABLE Savings_Goal (
    GoalID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT,
    GoalName VARCHAR(100),
    TargetAmount DECIMAL(10,2),
    CurrentAmount DECIMAL(10,2) DEFAULT 0,
    StartDate DATE,
    TargetDate DATE,

    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
GO

-- AI Prediction Table
CREATE TABLE AI_Prediction (
    PredictionID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT,
    PredictedAmount DECIMAL(10,2),
    ConfidencePercent DECIMAL(5,2),
    PredictionDate DATE,

    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
GO

-- ============================================================
-- 3. INSERT SAMPLE DATA
-- ============================================================

-- Insert Users Data
INSERT INTO Users (FullName, Email)
VALUES 
('Demo User', 'demo@gmail.com'),
('Sara Khan', 'sara@gmail.com'),
('Usman Tariq', 'usman@gmail.com'),
('Ayesha Malik', 'ayesha@gmail.com'),
('Hassan Raza', 'hassan@gmail.com'),
('Fatima Noor', 'fatima@gmail.com'),
('Bilal Shah', 'bilal@gmail.com'),
('Zain Ali', 'zain@gmail.com'),
('Hira Aslam', 'hira@gmail.com'),
('Ahmed Raza', 'ahmed@gmail.com'),
('Maryam Iqbal', 'maryam@gmail.com'),
('Omar Farooq', 'omar@gmail.com'),
('Laiba Zafar', 'laiba@gmail.com'),
('Danish Ali', 'danish@gmail.com'),
('Nimra Sheikh', 'nimra@gmail.com'),
('Saad Ahmed', 'saad@gmail.com'),
('Iqra Javed', 'iqra@gmail.com'),
('Abdullah Khan', 'abdullah@gmail.com'),
('Noor Fatima', 'noor@gmail.com'),
('Taha Malik', 'taha@gmail.com');
GO

-- Insert Categories Data
INSERT INTO Categories(CategoryName, BudgetLimit)
VALUES
('Food', 10000),
('Transport', 5000),
('Bills', 15000),
('Entertainment', 8000),
('Shopping', 12000),
('Health', 7000),
('Education', 10000),
('Savings', 20000);
GO

-- Insert Expenses Data
INSERT INTO Expenses
(UserID, CategoryID, Amount, ExpenseDate, Description, PaymentMethod)
VALUES
(1, 1, 1500, '2026-01-10', 'Lunch', 'Cash'),
(1, 2, 800, '2026-01-12', 'Bus Fare', 'Cash'),
(1, 3, 5000, '2026-01-15', 'Electric Bill', 'Card'),
(1, 4, 2000, '2026-02-01', 'Movie', 'Card'),
(1, 5, 3500, '2026-02-05', 'Clothes', 'Card'),
(1, 1, 1200, '2026-03-03', 'Dinner', 'Cash');
GO

-- Insert Savings Goals Data
INSERT INTO Savings_Goal
(UserID, GoalName, TargetAmount, CurrentAmount)
VALUES
(1, 'New Laptop', 150000, 50000),
(1, 'Vacation Trip', 100000, 30000);
GO

-- ============================================================
-- 4. QUERY EXAMPLES - ANALYTICS & REPORTS
-- ============================================================

-- Query 1: Show All Users
-- SELECT * FROM Users;

-- Query 2: Show All Expenses
-- SELECT * FROM Expenses;

-- Query 3: Expenses with Category Names (JOIN)
-- SELECT
-- E.ExpenseID,
-- C.CategoryName,
-- E.Amount,
-- E.ExpenseDate,
-- E.Description
-- FROM Expenses E
-- JOIN Categories C ON E.CategoryID = C.CategoryID;

-- Query 4: Total Spending by Category
-- SELECT
-- C.CategoryName,
-- SUM(E.Amount) AS TotalSpent
-- FROM Expenses E
-- JOIN Categories C ON E.CategoryID = C.CategoryID
-- GROUP BY C.CategoryName;

-- Query 5: Dashboard Total Spent
-- SELECT SUM(Amount) AS TotalSpent FROM Expenses;

-- Query 6: Budget Status (Spending vs Limit)
-- SELECT
-- C.CategoryName,
-- C.BudgetLimit,
-- ISNULL(SUM(E.Amount), 0) AS ActualSpent,
-- C.BudgetLimit - ISNULL(SUM(E.Amount), 0) AS RemainingBudget
-- FROM Categories C
-- LEFT JOIN Expenses E ON C.CategoryID = E.CategoryID
-- GROUP BY C.CategoryName, C.BudgetLimit;

-- Query 7: Most Spent Category
-- SELECT TOP 1
-- C.CategoryName,
-- SUM(E.Amount) AS TotalSpent
-- FROM Expenses E
-- JOIN Categories C ON E.CategoryID = C.CategoryID
-- GROUP BY C.CategoryName
-- ORDER BY TotalSpent DESC;

-- Query 8: Least Spent Category
-- SELECT TOP 1
-- C.CategoryName,
-- SUM(E.Amount) AS TotalSpent
-- FROM Expenses E
-- JOIN Categories C ON E.CategoryID = C.CategoryID
-- GROUP BY C.CategoryName
-- ORDER BY TotalSpent ASC;

-- Query 9: Monthly Spending Trend
-- SELECT
-- YEAR(ExpenseDate) AS Year,
-- MONTH(ExpenseDate) AS Month,
-- SUM(Amount) AS TotalSpent
-- FROM Expenses
-- GROUP BY YEAR(ExpenseDate), MONTH(ExpenseDate)
-- ORDER BY Year, Month;

-- Query 10: Weekly Spending Analysis
-- SELECT
-- DATENAME(WEEKDAY, ExpenseDate) AS DayName,
-- SUM(Amount) AS TotalSpent
-- FROM Expenses
-- GROUP BY DATENAME(WEEKDAY, ExpenseDate);

-- Query 11: Trend Analysis (Month-over-Month)
-- SELECT
-- MONTH(ExpenseDate) AS MonthNo,
-- SUM(Amount) AS MonthlyTotal,
-- LAG(SUM(Amount)) OVER (ORDER BY MONTH(ExpenseDate)) AS PreviousMonth
-- FROM Expenses
-- GROUP BY MONTH(ExpenseDate);

-- Query 12: Savings Goal Progress
-- SELECT
-- GoalName,
-- TargetAmount,
-- CurrentAmount,
-- (CurrentAmount * 100.0 / TargetAmount) AS ProgressPercent
-- FROM Savings_Goal;

-- ============================================================
-- END OF SCRIPT
-- ============================================================
