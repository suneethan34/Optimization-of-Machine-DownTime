-- Create database
create database machine_downtime_db;
-- SELECT DATASET FOR USE
use machine_downtime_db;
select * from machine_downtime;
CREATE TABLE Machine_Downtime (
    Date DATE,
    Machine_ID VARCHAR(50),
    Assembly_Line_No VARCHAR(50),
    Hydraulic_Pressure_bar DECIMAL(10,2),
    Coolant_Pressure_bar DECIMAL(10,2),
    Air_System_Pressure_bar DECIMAL(10,3),
    Coolant_Temperature DECIMAL(5,2),
    Hydraulic_Oil_Temperature_C DECIMAL(5,2),
    Spindle_Bearing_Temperature_C DECIMAL(5,2),
    Spindle_Vibration_um DECIMAL(6,3),
    Tool_Vibration_um DECIMAL(6,3),
    Spindle_Speed_RPM INT,
    Voltage_volts DECIMAL(6,2),
    Torque_Nm DECIMAL(8,3) NULL,
    Cutting_kN DECIMAL(8,3),
    Downtime VARCHAR(50)
);
select count(*) from machine_downtime;
select * from machine_downtime;
-- NUMBERS OF ROWS IN OUR DATASET
SELECT COUNT(*) AS NUM_ROW
FROM machine_downtime;
-- NUMBEER OF COLUMNS IN OUR DATASET
SELECT COUNT(*) AS NUM_COL
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'machine_downtime';

-- Count the number of machine
select Machine_ID ,count(Machine_ID) as No_of_Machine
from machine_downtime
group by Machine_ID;

-- Count the number of Assembly line number
select Assembly_Line_No ,count(Assembly_Line_No) as No_of_Assembly_Line
from machine_downtime
group by Assembly_Line_No;

-- Count of number of Machine downtime
select Downtime , count(Downtime) as Number_of_Downtime
from machine_downtime
group by Downtime;

-- Cheking for Null values
SELECT * FROM machine_downtime
WHERE Date IS NULL;

/* EDA OPERATION */

/* 1st Business Moment: Measure Of Central Tendency  */

/* Mean */
SELECT AVG(Hydraulic_Pressure_bar) AS mean_Hydraaulic_pressure
FROM machine_downtime;

SELECT AVG(Coolant_Pressure_bar) AS mean_Coolant_Pressure
FROM machine_downtime;

SELECT AVG(Air_System_Pressure_bar) AS mean_Air_System_Pressure
FROM machine_downtime;

SELECT AVG(Coolant_Temperature) AS mean_Coolant_Temperature
FROM machine_downtime;

SELECT AVG(Hydraulic_Oil_Temperature_c) AS mean_Hydraulic_Oil_Temperature
FROM machine_downtime;

SELECT AVG(Spindle_Bearing_Temperature_c) AS mean_Spindle_Bearing_Temperature
FROM machine_downtime;

SELECT AVG(Spindle_Vibration_um) AS mean_Spindle_Vibration
FROM machine_downtime;

SELECT AVG(Tool_Vibration_um) AS mean_Tool_Vibration
FROM machine_downtime;

SELECT AVG(Spindle_Speed_RPM) AS mean_Spindle_Speed
FROM machine_downtime;

SELECT AVG(Voltage_Volts) AS mean_Voltage
FROM machine_downtime;

SELECT AVG(Torque_Nm) AS mean_Torque
FROM machine_downtime;

SELECT AVG(Cutting_KN) AS mean_Cutting
FROM machine_downtime;

/* Median */

SELECT Hydraulic_pressure_bar AS median_Hydraulic_pressure
FROM (
    SELECT Hydraulic_pressure_bar, ROW_NUMBER() OVER (ORDER BY Hydraulic_pressure_bar) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM machine_downtime
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;   

SELECT Coolant_Pressure_bar AS median_Coolant_Pressure
FROM (
    SELECT Coolant_Pressure_bar, ROW_NUMBER() OVER (ORDER BY Coolant_Pressure_bar) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM machine_downtime
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;  
select * from machine_downtime;
SELECT Air_System_Pressure_bar AS median_Air_System_Pressure
FROM (
    SELECT Air_System_Pressure_bar, ROW_NUMBER() OVER (ORDER BY Air_System_Pressure_bar) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM machine_downtime
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;  

SELECT Coolant_Temperature AS median_Coolant_Temperature
FROM (
    SELECT Coolant_Temperature, ROW_NUMBER() OVER (ORDER BY Coolant_Temperature) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM machine_downtime
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;  

SELECT Hydraulic_Oil_Temperature_c AS median_Hydraulic_Oil_Temperature_c
FROM (
    SELECT Hydraulic_Oil_Temperature_C, ROW_NUMBER() OVER (ORDER BY Hydraulic_Oil_Temperature_c) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM machine_downtime
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;  

SELECT Spindle_Bearing_Temperature AS median_Spindle_Bearing_Temperature
FROM (
    SELECT Spindle_Bearing_Temperature, ROW_NUMBER() OVER (ORDER BY Spindle_Bearing_Temperature) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM machine_downtime
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;  
select * from machine_downtime;
SELECT Spindle_Vibration AS median_Spindle_Vibration
FROM (
    SELECT Spindle_Vibration_um, ROW_NUMBER() OVER (ORDER BY Spindle_Vibration_um) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM machine_downtime
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;  

SELECT Tool_Vibration_um AS median_Tool_Vibration_um
FROM (
    SELECT Tool_Vibration_um, ROW_NUMBER() OVER (ORDER BY Tool_Vibration_um) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM machine_downtime
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;  

SELECT Spindle_Speed_Rpm AS median_Spindle_Speed_rpm
FROM (
    SELECT Spindle_Speed_rpm, ROW_NUMBER() OVER (ORDER BY Spindle_Speed_rpm) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM machine_downtime
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;  

SELECT Voltage_volts AS median_Voltage
FROM (
    SELECT Voltage_volts, ROW_NUMBER() OVER (ORDER BY Voltage_volts) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM machine_downtime
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;  

SELECT Torque AS median_Torque
FROM (
    SELECT Torque_nm, ROW_NUMBER() OVER (ORDER BY Torque_nm) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM machine_downtime
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;  

SELECT Cutting AS median_Cutting_kn
FROM (
    SELECT Cutting_kn, ROW_NUMBER() OVER (ORDER BY Cutting_kn) AS row_num,
           COUNT(*) OVER () AS total_count
    FROM machine_downtime
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;  

/* Mode */
 SELECT Hydraulic_Pressure_bar AS mode_Hydraulic_Pressure_bar
FROM (
    SELECT Hydraulic_Pressure_bar, COUNT(*) AS frequency
    FROM machine_downtime
    GROUP BY Hydraulic_Pressure_bar
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

 SELECT Coolant_Pressure_bar AS mode_Coolant_Pressure_bar
FROM (
    SELECT Coolant_Pressure_bar, COUNT(*) AS frequency
    FROM machine_downtime
    GROUP BY Coolant_Pressure_bar
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

 SELECT Air_System_Pressure_bar AS mode_Air_System_Pressure_bar
FROM (
    SELECT Air_System_Pressure_bar, COUNT(*) AS frequency
    FROM machine_downtime
    GROUP BY Air_System_Pressure_bar
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

 SELECT Coolant_Temperature AS mode_Coolant_Temperature
FROM (
    SELECT Coolant_Temperature, COUNT(*) AS frequency
    FROM machine_downtime
    GROUP BY Coolant_Temperature
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

 SELECT Hydraulic_Oil_Temperature_c AS mode_Hydraulic_Oil_Temperature_c
FROM (
    SELECT Hydraulic_Oil_Temperature_c, COUNT(*) AS frequency
    FROM machine_downtime
    GROUP BY Hydraulic_Oil_Temperature_c
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

 SELECT Spindle_Bearing_Temperature_c AS mode_Spindle_Bearing_Temperature_c
FROM (
    SELECT Spindle_Bearing_Temperature_c, COUNT(*) AS frequency
    FROM machine_downtime
    GROUP BY Spindle_Bearing_Temperature_c
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

 SELECT Spindle_Vibration_um AS mode_Spindle_Vibration_um
FROM (
    SELECT Spindle_Vibration_um, COUNT(*) AS frequency
    FROM machine_downtime
    GROUP BY Spindle_Vibration_um
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

 SELECT Tool_Vibration_um AS mode_Tool_Vibration_um
FROM (
    SELECT Tool_Vibration_um, COUNT(*) AS frequency
    FROM machine_downtime
    GROUP BY Tool_Vibration_um
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

 SELECT Spindle_Speed AS mode_Spindle_Speed
FROM (
    SELECT Spindle_Speed_rpm, COUNT(*) AS frequency
    FROM machine_downtime
    GROUP BY Spindle_Speed_rpm
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

 SELECT Voltage_volts AS mode_Voltage_volts
FROM (
    SELECT Voltage_volts, COUNT(*) AS frequency
    FROM machine_downtime
    GROUP BY Voltage_volts
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

 SELECT Torque AS mode_Torque_nm
FROM (
    SELECT Torque_nm, COUNT(*) AS frequency
    FROM machine_downtime
    GROUP BY Torque_nm
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

 SELECT Cutting AS mode_Cutting_kn
FROM (
    SELECT Cutting_kn, COUNT(*) AS frequency
    FROM machine_downtime
    GROUP BY Cutting_kn
    ORDER BY frequency DESC
    LIMIT 1
) AS subquery;

/* 2nd Business Moment: Measure Of Dispersion */

 ---  Variance
 
 SELECT VARIANCE(Hydraulic_Pressure_bar) AS Hydraulic_Pressure_variance
FROM machine_downtime;

SELECT VARIANCE(Coolant_Pressure_bar) AS Coolant_Pressure_variance
FROM machine_downtime;

SELECT VARIANCE(Air_System_Pressure_bar) AS Air_System_Pressure_variance
FROM machine_downtime;

SELECT VARIANCE(Coolant_Temperature) AS Coolant_Temperature_variance
FROM machine_downtime;

SELECT VARIANCE(Hydraulic_Oil_Temperature_c) AS Hydraulic_Oil_Temperature_variance
FROM machine_downtime;

SELECT VARIANCE(Spindle_Bearing_Temperature_c) AS Spindle_Bearing_Temperature_variance
FROM machine_downtime;

SELECT VARIANCE(Spindle_Vibration_um) AS Spindle_Vibration_variance
FROM machine_downtime;

SELECT VARIANCE(Tool_Vibration_um) AS Tool_Vibration_variance
FROM machine_downtime;

SELECT VARIANCE(Spindle_Speed_rpm) AS Spindle_Speed_variance
FROM machine_downtime;

SELECT VARIANCE(Voltage_volts) AS Voltagevariance
FROM machine_downtime;

SELECT VARIANCE(Torque_nm) AS Torque_variance
FROM machine_downtime;

SELECT VARIANCE(Cutting_kn) AS Cutting_variance
FROM machine_downtime;

-- Standard Deviation

 SELECT STDDEV(Hydraulic_Pressure) AS Hydraulic_Pressure_stddev
FROM machine_downtime;

SELECT STDDEV(Coolant_Pressure_bar) AS Coolant_Pressure_stddev
FROM machine_downtime;

SELECT STDDEV(Air_System_Pressure_bar) AS Air_System_Pressure_stddev
FROM machine_downtime;

SELECT STDDEV(Coolant_Temperature) AS Coolant_Temperature_stddev
FROM machine_downtime;

SELECT STDDEV(Hydraulic_Oil_Temperature_bar) AS Hydraulic_Oil_Temperature_stddev
FROM machine_downtime;

SELECT STDDEV(Spindle_Bearing_Temperature_c) AS Spindle_Bearing_Temperature_stddev
FROM machine_downtime;

SELECT STDDEV(Spindle_Vibration_um) AS Spindle_Vibration_stddev
FROM machine_downtime;

SELECT STDDEV(Tool_Vibration_um) AS Tool_Vibration_stddev
FROM machine_downtime;

SELECT STDDEV(Spindle_Speed_rpm) AS Spindle_Speed_stddev
FROM machine_downtime;

SELECT STDDEV(Voltage_volts) AS Voltage_stddev
FROM machine_downtime;

SELECT STDDEV(Torque_nm) AS Torque_stddev
FROM machine_downtime;

SELECT STDDEV(Cutting_kn) AS Cutting_stddev
FROM machine_downtime;

--- RANGE

SELECT MAX(Hydraulic_Pressure_bar) - MIN(Hydraulic_Pressure_bar) AS experience_range
FROM machine_downtime;

SELECT MAX(Coolant_Pressure_bar) - MIN(Coolant_Pressure_bar) AS experience_range
FROM machine_downtime;

SELECT MAX(Air_System_Pressure_bar) - MIN(Air_System_Pressure_bar) AS experience_range
FROM machine_downtime;

SELECT MAX(Coolant_Temperature_bar) - MIN(Coolant_Temperature) AS experience_range
FROM machine_downtime;

SELECT MAX(Hydraulic_Oil_Temperature_bar) - MIN(Hydraulic_Oil_Temperature) AS experience_range
FROM machine_downtime;

SELECT MAX(Spindle_Bearing_Temperature_c) - MIN(Spindle_Bearing_Temperature_c) AS experience_range
FROM machine_downtime;

SELECT MAX(Spindle_Vibration_um) - MIN(Spindle_Vibration_um) AS experience_range
FROM machine_downtime;

SELECT MAX(Tool_Vibration_um) - MIN(Tool_Vibration_um) AS experience_range
FROM machine_downtime;

SELECT MAX(Spindle_Speed_rpm) - MIN(Spindle_Speed_rpm) AS experience_range
FROM machine_downtime;

SELECT MAX(Voltage_volts) - MIN(Voltage_volts) AS experience_range
FROM machine_downtime;

SELECT MAX(Torque_nm) - MIN(Torque_nm) AS experience_range
FROM machine_downtime;

SELECT MAX(Cutting_kn) - MIN(Cutting_kn) AS experience_range
FROM machine_downtime;

/* Third and Fourth Moment Business Decision */
--- skewness and kurkosis 

SELECT
    (
        SUM(POWER(Hydraulic_Pressure_bar - (SELECT AVG(Hydraulic_Pressure_bar) FROM machine_downtime), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Hydraulic_Pressure_bar) FROM machine_downtime), 3))
    ) AS skewness,
    (
        (SUM(POWER(Hydraulic_Pressure_bar - (SELECT AVG(Hydraulic_Pressure_bar) FROM machine_downtime), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Hydraulic_Pressure_bar) FROM machine_downtime), 4))) - 3
    ) AS kurtosis
FROM machine_downtime;

SELECT
    (
        SUM(POWER(Coolant_Pressure_bar - (SELECT AVG(Coolant_Pressure_bar) FROM machine_downtime), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Coolant_Pressure_bar) FROM machine_downtime), 3))
    ) AS skewness,
    (
        (SUM(POWER(Coolant_Pressure_bar - (SELECT AVG(Coolant_Pressure_bar) FROM machine_downtime), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Coolant_Pressure_bar) FROM machine_downtime), 4))) - 3
    ) AS kurtosis
FROM machine_downtime;
select * from machine_downtime;
SELECT
    (
        SUM(POWER(Air_System_Pressure_bar - (SELECT AVG(Air_System_Pressure_bar) FROM machine_downtime), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Air_System_Pressure_bar) FROM machine_downtime), 3))
    ) AS skewness,
    (
        (SUM(POWER(Air_System_Pressure_bar - (SELECT AVG(Air_System_Pressure_bar) FROM machine_downtime), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Air_System_Pressure_bar) FROM machine_downtime), 4))) - 3
    ) AS kurtosis
FROM machine_downtime;

SELECT
    (
        SUM(POWER(Coolant_Temperature - (SELECT AVG(Coolant_Temperature) FROM machine_downtime), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Coolant_Temperature) FROM machine_downtime), 3))
    ) AS skewness,
    (
        (SUM(POWER(Coolant_Temperature - (SELECT AVG(Coolant_Temperature) FROM machine_downtime), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Coolant_Temperature) FROM machine_downtime), 4))) - 3
    ) AS kurtosis
FROM machine_downtime;

SELECT
    (
        SUM(POWER(Hydraulic_Oil_Temperature_c - (SELECT AVG(Hydraulic_Oil_Temperature_c) FROM machine_downtime), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Hydraulic_Oil_Temperature_c) FROM machine_downtime), 3))
    ) AS skewness,
    (
        (SUM(POWER(Hydraulic_Oil_Temperature_c - (SELECT AVG(Hydraulic_Oil_Temperature_c) FROM machine_downtime), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Hydraulic_Oil_Temperature_c) FROM machine_downtime), 4))) - 3
    ) AS kurtosis
FROM machine_downtime;
select * from machine_downtime;
SELECT
    (
        SUM(POWER(Spindle_Bearing_Temperature_c - (SELECT AVG(Spindle_Bearing_Temperature_c) FROM machine_downtime), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Spindle_Bearing_Temperature_c) FROM machine_downtime), 3))
    ) AS skewness,
    (
        (SUM(POWER(Spindle_Bearing_Temperature_c - (SELECT AVG(Spindle_Bearing_Temperature_c) FROM machine_downtime), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Spindle_Bearing_Temperature_c) FROM machine_downtime), 4))) - 3
    ) AS kurtosis
FROM machine_downtime;
select * from machine_downtime;
SELECT
    (
        SUM(POWER(Spindle_Vibration_um - (SELECT AVG(Spindle_Vibration_um) FROM machine_downtime), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Spindle_Vibration_um) FROM machine_downtime), 3))
    ) AS skewness,
    (
        (SUM(POWER(Spindle_Vibration_um- (SELECT AVG(Spindle_Vibration_um) FROM machine_downtime), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Spindle_Vibration_um) FROM machine_downtime), 4))) - 3
    ) AS kurtosis
FROM machine_downtime;
select * from machine_downtime;
SELECT
    (
        SUM(POWER(Tool_Vibration_um - (SELECT AVG(Tool_Vibration_um) FROM machine_downtime), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Tool_Vibration_um) FROM machine_downtime), 3))
    ) AS skewness,
    (
        (SUM(POWER(Tool_Vibration_um - (SELECT AVG(Tool_Vibration_um) FROM machine_downtime), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Tool_Vibration_um) FROM machine_downtime), 4))) - 3
    ) AS kurtosis
FROM machine_downtime;

SELECT
    (
        SUM(POWER(Spindle_Speed_Rpm - (SELECT AVG(Spindle_Speed_Rpm) FROM machine_downtime), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Spindle_Speed_Rpm) FROM machine_downtime), 3))
    ) AS skewness,
    (
        (SUM(POWER(Spindle_Speed_Rpm - (SELECT AVG(Spindle_Speed_Rpm) FROM machine_downtime), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Spindle_Speed_Rpm) FROM machine_downtime), 4))) - 3
    ) AS kurtosis
FROM machine_downtime;

SELECT
    (
        SUM(POWER(Voltage_volts- (SELECT AVG(Voltage_volts) FROM machine_downtime), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Voltage_volts) FROM machine_downtime), 3))
    ) AS skewness,
    (
        (SUM(POWER(Voltage_volts - (SELECT AVG(Voltage_volts) FROM machine_downtime), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Voltage_volts) FROM machine_downtime), 4))) - 3
    ) AS kurtosis
FROM machine_downtime;

SELECT
    (
        SUM(POWER(Torque_nm - (SELECT AVG(Torque_nm) FROM machine_downtime), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Torque_nm) FROM machine_downtime), 3))
    ) AS skewness,
    (
        (SUM(POWER(Torque_nm - (SELECT AVG(Torque_nm) FROM machine_downtime), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Torque_nm) FROM machine_downtime), 4))) - 3
    ) AS kurtosis
FROM machine_downtime;

SELECT
    (
        SUM(POWER(Cutting_kn - (SELECT AVG(Cutting_kn) FROM machine_downtime), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Cutting_kn) FROM machine_downtime), 3))
    ) AS skewness,
    (
        (SUM(POWER(Cutting_kn - (SELECT AVG(Cutting_kn) FROM machine_downtime), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Cutting_kn) FROM machine_downtime), 4))) - 3
    ) AS kurtosis
FROM machine_downtime;