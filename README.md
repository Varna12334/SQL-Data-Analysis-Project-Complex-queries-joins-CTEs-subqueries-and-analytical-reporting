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
cur.execute("SELECT name FROM sqlite_master WHERE type='table';")print(cur.fetchall())


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

