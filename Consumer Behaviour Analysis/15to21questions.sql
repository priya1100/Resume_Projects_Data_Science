-- Question15:Count the sales occurrences for each time of day on every weekday.
SELECT dayname,timeofday,COUNT(*) AS count FROM amazon_sales
GROUP BY dayname,timeofday
ORDER BY 
    FIELD(dayname, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'), 
    FIELD(timeofday, 'Morning', 'Afternoon', 'Evening');

-- Question16:Identify the customer type contributing the highest revenue
SELECT customer_type,SUM(total) AS total_revenue
FROM amazon_sales GROUP BY customer_type ORDER BY total_revenue DESC LIMIT 1;

-- Question17:Determine the city with the highest VAT percentage.
SELECT city,SUM(VAT) / SUM(total) * 100 AS vat_percentage FROM amazon_sales
GROUP BY city ORDER BY vat_percentage DESC LIMIT 1;

-- Question18:Identify the customer type with the highest VAT payments
SELECT customer_type,SUM(VAT) AS total_vat_payments FROM amazon_sales
GROUP BY customer_type ORDER BY total_vat_payments DESC LIMIT 1;

-- Question19:What is the count of distinct customer types in the dataset?
SELECT COUNT(DISTINCT customer_type) AS distinct_customer_types_count
FROM amazon_sales;

-- Question20:What is the count of distinct payment methods in the dataset?
SELECT COUNT(DISTINCT payment_method) AS distinct_payment_methods_count
FROM amazon_sales;

-- Question21:Which customer type occurs most frequently?
SELECT customer_type FROM (SELECT customer_type,COUNT(*) AS count FROM amazon_sales 
GROUP BY customer_type ORDER BY count DESC LIMIT 1) AS most_frequent_customer_type;

