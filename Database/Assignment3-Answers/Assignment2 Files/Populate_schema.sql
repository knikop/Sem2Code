--Assignment 2
-- Populate Table Statements
--Kosta Nikopoulos

--Salesperson
INSERT INTO salesperson(salesperson_id,first_name,last_name)
VALUES (1,'Frank','Newman');

INSERT INTO salesperson(salesperson_id,first_name,last_name)
VALUES (2,'Jeff','Oxeman');

INSERT INTO salesperson(salesperson_id,first_name,last_name)
VALUES (3,'Roger','Flank');

INSERT INTO salesperson(salesperson_id,first_name,last_name)
VALUES (4,'Jerry','Thompson');

INSERT INTO salesperson(salesperson_id,first_name,last_name)
VALUES (5,'Craig','Tomas');

INSERT INTO salesperson(salesperson_id,first_name,last_name)
VALUES (6,'Markus','Pegasus');

--Car
INSERT INTO Car(car_id,serial_number,make,c_model,colour,c_year,carforsale_y_n)
VALUES (117, 21547, 'Honda', 'Accord' , 'blue', DATE '2004-08-23', 'Y');

INSERT INTO Car(car_id,serial_number,make,c_model,colour,c_year,carforsale_y_n)
VALUES (138, 67347, 'Toyota', 'Camrie' , 'red', DATE '2010-07-25', 'N');

INSERT INTO Car(car_id,serial_number,make,c_model,colour,c_year,carforsale_y_n)
VALUES (215, 35245, 'Ford', 'Mustang' , 'silver', DATE '2014-10-29', 'Y');

INSERT INTO Car(car_id,serial_number,make,c_model,colour,c_year,carforsale_y_n)
VALUES (099, 01279, 'Lamborghini', 'Huracan' , 'white', DATE '2011-09-12', 'N');

INSERT INTO Car(car_id,serial_number,make,c_model,colour,c_year,carforsale_y_n)
VALUES (101, 78546, 'Lamborghini', 'Aventador' , 'green', DATE '2005-07-22', 'N');

INSERT INTO Car(car_id,serial_number,make,c_model,colour,c_year,carforsale_y_n)
VALUES (777, 21547, 'Chevrolet', 'Corvette' , 'black', DATE '2017-04-05', 'Y');

--customer
INSERT INTO customer(customer_id,last_name,first_name,phone_number,address,city,cus_state,country,postal_code)
VALUES(111, 'Johnson', 'Mark', '695-457-4578', '2nd street', 'Boston', 'Masttachusis', 'USA', 'H0E2TI' );

INSERT INTO customer(customer_id,last_name,first_name,phone_number,address,city,cus_state,country,postal_code)
VALUES(222, 'Maxwell', 'Jason', '438-435-4478', '10th street', 'Toronto', 'Ontario', 'Canada', 'A3W4D5' );

INSERT INTO customer(customer_id,last_name,first_name,phone_number,address,city,cus_state,country,postal_code)
VALUES(333, 'Newman', 'Jack', '111-222-3333', '1st street', 'Victoria', 'BC', 'Canada', 'E4T6D6' );

INSERT INTO customer(customer_id,last_name,first_name,phone_number,address,city,cus_state,country,postal_code)
VALUES(444, 'Jackson', 'Jamal', '555-888-6666', '3rd street', 'Las Vegas', 'Nevada', 'USA', 'C0T9F3' );

INSERT INTO customer(customer_id,last_name,first_name,phone_number,address,city,cus_state,country,postal_code)
VALUES(555, 'Micheal', 'Angelo', '203-678-9876', '2nd street', 'Boston', 'Masttachusis', 'USA', 'L8I1B7' );

INSERT INTO customer(customer_id,last_name,first_name,phone_number,address,city,cus_state,country,postal_code)
VALUES(666, 'Morningstar', 'Lucifer', '666-666-6666', '666th street', 'LosAngeles', 'California', 'USA', 'A6L6G6' );

--Sales Invoice
INSERT INTO sales_invoice (invoice_id, invoice_number, si_date, car_id, customer_id, salesperson_id)
VALUES (1, 50010, DATE '2006-08-01', 117, 111, 1);

INSERT INTO sales_invoice (invoice_id, invoice_number, si_date, car_id, customer_id, salesperson_id)
VALUES (2, 60020, DATE '2011-07-09', 138, 222, 2);

INSERT INTO sales_invoice (invoice_id, invoice_number, si_date, car_id, customer_id, salesperson_id)
VALUES (3, 70030, DATE '2015-11-21', 215, 333, 3);

INSERT INTO sales_invoice (invoice_id, invoice_number, si_date, car_id, customer_id, salesperson_id)
VALUES (4, 80040, DATE '2012-10-24', 099, 444, 4);

INSERT INTO sales_invoice (invoice_id, invoice_number, si_date, car_id, customer_id, salesperson_id)
VALUES (5, 90050, DATE '2009-09-09', 101, 555, 5);

INSERT INTO sales_invoice (invoice_id, invoice_number, si_date, car_id, customer_id, salesperson_id)
VALUES (6, 10001, DATE '2018-05-11', 777, 666, 6);

--Mechanic
INSERT INTO Mechanic(Mechanic_id,last_name,first_name) 
VALUES(1,'Reed','Arthur');

INSERT INTO Mechanic(Mechanic_id,last_name,first_name) 
VALUES(2,'Reed','Niko');

INSERT INTO Mechanic(Mechanic_id,last_name,first_name) 
VALUES(3,'Micheal','Micheal');

INSERT INTO Mechanic(Mechanic_id,last_name,first_name) 
VALUES(4,'Deep','Jonny');

INSERT INTO Mechanic(Mechanic_id,last_name,first_name) 
VALUES(5,'Michels','Jimmy');

INSERT INTO Mechanic(Mechanic_id,last_name,first_name) 
VALUES(6,'Creed','Jack');

--Service
INSERT INTO Service(service_id,servive_name,hourly_rate)
VALUES(11, 'Oil Change', 55);

INSERT INTO Service(service_id,servive_name,hourly_rate)
VALUES(22, 'Brake Work', 59);

INSERT INTO Service(service_id,servive_name,hourly_rate)
VALUES(33, 'New Tires', 57);

INSERT INTO Service(service_id,servive_name,hourly_rate)
VALUES(44, 'Replace air filter', 25);

INSERT INTO Service(service_id,servive_name,hourly_rate)
VALUES(55, 'Battery Replacement', 30);

INSERT INTO Service(service_id,servive_name,hourly_rate)
VALUES(66, 'ScheduledMaintenance', 40);

--Parts
INSERT INTO parts(Parts_id,Part_Number,Description,Purchase_Price,Retail_Price)
VAlUES(01, 10010, 'Doors', 150, 200 );

INSERT INTO parts(Parts_id,Part_Number,Description,Purchase_Price,Retail_Price)
VAlUES(02, 20020, 'Windows', 100, 125 );

INSERT INTO parts(Parts_id,Part_Number,Description,Purchase_Price,Retail_Price)
VAlUES(03, 30030, 'Gauges and Meters', 300, 500 );

INSERT INTO parts(Parts_id,Part_Number,Description,Purchase_Price,Retail_Price)
VAlUES(04, 40040, 'Exhaust System', 100, 150 );

INSERT INTO parts(Parts_id,Part_Number,Description,Purchase_Price,Retail_Price)
VAlUES(05, 50050, 'Sensors', 50, 100 );

INSERT INTO parts(Parts_id,Part_Number,Description,Purchase_Price,Retail_Price)
VAlUES(06, 60060, 'Breaking System', 250, 550 );

--Service Ticket
INSERT INTO serviceticket(ServiceTicket_id, ServiceTicket_Number, car_id, customer_id, st_date_received, comments, st_date_returnedtocustomer) 
VALUES(101, 44004, 117, 111,  DATE '2006-08-01', 'Needs oil change',  DATE '2006-09-01' );

INSERT INTO serviceticket(ServiceTicket_id, ServiceTicket_Number, car_id, customer_id, st_date_received, comments, st_date_returnedtocustomer) 
VALUES(202, 55005, 138, 222, DATE '2011-07-09', 'Needs new Windows' , DATE '2011-08-08');

INSERT INTO serviceticket(ServiceTicket_id, ServiceTicket_Number, car_id, customer_id, st_date_received, comments, st_date_returnedtocustomer) 
VALUES(303, 66006, 215, 333, DATE '2015-11-21', 'Needs new Brakes', DATE '2015-12-22' );

INSERT INTO serviceticket(ServiceTicket_id, ServiceTicket_Number, car_id, customer_id, st_date_received, comments, st_date_returnedtocustomer) 
VALUES(404, 77007, 099, 444, DATE '2012-10-24', 'Needs tires', DATE '2012-11-28');

INSERT INTO serviceticket(ServiceTicket_id, ServiceTicket_Number, car_id, customer_id, st_date_received, comments, st_date_returnedtocustomer) 
VALUES(505, 88008, 101, 555, DATE '2009-09-09', 'Needs Battery', DATE '2009-10-10');

INSERT INTO serviceticket(ServiceTicket_id, ServiceTicket_Number, car_id, customer_id, st_date_received, comments, st_date_returnedtocustomer) 
VALUES(606, 99009, 777, 666, DATE '2018-05-11', 'Needs Maintenance', DATE '2018-10-25' );

--Service Mechanic
INSERT INTO servicemechanic(ServiceMechanic_id, ServiceTicket_id, Service_id, Mechanic_id, sm_Hours, Comments, Rate) 
VALUES(1, 101, 11, 1, 12, 'Oil was Changed', 100 );

INSERT INTO servicemechanic(ServiceMechanic_id, ServiceTicket_id, Service_id, Mechanic_id, sm_Hours, Comments, Rate) 
VALUES(2, 202, 22, 2, 5, 'Windows were changed', 75);

INSERT INTO servicemechanic(ServiceMechanic_id, ServiceTicket_id, Service_id, Mechanic_id, sm_Hours, Comments, Rate) 
VALUES(3, 303, 33, 3, 9, 'Breaks were replaced', 50);

INSERT INTO servicemechanic(ServiceMechanic_id, ServiceTicket_id, Service_id, Mechanic_id, sm_Hours, Comments, Rate) 
VALUES(4, 404, 44, 4, 2, 'Tires were changed', 20);

INSERT INTO servicemechanic(ServiceMechanic_id, ServiceTicket_id, Service_id, Mechanic_id, sm_Hours, Comments, Rate) 
VALUES(5, 505, 55, 5, 4, 'Exhaust was changed', 60);

INSERT INTO servicemechanic(ServiceMechanic_id, ServiceTicket_id, Service_id, Mechanic_id, sm_Hours, Comments, Rate) 
VALUES(6, 606, 66, 6, 3, 'ScheduledMaintenance', 50);

--Parts Used
INSERT INTO partsUsed(PartsUsed_id, Parts_id, ServiceTicket_id, NumberUsed, Price)
VALUES(707, 01, 101, 4, 245);

INSERT INTO partsUsed(PartsUsed_id, Parts_id, ServiceTicket_id, NumberUsed, Price)
VALUES(808, 02, 202, 5, 265);

INSERT INTO partsUsed(PartsUsed_id, Parts_id, ServiceTicket_id, NumberUsed, Price)
VALUES(909, 03, 303, 2, 175);

INSERT INTO partsUsed(PartsUsed_id, Parts_id, ServiceTicket_id, NumberUsed, Price)
VALUES(777, 04, 404, 3, 425);

INSERT INTO partsUsed(PartsUsed_id, Parts_id, ServiceTicket_id, NumberUsed, Price)
VALUES(888, 05, 505, 8, 385);

INSERT INTO partsUsed(PartsUsed_id, Parts_id, ServiceTicket_id, NumberUsed, Price)
VALUES(999, 06, 606, 10, 195);

