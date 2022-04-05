-- Author: Tri Cao <tri.cao@tuni.fi>
-- Date: 2022-03-31
-- File: 072-alter-2.sql

-- Add attribute NOT NULL definition to the *item*
        -- column. This makes it possible to use the column
        -- as an index.
DROP TABLE IF EXISTS inventory;

CREATE TABLE inventory
(
    item    VARCHAR(100)
   , worth     INTEGER
   , comment VARCHAR(400)
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

BEGIN TRANSACTION;

CREATE TABLE tmp
(
    item            VARCHAR(100) NOT NULL
    , worth         INTEGER NOT NULL
    , comment       VARCHAR(500) NOT NULL
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
