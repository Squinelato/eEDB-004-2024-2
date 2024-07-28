WITH delivery AS (
	SELECT
		dw_dlv.OrderID AS order_id,
		dw_dlv.RequiredDate AS required_date,
		dw_dlv.ShippedDate AS shipped_date,
        DATEDIFF(dw_dlv.RequiredDate, dw_dlv.ShippedDate) AS advance_ship_rate_in_days
	FROM mydb.dw_delivery as dw_dlv
), delivery_metrics AS (
	SELECT
		AVG(advance_ship_rate_in_days) AS avg_advance_ship_rate_in_days,
        STD(advance_ship_rate_in_days) AS std_advance_ship_rate_in_days
	FROM delivery
)
SELECT * FROM delivery_metrics;

SELECT * FROM mydb.dw_delivery;