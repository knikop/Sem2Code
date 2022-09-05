--Lab 9 
--Database Views
--Kosta Nikopoulos



--1. Create a VIEW that queries a table having at least 5 columns.
CREATE OR REPLACE VIEW vw_parts("Part_ID","Part Number", "Description", "Buy Price", "Sell Price")
AS SELECT
    parts_id,part_number, description,purchase_price,retail_price
FROM parts
WITH READ ONLY;

--2. Create a VIEW that read data from two different tables of your choice.
CREATE OR REPLACE VIEW vw_car_invoice 
AS SELECT 
    c.serial_number, c.car_id, si.invoice_number, si.si_date   
FROM Car c, sales_invoice si
WHERE c.car_id = si.car_id
WITH READ ONLY;


--3. Create a VIEW that read data from three different tables of your choice. The tables to be queried must be related through a parent-child relationship.
CREATE OR REPLACE VIEW vw_service_mech
AS SELECT 
    m.first_name,m.last_name,s.service_id,sm.mechanic_id,sm.comments
FROM mechanic m, service s, servicemechanic sm
WHERE m.mechanic_id = sm.mechanic_id
AND s.service_id = sm.service_id
WITH READ ONLY;

--4. Write DROP statements that delete the views you created in the previous steps.
DROP VIEW vw_parts;
DROP VIEW vw_car_invoice;
DROP VIEW vw_service_mech;
