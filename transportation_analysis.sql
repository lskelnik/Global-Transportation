/*
Analysis of global airports, train stations, and ferry ports. Sources: OpenFlights airports database and OurAirports database
See README files for links and data dictionaries.

Skills used: stored procedures, views, window functions, aggregate functions, control flow functions, joins
/*
USE transportation;

-- create a stored procedure to call airports by country and type of airport
DROP PROCEDURE IF EXISTS get_airports_by_country;

DELIMITER $$
CREATE PROCEDURE get_airports_by_country
(
iso_country CHAR(2),
type TEXT
)
BEGIN 
    SELECT 
        airport_name,
        municipality,
        type
    FROM airports a
    WHERE a.iso_country = IFNULL(iso_country, a.iso_country)
          AND a.type = IFNULL(type, a.type);
END $$ 

DELIMITER ;

-- Call the stored procedure to get the large airports in the United States

CALL get_airports_by_country('US', 'large_airport');

-- Show the totals for each type of airport by country using a window function

CREATE OR REPLACE VIEW airports_by_country AS

SELECT
    DISTINCT c.country_name,
    a.type,
    COUNT(*) OVER(PARTITION BY c.country_name ORDER BY a.type) total
FROM airports a
JOIN countries c
    ON (a.iso_country = c.code)
ORDER BY country_name, total DESC;

-- Show the totals for each type of airport by continent using a window function

CREATE OR REPLACE VIEW airports_by_continent AS

SELECT
    DISTINCT c.continent,
    a.type,
    COUNT(*) OVER(PARTITION BY c.continent ORDER BY a.type) total
FROM airports a
JOIN countries c
    ON (a.iso_country = c.code)
ORDER BY continent, total DESC;

-- View the small airports by country

CREATE OR REPLACE VIEW small_airports AS

SELECT 
    c.country_name,
    a.airport_name,
    a.municipality,
    a.latitude_deg,
    a.longitude_deg,
    elevation_ft
FROM airports a
JOIN countries c
    ON (a.iso_country = c.code)
WHERE type = 'small_airport'
ORDER BY c.country_name ASC;

-- View the medium airports by country

CREATE OR REPLACE VIEW medium_airports AS

SELECT 
    c.country_name,
    a.airport_name,
    a.municipality,
    a.latitude_deg,
    a.longitude_deg,
    elevation_ft
FROM airports a
JOIN countries c
    ON (a.iso_country = c.code)
WHERE type = 'medium_airport'
ORDER BY c.country_name ASC;

-- View the large airports by country

CREATE OR REPLACE VIEW large_airports AS

SELECT 
    c.country_name,
    a.airport_name,
    a.municipality,
    a.latitude_deg,
    a.longitude_deg,
    elevation_ft
FROM airports a
JOIN countries c
    ON (a.iso_country = c.code)
WHERE type = 'large_airport'
ORDER BY c.country_name ASC;

-- View the heliports by country

CREATE OR REPLACE VIEW heliports AS

SELECT 
    c.country_name,
    a.airport_name,
    a.municipality,
    a.latitude_deg,
    a.longitude_deg,
    elevation_ft
FROM airports a
JOIN countries c
    ON (a.iso_country = c.code)
WHERE type = 'heliport'
ORDER BY c.country_name ASC;

-- View the seaplane bases by country

CREATE OR REPLACE VIEW seaplane_bases AS

SELECT 
    c.country_name,
    a.airport_name,
    a.municipality,
    a.latitude_deg,
    a.longitude_deg,
    elevation_ft
FROM airports a
JOIN countries c
    ON (a.iso_country = c.code)
WHERE type = 'seaplane_base'
ORDER BY c.country_name ASC;

-- View the closed airports by country

CREATE OR REPLACE VIEW closed_airports AS

SELECT 
    c.country_name,
    a.airport_name,
    a.municipality,
    a.latitude_deg,
    a.longitude_deg,
    elevation_ft
FROM airports a
JOIN countries c
    ON (a.iso_country = c.code)
WHERE type = 'closed'
ORDER BY c.country_name ASC;

-- View the balloonports by country

CREATE OR REPLACE VIEW balloonports AS

SELECT 
    c.country_name,
    a.airport_name,
    a.municipality,
    a.latitude_deg,
    a.longitude_deg,
    elevation_ft
FROM airports a
JOIN countries c
    ON (a.iso_country = c.code)
WHERE type = 'balloonport'
ORDER BY c.country_name ASC;

-- View the total amount of ferry ports per country. Limit to totals greater than 2

CREATE OR REPLACE VIEW ferries_by_country AS
SELECT 
    country,
    COUNT(*) AS total
FROM ports
GROUP BY country
HAVING total > 2
ORDER BY total DESC;

-- View the total amount of train stations per country. Limit to the top ten by total count.

CREATE OR REPLACE VIEW stations_by_country AS
SELECT 
    country,
    COUNT(*) AS total
FROM stations
GROUP BY country
ORDER BY total DESC
LIMIT 10;

-- Use the small_airports View to compare the top ten countries with the most small airports

CREATE OR REPLACE VIEW most_small_airports AS

SELECT 
    country_name,
    COUNT(*) AS total
FROM small_airports
GROUP BY country_name
ORDER BY total DESC
LIMIT 10;

-- Use the medium_airports View to compare the top ten countries with the most medium airports

CREATE OR REPLACE VIEW most_medium_airports AS

SELECT 
    country_name,
    COUNT(*) AS total
FROM medium_airports
GROUP BY country_name
ORDER BY total DESC
LIMIT 10;

-- Use the large_airports View to compare the top ten countries with the most large airports

CREATE OR REPLACE VIEW most_large_airports AS

SELECT 
    country_name,
    COUNT(*) AS total
FROM large_airports
GROUP BY country_name
ORDER BY total DESC
LIMIT 10;

-- Use the heliports View to compare the top ten countries with the most heliports

CREATE OR REPLACE VIEW most_heliports AS

SELECT 
    country_name,
    COUNT(*) AS total
FROM heliports
GROUP BY country_name
ORDER BY total DESC
LIMIT 10;

-- Use the seaplane_bases View to compare the top ten countries with the most seaplane bases

CREATE OR REPLACE VIEW most_seaplane_bases AS

SELECT 
    country_name,
    COUNT(*) AS total
FROM seaplane_bases
GROUP BY country_name
ORDER BY total DESC
LIMIT 10;

-- Use the closed_airports View to compare the top ten countries with the most closed airports

CREATE OR REPLACE VIEW most_closed_airports AS

SELECT 
    country_name,
    COUNT(*) AS total
FROM closed_airports
GROUP BY country_name
ORDER BY total DESC
LIMIT 10;

-- Use the balloonports View to compare the top countries with the most balloonports

CREATE OR REPLACE VIEW most_balloonports AS

SELECT 
    country_name,
    COUNT(*) AS total
FROM balloonports
GROUP BY country_name
ORDER BY total DESC
LIMIT 10;
*/

