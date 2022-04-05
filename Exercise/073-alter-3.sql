-- Author: Tri Cao <tri.cao@tuni.fi>
-- Date: 2022-03-31
-- File: 073-alter-3.sql

-- Remove attribute NOT NULL definition from the
     --   *item* column
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
