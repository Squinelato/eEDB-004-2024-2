CREATE OR REPLACE VIEW mydb.view_revenue AS
SELECT
	dw_ord.OrderID AS order_id,
    SUM(dw_ord_dtl.UnitPrice * dw_ord_dtl.Quantity) AS total_revenue
FROM mydb.dw_order AS dw_ord
INNER JOIN mydb.dw_order_detail AS dw_ord_dtl USING(DT_REFE, OrderID)
GROUP BY dw_ord.OrderID
ORDER BY total_revenue DESC;

SELECT * FROM mydb.view_revenue;