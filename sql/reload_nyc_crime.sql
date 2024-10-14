SELECT * FROM nyc_crime;
SELECT YEAR(report_date) AS r_dt, COUNT(*) FROM nyc_crime GROUP BY r_dt; -- This table is the bottle neck (less data available)

