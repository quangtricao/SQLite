-- Author: Tri Cao <tri.cao@tuni.fi>
-- Date: 2022-03-31
-- File: 074-alter-4.sql

-- Modify *comment* column to use default value "No
        -- comment" in case of NULL value insert.
BEGIN TRANSACTION;

CREATE TABLE tmp
(
    item            VARCHAR(100)
    , worth         INTEGER
    , comment       VARCHAR(500) DEFAULT "No comment"
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
