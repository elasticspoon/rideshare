CREATE SCHEMA IF NOT EXISTS temp;

CREATE TABLE IF NOT EXISTS
temp.customers (email CITEXT);

ALTER TABLE temp.customers
ADD CONSTRAINT unique_email UNIQUE (email);
