-- Lab 2
-- Kosta Nikopoulos

--1) List all vendor names in capital letters.
Select UPPER(v_name) AS "Vendor Name"
From vendor


--2) List all vendor codes, names and contact info (the area code and phone number must be combined using the CONCAT SQL function).
Select 
vendor.*,
Concat(concat(v_areacode, '-'), v_phone) AS "Telephone Number" 
From vendor


--3) Count all the vendors operating in Florida (FL).
Select COUNT(v_state) "Vendors in Florida" 
From vendor
Where v_state = 'FL';


--4) Find the average price of products offered by the vendor whose code is 24288.
Select AVG(p_price) "Average Price" 
From product
Where v_code = '24288';


--5) Find the cheapest product.
Select *
From Product
Where 
    p_price =  (select MIN(p_price) "Min Price" from product)


--6) How many products are offered by the vendor whose code is 25595
Select COUNT(v_code) "Number of Products"
From product
Where v_code = '25595';


--7) What is the most expensive product that is provided by a vendor whose code is 24288.
Select *
From product
Where
    p_price = (Select MAX(p_price) from product
    Where v_code = '24288')

