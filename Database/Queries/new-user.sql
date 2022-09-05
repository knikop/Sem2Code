-- Aletr the session to allow creating container database (CDB)
alter session set "_ORACLE_SCRIPT"=true;  

-- Create the new user with a password
create user kosta identified by oracle;

-- Grant the new user with the necessary privileges
grant CREATE SESSION, ALTER SESSION, CREATE DATABASE LINK, -
  CREATE MATERIALIZED VIEW, CREATE PROCEDURE, CREATE PUBLIC SYNONYM, -
  CREATE ROLE, CREATE SEQUENCE, CREATE SYNONYM, CREATE TABLE, - 
  CREATE TRIGGER, CREATE TYPE, CREATE VIEW, UNLIMITED TABLESPACE -
  to kosta;