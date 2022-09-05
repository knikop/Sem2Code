--Assignment 3
--Kosta Nikopoulos
--PL/SQL


CREATE OR REPLACE PROCEDURE proc_Service_info(
in_Service_id service.service_id%TYPE
)
IS

--Define a cursor to 
--Locale variables/ reference type
    CURSOR c_service_info IS
       SELECT
        m.first_name AS "Mechanic FName",
        m.last_name AS "Mechanic LName",
        sm.sm_hours AS "Hours",
        sm.rate AS "Rate",
        cu.first_name AS "Customer FName",
        cu.last_name AS "Customer LName",
        st.serviceticket_number AS "Ticket Number",
        st.st_date_returnedtocustomer AS "Date Returned",
        s.servive_name AS "Service Name"
    FROM
        mechanic         m,
        servicemechanic  sm,
        serviceticket    st,
        service          s,
        customer         cu,
        car              ca,
        partsused        pu,
        parts            p
    WHERE
            m.mechanic_id = sm.mechanic_id
        AND s.service_id = sm.service_id
        AND st.serviceticket_id = sm.serviceticket_id
        AND cu.customer_id = st.customer_id
        AND ca.car_id = st.car_id
        AND p.parts_id = pu.parts_id
        AND s.service_id = in_service_id;
        
r_service c_service_info%ROWTYPE;
BEGIN
  Null;
  OPEN c_service_info;
  
  FETCH c_service_info INTO r_service;
  IF c_service_info%FOUND THEN
    
    dbms_output.put_line('Number of services: '|| c_service_info);
    dbms_output.put_line('Mechanic Name: '||r_service.m.first_name||' '||
    r_service.m.last_name);
    dbms_output.put_line('Hours: '||r_service.sm.sm_hours||' '||
    'Rate: '||r_service.sm.rate);
    dbms_output.put_line('Cusmoter Full Name: '||r_service.cu.first_name||' '||
    r_service.cu.last_name);
    dbms_output.put_line(
    'ServiceTicket Number: '||r_service.st.ServiceTicket_Number||
    'Date Received: '||r_service.st.st_date_received||
    'Date Returned: '||r_service.st.st_date_returnedtocustomer);
    dbms_output.put_line('Service Name: '||r_service.s.Service_Name);
    dbms_output.put_line('Total Price: '||
    r_service.sm.sm_hours * r_service.s.Hourly_Rate);
    END IF; 
    
CLOSE c_service_info;
--handle the exception that might occur 
EXCEPTION
    WHEN TOO_MANY_ROWS
    THEN
    DBMS_OUTPUT.PUT_LINE('You have too many rows here be more specific...');
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    WHEN NO_DATA_FOUND
    THEN
    DBMS_OUTPUT.PUT_LINE('No data found for Service ID:  '||in_Service_id);
END;
/

DECLARE



