CREATE OR REPLACE VIEW mydb.view_advance_ship_rate_in_days AS
SELECT
	dw_dlv.OrderID AS order_id,
	dw_dlv.RequiredDate AS required_date,
	dw_dlv.ShippedDate AS shipped_date,
	DATEDIFF(dw_dlv.RequiredDate, dw_dlv.ShippedDate) AS advance_ship_rate_in_days
FROM mydb.dw_delivery as dw_dlv
WHERE dw_dlv.ShippedDate IS NOT NULL;

CREATE OR REPLACE VIEW mydb.view_advance_ship_rate_in_days_percentiles AS
SELECT DISTINCT
	advance_ship_rate_in_days,
	ROUND((CUME_DIST() OVER(ORDER BY advance_ship_rate_in_days ASC) * 100 ), 2) AS percentile
FROM mydb.view_advance_ship_rate_in_days;

CREATE OR REPLACE VIEW view_advance_ship_rate_in_days_mean_and_std AS
SELECT
	ROUND(AVG(advance_ship_rate_in_days), 2) AS avg_advance_ship_rate_in_days,
	ROUND(STD(advance_ship_rate_in_days), 2) AS std_advance_ship_rate_in_days
FROM mydb.view_advance_ship_rate_in_days;

SELECT * FROM mydb.view_advance_ship_rate_in_days;
SELECT * FROM mydb.view_advance_ship_rate_in_days_percentiles;
SELECT * FROM mydb.view_advance_ship_rate_in_days_mean_and_std;
