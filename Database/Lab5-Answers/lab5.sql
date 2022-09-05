--Lab 5
--Kosta Nikopoulos

DROP TABLE salesperson; 
DROP TABLE Car;
DROP TABLE Customer;
DROP TABLE sales_invoice;
DROP TABLE Mechanic;
DROP TABLE Service;
DROP TABLE parts;
DROP TABLE serviceticket;
DROP TABLE servicemechanic;
DROP TABLE partsUsed;


CREATE TABLE salesperson(
salesperson_id NUMBER PRIMARY KEY,
last_name VARCHAR2(20),
first_name VARCHAR2(20)
);

CREATE TABLE Car(
car_id NUMBER PRIMARY KEY,
serial_number NUMBER,
make VARCHAR2(25) NOT NULL,
c_model VARCHAR2(30) NOT NULL,
colour CHAR(12) NOT NULL, 
c_year DATE NOT NULL,
carforsale_y_n CHAR(1) NOT NULL
);

CREATE TABLE customer(
customer_id NUMBER PRIMARY KEY,
last_name VARCHAR(20) NOT NULL,
first_name VARCHAR2(20) NOT NULL,
phone_number CHAR(8) NOT NULL,
address CHAR(10) NOT NULL,
city CHAR(10) NOT NULL,
cus_state CHAR(3) NOT NULL,
country CHAR(9) NOT NULL,
postal_code CHAR(6)NOT NULL
);

CREATE TABLE sales_invoice(
invoice_id NUMBER 
CONSTRAINT PK_sales_invoice PRIMARY KEY,
invoice_number NUMBER NOT NULL,
si_date DATE NOT NULL,
car_id NUMBER,
customer_id NUMBER,
salesperson_id NUMBER,

CONSTRAINT fk_sales_invoice_Car
FOREIGN KEY(car_id) REFERENCES Car(car_id),
CONSTRAINT fk_sales_invoice__customer
FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
CONSTRAINT fk_sales_invoice_salesperson
FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id)
);

CREATE TABLE Mechanic(
Mechanic_id NUMBER PRIMARY KEY,
last_name VARCHAR2(20) NOT NULL,
first_name VARCHAR(20) NOT NULL
);

CREATE TABLE Service(
Service_id NUMBER PRIMARY KEY,
Servive_Name VARCHAR2(20) NOT NULL,
Hourly_Rate NUMBER NOT NULL
);

CREATE TABLE parts(
Parts_id NUMBER PRIMARY KEY,
Part_number NUMBER NOT NULL,
Description VARCHAR2(30) NOT NULL,
Purchase_Price NUMBER NOT NULL,
Retail_Price NUMBER NOT NULL
);

CREATE TABLE serviceticket(
ServiceTicket_id NUMBER 
CONSTRAINT PK_serviceticket PRIMARY KEY,
ServiceTicket_Number NUMBER NOT NULL,
car_id NUMBER,
customer_id NUMBER,
st_date_received DATE NOT NULL,
comments VARCHAR2(25) NOT NULL,
st_date_returnedtocustomer DATE NOT NULL,

CONSTRAINT fk_serviceticket_Car
FOREIGN KEY(car_id) REFERENCES Car(car_id),
CONSTRAINT fk_serviceticket__customer
FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE servicemechanic(
ServiceMechanic_id NUMBER
CONSTRAINT PK_servicemechanic PRIMARY KEY,
ServiceTicket_id NUMBER,
Service_id NUMBER,
Mechanic_id NUMBER,
sm_Hours NUMBER NOT NULL,
Comments VARCHAR2(20) NOT NULL,
Rate CHAR(10) NOT NULL,

CONSTRAINT fk_servicemechanic_serviceticket
FOREIGN KEY(ServiceTicket_id) REFERENCES serviceticket(ServiceTicket_id),
CONSTRAINT fk_servicemechanic_Service
FOREIGN KEY(Service_id) REFERENCES Service(Service_id),
CONSTRAINT fk_servicemechanic_mechanic
FOREIGN KEY(Mechanic_id) REFERENCES Mechanic(Mechanic_id)
);

CREATE TABLE partsUsed(
PartsUsed_id NUMBER
CONSTRAINT PK_partsUsed PRIMARY KEY,
Parts_id NUMBER,
ServiceTicket_id NUMBER,
NumberUsed NUMBER NOT NULL,
Price NUMBER NOT NULL,

CONSTRAINT fk_partsUsed_parts
FOREIGN KEY(Parts_id) REFERENCES Parts(Parts_id),
CONSTRAINT fk_partsUsed_serviceticket
FOREIGN KEY(ServiceTicket_id) REFERENCES serviceticket(ServiceTicket_id)
);
