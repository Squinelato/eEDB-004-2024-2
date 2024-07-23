SELECT
	f_prd.ProductName
FROM `DB`.`FactProduct` AS f_prd
INNER JOIN `DB`.`DimStock` AS d_stk USING(ProductSK)
WHERE
	f_prd.IsCurrentRecord = true
    AND d_stk.IsCurrentRecord = true