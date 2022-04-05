-- Author: Tri Cao <tri.cao@tuni.fi>
-- Date: 2022-03-21
-- File: 023-domain-constraints-in-project-table.sql

-- Record information on *project:* project name, name of the
        -- manager, manager's phone number, manager's job title,
        -- Define constraints for:

        --    PROJECT NAME is longer than 5

        --    MANAGER's name is longer than 5

        --    JOB TITLE in only one of accepted values of:
        --        sales manager,
        --        office manager,
        --        facilities manager
        --        business manager
DROP TABLE IF EXISTS project;

CREATE TABLE project
(
    project_name    VARCHAR(100)
   , manager_name     VARCHAR(100)
   , phone VARCHAR(100)
   , job_title VARCHAR(100)
   , CHECK (LENGTH(project_name) >5)
   , CHECK (LENGTH(manager_name) >5)
   , CHECK (job_title = 'sales manager' OR job_title = 'office manager' OR job_title = 'facilities manager' OR job_title = 'business manager')
);
-- Fail: project name
INSERT INTO project
    (project_name, manager_name, phone,job_title)
VALUES
    ('Jim','Keven John', ' 102524','sales manager')
;
-- Fail: manager name
INSERT INTO project
    (project_name, manager_name, phone,job_title)
VALUES
    ('Jim Hell','John', ' 102524','sales manager')
;
-- Fail:JOB TITLE in only one of accepted values of:
INSERT INTO project
    (project_name, manager_name, phone,job_title)
VALUES
    ('Jim Hell','John Keven', ' 102524','sales')
;
-- End of file
