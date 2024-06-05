import pymysql
import pandas as pd

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
    # Using pandas to fetch distinct crime codes and descriptions
    query = "SELECT DISTINCT Crm_Cd, Crm_Cd_Desc FROM crime_info"
    df = pd.read_sql_query(query, connection)

    print("Distinct crime codes and their descriptions:")
    print(df)

finally:
    # Close the connection
    connection.close()
