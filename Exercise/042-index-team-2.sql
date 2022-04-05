-- Author: Tri Cao <tri.cao@tuni.fi>
-- Date: 2022-03-24
-- File: 042-index-team-2.sql

-- Create index to table using the *owner* field.
        -- Name the index with `team__owner_index'.
DROP TABLE IF EXISTS team;

CREATE TABLE team
(
    coach_last    VARCHAR(100) NOT NULL
   , coach_first     VARCHAR(100) NOT NULL
   , team_name VARCHAR(100) NOT NULL
   , owner VARCHAR(100) NOT NULL
);
INSERT INTO team
    (coach_last, coach_first, team_name,owner)
VALUES
    ('Doe','John','Liverpool','owner1')
;
INSERT INTO team
    (coach_last, coach_first, team_name,owner)
VALUES
    ('Doe','Jane','Macheter','owner2')
;
INSERT INTO team
    (coach_last, coach_first, team_name,owner)
VALUES
    ('Richards','Jenny','Scotch','owner3')
;
CREATE INDEX team__owner_index
ON team (owner);
-- End of file
