SELECT
	d_ord_dtl.OrderID,
    SUM(d_ord_dtl.UnitPrice * d_ord_dtl.Quantity) AS total_revenue
FROM `DB`.`FactOrder` AS f_ord
INNER JOIN `DB`.`DimOrderDetail` AS d_ord_dtl USING(OrderID)
GROUP BY f_ord.OrderID
ORDER BY f_ord.OrderDate;