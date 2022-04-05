-- Author: Tri Cao <tri.cao@tuni.fi>
-- Date: 2022-03-21
-- File: 022-domain-constraints-in-product-table.sql

-- Record information on *product:* name,
        -- description, weight, selling price, net price
        -- (purchase price).

        -- Define constraints for:

        --    NAME is longer than 4 characters
        --    DESCRIPTION is longer than 10 charcters
        --    WEIGHT is a positive number
        --    SELL PRICE is greater than 0
        --    NET PRICE is lower than sell price
DROP TABLE IF EXISTS product;

CREATE TABLE product
(
    name    VARCHAR(100)
   , description     VARCHAR(400)
   , weight FLOAT
   , sell_price FLOAT
   , net_price FLOAT
   , CHECK (LENGTH(name) >4)
   , CHECK (LENGTH(description) >10)
   , CHECK (weight >0)
   , CHECK (sell_price >0)
   , CHECK (net_price >0 AND net_price < sell_price)
);
-- Fail: name
INSERT INTO product
    (name, description, weight,sell_price,net_price)
VALUES
    ('Jim','DESCRIPTION is longer than 10 charcters', 10,1000,200)
;

-- Fail: description
INSERT INTO product
    (name, description, weight,sell_price,net_price)
VALUES
    ('John kevem','longer', 10,1000,200)
;
-- Fail: weight
INSERT INTO product
    (name, description, weight,sell_price,net_price)
VALUES
    ('John kevem','DESCRIPTION is longer than 10 charcters', -10,1000,200)
;
-- Fail: sell price
INSERT INTO product
    (name, description, weight,sell_price,net_price)
VALUES
    ('John kevem','DESCRIPTION is longer than 10 charcters', 10,-1000,200)
;
-- Fail: net price
INSERT INTO product
    (name, description, weight,sell_price,net_price)
VALUES
    ('John kevem','DESCRIPTION is longer than 10 charcters', 10,1000,2000)
;
-- End of file
