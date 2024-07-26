CREATE OR REPLACE VIEW mydb.view_revenue_per_day AS
SELECT
	dw_ord.DT_REFE AS reference_date,
	COUNT(*) AS number_of_orders,
    SUM(dw_ord_dtl.Quantity) AS number_of_itens_sold,
    CONCAT('$', FORMAT(SUM(dw_ord_dtl.UnitPrice * dw_ord_dtl.Quantity), 2,'en_US')) AS total_revenue
FROM mydb.dw_order AS dw_ord
INNER JOIN mydb.dw_order_detail AS dw_ord_dtl USING(DT_REFE, OrderID)
GROUP BY dw_ord.DT_REFE
ORDER BY reference_date DESC;

SELECT * FROM mydb.view_revenue_per_day;