CREATE OR REPLACE VIEW mydb.view_delivery_revenue_per_country AS
SELECT
	dw_dlv.Country AS country,
    SUM(dw_ord_dtl.Quantity) AS number_of_itens_sold,
    CONCAT('$', FORMAT(SUM(dw_ord_dtl.UnitPrice * dw_ord_dtl.Quantity), 2,'en_US')) AS total_revenue
FROM mydb.dw_order AS dw_ord
	INNER JOIN mydb.dw_order_detail AS dw_ord_dtl USING(DT_REFE, OrderID)
	INNER JOIN mydb.dw_order_logical AS dw_ord_lgc ON dw_ord_lgc.OrderID = dw_ord.OrderID
    INNER JOIN mydb.dw_delivery AS dw_dlv ON dw_dlv.OrderID = dw_ord_lgc.OrderID
GROUP BY dw_dlv.Country
ORDER BY SUM(dw_ord_dtl.UnitPrice * dw_ord_dtl.Quantity) DESC;

SELECT * FROM mydb.view_delivery_revenue_per_country;

CREATE OR REPLACE VIEW mydb.view_delivery_revenue_per_city AS
SELECT
	dw_dlv.Country AS country,
	dw_dlv.City AS city,
    SUM(dw_ord_dtl.Quantity) AS number_of_itens_sold,
    CONCAT('$', FORMAT(SUM(dw_ord_dtl.UnitPrice * dw_ord_dtl.Quantity), 2,'en_US')) AS total_revenue
FROM mydb.dw_order AS dw_ord
	INNER JOIN mydb.dw_order_detail AS dw_ord_dtl USING(DT_REFE, OrderID)
	INNER JOIN mydb.dw_order_logical AS dw_ord_lgc ON dw_ord_lgc.OrderID = dw_ord.OrderID
    INNER JOIN mydb.dw_delivery AS dw_dlv ON dw_dlv.OrderID = dw_ord_lgc.OrderID
GROUP BY dw_dlv.Country, dw_dlv.City
ORDER BY SUM(dw_ord_dtl.UnitPrice * dw_ord_dtl.Quantity) DESC;

SELECT * FROM mydb.view_delivery_revenue_per_city;
