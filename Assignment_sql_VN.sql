-- Venkata Nagarjuna T H 
 
-- Creating new Database 
create database assignment;

USE assignment;
set SQL_SAFE_UPDATES = 0;
SET sql_mode='';

-- Importing file using the Import wizard of MySQL workbench
-- In this section we have imported the data using MySQL Workbench for the table Bajaj and etc.
-- After importing we are checking the column names of the tables and datatypes.

desc bajaj;
desc eicher;
desc hero;
desc infosys;
desc tcs;
desc tvs;
#####################################################################################
-- Step 1 - generating the 20 day and 50 day Moving averages

-- creating new tables with the 20day and 50 day moving average
-- First starting with the Bajaj and moving to other stocks.

-- Bajaj Auto
CREATE TABLE bajaj1 AS
SELECT `Date`, `Close Price`, ROW_NUMBER() OVER () rownum,
AVG(`Close Price`) OVER ( ROWS BETWEEN 0 preceding AND 19 FOLLOWING) AS `20_Day_MA` ,
AVG(`Close Price`) OVER ( ROWS BETWEEN 0 preceding AND 49 FOLLOWING) AS `50_Day_MA`
FROM  `bajaj`;

-- As we calculated the 20day and 50 day Moving average, First 19 days will be null for 20 day and first 49 days will be Null for the 50 day 
-- Hence we are updating those values with NULL

UPDATE bajaj1 set `20_Day_MA` = NULL
WHERE rownum > (SELECT COUNT(*) FROM `bajaj`) - 19 ;
UPDATE bajaj1 set `50_Day_MA` = NULL
WHERE rownum > (SELECT COUNT(*) FROM `bajaj`) - 49 ;

-- We are dropping the column rownum 
ALTER TABLE bajaj1 DROP rownum ;

-- Selecting few rows from newly created table Bajaj1
SELECT * FROM bajaj1 limit 100;

-- Eicher Motors
CREATE TABLE eicher1 AS
SELECT `Date`, `Close Price`, ROW_NUMBER() OVER () rownum,
AVG(`Close Price`) OVER ( ROWS BETWEEN 0 preceding AND 19 FOLLOWING) AS `20_Day_MA` ,
AVG(`Close Price`) OVER ( ROWS BETWEEN 0 preceding AND 49 FOLLOWING) AS `50_Day_MA`
FROM  `eicher`;

-- As we calculated the 20day and 50 day Moving average, First 19 days will be null for 20 day and first 49 days will be Null for the 50 day 
-- Hence we are updating those values with NULL

UPDATE eicher1 set `20_Day_MA` = NULL
WHERE rownum > (SELECT COUNT(*) FROM `eicher`) - 19 ;
UPDATE eicher1 set `50_Day_MA` = NULL
WHERE rownum > (SELECT COUNT(*) FROM `eicher`) - 49 ;

-- We are dropping the column rownum 
ALTER TABLE eicher1 DROP rownum ;

-- Selecting few rows from newly created table eicher1
SELECT * FROM eicher1 limit 100;

-- Hero Motocorp
CREATE TABLE hero1 AS
SELECT `Date`, `Close Price`, ROW_NUMBER() OVER () rownum,
AVG(`Close Price`) OVER ( ROWS BETWEEN 0 preceding AND 19 FOLLOWING) AS `20_Day_MA` ,
AVG(`Close Price`) OVER ( ROWS BETWEEN 0 preceding AND 49 FOLLOWING) AS `50_Day_MA`
FROM  `hero`;

-- As we calculated the 20day and 50 day Moving average, First 19 days will be null for 20 day and first 49 days will be Null for the 50 day 
-- Hence we are updating those values with NULL

UPDATE hero1 set `20_Day_MA` = NULL
WHERE rownum > (SELECT COUNT(*) FROM `hero`) - 19 ;
UPDATE hero1 set `50_Day_MA` = NULL
WHERE rownum > (SELECT COUNT(*) FROM `hero`) - 49 ;

-- We are dropping the column rownum 
ALTER TABLE hero1 DROP rownum ;

-- Selecting few rows from newly created table hero1
SELECT * FROM hero1 limit 100;

-- Infosys
CREATE TABLE infosys1 AS
SELECT `Date`, `Close Price`, ROW_NUMBER() OVER () rownum,
AVG(`Close Price`) OVER ( ROWS BETWEEN 0 preceding AND 19 FOLLOWING) AS `20_Day_MA` ,
AVG(`Close Price`) OVER ( ROWS BETWEEN 0 preceding AND 49 FOLLOWING) AS `50_Day_MA`
FROM  `infosys`;

-- As we calculated the 20day and 50 day Moving average, First 19 days will be null for 20 day and first 49 days will be Null for the 50 day 
-- Hence we are updating those values with NULL

UPDATE infosys1 set `20_Day_MA` = NULL
WHERE rownum > (SELECT COUNT(*) FROM `infosys`) - 19 ;
UPDATE infosys1 set `50_Day_MA` = NULL
WHERE rownum > (SELECT COUNT(*) FROM `infosys`) - 49 ;

-- We are dropping the column rownum 
ALTER TABLE infosys1 DROP rownum ;

-- Selecting few rows from newly created table infosys1
SELECT * FROM infosys1 limit 100;

-- TCS
CREATE TABLE tcs1 AS
SELECT `Date`, `Close Price`, ROW_NUMBER() OVER () rownum,
AVG(`Close Price`) OVER ( ROWS BETWEEN 0 preceding AND 19 FOLLOWING) AS `20_Day_MA` ,
AVG(`Close Price`) OVER ( ROWS BETWEEN 0 preceding AND 49 FOLLOWING) AS `50_Day_MA`
FROM  `tcs`;

-- As we calculated the 20day and 50 day Moving average, First 19 days will be null for 20 day and first 49 days will be Null for the 50 day 
-- Hence we are updating those values with NULL

UPDATE tcs1 set `20_Day_MA` = NULL
WHERE rownum > (SELECT COUNT(*) FROM `tcs`) - 19 ;
UPDATE tcs1 set `50_Day_MA` = NULL
WHERE rownum > (SELECT COUNT(*) FROM `tcs`) - 49 ;

-- We are dropping the column rownum 
ALTER TABLE tcs1 DROP rownum ;

-- Selecting few rows from newly created table tcs1
SELECT * FROM tcs1 limit 100;

-- TVS
CREATE TABLE tvs1 AS
SELECT `Date`, `Close Price`, ROW_NUMBER() OVER () rownum,
AVG(`Close Price`) OVER ( ROWS BETWEEN 0 preceding AND 19 FOLLOWING) AS `20_Day_MA` ,
AVG(`Close Price`) OVER ( ROWS BETWEEN 0 preceding AND 49 FOLLOWING) AS `50_Day_MA`
FROM  `tvs`;

-- As we calculated the 20day and 50 day Moving average, First 19 days will be null for 20 day and first 49 days will be Null for the 50 day 
-- Hence we are updating those values with NULL

UPDATE tvs1 set `20_Day_MA` = NULL
WHERE rownum > (SELECT COUNT(*) FROM `tvs`) - 19 ;
UPDATE tvs1 set `50_Day_MA` = NULL
WHERE rownum > (SELECT COUNT(*) FROM `tvs`) - 49 ;

-- We are dropping the column rownum 
ALTER TABLE tvs1 DROP rownum ;

-- Selecting few rows from newly created table TVS1
SELECT * FROM tvs1 limit 100;


#########################################################
-- STEP -2 - Creating Master table containing all the stocks closing price
--

CREATE TABLE stock_master_table AS
SELECT bajaj1.`Date`, bajaj1.`Close Price` AS Bajaj,
		eicher1.`Close Price` AS Eicher, 
        hero1.`Close Price`	AS Hero,
        infosys1.`Close Price`	AS Infosys, 
		tcs1.`Close Price`	AS TCS, 
		tvs1.`Close Price`	AS TVS		
FROM bajaj1 
INNER JOIN eicher1  ON bajaj1.`Date` = eicher1.`Date`
INNER JOIN hero1 ON  bajaj1.`Date` = hero1.`Date`
INNER JOIN infosys1  ON  bajaj1.`Date` = infosys1.`Date`
INNER JOIN tcs1 ON 	bajaj1.`Date` = tcs1.`Date`
INNER JOIN tvs1 ON 	bajaj1.`Date` = tvs1.`Date`;

-- selecting the rows limited to 100;
SELECT * FROM stock_master_table limit 100;


#############################################################
-- Step 3 - Creating new tables with Buy / Sell / Hold
--

-- In this section we will be creating new tables contains the information about whether the stock on particular day should be Buy / sell / hold.
-- This can be achived by Moving average which as created in the step 1. 

-- The Generation of the Signal will be based on the Moving averages of 20 day and 50 day logic.
-- BUY: IF the moving average of 20 day and 50 day is negative 
-- SELL: IF the moving average of 20 day and 50 day is Positive
-- HOLD: In all other cases.  

-- This can be done for individual tables . First start with the bajaj and continuing with the other stocks given 
-- Bajaj 

CREATE TABLE bajaj2 AS
SELECT `Date`, `Close Price`,
	(CASE
		WHEN (`20_Day_MA` > `50_Day_MA`) THEN 'Buy'
		WHEN (`20_Day_MA` < `50_Day_MA`) THEN 'Sell'
		ELSE 'Hold'
	END) as `Signal`
from bajaj1 ;

-- Selecting the data from the newly created table bajaj2
select * from bajaj2 limit 100;

-- Eicher Motors

CREATE TABLE eicher2 AS
SELECT `Date`, `Close Price`,
	(CASE
		WHEN (`20_Day_MA` > `50_Day_MA`) THEN 'Buy'
		WHEN (`20_Day_MA` < `50_Day_MA`) THEN 'Sell'
		ELSE 'Hold'
	END) as `Signal`
from eicher1 ;

-- Selecting the data from the newly created table eicher2
select * from eicher2 limit 100;

-- Hero Motcorp

CREATE TABLE hero2 AS
SELECT `Date`, `Close Price`,
	(CASE
		WHEN (`20_Day_MA` > `50_Day_MA`) THEN 'Buy'
		WHEN (`20_Day_MA` < `50_Day_MA`) THEN 'Sell'
		ELSE 'Hold'
	END) as `Signal`
from hero1 ;

-- Selecting the data from the newly created table hero2
select * from hero2 limit 100;

-- Infosys

CREATE TABLE infosys2 AS
SELECT `Date`, `Close Price`,
	(CASE
		WHEN (`20_Day_MA` > `50_Day_MA`) THEN 'Buy'
		WHEN (`20_Day_MA` < `50_Day_MA`) THEN 'Sell'
		ELSE 'Hold'
	END) as `Signal`
from infosys1 ;

-- Selecting the data from the newly created table infosys2
select * from infosys2 limit 100;

-- TCS

CREATE TABLE tcs2 AS
SELECT `Date`, `Close Price`,
	(CASE
		WHEN (`20_Day_MA` > `50_Day_MA`) THEN 'Buy'
		WHEN (`20_Day_MA` < `50_Day_MA`) THEN 'Sell'
		ELSE 'Hold'
	END) as `Signal`
from tcs1 ;

-- Selecting the data from the newly created table tcs2
select * from tcs2 limit 100;

-- TVS

CREATE TABLE tvs2 AS
SELECT `Date`, `Close Price`,
	(CASE
		WHEN (`20_Day_MA` > `50_Day_MA`) THEN 'Buy'
		WHEN (`20_Day_MA` < `50_Day_MA`) THEN 'Sell'
		ELSE 'Hold'
	END) as `Signal`
from tvs1 ;

-- Selecting the data from the newly created table tvs2
select * from tvs2 limit 100;


#####################################################################################
-- Step - 4  - Creating user defined function
-- In this section we will create user defined function to check the signal based on the date. 
-- First I will create one function for Bajaj and I will create generic function for any stock given in the problem

-- Bajaj - UDF
delimiter $$
CREATE FUNCTION generate_signal_Bajaj(targetDate char(10))
	RETURNS char(15)
	DETERMINISTIC
	BEGIN
		RETURN (SELECT `Signal` FROM bajaj2 WHERE `Date` = targetDate);
	END $$
delimiter ;

-- sample query to generate a signal
SELECT generate_signal_Bajaj('2018-07-31') AS Signal_Target_Bajaj; 

--
-- Generic User defined function for all the stocks.
--
delimiter $$
CREATE FUNCTION generate_signal_any(targetName char(15), targetDate char(10))
RETURNS CHAR(15)
DETERMINISTIC
BEGIN 
	return (CASE LOWER(targetName)
				WHEN 'bajaj' THEN (SELECT `Signal` FROM bajaj2 WHERE `Date` = targetDate)
				WHEN 'eicher' THEN (SELECT `Signal` FROM bajaj2 WHERE `Date` = targetDate)
				WHEN 'hero' THEN (SELECT `Signal` FROM bajaj2 WHERE `Date` = targetDate)
				WHEN 'infosys' THEN (SELECT `Signal` FROM bajaj2 WHERE `Date` = targetDate)
				WHEN 'tcs' THEN (SELECT `Signal` FROM bajaj2 WHERE `Date` = targetDate)
				WHEN 'tvs' THEN (SELECT `Signal` FROM bajaj2 WHERE `Date` = targetDate)
				ELSE 'STOCK NOT FOUND'
			END);
	END $$
delimiter ;

-- sample query to generate a signal - Bajaj
SELECT generate_signal_any('Bajaj','2018-07-31') AS Signal_Target_Bajaj; 
-- sample query to generate a signal -  Eicher
SELECT generate_signal_any('Eicher','2018-07-31') AS Signal_Target_Eicher; 
-- sample query to generate a signal - Hero Motocorp
SELECT generate_signal_any('Hero','2018-07-31') AS Signal_Target_Hero; 
-- sample query to generate a signal -  Infosys
SELECT generate_signal_any('Infosys','2018-07-31') AS Signal_Target_Infosys; 
-- sample query to generate a signal - TCS
SELECT generate_signal_any('TCS','2018-07-31') AS Signal_Target_TCS; 
-- sample query to generate a signal -  TVS
SELECT generate_signal_any('TVS','2018-07-31') AS Signal_Target_TVS; 




