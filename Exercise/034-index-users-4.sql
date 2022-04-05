-- Author: Tri Cao <tri.cao@tuni.fi>
-- Date: 2022-03-24
-- File: 034-index-users-4.sql

-- Write SQL command file to remove all created
        -- indexes from the table.
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
DROP INDEX users__first_index;
DROP INDEX users__last_index;
DROP INDEX users__phone_index;
-- End of file
