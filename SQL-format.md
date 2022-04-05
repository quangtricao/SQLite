All of the answers provide settings you can type at the SQLite console or via CLI,
but nobody mentions that these settings can be put into an RC file to avoid
having to type them all the time. Save this as ~/.sqliterc:

.mode column
.headers on
.separator ROW "\n"
.nullvalue NULL

Note I've also added a placeholder for null values, instead of the default empty string.


https://dba.stackexchange.com/questions/40656/how-to-properly-format-sqlite-shell-output