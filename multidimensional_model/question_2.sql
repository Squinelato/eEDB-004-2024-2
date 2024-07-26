CREATE OR REPLACE VIEW mydb.view_products AS
SELECT
    dw_prd.ProductID AS product_id,
    dw_prd.ProductName AS product_name,
    SUM(dw_ord_dtl.Quantity) AS number_of_itens_sold,
    SUM(dw_ord_dtl.UnitPrice * dw_ord_dtl.Quantity) AS total_product_revenue,
    dw_prd.DT_INI AS 'from_date',
	dw_prd.DT_FIM AS 'to_date'
FROM mydb.dw_product AS dw_prd
INNER JOIN mydb.dw_order_detail AS dw_ord_dtl USING(SKProductID)
GROUP BY dw_prd.SKProductID
ORDER BY total_product_revenue DESC;

SELECT * FROM mydb.view_products;