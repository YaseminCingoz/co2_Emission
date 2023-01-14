CREATE DATABASE Projects;
USE Projects;

-- DATA EXPLORATION

SELECT Make, Model, Engine_Size, CO2_Emissions
FROM co2_emission
ORDER BY Vehicle_Class desc;

-- DELETE USELESS COLUMNS

ALTER TABLE co2_emission
DROP COLUMN Fuel_Consumption_Comb_mpg;


-- CHANGE ABBREVIATED FUEL NAMES

SELECT DISTINCT Fuel_Type, COUNT(Fuel_Type) AS Count
FROM co2_emission
GROUP BY Fuel_Type;

UPDATE co2_emission
SET Fuel_Type = CASE WHEN Fuel_Type = "X" THEN "Regular Gasoline"
					 WHEN Fuel_Type = "Z" THEN "Premium Gasoline"
					 WHEN Fuel_Type = "E" THEN "Ethanol(E85)"
					 WHEN Fuel_Type = "D" THEN "Diesel"
					 WHEN Fuel_Type = "N" THEN "Natural Gas"
					 ELSE Fuel_Type 
					 END;
                     
-- CHANGE ABBREVIATED TRANSMISSION NAMES

SELECT DISTINCT Transmission, COUNT(Transmission) AS Count
FROM co2_emission
GROUP BY Transmission;

UPDATE co2_emission
SET Transmission = CASE WHEN  Transmission = 'AS6' THEN 'Auto Select Shift 6 Gears'
						WHEN Transmission = 'AS8' THEN 'Auto Select Shift 8 Gears'
						WHEN Transmission = 'M6' THEN 'Manual 6 Gears'
						WHEN Transmission = 'A6' THEN 'Automatic 6 Gears'
						WHEN Transmission = 'A8' THEN 'Automatic 8 Gears'						
						WHEN Transmission = 'AM7' THEN 'Automated Manual 7 Gears'
						WHEN Transmission = 'A9' THEN 'Automatic 9 Gears'
						WHEN Transmission = 'AS7' THEN 'Auto Select Shift 7 Gears'
						WHEN Transmission = 'AV' THEN 'CVT'
						WHEN Transmission = 'M5' THEN 'Manual 5 Gears'						
						WHEN Transmission = 'AS10' THEN 'Auto Select Shift 10 Gears'
						WHEN Transmission = 'AM6' THEN 'Automated Manual 6 Gears'
						WHEN Transmission = 'AV7' THEN 'CVT 7 Gears'
						WHEN Transmission = 'AV6' THEN 'CVT 6 Gears'						
						WHEN Transmission = 'M7' THEN 'Manual 7 Gears'
						WHEN Transmission = 'A5' THEN 'Automatic 5 Gears'
						WHEN Transmission = 'AS9' THEN 'Auto Select Shift 9 Gears'
						WHEN Transmission = 'A4' THEN 'Automatic 4 Gears'
						WHEN Transmission = 'AM8' THEN 'Automated Manual 8 Gears'						
						WHEN Transmission = 'A7' THEN 'Automatic 7 Gears'
						WHEN Transmission = 'AV8' THEN 'CVT 8 Gears'
						WHEN Transmission = 'A10' THEN 'Automatic 10 Gears'
						WHEN Transmission = 'AS5' THEN 'Auto Select Shift 5 Gears'						
						WHEN Transmission = 'AV10' THEN 'CVT 10 Gears'
						WHEN Transmission = 'AM5' THEN 'Automated Manual 5 Gears'
						WHEN Transmission = 'AM9' THEN 'Automated Manual 9 Gears'
						WHEN Transmission = 'AS4' THEN 'Auto Select Shift 4 Gears'
						ELSE Transmission 
						END;

-- RENAME  A COLUMN NAME

ALTER TABLE co2_emission
RENAME COLUMN Make TO Brand;


-- CHECK IF THERE IS NULL OR EMPTY VALUES 

-- 0 rows returned
SELECT * FROM co2_emission
WHERE Brand IS NULL OR Brand = ' ';

-- 0 rows returned
SELECT * FROM co2_emission
WHERE Model IS NULL OR Model = ' ';

-- 0 rows returned
SELECT * FROM co2_emission
WHERE Engine_Size IS NULL OR Engine_Size = ' ';


SELECT * FROM co2_emission;