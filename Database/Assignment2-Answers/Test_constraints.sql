--Assignment 2
--Testing Constraints
--Kosta Nikopoulos

--Car
INSERT INTO Car(car_id,serial_number,make,c_model,colour,c_year,carforsale_y_n)
VALUES (502, 21578, 'Tesla', 'Model S' , 'white', DATE '2004-08-23', 'N');

INSERT INTO Car(car_id,serial_number,make,c_model,colour,c_year,carforsale_y_n)
VALUES (698, 65425, 'Volkswagen', 'Beettle' , 'blue', DATE '2010-07-25', 'Y');

INSERT INTO Car(car_id,serial_number,make,c_model,colour,c_year,carforsale_y_n)
VALUES (425, 74259, 'Dodge', 'Viper' , 'purple', DATE '2014-10-29', 'N');

INSERT INTO Car(car_id,serial_number,make,c_model,colour,c_year,carforsale_y_n)
VALUES (055, 31205, 'Lamborghini', 'Countach' , 'white', DATE '2011-09-12', 'N');


--Parts
Update parts 
SET
Retail_Price = 395,
Purchase_Price = 95,
Description = 'Steel Doors'
WHERE Parts_id = 01;

Update parts 
SET
Retail_Price = 275,
Purchase_Price = 250,
Description = 'Reinforced Windows'
WHERE Parts_id = 02;

Update parts 
SET
Retail_Price = 600,
Purchase_Price = 400,
Description = 'Gauges'
WHERE Parts_id = 03;

Update parts 
SET
Retail_Price = 200,
Purchase_Price = 150, 
Description = 'Exhaust'
WHERE Parts_id = 04;

--Service
Update Service
SET
hourly_rate = 25
WHERE service_id = 11;

Update Service
SET
hourly_rate = 39
WHERE service_id = 22;

Update Service
SET
hourly_rate = 55
WHERE service_id = 33;

Update Service
SET
hourly_rate = 15
WHERE service_id = 44;