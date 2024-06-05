import pymysql
import matplotlib.pyplot as plt

# Connect to MySQL database
conn = pymysql.connect(host='localhost', user='root', password='Priya@#2468', database='crime_database')
cursor = conn.cursor()

# Query to get the count of crimes for each unique crime code
query = "SELECT Crm_Cd, COUNT(*) AS crime_count FROM crime_info GROUP BY Crm_Cd"

# Execute the query
cursor.execute(query)

# Fetch the results
results = cursor.fetchall()

# Close the database connection
conn.close()

# Extracting data for plotting
crime_codes = [result[0] for result in results]
crime_counts = [result[1] for result in results]

# Plotting
plt.bar(crime_codes, crime_counts, color='red')
plt.xlabel('Crime Code')
plt.ylabel('Crime Count')
plt.title('Distribution of Reported Crimes by Crime Code')
plt.xticks(rotation=45, ha='right')
plt.tight_layout()
plt.show()
