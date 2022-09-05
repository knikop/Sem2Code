--Assignment 1

--Kosta Nikopoulos


--1) Find all customers who does not have initials.
Select *
FROM customer
WHERE 
cus_initial IS NULL
ORDER BY cus_code DESC;



--2) Find all vendors whose phone number’s area code is 615.
SELECT
    v_code, v_name, v_areacode As "Area-Code", v_phone
FROM vendor
WHERE
v_areacode = '615';



--3) How many products with price > 100?
SELECT
    p_code, p_descript, p_price As "Price", v_code
FROM product
WHERE p_price > 100;



--4) Find the line price of the product whose code is 23109-HB
SELECT
    p_code As "Product Code", inv_number, line_units, line_price
FROM line
WHERE p_code = '23109-HB';



--5) List the number of products each vendor provides.
SELECT
    p.p_code, p.p_qoh, v.v_code
FROM product p, vendor v
WHERE p.v_code = v.v_code;



--6) Count the number of products that do not have a vendor assigned.
SELECT COUNT(*)
FROM product
WHERE v_code IS NULL;


--7) List information about products whose vendor code is either 24288 or 25443.
SELECT
    p_code, p_descript, p_discount, p_price, v_code AS "Vendor Code"
FROM product
WHERE 
v_code = '24288'
OR v_code = '25443';


--8) List the products whose stock date was later than 01-MAR-12.
SELECT
    p_code,p_descript,p_price,p_indate AS "Date"
FROM product
WHERE p_indate > '01-MAR-12';



--9) How many invoices were generated for each customer?

SELECT cus_code, COUNT(inv_number)
FROM invoice
GROUP BY inv_number, cus_code
HAVING
COUNT(inv_number)>0;



--10) List all information about customers whose first name does not start with A or K.
SELECT 
    c.cus_fname, c.cus_initial, i.cus_code, l.inv_number, p.p_code, v.v_code
FROM customer c, invoice i, line l, product p, vendor v
WHERE c.cus_code = i.cus_code
AND i.inv_number = l.inv_number
AND l.p_code = p.p_code
AND p.v_code = v.v_code
AND c.cus_fname NOT LIKE '%A' 
AND c.cus_fname NOT LIKE '%K';


--11) What products have a price that exceeds the min product price?

SELECT
   *
FROM product
WHERE
p_price > (SELECT MIN(p_price) FROM product);


--12) How much is the average customer balance?
SELECT AVG(cus_balance) " Customer Balance"
FROM customer;



--13) What product(s) have a price equal to the average product price?

SELECT 
    * 
FROM product
WHERE
p_price = (SELECT AVG(p_price) FROM product);



--14) What product(s) have the lowest inventory value? Use the following formula to calculate the inventory value: P_QOH * P_PRICE.
SELECT
    MIN(SUM(p_qoh * p_price)) 
FROM product 
GROUP BY v_code;



--15) List all invoice data for customers whose codes are 10015 and 1008.
SELECT 
    c.cus_fname, i.cus_code, i.inv_number, p.p_code, v.v_code
FROM customer c, invoice i, line l, product p, vendor v
WHERE c.cus_code = i.cus_code
AND i.inv_number = l.inv_number
AND l.p_code = p.p_code
AND p.v_code = v.v_code
AND i.cus_code = '10015'
AND i.inv_number = '1008'
;






