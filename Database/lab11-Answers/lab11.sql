--lab 11
--PL/SQL Stored Procedures and Functions
--Kosta Nikopoulos

--Part 1
CREATE OR REPLACE PROCEDURE proc_Car_Info(
in_car_id IN NUMBER
)
IS
--declaring locale variables/reference types
r_car Car%ROWTYPE;
BEGIN
--implicit cursor to fetch info about specified car
    SELECT *
    INTO  r_car
    FROM Car
    WHERE car_id = in_car_id;
    DBMS_OUTPUT.PUT_LINE('This cars serial number is: '||r_car.serial_number) ;
    DBMS_OUTPUT.PUT_LINE('This cars model is:' ||r_car.c_model) ;
    DBMS_OUTPUT.PUT_LINE(concat('Car ID: ', in_car_id) );

--handle the exception that might occur  
EXCEPTION
    WHEN TOO_MANY_ROWS
    THEN
    DBMS_OUTPUT.PUT_LINE('You have too many rows here be more specific...');
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    WHEN NO_DATA_FOUND
    THEN
    DBMS_OUTPUT.PUT_LINE('No data found for Car ID:  '||in_car_id);
END;
/


--Block Testing
--test 1
BEGIN
     proc_car_info(117);
END;
/
--test 2
BEGIN
     proc_car_info(777);
END;
/
--test 3
BEGIN
     proc_car_info(138);
END;
/



--Part 2
CREATE OR REPLACE FUNCTION FN_customer_info(
in_phone_number IN CHAR
)
RETURN VARCHAR2
IS
  r_cus_info customer%ROWTYPE;
BEGIN
--fetch info about specified customer
    SELECT
        * 
    INTO r_cus_info
    FROM customer
    WHERE phone_number = in_phone_number;
    DBMS_OUTPUT.PUT_LINE(
    'Name: '||r_cus_info.first_name ||' '|| r_cus_info.last_name ||' '||
    'Address: '|| r_cus_info.address ||' '|| 
    'City: '|| r_cus_info.city ||' '||
    'State: '|| r_cus_info.cus_state ||' '||
    'Country: '|| r_cus_info.country ||' '|| 
    'Postal Code: '|| r_cus_info.postal_code ||' '||
    ' ID: '|| r_cus_info.customer_id);          
RETURN 'customer info';   
EXCEPTION
    WHEN TOO_MANY_ROWS
    THEN
    DBMS_OUTPUT.PUT_LINE('You have too many rows here be more specific...');
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    WHEN NO_DATA_FOUND
    THEN
    DBMS_OUTPUT.PUT_LINE('No data found for customer phone number: '||in_phone_number);
END;
/   

--Block Testiong
--test 1
DECLARE
    test VARCHAR2(50);
BEGIN
    test := FN_customer_info('666-666-6666');
END;
/
--test 2       
DECLARE
    test VARCHAR2(50);
BEGIN
    test := FN_customer_info('111-222-3333');
END;
/
--test 3
DECLARE
    test VARCHAR2(50);
BEGIN
    test := FN_customer_info('555-888-6666');
END;
/




