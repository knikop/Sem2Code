Create Table Bird_Owner(
    Owner_ID NUMBER NOT NULL,
    First_Name VARCHAR2(20) NOT NULL,
    Last_Name VARCHAR2(20) NOT NULL,
    Phone_Num CHAR(20) NOT NULL,
    Email CHAR(20) NOT NULL,
    PRIMARY KEY(Owner_ID)
);

CREATE TABLE Bird(
    Bird_ID NUMBER GENERATED AS IDENTITY Start With 1000 Increment BY 5
    NOT NULL PRIMARY KEY,
    Bird_Name VARCHAR2(20) NOT NULL,
    DOB DATE NOT NULL,
    Color VARCHAR2(20) NOT NULL,
    Owner_ID NUMBER NOT NULL,
    
    CONSTRAINT fk_Bird_Bird_Owner
    FOREIGN KEY(Owner_ID) REFERENCES Bird_Owner
);