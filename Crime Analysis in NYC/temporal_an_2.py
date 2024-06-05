import pymysql
import matplotlib.pyplot as plt

# Connect to MySQL database
conn = pymysql.connect(host='localhost', user='root', password='Priya@#2468', database='crime_database')
cursor = conn.cursor()

# Query to get the count of crimes for male and female victims
query = "SELECT Vict_Sex, COUNT(*) AS crime_count FROM crime_info GROUP BY Vict_Sex"

# Execute the query
cursor.execute(query)

# Fetch the results
results = cursor.fetchall()

# Close the database connection
conn.close()

# Extracting data for plotting
genders = [result[0] for result in results]
crime_counts = [result[1] for result in results]

# Plotting
plt.bar(genders, crime_counts, color=['blue', 'pink'])
plt.xlabel('Gender')
plt.ylabel('Crime Count')
plt.title('Crime Rates by Gender')
plt.show()
