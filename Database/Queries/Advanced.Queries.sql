

-- SELECT WITH ORDER BY

SELECT P_CODE, P_DESCRIPT, P_INDATE, P_PRICE
FROM   PRODUCT
ORDER  BY P_PRICE

SELECT P_CODE, P_DESCRIPT, P_INDATE, P_PRICE
FROM   PRODUCT
ORDER  BY P_PRICE DESC

SELECT EMP_LNAME, EMP_FNAME, EMP_INITIAL, EMP_AREACODE, EMP_PHONE
FROM   EMPLOYEE
ORDER  BY EMP_LNAME, EMP_FNAME, EMP_INITIAL

SELECT P_DESCRIPT, V_CODE, P_INDATE, P_PRICE
FROM   PRODUCT
WHERE  P_INDATE < '21-JAN-2012'
  AND  P_PRICE <= 50.00
ORDER  BY V_CODE, P_PRICE DESC

-- LISTING UNIQUE VALUES (ROWS!)

SELECT DISTINCT V_CODE FROM PRODUCT

SELECT DISTINCT V_STATE FROM VENDOR

-- UNIQUE ROWS (VALUES COMBINATIONS)

SELECT DISTINCT V_STATE, V_NAME FROM VENDOR

SELECT DISTINCT V_STATE, V_AREACODE FROM VENDOR


-- AGGREGATE FUNCTIONS: COUNT, MIN, MAX, SUM AND AVG

-- COUNT 
- Q: How many vendors provide products?
- COUNT(column) counts the not null values in column
SELECT COUNT(DISTINCT V_CODE) FROM PRODUCT                   

- COUNT(*) counts the number of rows returned
SELECT COUNT(*) FROM (SELECT DISTINCT V_CODE FROM PRODUCT)

SELECT COUNT(*) FROM (SELECT DISTINCT V_CODE FROM PRODUCT WHERE V_CODE IS NOT NULL)

- Q: How many vendors (unique vendors) have products with price < 10?
SELECT COUNT(DISTINCT V_CODE) 
FROM   PRODUCT 
WHERE  P_PRICE <= 10.00

- Q: How many products with price < 10?
SELECT COUNT(*) FROM PRODUCT 
WHERE  P_PRICE <= 10.00

-- MAX AND MIN

SELECT MAX(P_PRICE) FROM PRODUCT

SELECT MIN(P_PRICE) FROM PRODUCT

- Q: What product(s) have a price equal to the maximum product price?
SELECT P_CODE, P_DESCRIPT, P_PRICE 
FROM   PRODUCT
WHERE  P_PRICE = (SELECT MAX(P_PRICE) FROM PRODUCT)

- Q: What product(s) have the highest inventory value?
SELECT *
FROM   PRODUCT
WHERE  P_QOH * P_PRICE = (SELECT MAX(P_QOH * P_PRICE) FROM PRODUCT)

-- SUM
- Q: How much is the total customer balance?
SELECT SUM(CUS_BALANCE) AS TOTBALANCE FROM CUSTOMER

- Q: How much is the total value of our product inventory?
SELECT SUM(P_QOH*P_PRICE) AS TOTVALUE
FROM   PRODUCT

-- AVG
- Q: What is the average product price?
SELECT AVG(P_PRICE) FROM PRODUCT;

- Q: What products have a price that exceeds the average product price?
SELECT P_CODE, P_DESCRIPT, P_QOH, P_PRICE, V_CODE 
FROM   PRODUCT
WHERE  P_PRICE > (SELECT AVG(P_PRICE) FROM PRODUCT)
ORDER  BY P_PRICE DESC

-- GROUP BY
- Q: What is the minimum price for each sale code?
SELECT P_SALECODE, MIN(P_PRICE)
FROM   PRODUCT
GROUP  BY P_SALECODE

- Q: What is the average price for each sale code?
SELECT P_SALECODE, AVG(P_PRICE)
FROM   PRODUCT
GROUP  BY P_SALECODE

- The following will generate an error 
- GROUP BY must be used with aggregation functions
SELECT V_CODE, P_CODE, P_DESCRIPT,P_PRICE
FROM   PRODUCT
GROUP  BY V_CODE

- How many products each vendor provides?
SELECT V_CODE, COUNT(DISTINCT P_CODE)
FROM   PRODUCT
GROUP  BY V_CODE

-- GROUP BY WITH HAVING CLAUSE
-Q: List the number of products by vendor with the average price, include only the rows with price below 10.00.
SELECT V_CODE, COUNT(DISTINCT P_CODE), AVG(P_PRICE)
FROM   PRODUCT
GROUP  BY V_CODE

SELECT V_CODE, COUNT(DISTINCT P_CODE), AVG(P_PRICE)
FROM   PRODUCT
GROUP  BY V_CODE
HAVING AVG(P_PRICE) < 10

- Q: The following SQL command will:
-    1 - Aggregate the total cost of products group by vendor
-    2 - Select only the rows having a total cost greater than 500
-    3 - List the results in descending order by total cost

SELECT V_CODE, SUM(P_QOH * P_PRICE) AS TOTCOST
FROM   PRODUCT
GROUP  BY V_CODE
HAVING (SUM(P_QOH * P_PRICE)>500)
ORDER  BY SUM(P_QOH * P_PRICE) DESC


--====== JOINS
- Q: List the product description, price, vendor code, name, contact, area code and phone for each product
SELECT P_DESCRIPT, P_PRICE, VENDOR.V_CODE, V_NAME, V_CONTACT, V_AREACODE, V_PHONE 
FROM   PRODUCT, VENDOR
WHERE  PRODUCT.V_CODE = VENDOR.V_CODE

- Q: Ordered by P_PRICE
SELECT P_DESCRIPT, P_PRICE, VENDOR.V_CODE, V_NAME, V_CONTACT, V_AREACODE, V_PHONE
FROM   PRODUCT, VENDOR
WHERE  PRODUCT.V_CODE = VENDOR.V_CODE
ORDER  BY P_PRICE

- Q: List products with vendor data for products purchased after 15-JAN-2010
SELECT P_DESCRIPT, P_PRICE, V_NAME, V_CONTACT, V_AREACODE, V_PHONE
FROM   PRODUCT, VENDOR
WHERE  PRODUCT.V_CODE = VENDOR.V_CODE
  AND  P_INDATE > '15-JAN-2012'

- Q: List all invoice data for customer number 10014
SELECT CUS_LNAME, INVOICE.INV_NUMBER, INV_DATE, P_DESCRIPT
FROM   CUSTOMER, INVOICE, LINE, PRODUCT
WHERE  CUSTOMER.CUS_CODE = INVOICE.CUS_CODE
  AND  INVOICE.INV_NUMBER = LINE.INV_NUMBER
  AND  LINE.P_CODE = PRODUCT.P_CODE
  AND  CUSTOMER.CUS_CODE = 10014
ORDER  BY INVOICE.INV_NUMBER


-- USING ALIAS
SELECT P_DESCRIPT, P_PRICE, V_NAME, V_CONTACT, V_AREACODE, V_PHONE
FROM   PRODUCT P, VENDOR V
WHERE  P.V_CODE = V.V_CODE
ORDER  BY P_PRICE

-- RECURSIVE QUERIES
-- List all employees with their manager's name
-- Using EMP table

SELECT E.EMP_MGR, M.EMP_LNAME,E.EMP_NUM, E.EMP_LNAME
FROM   EMP E, EMP M
WHERE  E.EMP_MGR=M.EMP_NUM
ORDER  BY E.EMP_MGR