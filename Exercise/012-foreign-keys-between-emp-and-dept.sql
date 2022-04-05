-- Author: Tri Cao <tri.cao@tuni.fi>
-- Date: 2022-03-21
-- File: 012-foreign-keys-between-emp-and-dept.sql

 --EMP         DEPT
         --   id      +-> id
         --   name    |   name
         --   dept  --+   location

-- PRAGMA sends database specific command
-- SQLite does not have foregign keys enabled by default
PRAGMA foreign_keys = ON;
-- CREATE TABLE
-- ---------------------------------------------------

DROP TABLE IF EXISTS dept;

CREATE TABLE dept
(
    id         INTEGER
    ,name    VARCHAR(100)
    , location  VARCHAR(200)
    , CONSTRAINT dept_pk_id
      PRIMARY KEY (id)
);

DROP TABLE IF EXISTS emp;

CREATE TABLE emp
(
   id          INTEGER
   , name     VARCHAR(100)
   , dept      INTEGER

   , CONSTRAINT emp_id_pk
     PRIMARY KEY (id)

   , CONSTRAINT emp_dept_fk
     FOREIGN KEY (dept)
     REFERENCES dept (id)
);

-- ---------------------------------------------------
-- INSERT: dept
-- ---------------------------------------------------

INSERT INTO dept
    (id, name, location)
VALUES
    (10, 'ACCOUNTING', 'NEW YORK' )
;

INSERT INTO dept
    (id, name, location)
VALUES
    (20, 'RESEARCH', 'DALLAS' )
;

INSERT INTO dept
    (id, name, location)
VALUES
    (30, 'SALES', 'CHICAGO' )
;

-- ---------------------------------------------------
-- INSERT: emp
-- ---------------------------------------------------

INSERT INTO emp
    (id, name,dept)
VALUES
    (7369, 'Smith', 20)
;

INSERT INTO emp
    (id, name,dept)
VALUES
    (7499, 'Jane', 30)
;

INSERT INTO emp
    (id, name,dept)
VALUES
    (7844, 'Michael', 10)
;

-- ---------------------------------------------------
-- VIOLATION: Primary key
-- ---------------------------------------------------

-- primary key already exists
-- Error: stepping, UNIQUE constraint failed: dept.id (19)
INSERT INTO dept
    (id, name, location)
VALUES
    (20, 'RESEARCH', 'DALLAS' )
;

-- ---------------------------------------------------
-- VIOLATION: Foreign key
-- ---------------------------------------------------

-- No dept id 100 in the DEPT table
-- Error: stepping, FOREIGN KEY constraint failed (19)
INSERT INTO emp
    (id, name,dept)
VALUES
    (7944, 'Dave', 100)
;

-- End of file
