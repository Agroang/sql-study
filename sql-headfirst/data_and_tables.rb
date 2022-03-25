# A database contains tables.
# A table is the structure inside your database that contains data, organized in
# columns and rows. Each category becomes a column and each entry(object) a row.

# Databases contain connected data

# A column is a piece of data stored by your table. A row is a single set of
# columns that describe attributes of a single thing. Columns and rows together
# make up a table.

# You’ll often see the word field used instead of column. They mean the same
# thing. Also, row and record are often used interchangeably

# To manually create a database:(using Ruby syntax, normally you wouldn't need
# SQL tags that I used)
<<-SQL
CREATE DATABASE matias_list;
SQL

# To actually use the created database we do the following:
<<-SQL
USE matias_list;
SQL

# To create a table in the database:
<<-SQL
CREATE TABLE doughnut_list
(
  doughnut_name VARCHAR(10),
  doughnut_type VARCHAR(8)
);
SQL

# The open parenthesis opens the list of columns to create
# The VARCHAR is the DATA TYPE. It stands for VARiable and CHARacter and is used
# to hold information that's stored as text. The numbers how many characters the
# text can hold.

# Some of the most common data types:
# VARCHAR holds text data of up to 255 characters in length.
# DATETIME/TIMESTAMP keeps track of the date and time.
# TIME keeps track of the time (doesn't care about the date).
# DATE keep tracks of your dates (doesn't care about the time).
# DEC, short for decimal, gives you decimal places
# CHAR, short for character, data to be a set length
# INT, short for integer, whole numbers but also negative numbers
# BLOB, short for binary large object, stores large amounts of text data.

# *The data type names changes depending on the data base that you use so
# make sure to check beforehand about the data types that the database that
# you use employ*

# Choosing the right data type is not only about organization and functionality
# (you can only run certain operations on certain data types) but also about
# space, using BLOB instead of VARCHAR is a lot of wated space and you can
# run out of space!

#  Choosing the best matching data type for each column in your table will
# reduce the size of table and make operations on your data faster!

# TIMESTAMP is usually used to capture the current time. DATETIME is best used
# to store a future event.

# To see how your table looks like:
<<-SQL
DESC table_name;
SQL

# DESC is short for describe.

# You can't re-create a table that you already made! (you would have to start
# over). You can change tables as well if needed.

# To get rid of/delete a table:
<<-SQL
DROP TABLE table_name;
SQL

# *DROP TABLE will work whether or not there is data in your table, so use the
# command with extreme caution! Once the table is dropped, it's gone along with
# any data that was on it.

# To insert data into a table:
<<-SQL
INSERT INTO table_name (column_one, column_two)
VALUES ('value_one', 'value_two');
SQL

# The values need to be in the same order as the column names!!
# The values must have single quotes when you insert text.

# The DATE type requires a specific format (depends on your database). Check
# if unsure.

# Actual example for INSERT:
<<-SQL
INSERT INTO my_contacts
(last_name, first_name, email, gender, birthday, profession, place, situation,
interests, seeking)
VALUES
('Anderson', 'Jillian', 'jill_anderson@example.com', 'F', '1980-09-05',
'Technical Writer', 'Palo Alto, CA', 'Single', 'Kayaking, Reptiles',
'Relationship, Friends');
SQL

# Any value that goes into VARCHAR, CHAR, DATE, or BLOB column has a single
# quote around it. DEC and INT don't use quotes.

# Example with numerics:

<<-SQL
INSERT INTO doughnut_purchases
(donut_type, dozens, topping, price)
VALUES
('jelly', 3, 'sprinkles', 3.50);
SQL

# Variations on a INSERT statement:
# 1 - Changing the original order of the columns: Works as longs as you also
# change in the same way the order of the inserted values.
# 2 - Omitting column names: You can leave out the list of column names but the
# values must ALL be there and in the SAME ORDER that you added your columns.
<<-SQL
INSERT INTO doughnut_purchases
VALUES
(...);
SQL
# 3 - Leaving some columns out: You can insert a few columns and leave some out.
# But by doing this you need to specify which columns are you using to inset the
# data into.
<<-SQL
INSERT INTO my_contacts
(last_name, first_name, email)
VALUES
('Anderson', 'Jillian', 'random_email@example.com');
SQL

# To see the data in your table (DESC only shows the structure, not the data):

<<-SQL
SELECT * FROM my_contacts;
SQL

# (*) means to select EVERYTHING from the my_contacts table.

# The columns that do not have value assigned are represented with NULL.

#  A value can be NULL, but it never equals NULL because NULL is an undefined
# value.

# There are times when you want your columns to always hold a certain value and
# not be NULL. You can set your table to not accept NULL values for columns.
<<-SQL
CREATE TABLE my_contacts
(
  last_name VARCHAR (30) NOT NULL,
  first_name VARCHAR (20) NOT NULL
);
SQL

# With the above code you MUST provide a value for both columns or you will get
# an error.

# In most cases you will want your columns to not be NULL unless you know that
# will fill in the data later.

# If we have a column that we know is usually a specific value, we can assign it
# a DEFAULT value. The value that follows the DEFAULT keyword is automatically
# inserted into the table each time a row is  added if no other value is
# specified. The default value has to be of the same type of value as the column.
<<-SQL
CREATE TABLE random_list
(
  random_name VARCHAR(10) NOT NULL,
  random_type VARCHAR(8) NOT NULL,
  random_price DEC(3,2) NOT NULL DEFAULT 1.00
)
SQL

# DEC(3,2) means that the total digits allowed are 3, with 1 before and 2 after
# the decimal.

# With the above code, if no price is given the it will default to 1.00
