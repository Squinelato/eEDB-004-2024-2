CREATE OR REPLACE VIEW mydb.view_revenue_per_order AS
SELECT
	dw_ord.OrderID AS order_id,
    SUM(dw_ord_dtl.Quantity) AS number_of_itens_sold,
    CONCAT('$', FORMAT(SUM(dw_ord_dtl.UnitPrice * dw_ord_dtl.Quantity), 2,'en_US')) AS total_revenue
FROM mydb.dw_order AS dw_ord
	INNER JOIN mydb.dw_order_detail AS dw_ord_dtl USING(DT_REFE, OrderID)
GROUP BY dw_ord.OrderID
ORDER BY SUM(dw_ord_dtl.UnitPrice * dw_ord_dtl.Quantity) DESC;

SELECT * FROM mydb.view_revenue_per_order;