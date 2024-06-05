import matplotlib.pyplot as plt
import pandas as pd
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
        # Query to fetch latitude and longitude data from the crime_info table
        query = "SELECT LAT, LON FROM crime_info"

        # Execute the query
        cursor.execute(query)

        # Fetch all rows
        rows = cursor.fetchall()

        # Extract latitude and longitude values into separate lists
        latitudes = [row[0] for row in rows]
        longitudes = [row[1] for row in rows]

        # Plot the histogram
        plt.figure(figsize=(10, 8))
        plt.hexbin(longitudes, latitudes, gridsize=50, cmap='Reds', alpha=0.7)
        plt.colorbar(label='Crime Count')
        plt.xlabel('Longitude')
        plt.ylabel('Latitude')
        plt.title('Geographical Hotspots for Reported Crimes')
        plt.show()

finally:
    # Close the connection
    connection.close()
