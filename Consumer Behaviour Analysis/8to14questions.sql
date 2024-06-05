-- Question8:Which product line generated the highest revenue?
SELECT product_line,SUM(total) AS total_revenue FROM amazon_sales
GROUP BY product_line
ORDER BY total_revenue DESC 
LIMIT 1;

-- Question9:In which city was the highest revenue recorded?
SELECT city,SUM(total) AS total_revenue FROM amazon_sales
GROUP BY city ORDER BY total_revenue DESC
LIMIT 1;

-- Question10:Which product line incurred the highest Value Added Tax?
SELECT product_line,SUM(VAT) AS total_vat
FROM amazon_sales
GROUP BY product_line
ORDER BY total_vat DESC
LIMIT 1;

-- Question11:For each product line, add a column indicating "Good" if its sales are above average, otherwise "Bad.
SELECT *,CASE WHEN total > avg_sales THEN 'Good'ELSE 'Bad'END AS sales_category
FROM (
    SELECT *,(SELECT AVG(total) FROM amazon_sales) AS avg_sales FROM amazon_sales) AS with_avg_sales;

-- Question12:Identify the branch that exceeded the average number of products sold.
SELECT branchFROM (SELECT branch,AVG(quantity) AS avg_quantity FROM 
                   amazon_sales GROUP BY branch) AS branch_avg WHERE 
                   avg_quantity > (SELECT AVG(quantity) FROM amazon_sales);

-- Question13:Which product line is most frequently associated with each gender?
SELECT gender,product_line,COUNT(*) AS count FROM amazon_sales
GROUP BY gender,product_line
HAVING count = (SELECT MAX(sub.count)FROM (SELECT gender,product_line,COUNT(*) AS count
            FROM amazon_sales GROUP BY gender,product_line) AS sub
            WHERE sub.gender = amazon_sales.gender GROUP BY sub.gender);
            
-- Question14:Calculate the average rating for each product line.
SELECT product_line,AVG(Rating) AS average_rating FROM amazon_sales GROUP BY product_line
ORDER BY average_rating DESC;

