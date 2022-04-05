-- Author: Tri Cao <tri.cao@tuni.fi>
-- Date: 2022-03-21
-- File: 011-foreign-keys-between-person-and-phone.sql

--PERSON      PHONE
        --id      +-> id
        --first   |   number
        --last    |   comment         ("Work, "private". ...)
        --phone --+

-- PRAGMA sends database specific command
-- SQLite does not have foregign keys enabled by default
PRAGMA foreign_keys = ON;
    -- CREATE TABLE
-- ---------------------------------------------------

DROP TABLE IF EXISTS phone;

CREATE TABLE phone
(
    id         INTEGER
    , phone    VARCHAR(100)
    , comment  VARCHAR(3000)
    , CONSTRAINT phone_id_pk
      PRIMARY KEY (id)
);

DROP TABLE IF EXISTS person;

CREATE TABLE person
(
   id          INTEGER
   , first     VARCHAR(200)
   , last      VARCHAR(200)
   , phone     VARCHAR(100)

   , CONSTRAINT person_id_pk
     PRIMARY KEY (id)

   , CONSTRAINT person_phone_fk
     FOREIGN KEY (phone)
     REFERENCES phone (id)
);

-- ---------------------------------------------------
-- INSERT: phone
-- ---------------------------------------------------

INSERT INTO phone
    (id, phone, comment)
VALUES
    (1, '112233', 'comment 1' )
;

INSERT INTO phone
    (id, phone, comment)
VALUES
    (2, '223344', 'comment 2' )
;

INSERT INTO phone
    (id, phone, comment)
VALUES
    (3, '334455', 'comment 3' )
;

-- ---------------------------------------------------
-- INSERT: person
-- ---------------------------------------------------

INSERT INTO person
    (id, first, last, phone)
VALUES
    (1, 'John', 'Doe', 1)
;

INSERT INTO person
    (id, first, last, phone)
VALUES
    (2, 'Jane', 'Doe', 2)
;

INSERT INTO person
    (id, first, last, phone)
VALUES
    (3, 'Michael', 'McGraw', 3)
;

-- ---------------------------------------------------
-- VIOLATION: Primary key
-- ---------------------------------------------------

-- primary key already exists
-- Error: stepping, UNIQUE constraint failed: phone.id (19)
INSERT INTO phone
    (id, phone, comment)
VALUES
    (1, '112233', 'comment' )
;

-- ---------------------------------------------------
-- VIOLATION: Foreign key
-- ---------------------------------------------------

-- No phone id 100 in the PHONE table
-- Error: stepping, FOREIGN KEY constraint failed (19)
INSERT INTO person
    (id, first, last, phone)
VALUES
    (4, 'Dave', 'Abrahams', 100)
;

-- End of file
