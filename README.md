# SQL
### SQL is a standard when it comes to manipulating and querying data. 
 One of key benefits being that SQL allows users to quickly and efficiently input and retrieve information from relational databases. A relational database is a type of database that stores and provides access to data points that are related to one another (Oracle, What is a relational database?), think of this as an excel spreadsheet with columns and rows. They can be made up of one or more of these tables with each row identified by a unique key (primary key). The collection of these database objects is referred to as a Schema. Schemas are a useful mechanism to segregate database objects for different applications, access rights, and managing security administration of databases (Rajendra GuptaRajendra , 2019). One of my favorite advantages when using SQL would be having the ability to only retrieve the data that is task specific.
### Normally, I do a majority of data manipulation and analysis using the Pandas library. 
However, when trying to subset a dataframe with multiple conditions, the syntax gets pretty complicated. Using SQL statements such as SELECT, DISTINCT, and LIKE, we can save computation time by only retrieving the data that serves our goal. The image below is an example of a relational database schema. Each rectangle being a table, with the table name listed at the top. Below the each of the table names is a list of column names associated with each table. The column names with an asterix(*), gold keys in this case, indicate that it is the primary key (unique identifier) for the table. As you can see, the primary key from one table may also be in another table. This is known foreign key (the primary key from a different table), blue diamonds in this case.

The SQLite library has a very efficient Relational Database Management System (RDBMS). SQLite3 provides users with many beneficial features, the most noticeable being that it is self-contained, severless, and zero-configuration (What is SQLite? Top SQLite Features You Should Know 2020).

## SQLite3 in Action
For this tutorial I will install and load in the necessary libraries, connect to the database, and then begin sending queries. A few of the examples used below were taken from _LucasMcL/15-sql_queries_02-chinook_. The installation may not be needed if you’re using Python version 3.

Installing SQLite3
Importing SQLite3
pip install pysqlite3
import sqlite3
Connecting to the database
conn = sqlite3.connect('data/Chinook_Sqlite.sqlite')
Instantiating a cursor object to fetch query results
cur = conn.cursor()
Now that we are connected to the database, we can query the data within. Using the cursor object to execute queries only returns the cursor object. In order to see the results, we need to use the fetchall() method afterwards.

Executing a query with the SELECT statement and the WHERE clause to see how many tables are in the database. The WHERE clause generally filters results of a query by some condition. In the example below, I am using it to return the name of objects in the database that are of the type ‘table’. Every SQLite database has an sqlite_master table containing information about the schema. Ending the query with a semicolon indicates the end of a statement. If we wanted the query to return all records in the table, use an asterix(*) in place of name.
cur.execute("SELECT name FROM sqlite_master WHERE type='table';")
print(cur.fetchall())
# Output:
[('Album',), ('Artist',), ('Customer',), ('Employee',), ('Genre',), ('Invoice',), ('InvoiceLine',), ('MediaType',), ('Playlist',), ('PlaylistTrack',), ('Track',)]
The output of this query statement returned all of the tables in the database.
Say we wanted even more detailed information on each of the tables in the database, the PRAGMA command will give us just that.
cur.execute("PRAGMA table_info(Employee)")
info = cur.fetchall()
print(*info, sep = "n")
# Output:
(0, 'EmployeeId', 'INTEGER', 1, None, 1)
(1, 'LastName', 'NVARCHAR(20)', 1, None, 0)
(2, 'FirstName', 'NVARCHAR(20)', 1, None, 0)
(3, 'Title', 'NVARCHAR(30)', 0, None, 0)
(4, 'ReportsTo', 'INTEGER', 0, None, 0)
(5, 'BirthDate', 'DATETIME', 0, None, 0)
(6, 'HireDate', 'DATETIME', 0, None, 0)
(7, 'Address', 'NVARCHAR(70)', 0, None, 0)
(8, 'City', 'NVARCHAR(40)', 0, None, 0) 
(9, 'State', 'NVARCHAR(40)', 0, None, 0)
(10, 'Country', 'NVARCHAR(40)', 0, None, 0)
(11, 'PostalCode', 'NVARCHAR(10)', 0, None, 0)
(12, 'Phone', 'NVARCHAR(24)', 0, None, 0)
(13, 'Fax', 'NVARCHAR(24)', 0, None, 0)
(14, 'Email', 'NVARCHAR(60)', 0, None, 0)
The output of this query statement returned the Employee table's Column ID, Column Name, Column Type, Not Null Values, Default Value, and Primary Key.
If you’d like the output in a format where you can manipulate or process the data, using Pandas to wrap the query results into a dataframe can save time. The cursor.description attribute returns a column description containing:

1. name
2. type_code
3. display_size
4. internal_size
5. precision
6. scale
7. null_ok
Using the description attribute, we can fetch the name of each column using list comprehension. Below is a query statement selecting the customers’ full name, id, and country who are not in the US with the results wrapped in a dataframe.

# Importing Pandas
import pandas as pd
cur.execute("""
    SELECT FirstName, LastName, CustomerId, Country
    FROM customer
    WHERE country != 'USA'
""")
df = pd.DataFrame(cur.fetchall())
df.columns = [x[0] for x in cur.description]
df.head(10)
# Output:
Filtering and Ordering with SQL
Back to the point where SQL queries allow you to retrieve only the data relevant to your task. There are a handful of query modifiers I will go over, ORDER BY being the first. This modifier allows us to sort the results of a SELECT statement by a particular feature.
The LIMIT clause is exactly what it sounds like, it limits the output to a set number of results. This is similar to viewing the output of a Pandas dataframe using the df.head(10) attribute.
The BETWEEN operator allows us to further select specific data by filtering the results that are between set values. This can be extremely useful when querying for a specific age group, time frame, etc.
Below I am executing a query to select data from the track table where the track’s length in milliseconds is between 205205 and 300000. The results are sorted by the tracks’ milliseconds and in descending order, so the tracks with the longer tracks will be at the top. I am also limiting this query to only output 10 results.
cur.execute("""
    SELECT Name, AlbumId, TrackId, Milliseconds
    FROM track
    WHERE Milliseconds BETWEEN 205205 AND 300000
    ORDER BY Milliseconds Desc
    LIMIT 10
""")
info = cur.fetchall()
print(*info, sep = "n")
# Output:
('Breathe', 212, 2613, 299781)
('Queixa', 23, 524, 299676)
('Getaway Car', 10, 97, 299598)
('Winterlong', 201, 2485, 299389)
('Cherub Rock', 202, 2491, 299389)
('Sonata for Solo Violin: IV: Presto', 325, 3480, 299350)
('Linha Do Equador', 21, 218, 299337)
('Who Are You (Single Edit Version)', 221, 2749, 299232)
('Garden', 181, 2201, 299154)
('The Spirit Of Radio', 196, 2406, 299154)
Aggregate Functions
These SQL functions can be really helpful when performing statistical analysis. We can get the average values, minimum and maximum values, and the sum of values in a column. The COUNT function returns the number of records that meet a certain condition.
The GROUP BY function will return your results grouped together by a set column. Examples of this would be grouping results by gender, breed, or nationality.
Below is an example query for total sales per country with the results being grouped by each country. I am also aliasing the sum of totals as ‘TotalSales’ in order to group the results by the total sales for each country.
cur.execute('''
    SELECT i.billingcountry, sum(total) as 'TotalSales'
    FROM invoice AS i
    GROUP BY billingcountry
    ORDER BY totalsales DESC
    '''
)
info = cur.fetchall()
print(*info, sep = "n")
# Output:
('USA', 523.0600000000003)
('Canada', 303.9599999999999)
('France', 195.09999999999994)
('Brazil', 190.09999999999997)
('Germany', 156.48)
('United Kingdom', 112.85999999999999)
('Czech Republic', 90.24000000000001)
('Portugal', 77.23999999999998)
('India', 75.25999999999999)
('Chile', 46.62)
('Ireland', 45.62)
('Hungary', 45.62)
('Austria', 42.62)
('Finland', 41.620000000000005)
('Netherlands', 40.62)
('Norway', 39.62)
('Sweden', 38.620000000000005)
('Poland', 37.620000000000005)
('Italy', 37.620000000000005)
('Denmark', 37.620000000000005)
('Australia', 37.620000000000005)
('Argentina', 37.620000000000005)
('Spain', 37.62)
('Belgium', 37.62)
If you would like to take a further look into SQL aggregators and select statements, sqlclauses and zetcode provide some very useful examples.

https://github.com/Varna12334/SQL
