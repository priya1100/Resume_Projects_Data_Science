import matplotlib.pyplot as plt
import pymysql

# MySQL connection parameters
host = 'localhost'
user = 'root'
password = 'Priya@#2468'
database = 'crime_database'

# Connect to MySQL server
connection = pymysql.connect(host=host,
                             user=user,
                             password=password,
                             database=database)

try:
    with connection.cursor() as cursor:
        # Query to fetch victim ages from the crime_info table
        query = "SELECT Vict_Age FROM crime_info WHERE Vict_Age IS NOT NULL"

        # Execute the query
        cursor.execute(query)

        # Fetch all rows
        rows = cursor.fetchall()

        # Extract victim ages into a list
        victim_ages = [row[0] for row in rows]

        # Plot the histogram
        plt.figure(figsize=(10, 6))
        plt.hist(victim_ages, bins=20, color='skyblue', edgecolor='black')
        plt.xlabel('Age')
        plt.ylabel('Frequency')
        plt.title('Distribution of Victim Ages in Reported Crimes')
        plt.grid(True)
        plt.show()

finally:
    # Close the connection
    connection
