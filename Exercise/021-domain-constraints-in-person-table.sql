-- Author: Tri Cao <tri.cao@tuni.fi>
-- Date: 2022-03-21
-- File: 021-domain-constraints-in-person-table.sql

--Record information on *person:* name, phone, date
        --of birth (dob). Define constraints for:

        --    PHONE NUMBER is longer than 5
        --    DOB is later than 1930

DROP TABLE IF EXISTS person;

CREATE TABLE person
(
    name    VARCHAR(200)
   , phone     VARCHAR(100)
   , dob DATE
   , CHECK (LENGTH(phone) >5)
   , CHECK (STRFTIME('%Y',dob) >'1930')
);
-- Fail: phone
INSERT INTO person
    (name, phone, dob)
VALUES
    ('John','+1 12', '1980-01-01')
;

-- Fail: dob
INSERT INTO person
    (name, phone, dob)
VALUES
    ('John','+1 120 235 25', '1920-01-01')
;
-- End of file
