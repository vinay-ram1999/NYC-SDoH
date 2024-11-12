SELECT * FROM nyc_crime;

SELECT YEAR(report_date) AS r_dt, COUNT(*) FROM nyc_crime GROUP BY r_dt; -- This table is the bottle neck (less data available)

-- Default nyc_crime table columns
DESCRIBE nyc_crime;

/*
CREATE TABLE `nyc_crime` (
  `id` int NOT NULL,
  `CMPLNT_NUM` text,
  `ADDR_PCT_CD` double DEFAULT NULL,
  `BORO_NM` text,
  `CRM_ATPT_CPTD_CD` text,
  `HADEVELOPT` text,
  `HOUSING_PSA` text,
  `JURISDICTION_CODE` int DEFAULT NULL,
  `JURIS_DESC` text,
  `KY_CD` int DEFAULT NULL,
  `LAW_CAT_CD` text,
  `LOC_OF_OCCUR_DESC` text,
  `OFNS_DESC` text,
  `PARKS_NM` text,
  `PATROL_BORO` text,
  `PD_CD` double DEFAULT NULL,
  `PD_DESC` text,
  `PREM_TYP_DESC` text,
  `report_date` datetime DEFAULT NULL,
  `STATION_NAME` text,
  `SUSP_AGE_GROUP` text,
  `SUSP_RACE` text,
  `SUSP_SEX` text,
  `TRANSIT_DISTRICT` text,
  `VIC_AGE_GROUP` text,
  `VIC_RACE` text,
  `VIC_SEX` text,
  `X_COORD_CD` int DEFAULT NULL,
  `Y_COORD_CD` int DEFAULT NULL,
  `Latitude` double DEFAULT NULL,
  `Longitude` double DEFAULT NULL,
  `Lat_Lon` text,
  `New Georeferenced Column` text,
  `zipcode` varchar(10) DEFAULT NULL,
  `cmplnt_from_date` datetime DEFAULT NULL,
  `cmplnt_to_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
);
*/

-- We no longer need `New Georeferenced Column` in nyc_crime
ALTER TABLE nyc_crime
DROP COLUMN `New Georeferenced Column`;

DESCRIBE nyc_crime;

-- Remove all existing data from nyc_crime
TRUNCATE TABLE nyc_crime;

SELECT COUNT(*) FROM nyc_crime;

SELECT * FROM nyc_crime;

-- Now load the data using the python script

SELECT COUNT(*) FROM nyc_crime;

-- Now the the table has 8913268 rows

SELECT * FROM nyc_crime;

SELECT YEAR(report_date) AS r_dt, COUNT(*) FROM nyc_crime GROUP BY r_dt;

-- SELECT * FROM combined_summary_by_neighborhood_year_quarter; -- Not responding


