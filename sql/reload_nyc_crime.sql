SELECT * FROM nyc_crime;

SELECT YEAR(report_date) AS r_dt, COUNT(*) FROM nyc_crime GROUP BY r_dt; -- This table is the bottle neck (less data available)

-- Default nyc_crime table columns
/*
CREATE TABLE nyc_crime_2024 (
	cmplnt_num text,
	cmplnt_fr_dt datetime DEFAULT NULL,
	cmplnt_fr_tm datetime DEFAULT NULL,
	cmplnt_to_dt datetime DEFAULT NULL,
	cmplnt_to_tm datetime DEFAULT NULL,
	addr_pct_cd double DEFAULT NULL,
	rpt_dt datetime DEFAULT NULL,
	ky_cd int DEFAULT NULL,
	ofns_desc text,
	pd_cd double DEFAULT NULL,
	pd_desc text,
	crm_atpt_cptd_cd text,
	law_cat_cd text,
	boro_nm text,
	loc_of_occur_desc text,
	prem_typ_desc text,
	juris_desc text,
	jurisdiction_code int DEFAULT NULL,
	parks_nm text,
	hadevelopt text,
	housing_psa text,
	x_coord_cd int DEFAULT NULL,
	y_coord_cd int DEFAULT NULL,
	susp_age_group text,
	susp_race text,
	susp_sex text,
	transit_district text,
	latitude double DEFAULT NULL,
	longitude double DEFAULT NULL,
	lat_lon text,
	patrol_boro text,
	station_name text,
	vic_age_group text,
	vic_race text,
	vic_sex text,
  PRIMARY KEY (cmplnt_num)
);
*/

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


