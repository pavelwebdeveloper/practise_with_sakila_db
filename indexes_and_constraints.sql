-- Generating an ALTER TABLE statement for the rental table so that an error will be raised if a row having a value found in the rental.customer_id column is deleted from the customer table

ALTER TABLE rental
ADD CONSTRAINT fk_rental_customer FOREIGN KEY (customer_id)
REFERENCES customer (customer_id) ON DELETE RESTRICT;

-- Generating a multicolumn index on the payment table

ALTER TABLE payment
ADD INDEX idx_payment_date_amount (payment_date, amount);

-- The syntex to add a unique index vehicle_uq on the VIN column

ALTER TABLE vehicle
ADD UNIQUE vehicle_uq (VIN);

-- The syntex to add a unique index on the vehicle_id and VIN columns triggered by joins on the surrogate key 

ALTER TABLE vehicle
ADD UNIQUE INDEX idx_vehicle_id_VIN (vehicle_id, VIN);
