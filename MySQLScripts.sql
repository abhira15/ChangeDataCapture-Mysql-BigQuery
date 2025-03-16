create database country_info;  -- create database

use country_info; -- enter in that database

CREATE TABLE country (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    capital VARCHAR(100) NOT NULL,
    language VARCHAR(100) NOT NULL
); -- crete the table country

INSERT INTO country (name, capital, language) 
VALUES 
    ('United States', 'Washington, D.C.', 'English'),
    ('France', 'Paris', 'French'),
    ('Japan', 'Tokyo', 'Japanese'),
    ('India', 'New Delhi', 'Hindi'),
    ('Brazil', 'Brasília', 'Portuguese'); -- insert intial data into country
    
SELECT * FROM country; -- to see intial table


UPDATE country 
SET capital = 'Mumbai' 
WHERE country_id = 4; -- update some data to check any change data capture

INSERT INTO country (name, capital, language) 
VALUES ('Germany', 'Berlin', 'German'); -- insert some rows

SELECT * FROM country;  -- to see updated table

# check all the changes in bigquery after 5- 15 mins