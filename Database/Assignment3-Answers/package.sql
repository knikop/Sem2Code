--Assignment 3
--Kosta Nikopoulos
--PL/SQL
--Package

--User-defined package with a user-defined record
CREATE OR REPLACE PACKAGE pkg_service_data AS
    TYPE ServiceInfoRec is record (
        --For Procedure
        --a
        mechanic_name VARCHAR2(75),
    --m_first_name mechanic.first_name%TYPE,
    --m_last_name mechanic.last_name%TYPE,
        --b   
        sm_Hours servicemechanic.sm_hours%TYPE,
        Rate servicemechanic.rate%TYPE,
        --c
        cus_fullname VARCHAR2(75),
    --c_last_name customer.last_name%TYPE,
    --c_first_name customer.first_name%TYPE,
        --d
        st_num serviceticket.serviceticket_number%TYPE,
        st_date_rec serviceticket.st_date_received%TYPE,
        st_date_ret serviceticket.st_date_returnedtocustomer%TYPE,
        --e
        service_name service.servive_name%TYPE,
        --f
        
        --g
        hourly_rate service.hourly_rate%TYPE,
        
        --For Function
        --a
        NumberUsed partsused.numberused%TYPE,
        Price partsused.price%TYPE,
        --b
        Part_number parts.part_number%TYPE,
        Descript parts.description%TYPE    
    );   
    
    --Define the Varray
    TYPE va_service IS VARRAY(10)
        OF ServiceInfoRec NOT NULL;
    
END pkg_service_data;
/