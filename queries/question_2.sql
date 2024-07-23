SELECT
	d_ord_dtl.ProductSK,
    SUM(d_ord_dtl.Quantity) AS total_number_of_products_sold,
    SUM(d_ord_dtl.UnitPrice * d_ord_dtl.Quantity) AS total_revenue
FROM `DB`.`FactOrder` AS f_ord
INNER JOIN `DB`.`DimOrderDetail` AS d_ord_dtl USING(OrderID)
GROUP BY d_ord_dtl.ProductSK
ORDER BY f_ord.OrderDate;