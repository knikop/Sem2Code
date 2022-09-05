-- Assignment 2

-- Main file of Assignment 2

-- Kosta Nikopoulos




set serveroutput on format word_wrapped;

set echo off

--Where the files are retreived/found from
show sqlpath -- The path where the data files are stored
--C:\Users\darth\Desktop\Winter2021\Database\Assignment2-Answers

--Loads the drop file
@Drop_schema.sql
--Loads the create file
@create_schema.sql
--Loads the populate file which fills the create file with data
@Populate_schema.sql
--Loads the test file which tests the constraints of the data
@Test_constraints.sql