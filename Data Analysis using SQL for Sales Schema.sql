# 1. Show all Customer Records
SELECT * FROM sales.customers LIMIT 1000;

# 2. Show Total Number of Customers
SELECT COUNT(*) FROM sales.customers;

# 3. Show all Date Records
SELECT * FROM sales.date LIMIT 1000;

# 4. Show all Market Records
SELECT * FROM sales.markets LIMIT 1000;

# 5. Show Transactions for Chennai market (market code for Chennai is Mark001)
SELECT * FROM sales.markets WHERE markets_code = "Mark001";

# 6. Show all Product Records
SELECT * FROM sales.products LIMIT 1000;

# 7. Show all Transaction Records
SELECT * FROM sales.transactions LIMIT 1000;

# 8. Show Distinct product codes that were sold in Chennai
SELECT DISTINCT product_code FROM sales.transactions WHERE market_code = "Mark001";

# 9. Show all Transactions WHERE currency is US Dollars
SELECT * FROM sales.transactions WHERE currency = "USD";

# 10. Show Transactions in 2020 join by Date Table
SELECT 
	tr.*, d.* 
FROM sales.transactions AS tr 
INNER JOIN sales.date AS d 
ON tr.order_date = d.date
WHERE d.year = "2020";

# 11. Show Total Revenue in Year 2020 in India
SELECT 
	SUM(tr.sales_amount) AS total_revenue 
FROM sales.transactions AS tr 
INNER JOIN sales.date AS d 
ON tr.order_date = d.date
WHERE d.year = "2020"
AND tr.currency = "INR";

# 12. Show Total Revenue in Year 2020 in India for January Month
SELECT 
	SUM(tr.sales_amount) AS total_revenue 
FROM sales.transactions AS tr 
INNER JOIN sales.date AS d 
ON tr.order_date = d.date
WHERE d.year = "2020"
AND d.month_name = "January"
AND tr.currency = "INR";

# 13. Show Total Revenue in Year 2020 for Chennai location
SELECT
	SUM(tr.sales_amount) AS total_revenue
FROM sales.transactions as tr
INNER JOIN sales.date AS d
ON tr.order_date = d.date
WHERE d.year = "2020"
AND  tr.market_code = "Mark001";