-- Author: Tri Cao <tri.cao@tuni.fi>
-- Date: 2022-03-26
-- File: 052-index-weather-2.sql

-- Create index to table using the *highest* value.
        -- Name the index with `weather__high_index'.
DROP TABLE IF EXISTS weather;

CREATE TABLE weather
(
    'Time of reading'    DATETIME NOT NULL
   , high     VARCHAR(5) NOT NULL
   , low VARCHAR(5) NOT NULL
   , observer VARCHAR(2) NOT NULL
   , comment VARCHAR(200) NOT NULL
);
INSERT INTO weather
    ('Time of reading', high, low,observer,comment)
VALUES
    ('2000-12-11 11:00', '+5', '+2','MK','snow-rain for a while')
;
INSERT INTO weather
    ('Time of reading', high, low,observer,comment)
VALUES
    ('2000-12-12 11:00', '+4', '+3','ES','Strong wind')
;
INSERT INTO weather
    ('Time of reading', high, low,observer,comment)
VALUES
    ('2000-12-15 11:00', '+2', '+0','RD','Night was cold and misty')
;
INSERT INTO weather
    ('Time of reading', high, low,observer,comment)
VALUES
    ('2000-12-14 10:00', '+7', '+12','MK','Rainy day')
;
CREATE INDEX weather__high_index
ON weather (high);
-- End of file
