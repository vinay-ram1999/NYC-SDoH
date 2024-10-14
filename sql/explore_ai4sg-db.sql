SHOW TABLES;

SHOW TABLES WHERE Tables_in_ai4sg REGEXP "^combined";

SHOW CREATE VIEW combined_summary_by_neighborhood_year_quarter;

SELECT VIEW_DEFINITION
FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_NAME = 'combined_summary_by_neighborhood_year_quarter';

-- To over come Error Code: 1137. Can't reopen table: 'all_view_table_connections' below, create a view and drop it after use
CREATE OR REPLACE VIEW all_view_table_connections AS
-- referenced from https://dataedo.com/kb/query/mysql/list-tables-used-by-a-view
select vtu.view_schema as database_name,
       vtu.view_name as view_name,
       vtu.table_schema as referenced_database_name,
       vtu.table_name as referenced_object_name,
       tab.table_type as object_type
from information_schema.view_table_usage vtu
join information_schema.tables tab on vtu.table_schema = tab.table_schema and vtu.table_name = tab.table_name
where view_schema not in ('sys','information_schema', 'mysql', 'performance_schema') -- and tab.table_schema = 'database_name' -- put your database name here
order by vtu.view_schema, vtu.view_name;

-- Tables/Views fo interest
SHOW TABLES WHERE Tables_in_ai4sg REGEXP "^combined" AND Tables_in_ai4sg REGEXP "year_quarter$";

-- Make a temporary table that has the base tables used to make the views we are interested in
DROP TEMPORARY TABLE IF EXISTS wanted_view_table_connections;
CREATE TEMPORARY TABLE IF NOT EXISTS wanted_view_table_connections AS
WITH wanted_view_names AS ( -- Get table names of interested tables/views into a table
SELECT TABLE_NAME AS wanted_views
FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_NAME REGEXP "^combined" AND TABLE_NAME REGEXP "year_quarter$"), primary_connections AS ( -- Get primary connections of wanted tables/views
SELECT DISTINCT referenced_object_name, object_type
FROM all_view_table_connections
WHERE view_name IN (SELECT wanted_views 
					FROM wanted_view_names)), secondary_connections AS ( -- Get secondary connections of views found in primary_connections
SELECT DISTINCT referenced_object_name, object_type
FROM all_view_table_connections
WHERE view_name IN (SELECT referenced_object_name 
					FROM primary_connections 
					WHERE object_type LIKE "VIEW")), terinary_connections AS ( -- Get terinary connections
SELECT DISTINCT referenced_object_name, object_type
FROM all_view_table_connections
WHERE view_name IN (SELECT referenced_object_name 
					FROM secondary_connections 
					WHERE object_type LIKE "VIEW")), quaternary_connections AS ( -- Get quaternary connections
SELECT DISTINCT referenced_object_name, object_type
FROM all_view_table_connections
WHERE view_name IN (SELECT referenced_object_name 
					FROM terinary_connections 
					WHERE object_type LIKE "VIEW"))

SELECT * FROM primary_connections WHERE object_type LIKE "BASE TABLE"
UNION
SELECT * FROM secondary_connections WHERE object_type LIKE "BASE TABLE"
UNION
SELECT * FROM terinary_connections WHERE object_type LIKE "BASE TABLE"
UNION
SELECT * FROM quaternary_connections WHERE object_type LIKE "BASE TABLE";

DROP VIEW IF EXISTS all_view_table_connections;

SELECT * FROM wanted_view_table_connections;
-- There are 5 base tables to look into: neighborhoods, zip, nyc_asthma_er_visits_by_zip, nyc_crime, nyc311

SELECT * FROM neighborhoods;

SELECT country, COUNT(*) FROM zip GROUP BY country;
SELECT * FROM zip WHERE zip REGEXP '^5200';

SELECT * FROM nyc_asthma_er_visits_by_zip;

SELECT * FROM nyc_crime;
SELECT YEAR(report_date) AS r_dt, COUNT(*) FROM nyc_crime GROUP BY r_dt; -- This table is the bottle neck (less data available)

SELECT * FROM nyc311;
SELECT YEAR(created_date) AS r_dt, COUNT(*) FROM nyc311 GROUP BY r_dt; -- Only run this query if you absolutely need it, as it takes long time to execute (~ 148 sec)

