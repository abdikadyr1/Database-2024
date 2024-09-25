--1
CREATE DATABASE lab2;

--2
CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(255),
    region_id int,
    population int
);

SELECT * FROM countries;
--3
INSERT INTO countries (country_id, country_name, region_id, population)
VALUES (1, 'KAZAKHSTAN', 1, 20592571);

--4
INSERT INTO countries(country_id, country_name)
VALUES (2, 'CHINA');

--5
INSERT INTO countries(region_id)
VALUES  (NULL);

--6
INSERT INTO countries(country_id, country_name, region_id, population)
VALUES
(4, 'USA', 3, 345426571),
(3, 'INDIA', 2, 1450935791),
(6, 'TURKEY', 5, 87473805);

--7
ALTER TABLE countries
ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

--8
INSERT INTO countries (country_name)
VALUES (DEFAULT);

--9
INSERT INTO countries
DEFAULT VALUES;

--10
CREATE TABLE countries_new (
    LIKE countries
);

--11
INSERT INTO countries_new
SELECT * FROM countries;

--12
UPDATE countries
SET region_id = 1
WHERE region_id IS NULL;

--13
SELECT countries.country_name, countries.population + countries.population * 0.1 as "New population"
FROM countries;

--14
DELETE FROM countries
WHERE population < 100000;

--15
DELETE FROM countries_new
USING countries
WHERE countries_new.country_id = countries.country_id
RETURNING *;

--16
DELETE FROM countries
RETURNING *;
