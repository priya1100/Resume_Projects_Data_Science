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
        # Query to get the total number of records
        query_total_records = "SELECT COUNT(*) FROM crime_data"
        cursor.execute(query_total_records)
        total_records = cursor.fetchone()[0]

        print(f"Total number of records: {total_records}")

        # Query to get the number of unique values in specific columns (example: Vict_Sex column)
        query_unique_values = "SELECT COUNT(DISTINCT Vict_Sex) FROM crime_data"
        cursor.execute(query_unique_values)
        unique_values = cursor.fetchone()[0]

        print(f"Number of unique values in Vict_Sex column: {unique_values}")

finally:
    # Close the connection
    connection.close()

