import pymysql

# Connect to MySQL database
conn = pymysql.connect(host='localhost', user='root', password='Priya@#2468', database='crime_database')
cursor = conn.cursor()

# Query to get the count of crimes for each unique location
query = "SELECT Location, COUNT(*) AS crime_count FROM crime_info GROUP BY Location ORDER BY crime_count DESC LIMIT 1"

# Execute the query
cursor.execute(query)

# Fetch the result
result = cursor.fetchone()

# Close the database connection
conn.close()

# Print the location with the highest crime count
print("Location with the most crimes:", result[0])
