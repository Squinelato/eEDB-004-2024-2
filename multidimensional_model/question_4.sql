CREATE OR REPLACE VIEW mydb.view_inventory AS
SELECT
	dw_prd.ProductName AS product_name,
    dw_prd.UnitsInStock AS unit_in_stock
FROM mydb.dw_product AS dw_prd
WHERE dw_prd.DT_FIM = '2099-12-31'
ORDER BY unit_in_stock ASC;

SELECT * FROM mydb.view_inventory;