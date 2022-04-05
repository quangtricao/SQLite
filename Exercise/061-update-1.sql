-- Author: Tri Cao <tri.cao@tuni.fi>
-- Date: 2022-03-26
-- File: 061-update-1.sql

-- Change John Doe's address to "21th Street".
DROP TABLE IF EXISTS users;

CREATE TABLE users
(
    last    VARCHAR(100) NOT NULL
   , first     VARCHAR(100) NOT NULL
   , phone VARCHAR(100) NOT NULL
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
SET     address= '21th Street'
WHERE last ='Doe' AND first = 'John'
;
-- End of file
