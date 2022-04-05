SQLITE

1 SQLITE DOCUMENTATION

    https://www.sqlite.org/cli.html
    https://www.sqlite.org/lang.html
    https://www.sqlite.org/lang_corefunc.html

    https://www.sqlitetutorial.net
    https://tableplus.com/blog/2018/08/download-install-sqlite-for-mac-osx-in-5-minutes.html

    SQLite is a simple local database, which does not have a SERVER component
    but only the CLIENT. A single file is used to store all the data.

2 SQLITE DATABASE

To log into database (will create if does not exist), use client command "sqlite3":

    sqlite3 <name>.db

An example:

    sqlite3 test.db

You are inside client when prompt changes to:

    sqlite>

3 SQLITE CLIENT

Client commands are dot-based. Examples:

    .help           List all commands
    .tables         List name of tables
    .databases      List names and files of attached databases

    .dump           List database content as SQL
    .dummp TABLE    List table information
    .schema         Show information on *all* tables
    .schema TABLE   Show table information

    .read FILE      Execute SQL commands from file
    .quit           Also ".q"

Useful options (can be stored to ~/.sqliterc):
    .headers on     Show headers (SELECT)
    .mode column    Better laoyut (SELECT)
    .nullvalue      NULL

Options can also be activated on command line:

    sqlite3 -column -header -nullvalue NULL <database>.db

There is a read-only table which can be queried for information:

    .schema SQLITE_MASTER

    SELECT   type
             , name
             , tbl_name
    FROM     SQLITE_MASTER
    ORDER BY type ASC
             , name ASC
    ;

4 SQLITE AND RUNNING SQL COMMANDS

You can use any editor provided that it is configured to use SPACES instead of TABS
for indentation. Consult the editor's preferences, settings or manual where
this is configured.

	1. Write the SQL command in an editor.
	2. Copy/paste the SQL command into the client prompt:

	    sqlite> ... copy/paste here ...

	3. If the command gets stuck, type ";" which means END-OF-SQL-STATEMENT
	to reset the prompt back to:

	    sqlite>

5 SQLITE AND INSTALLING A DATABASE

    1. Download the database installation file, like:

        create.sql (example file)

    2. Log into the SQLite database with client (see 3.2) and install
    database by reading the commands in the SQL fils:

        sqlite> .read create.sql

6 INFORMATION SCHEMA

https://sqlite.org/schematab.html

The schema for a database is a description of all of the other
tables, indexes, triggers, and views that are contained within
the database.

SELECT	name
	, type
	, tbl_name
FROM	sqlite_schema
;