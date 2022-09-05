-- Lab 6
-- Kosta Nikopoulos

--a) A constraint that rejects duplicated car models and serial numbers in the CAR table.
ALTER TABLE Car ADD CONSTRAINT uk_Car_model UNIQUE(c_model, serial_number);

--b) In the CAR table, a constraint that allows either Y or N to be stored in the CAR_FOR_SALE column.
ALTER TABLE Car ADD CONSTRAINT ck_Car_carforsale_y_n CHECK(carforsale_y_n IN ('Y','N'));

--c) In the SERVICE table, a constraint that rejects any hourly rate less than 60 dollars.
ALTER TABLE Service ADD CONSTRAINT ck_Hourly_Rate CHECK(Hourly_Rate < 60);

--d) In the PARTS table, a constraint that rejects duplicated part numbers.
ALTER TABLE parts ADD CONSTRAINT uk_Part_number UNIQUE(Part_number);

--e) A constraint that rejects any retail price greater than purchase price in the PARTS table. 
ALTER TABLE parts ADD CONSTRAINT ck_Retail_Price CHECK(Retail_Price > Purchase_Price);



--Display Table Constraints
--Car Table
SELECT constraint_name, constraint_type, search_condition, r_constraint_name
FROM user_constraints
WHERE table_name = 'Car';

--Parts Table
SELECT constraint_name, constraint_type, search_condition, r_constraint_name
FROM user_constraints
WHERE table_name = 'parts';