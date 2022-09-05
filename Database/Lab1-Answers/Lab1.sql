-- SQL Lab 1
--Kosta Nikopoulos

-- 1) List all vendors that are operating in Florida (FL) ordered by vender name (descending order).
/* Select 
v_code as "Vendor Code", v_name AS "Vendor Name" , v_contact ,v_areacode ,v_phone , v_state, v_order 
From vendor 
where v_state = 'FL'
Order BY v_name DESC;
*/

-- 2) List all vendors whose state is either GA or TN (you must use the IN operator).
/* Select 
 v_code , v_name , v_contact ,v_areacode ,v_phone ,v_state AS "State", v_order 
From vendor
where v_state IN (
'GA', 'TN');
*/

-- 3) List the unique states where vendors are operating.
/* Select 
 v_code , v_name , v_contact ,v_areacode ,v_phone , v_state AS "State", v_order 
From vendor
where v_state = 'KY';
*/

-- 4) List all products that are provided by a vendor whose code is 24288.
/* Select
p_code, p_descript, p_indate, p_qoh, p_min, p_price, p_discount, v_code AS "Vendor Code"
From product
where v_code = '24288';
*/

-- 5) List all vendors whose names start with the letter R (note the case sensitivity).
/* Select 
 v_code , v_name AS "Vendor Name" , v_contact ,v_areacode ,v_phone ,v_state , v_order 
From vendor
where v_name LIKE 'R%';
*/

-- 6) List all products whose quantity on hand (QOH) is grater than 50 (> 50).
/* Select
p_code, p_descript, p_indate, p_qoh AS "Quantity on Hand", p_min, p_price, p_discount, v_code
From product
where p_qoh > 50;
*/