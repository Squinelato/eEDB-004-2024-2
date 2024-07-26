CREATE OR REPLACE VIEW mydb.view_orders AS
SELECT
	dw_ord.DT_REFE AS reference_date,
	COUNT(*) AS number_of_orders
FROM mydb.dw_order AS dw_ord
INNER JOIN mydb.dw_order_detail AS dw_ord_dtl USING(DT_REFE, OrderID)
GROUP BY dw_ord.DT_REFE
ORDER BY reference_date DESC;

SELECT * FROM mydb.view_orders;