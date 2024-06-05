-- Question1 : What is the count of distinct cities in the dataset?
SELECT COUNT(DISTINCT city) AS distinct_cities_count
FROM amazon_sales;

-- Question2: For each branch, what is the corresponding city?
SELECT branch, GROUP_CONCAT(DISTINCT city) AS city
FROM amazon_sales
GROUP BY branch;

--  Question3:What is the count of distinct product lines in the dataset?
SELECT COUNT(DISTINCT product_line) AS distinct_product_lines_count
FROM amazon_sales;

-- Question4:Which payment method occurs most frequently?
SELECT payment_method, COUNT(*) AS frequency
FROM amazon_sales
GROUP BY payment_method
ORDER BY frequency DESC
LIMIT 1;

-- Question5:Which product line has the highest sales?
SELECT product_line, SUM(total) AS total_sales
FROM amazon_sales
GROUP BY product_line
ORDER BY total_sales DESC
LIMIT 1;

-- Question6:How much revenue is generated each month?
SELECT monthname,SUM(total) AS revenue
FROM amazon_sales
GROUP BY monthname

-- Question7:In which month did the cost of goods sold reach its peak?
SELECT monthname,SUM(cogs) AS total_cogs
FROM amazon_sales
GROUP BY monthname
ORDER BY total_cogs DESC
LIMIT 1;
