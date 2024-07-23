SELECT 
	COUNT(*) AS number_of_orders,
    OrderDate
FROM `DB`.`FactOrder`
WHERE OrderDate BETWEEN '2024-04-01' AND '2024-08-16'
GROUP BY OrderDate
ORDER BY OrderDate;