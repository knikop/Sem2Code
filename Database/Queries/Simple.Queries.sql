
--======== SELECT WITH WHERE CLAUSE

SELECT P_DESCRIPT, P_INDATE, P_PRICE, V_CODE
FROM   PRODUCT
WHERE  V_CODE = 21344;

-- Other comparison operators >, >=, <, <=, <>

SELECT P_DESCRIPT, P_INDATE, P_PRICE, V_CODE
FROM   PRODUCT
WHERE  V_CODE < > 21344;

--: Access user <>  w/o spaces

SELECT P_DESCRIPT, P_QOH, P_MIN, P_PRICE
FROM   PRODUCT
WHERE  P_PRICE <= 10;

-- Using comparison operators in character attributes

SELECT P_CODE, P_DESCRIPT, P_QOH, P_MIN, P_PRICE
FROM   PRODUCT
WHERE  P_CODE < '1558-QW1';

-- Using comparison operators on dates

SELECT P_DESCRIPT, P_QOH, P_MIN, P_PRICE, P_INDATE
FROM   PRODUCT
WHERE  P_INDATE >= '20-JAN-2012';

-- Using computed columns and aliases

SELECT P_DESCRIPT, P_QOH, P_PRICE, P_QOH*P_PRICE
FROM   PRODUCT;

SELECT P_DESCRIPT, P_QOH, P_PRICE, P_QOH*P_PRICE AS TOTVALUE
FROM   PRODUCT;

SELECT P_CODE, P_INDATE, SYSDATE - 90 AS CUTDATE
FROM   PRODUCT
WHERE  P_INDATE <= SYSDATE - 90;

SELECT P_CODE, P_INDATE, P_INDATE + 90 AS EXPDATE
FROM   PRODUCT;

-- Logical operators AND, OR, NOT

SELECT P_DESCRIPT, P_INDATE, P_PRICE, V_CODE
FROM   PRODUCT
WHERE  V_CODE = 21344
   OR  V_CODE = 24288;

SELECT P_DESCRIPT, P_INDATE, P_PRICE, V_CODE
FROM   PRODUCT
WHERE  P_PRICE < 50
AND    P_INDATE > '15-JAN-2012';

SELECT P_DESCRIPT, P_INDATE, P_PRICE, V_CODE
FROM   PRODUCT
WHERE (P_PRICE < 50 AND P_INDATE > '15-JAN-2012')
OR     V_CODE = 24288;

SELECT *
FROM   PRODUCT
WHERE  NOT (V_CODE = 21344);

-- Special operators : BETWEEN, IS NULL, LIKE, IN, EXITS

SELECT *
FROM   PRODUCT
WHERE  P_PRICE BETWEEN 50.00 AND 100.00;

-- If DBMS does not support BETWEEN
SELECT *
FROM   PRODUCT
WHERE  P_PRICE > 50.00 AND P_PRICE < 100.00;


SELECT P_CODE, P_DESCRIPT, V_COCE
FROM   PRODUCT
WHERE  V_CODE IS NULL;

SELECT P_CODE, P_DESCRIPT, P_INDATE
FROM   PRODUCT
WHERE  P_INDATE IS NULL;

-- Note: MS Access is case insensitive, ORACLE is case sensitive
-- Note: MS Access uses * and %, ORACLE uses % and _

SELECT V_NAME, V_CONTACT, V_AREACODE, V_PHONE
FROM   VENDOR
WHERE  V_CONTACT LIKE 'Smith%';

--: or use this version if case sensitive

SELECT V_NAME, V_CONTACT, V_AREACODE, V_PHONE
FROM   VENDOR
WHERE  UPPER(V_CONTACT) LIKE 'SMITH%';

SELECT V_NAME, V_CONTACT, V_AREACODE, V_PHONE
FROM   VENDOR
WHERE  V_CONTACT NOT LIKE 'Smith%';

SELECT *
FROM   VENDOR
WHERE  V_CONTACT LIKE 'Johns_n';

SELECT *
FROM   PRODUCT
WHERE  V_CODE IN (21344, 24288);

--If DBMS does not support IN
SELECT *
FROM   PRODUCT
WHERE  V_CODE = 21344
OR     V_CODE = 24288;

-- Q: List the v_code of vendors that provide products
SELECT V_CODE FROM PRODUCT;      		-- includes duplicates and Nulls

SELECT DISTINCT V_CODE FROM PRODUCT;      	-- includes Nulls

-- Q: List the V_CODE and V_NAME of vendors that provide products
SELECT V_CODE, V_NAME
FROM   VENDOR
WHERE  V_CODE IN (SELECT DISTINCT V_CODE FROM PRODUCT);

-- Three value logic (NULL) problem - Null values in FK cause problems
-- Q: List the V_CODE and V_NAME of vendors that do not provide products

SELECT V_CODE, V_NAME
FROM   VENDOR
WHERE  V_CODE NOT IN (SELECT DISTINCT V_CODE FROM PRODUCT);   - will list no rows!

-- Correct answer
SELECT V_CODE, V_NAME
FROM   VENDOR
WHERE  V_CODE NOT IN (SELECT DISTINCT V_CODE FROM PRODUCT WHERE V_CODE IS NOT NULL);

-- EXISTS
-- Returns true if the inner query returns at least 1 row, otherwise it returns false
-- Q: List all vendors but only if there are products to order (P_QOH <= P_MIN)

SELECT *
FROM   VENDOR
WHERE  EXISTS (SELECT * FROM PRODUCT WHERE P_QOH <= P_MIN);

-- Q: List all vendors but only if there are products with the qty on hand less than double the min qty
SELECT * FROM VENDOR
WHERE  EXISTS (SELECT * FROM PRODUCT WHERE P_QOH < P_MIN*2);

-- Q: List the products that are supplied by a vendor
SELECT *
FROM   PRODUCT
WHERE  V_CODE IS NOT NULL;