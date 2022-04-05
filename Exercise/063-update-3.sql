-- Author: Tri Cao <tri.cao@tuni.fi>
-- Date: 2022-03-26
-- File: 063-update-3.sql

-- Change Stephen Durak's postal code to 44654.
DROP TABLE IF EXISTS users;

CREATE TABLE users
(
    last    VARCHAR(100) NOT NULL
   , first     VARCHAR(100) NOT NULL
   , phone VARCHAR(100) NOT NULL
   , postal_code INTEGER
   , city VARCHAR(100) NOT NULL
   , address VARCHAR(100) NOT NULL
);
INSERT INTO users
    (last, first, phone,city,address)
VALUES
    ('Doe','John','1','New York','2th Avenue')
;
INSERT INTO users
    (last, first, phone,city,address)
VALUES
    ('Jordan','Mike','2','Washington','South Park Bd 3')
;
INSERT INTO users
    (last, first, phone,city,address)
VALUES
    ('Durak','Stephen','3','Florida','Sea Drive 112')
;
UPDATE  users
SET     postal_code= 44564
WHERE last ='Durak' AND first = 'Stephen'
;
-- End of file
