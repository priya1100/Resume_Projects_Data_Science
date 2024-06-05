-- Question22:Identify the customer type with the highest purchase frequency.
SELECT customer_type FROM (SELECT customer_type,COUNT(*) AS purchase_frequency FROM amazon_sales 
GROUP BY customer_type ORDER BY purchase_frequency DESC LIMIT 1) AS highest_purchase_frequency_customer_type;

-- Question23:Determine the predominant gender among customers
SELECT gender FROM (SELECT gender,COUNT(*) AS count FROM amazon_sales
GROUP BY gender ORDER BY count DESC LIMIT 1) AS predominant_gender;

-- Question24:Examine the distribution of genders within each branch.
SELECT branch,gender,COUNT(*) AS count FROM amazon_sales
GROUP BY branch,gender;

-- Question25:Identify the time of day when customers provide the most ratings.
SELECT timeofday,COUNT(Rating) AS rating_count FROM amazon_sales
GROUP BY timeofday ORDER BY rating_count DESC LIMIT 1;

-- Question26:Determine the time of day with the highest customer ratings for each branch.
SELECT branch,timeofday,AVG(Rating) AS average_rating FROM amazon_sales
GROUP BY branch,timeofday HAVING AVG(Rating) = (SELECT MAX(avg_rating) FROM (SELECT branch,timeofday,
AVG(Rating) AS avg_rating FROM amazon_sales GROUP BY branch,timeofday) AS branch_timeofday_avg_ratings
WHERE branch = amazon_sales.branch);

-- Question27:Identify the day of the week with the highest average ratings.
SELECT dayname,AVG(Rating) AS average_rating FROM amazon_sales
GROUP BY dayname ORDER BY average_rating DESC LIMIT 1;

-- Question28:Determine the day of the week with the highest average ratings for each branch.
SELECT branch,dayname,AVG(Rating) AS average_rating FROM 
amazon_sales GROUP BY branch,dayname HAVING AVG(Rating) = (SELECT MAX(avg_rating) FROM 
 (SELECT branch,dayname,AVG(Rating) AS avg_rating FROM amazon_sales GROUP BY branch,dayname
 ) AS branch_day_avg_ratings WHERE branch = amazon_sales.branch);
