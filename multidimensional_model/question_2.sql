CREATE OR REPLACE VIEW mydb.view_revenue_per_product AS
SELECT
    dw_prd.ProductID AS product_id,
    dw_prd.ProductName AS product_name,
    SUM(dw_ord_dtl.Quantity) AS number_of_itens_sold,
    CONCAT('$', FORMAT(SUM(dw_ord_dtl.UnitPrice * dw_ord_dtl.Quantity), 2,'en_US')) AS total_product_revenue
FROM mydb.dw_product AS dw_prd
	INNER JOIN mydb.dw_order_detail AS dw_ord_dtl USING(SKProductID)
GROUP BY dw_prd.ProductID, dw_prd.ProductName
ORDER BY SUM(dw_ord_dtl.UnitPrice * dw_ord_dtl.Quantity) DESC;

SELECT * FROM mydb.view_revenue_per_product;