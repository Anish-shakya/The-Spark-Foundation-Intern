-- Exploratory Data Analysis On Super Store Sales dataset
--- Creating a table to load dataset in Postgress SQL
CREATE TABLE SuperStore(
	Ship_Mode TEXT,
	Segment TEXT,
	Country TEXT,
	City TEXT,
	State TEXT,
	Postal_code TEXT,
	Region TEXT,
	Category TEXT,
	Sub_Category TEXT,
	Sales NUMERIC,
	Quantity INTEGER,
	Discount NUMERIC,
	Profit NUMERIC
);

select * FROM superstore;
-- 1) Profitability Analysis

-- 1.1) Profit by Region 
SELECT region,SUM(profit) AS Total_Profit
FROM superstore
GROUP BY region
ORDER BY Total_Profit DESC;

-- 1.2) Profit By State
SELECT state,SUM(profit) AS Total_Profit
FROM superstore
GROUP BY state
ORDER BY Total_Profit DESC;

-- 1.3) Profit By city
SELECT city,SUM(profit) AS Total_Profit
FROM superstore
GROUP BY city
ORDER BY Total_Profit DESC;

-- 2) Category and Sub-Category Analysis

-- 2.1) Most and least  Profitable by categories 
WITH CTE AS(
SELECT category,SUM(profit) As total_profit
FROM superstore
GROUP BY category
ORDER BY total_profit DESC
) 
SELECT category,total_profit
FROM CTE 
WHERE total_profit = (SELECT MAX(total_profit) FROM CTE) 
	  OR total_profit = (SELECT MIN(total_profit) FROM CTE)
	
-- 2.2) Most and least Profitable by categories and sub-categories
WITH CTE AS(
	SELECT category,sub_category, SUM(profit) As total_profit
	FROM superstore
	GROUP BY category,sub_category
	ORDER BY total_profit DESC
)
SELECT category,sub_category, total_profit
FROM CTE
WHERE total_profit = (SELECT MAX(total_profit) FROM CTE)
	OR total_profit = (SELECT MIN(total_profit) FROM CTE WHERE total_profit > 0)
 

