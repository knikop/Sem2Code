
------------------------------------------------------------
--|  NOTE! This script must be executed using the sys user |
------------------------------------------------------------

-- Aletr the session to allow creating container database (CDB)
alter session set "_ORACLE_SCRIPT"=true;  

-- Create the new user (aka DB schema). The new user must be identified by a password 
CREATE USER theUserName@ChangeMePlease identified by thePassword@ChangeMePlease;

-- Grant the new user with the necessary privileges
GRANT CREATE SESSION, ALTER SESSION, CREATE DATABASE LINK, -
    CREATE MATERIALIZED VIEW, CREATE PROCEDURE, CREATE PUBLIC SYNONYM, -
  CREATE ROLE, CREATE SEQUENCE, CREATE SYNONYM, CREATE TABLE, - 
  CREATE TRIGGER, CREATE TYPE, CREATE VIEW, UNLIMITED TABLESPACE -
  to theUserName@ChangeMePlease;