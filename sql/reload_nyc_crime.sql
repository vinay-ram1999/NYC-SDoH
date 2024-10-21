SELECT * FROM nyc_crime;

SELECT YEAR(report_date) AS r_dt, COUNT(*) FROM nyc_crime GROUP BY r_dt; -- This table is the bottle neck (less data available)

-- Default nyc_crime table columns
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



