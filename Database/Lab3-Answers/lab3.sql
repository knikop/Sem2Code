-- Lab 3

-- Kosta Nikopoulos


--1) List all products that are stored in New Jersey.
 Select p.product_name, p.p_description, p.list_price, w.warehouse_name,
 i.quantity, l.location_id, l.state 
From products p, warehouses w, inventories i,  locations l
--Join the sets
Where i.warehouse_id = w.warehouse_id
    AND w.location_id = l.location_id
    AND i.product_id = p.product_id
    AND l.location_id = 7


--2) List all orders that were placed by the customer whose ID is 45. The output of your query must include information about all the ordered products.
Select o.order_id, o.status, oi.item_id, oi.unit_price, e.employee_id, e.first_name, c.name, c.customer_id
From orders o, order_items oi, employees e, customers c
Where o.order_id = oi.order_id
    AND o.customer_id = c.customer_id
    AND e.employee_id = o.salesman_id
    AND o.customer_id = 45


--3) List the contact information of all customers.
Select co.first_name, co.email, co.phone, cu.name, cu.address, co.customer_id
From contacts co, customers cu
Where
    co.customer_id = cu.customer_id

--4) Find all products that are provided in the Americas.
Select p.product_name, p.list_price, w.warehouse_name, l.state, co.country_name, r.region_name, r.region_id
From products p, warehouses w, inventories i, locations l, regions r, countries co
Where i.warehouse_id = w.warehouse_id
    AND w.location_id = l.location_id
    AND i.product_id = p.product_id
    AND l.country_id = co.country_id
    AND co.region_id = r.region_id
    AND r.region_id = 2
