CREATE OR REPLACE VIEW mydb.view_categories_per_order_co_occurrence_matrix AS
WITH categories_per_order AS (
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
	GROUP BY dw_ord.OrderID
)
SELECT
	'Beverages' AS Category,
	0 AS Beverages,
    SUM(CASE WHEN category_beverages = 1 AND category_condiments = 1 THEN 1 ELSE 0 END) AS Condiments,
    SUM(CASE WHEN category_beverages = 1 AND category_confections = 1 THEN 1 ELSE 0 END) AS Confections,
    SUM(CASE WHEN category_beverages = 1 AND category_dairy_products = 1 THEN 1 ELSE 0 END) AS 'Dairy Products',
    SUM(CASE WHEN category_beverages = 1 AND category_grains_cereals = 1 THEN 1 ELSE 0 END) AS 'Grains/Cereals',
    SUM(CASE WHEN category_beverages = 1 AND category_meat_poultry = 1 THEN 1 ELSE 0 END) AS 'Meat/Poultry',
    SUM(CASE WHEN category_beverages = 1 AND category_produce = 1 THEN 1 ELSE 0 END) AS Produce,
    SUM(CASE WHEN category_beverages = 1 AND category_seafood = 1 THEN 1 ELSE 0 END) AS Seafood
FROM categories_per_order
UNION
SELECT
	'Condiments' AS Category,
	SUM(CASE WHEN category_condiments = 1 AND category_beverages = 1 THEN 1 ELSE 0 END) AS Beverages,
    0 AS Condiments,
    SUM(CASE WHEN category_condiments = 1 AND category_confections = 1 THEN 1 ELSE 0 END) AS Confections,
    SUM(CASE WHEN category_condiments = 1 AND category_dairy_products = 1 THEN 1 ELSE 0 END) AS 'Dairy Products',
    SUM(CASE WHEN category_condiments = 1 AND category_grains_cereals = 1 THEN 1 ELSE 0 END) AS 'Grains/Cereals',
    SUM(CASE WHEN category_condiments = 1 AND category_meat_poultry = 1 THEN 1 ELSE 0 END) AS 'Meat/Poultry',
    SUM(CASE WHEN category_condiments = 1 AND category_produce = 1 THEN 1 ELSE 0 END) AS Produce,
    SUM(CASE WHEN category_condiments = 1 AND category_seafood = 1 THEN 1 ELSE 0 END) AS Seafood
FROM categories_per_order
UNION
SELECT
	'Confections' AS Category,
	SUM(CASE WHEN category_confections = 1 AND category_beverages = 1 THEN 1 ELSE 0 END) AS Beverages,
    SUM(CASE WHEN category_confections = 1 AND category_condiments = 1 THEN 1 ELSE 0 END) AS Condiments,
    0 AS Confections,
    SUM(CASE WHEN category_confections = 1 AND category_dairy_products = 1 THEN 1 ELSE 0 END) AS 'Dairy Products',
    SUM(CASE WHEN category_confections = 1 AND category_grains_cereals = 1 THEN 1 ELSE 0 END) AS 'Grains/Cereals',
    SUM(CASE WHEN category_confections = 1 AND category_meat_poultry = 1 THEN 1 ELSE 0 END) AS 'Meat/Poultry',
    SUM(CASE WHEN category_confections = 1 AND category_produce = 1 THEN 1 ELSE 0 END) AS Produce,
    SUM(CASE WHEN category_confections = 1 AND category_seafood = 1 THEN 1 ELSE 0 END) AS Seafood
FROM categories_per_order
UNION
SELECT
	'Dairy Products' AS Category,
	SUM(CASE WHEN category_dairy_products = 1 AND category_beverages = 1 THEN 1 ELSE 0 END) AS Beverages,
    SUM(CASE WHEN category_dairy_products = 1 AND category_condiments = 1 THEN 1 ELSE 0 END) AS Condiments,
    SUM(CASE WHEN category_dairy_products = 1 AND category_confections = 1 THEN 1 ELSE 0 END) AS Confections,
    0 AS 'Dairy Products',
    SUM(CASE WHEN category_dairy_products = 1 AND category_grains_cereals = 1 THEN 1 ELSE 0 END) AS 'Grains/Cereals',
    SUM(CASE WHEN category_dairy_products = 1 AND category_meat_poultry = 1 THEN 1 ELSE 0 END) AS 'Meat/Poultry',
    SUM(CASE WHEN category_dairy_products = 1 AND category_produce = 1 THEN 1 ELSE 0 END) AS Produce,
    SUM(CASE WHEN category_dairy_products = 1 AND category_seafood = 1 THEN 1 ELSE 0 END) AS Seafood
FROM categories_per_order
UNION
SELECT
	'Grains/Cereals' AS Category,
	SUM(CASE WHEN category_grains_cereals = 1 AND category_beverages = 1 THEN 1 ELSE 0 END) AS Beverages,
    SUM(CASE WHEN category_grains_cereals = 1 AND category_condiments = 1 THEN 1 ELSE 0 END) AS Condiments,
    SUM(CASE WHEN category_grains_cereals = 1 AND category_confections = 1 THEN 1 ELSE 0 END) AS Confections,
    SUM(CASE WHEN category_grains_cereals = 1 AND category_dairy_products = 1 THEN 1 ELSE 0 END) AS 'Dairy Products',
    0 AS 'Grains/Cereals',
    SUM(CASE WHEN category_grains_cereals = 1 AND category_meat_poultry = 1 THEN 1 ELSE 0 END) AS 'Meat/Poultry',
    SUM(CASE WHEN category_grains_cereals = 1 AND category_produce = 1 THEN 1 ELSE 0 END) AS Produce,
    SUM(CASE WHEN category_grains_cereals = 1 AND category_seafood = 1 THEN 1 ELSE 0 END) AS Seafood
FROM categories_per_order
UNION
SELECT
	'Meat/Poultry' AS Category,
	SUM(CASE WHEN category_meat_poultry = 1 AND category_beverages = 1 THEN 1 ELSE 0 END) AS Beverages,
    SUM(CASE WHEN category_meat_poultry = 1 AND category_condiments = 1 THEN 1 ELSE 0 END) AS Condiments,
    SUM(CASE WHEN category_meat_poultry = 1 AND category_confections = 1 THEN 1 ELSE 0 END) AS Confections,
    SUM(CASE WHEN category_meat_poultry = 1 AND category_dairy_products = 1 THEN 1 ELSE 0 END) AS 'Dairy Products',
    SUM(CASE WHEN category_meat_poultry = 1 AND category_grains_cereals = 1 THEN 1 ELSE 0 END) AS 'Grains/Cereals',
    0 AS 'Meat/Poultry',
    SUM(CASE WHEN category_meat_poultry = 1 AND category_produce = 1 THEN 1 ELSE 0 END) AS Produce,
    SUM(CASE WHEN category_meat_poultry = 1 AND category_seafood = 1 THEN 1 ELSE 0 END) AS Seafood
FROM categories_per_order
UNION
SELECT
	'Produce' AS Category,
	SUM(CASE WHEN category_produce = 1 AND category_beverages = 1 THEN 1 ELSE 0 END) AS Beverages,
    SUM(CASE WHEN category_produce = 1 AND category_condiments = 1 THEN 1 ELSE 0 END) AS Condiments,
    SUM(CASE WHEN category_produce = 1 AND category_confections = 1 THEN 1 ELSE 0 END) AS Confections,
    SUM(CASE WHEN category_produce = 1 AND category_dairy_products = 1 THEN 1 ELSE 0 END) AS 'Dairy Products',
    SUM(CASE WHEN category_produce = 1 AND category_grains_cereals = 1 THEN 1 ELSE 0 END) AS 'Grains/Cereals',
    SUM(CASE WHEN category_produce = 1 AND category_meat_poultry = 1 THEN 1 ELSE 0 END) AS 'Meat/Poultry',
    0 AS Produce,
    SUM(CASE WHEN category_produce = 1 AND category_seafood = 1 THEN 1 ELSE 0 END) AS Seafood
FROM categories_per_order
UNION
SELECT
	'Seafood' AS Category,
	SUM(CASE WHEN category_seafood = 1 AND category_beverages = 1 THEN 1 ELSE 0 END) AS Beverages,
    SUM(CASE WHEN category_seafood = 1 AND category_condiments = 1 THEN 1 ELSE 0 END) AS Condiments,
    SUM(CASE WHEN category_seafood = 1 AND category_confections = 1 THEN 1 ELSE 0 END) AS Confections,
    SUM(CASE WHEN category_seafood = 1 AND category_dairy_products = 1 THEN 1 ELSE 0 END) AS 'Dairy Products',
    SUM(CASE WHEN category_seafood = 1 AND category_grains_cereals = 1 THEN 1 ELSE 0 END) AS 'Grains/Cereals',
    SUM(CASE WHEN category_seafood = 1 AND category_meat_poultry = 1 THEN 1 ELSE 0 END) AS 'Meat/Poultry',
    SUM(CASE WHEN category_seafood = 1 AND category_produce = 1 THEN 1 ELSE 0 END) AS Produce,
    0 AS Seafood
FROM categories_per_order;

SELECT * FROM mydb.view_categories_per_order_co_occurrence_matrix;