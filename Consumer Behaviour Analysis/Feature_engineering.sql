-- see all columns in amazon_sales 
select * from amazon_sales;

-- Feature engineering : add columns (created from existing columns)
-- Add a new column for time of day (Morning, Afternoon, Evening)
ALTER TABLE amazon_sales
ADD COLUMN timeofday ENUM('Morning', 'Afternoon', 'Evening');

-- Update the timeofday column based on the hour of the time column
UPDATE amazon_sales
SET timeofday = CASE 
    WHEN HOUR(time) >= 0 AND HOUR(time) < 12 THEN 'Morning'
    WHEN HOUR(time) >= 12 AND HOUR(time) < 17 THEN 'Afternoon'
    ELSE 'Evening'
END;

-- Add a new column for day of the week (Mon, Tue, Wed, Thu, Fri)
ALTER TABLE amazon_sales
ADD COLUMN dayname VARCHAR(3);

-- Update the dayname column based on the day of the date column
UPDATE amazon_sales
SET dayname = LEFT(DAYNAME(date), 3);

-- Add a new column for month of the year (Jan, Feb, Mar, etc.)
ALTER TABLE amazon_sales
ADD COLUMN monthname VARCHAR(3);

-- Update the monthname column based on the month of the date column
UPDATE amazon_sales
SET monthname = LEFT(MONTHNAME(date), 3);
