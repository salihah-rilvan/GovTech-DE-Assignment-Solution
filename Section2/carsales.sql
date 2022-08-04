BEGIN;

CREATE TABLE car (
    car_serial_number varchar(8),
    manufacturer_id char(2),
    model_name varchar(30),
    weight real,
    price real
);


INSERT INTO car (car_serial_number, manufacturer_id, model_name, weight, price)
VALUES ('SBA1234A','01','modelx', 4000, 40800),
('SBA2234A','02','modely', 5000, 40900),
('SBX2234A','03','modelz', 6000, 50000);


CREATE TABLE customer (
    customer_id char(8) NOT NULL,
    customer_name varchar(50) NOT NULL,
    customer_phone char(8) NOT NULL
);


INSERT INTO customer (customer_id, customer_name, customer_phone)
VALUES ('11111111', 'Mary', '84441111'),
('22222222', 'John', '85552222');



CREATE TABLE salesperson (
    staff_id char(8) NOT NULL,
    salesperson_name varchar(50) NOT NULL
);


INSERT INTO salesperson (staff_id, salesperson_name)
VALUES ('01452222', 'Rose'),
('15893333', 'Karyl');


CREATE TABLE manufacturer (
    manufacturer_id char(2) NOT NULL,
    manufacturer_name varchar(30) NOT NULL
);


INSERT INTO manufacturer (manufacturer_id, manufacturer_name)
VALUES ('01', 'Toyota'),
('02', 'Tesla'),
('03', 'BMW');


CREATE TABLE transaction (
    transaction_id char(10) NOT NULL,
    date varchar(10) NOT NULL,
    time varchar(8) NOT NULL, 
    car_serial_number varchar(8) NOT NULL,
    customer_id char(8) NOT NULL,
    salesperson_id char(8) NOT NULL
);


INSERT INTO transaction (transaction_id, date, time, car_serial_number, customer_id, salesperson_id)
VALUES ('0100022222', '2021-01-22', '19:30:10', 'SBA1234A', '11111111', '01452222'),
('0200033333', '2022-01-22', '12:30:10', 'SBA2234A', '22222222', '15893333'),
('0300033333', '2020-04-22', '13:30:10', 'SBX2234A', '22222222', '15893333');


ALTER TABLE ONLY car
    ADD CONSTRAINT car_pkey PRIMARY KEY (car_serial_number);

ALTER TABLE ONLY salesperson
    ADD CONSTRAINT salesperson_pkey PRIMARY KEY (staff_id);

ALTER TABLE ONLY customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);

ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (transaction_id);

ALTER TABLE ONLY manufacturer
    ADD CONSTRAINT manufacturer_pkey PRIMARY KEY (manufacturer_id);

ALTER TABLE ONLY car
    ADD CONSTRAINT car_fkey FOREIGN KEY (manufacturer_id) REFERENCES manufacturer(manufacturer_id);

ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_fkey_car_id FOREIGN KEY (car_serial_number) REFERENCES car(car_serial_number),
    ADD CONSTRAINT transaction_fkey_cust_id FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    ADD CONSTRAINT transaction_fkey_salesper_id FOREIGN KEY (salesperson_id) REFERENCES salesperson(staff_id);

COMMIT;








