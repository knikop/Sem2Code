--Assignment 3
--Kosta Nikopoulos
--PL/SQL
--Function

CREATE OR REPLACE FUNCTION fn_parts_data(
in_Service_id service.service_id%TYPE
)
RETURN pkg_service_data.va_service
IS
--the list of parts
    list_of_parts pkg_service_data.va_service := pkg_service_data.va_service();
--cursor
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
--temp record
r_parts_used pkg_service_data.ServiceInfoRec;
BEGIN
  
  DBMS_OUTPUT.PUT_LINE('Received the Service ID: '|| in_Service_id);
    
  FOR r_parts IN c_service_info
  LOOP
   DBMS_OUTPUT.PUT_LINE('Received the Service ID: '|| in_Service_id);
    r_parts_used.NumberUsed := r_parts.numberused;
    r_parts_used.Price := r_parts.price;
    r_parts_used.Part_number := r_parts.part_number;
    r_parts_used.Descript := r_parts.description;
    DBMS_OUTPUT.PUT_LINE( r_parts.numberused|| ':$' || r_parts.price||
    ':$' || r_parts.part_number|| ':$'||r_parts.description);
    --New element to VARRAY
    list_of_parts.EXTEND;
    list_of_parts(list_of_parts.LAST) := r_parts_used;
END LOOP;
--Return the list of parts
RETURN list_of_parts;
--Exception Section
EXCEPTION
    WHEN TOO_MANY_ROWS
        THEN
        DBMS_OUTPUT.PUT_LINE('You have too many rows here be more specific...');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
    WHEN NO_DATA_FOUND
        THEN
        DBMS_OUTPUT.PUT_LINE('No data found for Service ID:  '||in_Service_id);
    WHEN OTHERS 
        THEN
        DBMS_OUTPUT.PUT_LINE('An error was encountered - '|| SQLCODE ||' -ERROR- '||SQLERRM);
    
END;
/

/*
--Unnamed block that tests function
DECLARE
    r_parts_used pkg_service_data.ServiceInfoRec;
BEGIN
    r_parts_used := fn_parts_data();
END;
/

*/

























