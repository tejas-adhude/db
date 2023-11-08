# Please ensure you have the mysql-connector-python library installed in your Python environment. You can install it via pip:

# pip install mysql-connector-python

import mysql.connector

# Establish a connection to your MySQL database
connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root",
    database="company"
)

# Create a cursor
cursor = connection.cursor()

# Execute a query
query = "SELECT * FROM employees"
cursor.execute(query)

# Define a function to process each row fetched
def process_row(row):
    # Perform actions with the fetched row
    print(row)

# Fetch data using a for loop and explicit cursor
for row in cursor:
    process_row(row)

# Close the cursor and connection
cursor.close()
connection.close()