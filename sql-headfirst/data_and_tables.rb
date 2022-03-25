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
