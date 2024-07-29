CREATE OR REPLACE VIEW mydb.view_advance_ship_rate_in_days AS
SELECT
	dw_shp.CompanyName AS shipper_company_name,
	dw_dlv.OrderID AS order_id,
	dw_dlv.RequiredDate AS required_date,
	dw_dlv.ShippedDate AS shipped_date,
	DATEDIFF(dw_dlv.RequiredDate, dw_dlv.ShippedDate) AS advance_ship_rate_in_days
FROM mydb.dw_delivery as dw_dlv
	INNER JOIN mydb.dw_shipper AS dw_shp USING(SKShipperID)
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

CREATE OR REPLACE VIEW mydb.view_late_ship_rate_per_company AS
WITH ship_companies AS (
	SELECT
		shipper_company_name,
		SUM(CASE WHEN advance_ship_rate_in_days >= 0 THEN 1 ELSE 0 END) AS number_of_on_time_ships,
		SUM(CASE WHEN advance_ship_rate_in_days < 0 THEN 1 ELSE 0 END) AS number_of_late_ships,
		COUNT(order_id) AS total_number_of_ships
	FROM mydb.view_advance_ship_rate_in_days
	GROUP BY shipper_company_name
)
SELECT
	*,
    (number_of_on_time_ships / total_number_of_ships) * 100 AS on_time_ship_rate,
    (number_of_late_ships / total_number_of_ships) * 100 AS late_ship_rate
FROM ship_companies
ORDER BY on_time_ship_rate ASC;

CREATE OR REPLACE VIEW mydb.view_categories_per_company AS
WITH products_shipped AS (
	SELECT
		view_adv_shp.shipper_company_name,
        dw_ctg.CategoryName AS category_name
	FROM mydb.view_advance_ship_rate_in_days AS view_adv_shp
		INNER JOIN mydb.dw_order_logical AS dw_ord_lgc ON view_adv_shp.order_id = dw_ord_lgc.OrderId
		INNER JOIN mydb.dw_order AS dw_ord ON dw_ord_lgc.OrderId = dw_ord.OrderId
		INNER JOIN mydb.dw_order_detail AS dw_ord_dtl ON dw_ord.DT_REFE = dw_ord_dtl.DT_REFE AND dw_ord.OrderID = dw_ord_dtl.OrderID
		INNER JOIN mydb.dw_product AS dw_prd USING(SKProductID)
		INNER JOIN mydb.dw_category AS dw_ctg USING(SKCategoryID)
), categories_per_company AS (
	SELECT
		category_name,
		SUM(CASE WHEN shipper_company_name = 'Speedy Express' THEN 1 ELSE 0 END) AS shipper_speedy_express,
		SUM(CASE WHEN shipper_company_name = 'United Package' THEN 1 ELSE 0 END) AS shipper_united_package,
		SUM(CASE WHEN shipper_company_name = 'Federal Shipping' THEN 1 ELSE 0 END) AS shipper_federal_shipping
	FROM products_shipped
	GROUP BY category_name
)
SELECT * FROM categories_per_company;

SELECT * FROM mydb.view_advance_ship_rate_in_days;
SELECT * FROM mydb.view_advance_ship_rate_in_days_mean_and_std;
SELECT * FROM mydb.view_advance_ship_rate_in_days_percentiles;
SELECT * FROM mydb.view_late_ship_rate_per_company;
SELECT * FROM mydb.view_categories_per_company;