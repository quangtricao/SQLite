-- Author: Tri Cao <tri.cao@tuni.fi>
-- Date: 2022-03-31
-- File: 071-alter-1.sql

-- Make the column *comment* and *item* longer than
-- what you created by 100 characters.

DROP TABLE IF EXISTS inventory;

CREATE TABLE inventory
(
    item    VARCHAR(100) NOT NULL
   , worth     INTEGER NOT NULL
   , comment VARCHAR(400) NOT NULL
);
INSERT INTO inventory
    (item, worth, comment)
VALUES
    ( 'baseball',150,'My first baseball')
;
INSERT INTO inventory
    (item, worth, comment)
VALUES
    ( 'bike',2000,'For mountain riding')
;
INSERT INTO inventory
    (item, worth, comment)
VALUES
    ( 'playcards',10,'Funny pictures')
;
-- EXERCISE: 7.1 Alter 1
--
--     Make the column *comment* and *item* longer than
--     what you created by 100 characters.
--
-- HOW TO SOLVE THE EXERCISE
-- -------------------------
--
-- SQLite does not have "ALTER TABLE" command
-- to modify data type for a column. The plan:
--
-- <start transaction>
--
-- 1. Create a temporary table "tmp"
--    New table conatins new column definitions
--        item    VARCHAR(180)
--        ...
--        comment VARCHAR(1100)
--
-- 2. Copy data from ORIGINAL table to the new "tmp" table
--    ... copying is INSERT with SELECT ...
--
-- 3. Drop ORIGINAL table
--
-- 4. Rename "tmp" to ORIGINAL table.
--
-- <end transaction>

BEGIN TRANSACTION;

CREATE TABLE tmp
(
    item            VARCHAR(100)
    , worth         INTEGER
    , comment       VARCHAR(500)
);

INSERT INTO tmp
SELECT      *
FROM        inventory
;

DROP TABLE inventory;

ALTER TABLE tmp
RENAME TO   inventory
;

COMMIT;
-- End of file
