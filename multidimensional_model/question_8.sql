SELECT
	dw_ord.OrderID AS order_id,
    MAX(CASE WHEN dw_ctg.CategoryName = 'Beverages' THEN 1 ELSE 0 END) AS category_beverages,
    MAX(CASE WHEN dw_ctg.CategoryName = 'Condiments' THEN 1 ELSE 0 END) AS category_condiments,
    MAX(CASE WHEN dw_ctg.CategoryName = 'Confections' THEN 1 ELSE 0 END) AS category_confections,
    MAX(CASE WHEN dw_ctg.CategoryName = 'Dairy Products' THEN 1 ELSE 0 END) AS category_dairy_products,
    MAX(CASE WHEN dw_ctg.CategoryName = 'Grains/Cereals' THEN 1 ELSE 0 END) AS category_grains_cereals,
    MAX(CASE WHEN dw_ctg.CategoryName = 'Meat/Poultry' THEN 1 ELSE 0 END) AS category_meat_poultry,
    MAX(CASE WHEN dw_ctg.CategoryName = 'Produce' THEN 1 ELSE 0 END) AS category_produce,
    MAX(CASE WHEN dw_ctg.CategoryName = 'Seafood' THEN 1 ELSE 0 END) AS category_seafood
FROM mydb.dw_order AS dw_ord
	INNER JOIN mydb.dw_order_detail AS dw_ord_dtl USING(DT_REFE, OrderID)
    INNER JOIN mydb.dw_product AS dw_prd USING(SKProductID)
    INNER JOIN mydb.dw_category AS dw_ctg USING(SKCategoryID)
GROUP BY dw_ord.OrderID;

SELECT distinct CategoryName FROM mydb.dw_category;