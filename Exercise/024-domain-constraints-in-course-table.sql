-- Author: Tri Cao <tri.cao@tuni.fi>
-- Date: 2022-03-21
-- File: 024-domain-constraints-in-course-table.sql

-- Record information on *course*: description,
        -- lecturer, duration in weeks, credit units.
        -- Define constraints for:

        --    DURATION must be positive integer and not zero

        --    CREDIT is between 1..30

        -- About the START DATE domain constraint check:

        --    If today is 1980-10-20, start date can be at the
        --    earliest 1980-10-19. Values earlier than (date - 1) are
        --    rejected.
DROP TABLE IF EXISTS course;

CREATE TABLE course
(
    description    VARCHAR(400)
   , lecturer     VARCHAR(100)
   , duration INTEGER
   , credit INTEGER
   , start_date DATE
   , CHECK (duration >0)
   , CHECK (credit >0 and credit <30)
   , CHECK ((cast(strftime('%d','2022-03-25') as INTEGER) - cast(strftime('%d',start_date) as INTEGER))<2)
);
-- Fail: duration
INSERT INTO course
    (description, lecturer, duration,credit,start_date)
VALUES
    ('Jim new name hellp world','Keven John', -3,8,'2022-03-25')
;
-- Fail: credit
INSERT INTO course
    (description, lecturer, duration,credit,start_date)
VALUES
    ('Jim new name hellp world','Keven John', 3,38,'2022-03-25')
;
-- Fail:About the START DATE domain constraint check:
INSERT INTO course
    (description, lecturer, duration,credit,start_date)
VALUES
    ('Jim new name hellp world','Keven John', 3,28,'2022-03-20')
;
-- End of file
