CREATE OR REPLACE VIEW mydb.view_revenue_per_employee_per_month AS
SELECT
	dw_emp.EmployeeID AS employee_id,
	CONCAT(dw_emp.FirstName, ' ', dw_emp.LastName) AS employee_name,
    DATE_FORMAT(OrderDate, '%Y-%m') AS period,
	COUNT(*) AS number_of_orders,
    CONCAT('$', FORMAT(SUM(dw_ord_dtl.UnitPrice * dw_ord_dtl.Quantity), 2,'en_US')) AS revenue
FROM mydb.dw_employee AS dw_emp
	INNER JOIN mydb.dw_order AS dw_ord USING(SKEmployeeID)
	INNER JOIN mydb.dw_order_detail AS dw_ord_dtl USING(DT_REFE, OrderID)
GROUP BY DATE_FORMAT(dw_ord.OrderDate, '%Y-%m'), dw_emp.EmployeeID, dw_emp.LastName, dw_emp.FirstName
ORDER BY DATE_FORMAT(dw_ord.OrderDate, '%Y-%m') DESC, SUM(dw_ord_dtl.UnitPrice * dw_ord_dtl.Quantity) DESC;

CREATE OR REPLACE VIEW mydb.view_revenue_per_employee_per_year AS
SELECT
	dw_emp.EmployeeID AS employee_id,
	CONCAT(dw_emp.FirstName, ' ', dw_emp.LastName) AS employee_name,
    DATE_FORMAT(OrderDate, '%Y') AS period,
	COUNT(*) AS number_of_orders,
    CONCAT('$', FORMAT(SUM(dw_ord_dtl.UnitPrice * dw_ord_dtl.Quantity), 2,'en_US')) AS revenue
FROM mydb.dw_employee AS dw_emp
	INNER JOIN mydb.dw_order AS dw_ord USING(SKEmployeeID)
	INNER JOIN mydb.dw_order_detail AS dw_ord_dtl USING(DT_REFE, OrderID)
GROUP BY DATE_FORMAT(dw_ord.OrderDate, '%Y'), dw_emp.EmployeeID, dw_emp.LastName, dw_emp.FirstName
ORDER BY DATE_FORMAT(dw_ord.OrderDate, '%Y') DESC, SUM(dw_ord_dtl.UnitPrice * dw_ord_dtl.Quantity) DESC;

CREATE OR REPLACE VIEW mydb.view_revenue_per_employee AS
SELECT
	dw_emp.EmployeeID AS employee_id,
	CONCAT(dw_emp.FirstName, ' ', dw_emp.LastName) AS employee_name,
	COUNT(*) AS number_of_orders,
    CONCAT('$', FORMAT(SUM(dw_ord_dtl.UnitPrice * dw_ord_dtl.Quantity), 2,'en_US')) AS total_revenue
FROM mydb.dw_employee AS dw_emp
	INNER JOIN mydb.dw_order AS dw_ord USING(SKEmployeeID)
	INNER JOIN mydb.dw_order_detail AS dw_ord_dtl USING(DT_REFE, OrderID)
GROUP BY dw_emp.EmployeeID, dw_emp.LastName, dw_emp.FirstName
ORDER BY SUM(dw_ord_dtl.UnitPrice * dw_ord_dtl.Quantity) DESC;

SELECT * FROM mydb.view_revenue_per_employee_per_month;
SELECT * FROM mydb.view_revenue_per_employee_per_year;
SELECT * FROM mydb.view_revenue_per_employee;