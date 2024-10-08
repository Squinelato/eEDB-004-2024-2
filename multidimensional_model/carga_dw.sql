TRUNCATE TABLE mydb.dw_category;
INSERT INTO mydb.dw_category
SELECT 
CategoryID AS SKCategoryID,
CategoryID, 
current_date() AS DT_INI, 
'2099-12-31' AS DT_FIM, 
current_date() AS DT_LOAD, 
CategoryName,
CategoryDescription, 
MD5(concat(CategoryName, CategoryDescription))  AS CHECKSUM
FROM 
mydb.rel_category;

select * from mydb.dw_category;



INSERT INTO mydb.dw_supplier
SELECT
SupplierID AS SKSupplierID,
SupplierID,
current_date() AS DT_INI, 
'2099-12-31' AS DT_FIM, 
current_date() AS DT_LOAD, 
CompanyName,
ContactName,
ContactTitle,
Address,
City,
Region,
PostalCode,
Country,
MD5(concat(CompanyName,
	ContactName,
	ContactTitle,
	Address,
	City,
	Region,
	PostalCode,
	Country))  AS CHECKSUM
FROM mydb.rel_supplier;

select * from mydb.dw_supplier;



INSERT INTO mydb.dw_product
SELECT
a.ProductID AS SKProductID,
a.ProductID,
current_date() AS DT_INI, 
'2099-12-31' AS DT_FIM, 
current_date() AS DT_LOAD, 
a.ProductName,
b.SKCategoryID, 
c.SKSupplierID,
a.QuantityPerUnit,
a.UnitPrice,
a.UnitsInStock,
a.UnitsOnOrder,
a.Discontinued,
MD5(concat(a.ProductName,
	b.SKCategoryID, 
	c.SKSupplierID,
	a.QuantityPerUnit,
	a.UnitPrice,
	a.UnitsInStock,
	a.UnitsOnOrder,
	a.Discontinued))  AS CHECKSUM
FROM mydb.rel_product a
INNER JOIN mydb.dw_category b ON (b.CategoryID = a.CategoryID) 
INNER JOIN mydb.dw_supplier c ON (c.SupplierID = a.SupplierID);

select * from mydb.dw_product;



CREATE TABLE mydb.Customer_SEQ (
     SK_CustomerID INTEGER NOT NULL AUTO_INCREMENT,
     CustomerID CHAR(5) NOT NULL,
     PRIMARY KEY (SK_CustomerID)
);

INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('1', 'ALFKI');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('2', 'ANATR');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('3', 'ANTON');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('4', 'AROUT');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('5', 'BERGS');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('6', 'BLAUS');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('7', 'BLONP');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('8', 'BOLID');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('9', 'BONAP');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('10', 'BOTTM');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('11', 'BSBEV');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('12', 'CACTU');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('13', 'CENTC');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('14', 'CHOPS');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('15', 'COMMI');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('16', 'CONSH');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('17', 'DRACD');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('18', 'DUMON');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('19', 'EASTC');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('20', 'ERNSH');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('21', 'FAMIA');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('22', 'FISSA');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('23', 'FOLIG');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('24', 'FOLKO');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('25', 'FRANK');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('26', 'FRANR');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('27', 'FRANS');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('28', 'FURIB');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('29', 'GALED');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('30', 'GODOS');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('31', 'GOURL');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('32', 'GREAL');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('33', 'GROSR');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('34', 'HANAR');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('35', 'HILAA');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('36', 'HUNGC');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('37', 'HUNGO');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('38', 'ISLAT');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('39', 'KOENE');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('40', 'LACOR');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('41', 'LAMAI');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('42', 'LAUGB');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('43', 'LAZYK');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('44', 'LEHMS');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('45', 'LETSS');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('46', 'LILAS');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('47', 'LINOD');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('48', 'LONEP');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('49', 'MAGAA');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('50', 'MAISD');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('51', 'MEREP');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('52', 'MORGK');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('53', 'NORTS');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('54', 'OCEAN');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('55', 'OLDWO');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('56', 'OTTIK');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('57', 'PARIS');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('58', 'PERIC');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('59', 'PICCO');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('60', 'PRINI');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('61', 'QUEDE');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('62', 'QUEEN');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('63', 'QUICK');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('64', 'RANCH');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('65', 'RATTC');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('66', 'REGGC');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('67', 'RICAR');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('68', 'RICSU');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('69', 'ROMEY');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('70', 'SANTG');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('71', 'SAVEA');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('72', 'SEVES');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('73', 'SIMOB');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('74', 'SPECD');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('75', 'SPLIR');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('76', 'SUPRD');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('77', 'THEBI');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('78', 'THECR');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('79', 'TOMSP');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('80', 'TORTU');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('81', 'TRADH');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('82', 'TRAIH');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('83', 'VAFFE');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('84', 'VICTE');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('85', 'VINET');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('86', 'WANDK');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('87', 'WARTH');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('88', 'WELLI');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('89', 'WHITC');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('90', 'WILMK');
INSERT INTO `mydb`.`customer_seq` (`SK_CustomerID`, `CustomerID`) VALUES ('91', 'WOLZA');

select * from mydb.customer_seq;

-- TRUNCATE TABLE mydb.dw_customer;
INSERT INTO mydb.dw_customer
SELECT
b.SK_CustomerID,
a.CustomerID,
current_date() AS DT_INI, 
'2099-12-31' AS DT_FIM, 
current_date() AS DT_LOAD, 
CompanyName,
ContactName,
ContactTitle,
Address,
City,
Region,
PostalCode,
Country,
MD5(concat(CompanyName,
	ContactName,
	ContactTitle,
	Address,
	City,
	(CASE WHEN Region IS NULL
    THEN ''
    ELSE Region
    END),
	PostalCode,
	Country))  AS CHECKSUM
FROM mydb.rel_customer a
inner join mydb.customer_seq b on (a.customerID = b.customerID);

select * from mydb.dw_customer;



INSERT INTO mydb.dw_employee
SELECT 
EmployeeID as SKEmployeeID,
EmployeeID,
current_date() AS DT_INI, 
'2099-12-31' AS DT_FIM, 
current_date() AS DT_LOAD, 
LastName,
FirstName,
Title,
BirthDate,
HireDate,
Salary,
MD5(concat(LastName,
	FirstName,
	Title,
	BirthDate,
	HireDate,
	Salary))  AS CHECKSUM
FROM mydb.rel_employee;

select * from mydb.dw_employee;



INSERT INTO mydb.dw_shipper
SELECT
ShipperID as SKShipperID,
ShipperID,
current_date() AS DT_INI, 
'2099-12-31' AS DT_FIM, 
current_date() AS DT_LOAD, 
CompanyName,
MD5(CompanyName)  AS CHECKSUM
FROM mydb.rel_shipper;

select * from mydb.dw_shipper;



INSERT INTO mydb.dw_order_logical
SELECT distinct(OrderID)
FROM mydb.rel_order;

SELECT * FROM mydb.dw_order_logical;



INSERT INTO mydb.dw_order
SELECT
a.OrderDate,
a.OrderID,
current_date() AS DT_LOAD,
b.SKCustomerID,
c.SKEmployeeID,
a.OrderDate
FROM mydb.rel_order a
inner join mydb.dw_customer b on (a.CustomerID = b.CustomerID)
inner join mydb.dw_employee c on (a.EmployeeID = c.EmployeeID);

SELECT * FROM mydb.dw_order;



INSERT INTO mydb.dw_order_detail
SELECT
b.OrderDate,
a.OrderID,
c.SKProductID,
current_date() AS DT_LOAD,
a.UnitPrice,
a.Quantity,
a.Discount
FROM mydb.rel_order_detail a
inner join mydb.rel_order b on (a.OrderID = b.OrderID)
inner join mydb.dw_product c on (a.ProductID = c.ProductID);

SELECT * FROM mydb.dw_order_detail;



INSERT INTO mydb.dw_delivery
SELECT
CASE WHEN a.ShippedDate IS NULL
THEN '2099-12-31'
ELSE a.ShippedDate
END,
a.OrderID,
b.SKshipperID,
current_date() AS DT_LOAD,
a.RequiredDate,
a.ShippedDate,
a.Freight,
a.ShipAddress,
a.ShipCity,
a.ShipRegion,
a.ShipPostalCode,
a.ShipCountry
FROM mydb.rel_delivery a
inner join mydb.dw_shipper b on (a.ShipperID = b.ShipperID);

SELECT * FROM mydb.dw_delivery;



INSERT INTO mydb.dw_store
SELECT
StoreID AS SKStoreID,
StoreID,
current_date() AS DT_INI, 
'2099-12-31' AS DT_FIM, 
current_date() AS DT_LOAD,
ManagerID,
Address,
City,
Region,
PostalCode,
Country,
MD5(
	concat(
		Address,
		City,
		(CASE
			WHEN Region IS NULL THEN ''
			ELSE Region
		END),
		PostalCode,
		Country
	)
) AS CHECKSUM
FROM mydb.rel_store;


SELECT * FROM mydb.dw_store;

