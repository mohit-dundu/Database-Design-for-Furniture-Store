
---------------------------------------------------------------TABLE CREATION------------------------------------------------------------------------------------------------

CREATE TABLE CUSTOMER_PROJECT(
customer_id NUMBER(25) PRIMARY KEY,
customer_name VARCHAR2(50),
billing_address_line VARCHAR2(50) UNIQUE,
city VARCHAR2(50),
addr_state VARCHAR2(50),
zip NUMBER(10),
phone_number number(15)
);


CREATE TABLE EMPLOYEE(
employee_SSN NUMBER(10) PRIMARY KEY,
employee_name VARCHAR2(25),
employee_address_line VARCHAR2(200),
city VARCHAR2(50),
addr_state VARCHAR2(50),
zip NUMBER(10),
employee_phone NUMBER(10),
salary NUMBER(10),
employee_type VARCHAR2(25),
commission NUMBER(10),
dl_no NUMBER(10),
dl_exp_date DATE
);


CREATE TABLE FURNITURE(
item_code NUMBER(25) PRIMARY KEY,
price NUMBER(10),
quantity_stock NUMBER(10),
product_desc VARCHAR2(200));


CREATE TABLE ORDERS(
order_id NUMBER(25) PRIMARY KEY,
employee_SSN NUMBER(10),
customer_id NUMBER(25),
customer_del_address_line VARCHAR2(200),
city VARCHAR2(50),
addr_state VARCHAR2(50),
zip NUMBER(10),
item_code NUMBER(25),
order_quantity NUMBER(10),
total_price NUMBER(10),
ufo_del VARCHAR2(1),
delivery_fee NUMBER(10),
grand_total NUMBER(10),
CONSTRAINT emp_fk FOREIGN KEY(employee_SSN) REFERENCES EMPLOYEE(employee_SSN),
CONSTRAINT cust_fk FOREIGN KEY(customer_id) REFERENCES CUSTOMER_PROJECT(customer_id),
CONSTRAINT item_fk FOREIGN KEY(item_code) REFERENCES FURNITURE(item_code));


CREATE TABLE TRUCK(
vehicle_no VARCHAR2(25) PRIMARY KEY,
license_plate_no VARCHAR2(25),
license_exp_date DATE,
inspection_exp_date DATE,
employee_SSN NUMBER(10), 
CONSTRAINT employee_fk FOREIGN KEY (employee_SSN) REFERENCES EMPLOYEE(employee_SSN));


CREATE TABLE SHIPMENT(
shipment_id NUMBER(25) PRIMARY KEY,
order_id NUMBER(25),
vehicle_no VARCHAR2(25),
employee_SSN NUMBER(10));

CREATE TABLE ORDER_MEMO(
order_id NUMBER(25),
item_code NUMBER(25),
order_date DATE,
CONSTRAINT order_memo_pk PRIMARY KEY(order_id,item_code),
CONSTRAINT item_om_fk FOREIGN KEY (item_code) REFERENCES FURNITURE(item_code),
CONSTRAINT order_om_fk FOREIGN KEY (order_id) REFERENCES ORDERS(order_id)
);


--guz and nairs5 grant commands

grant select on customer_project to guz,nairs5 ;
grant select on employee to guz,nairs5 ;
grant select on furniture to guz,nairs5 ;
grant select on orders to guz,nairs5 ;
grant select on truck to guz,nairs5 ;
grant select on shipment to guz,nairs5 ;
grant select on order_memo to guz,nairs5 ;


--------------------------------------------------------Select Queries-------------------------------------------------------------------------------
SELECT * FROM truck;
SELECT * FROM shipment;
SELECT * FROM orders;
SELECT * FROM furniture;
SELECT * FROM EMPLOYEE;
SELECT * FROM customer_project;
SELECT * FROM order_memo;

-----------------------------------------------------------Drop Queries-------------------------------------------------------------------------
--drop TABLE CUSTOMER_PROJECT;
--drop TABLE employee;
--drop TABLE furniture;
--drop table orders;
--alter table orders drop column extended_price;
--alter table orders drop constraint cust_fk;
--alter table orders drop constraint emp_fk;
--alter table orders drop constraint item_fk;
--drop TABLE truck;
--alter table TRUCK drop constraint employee_fk;
--alter table TRUCK add constraint employee_fk FOREIGN KEY (employee_SSN) REFERENCES EMPLOYEE(employee_SSN);
--drop TABLE SHIPMENT;

----------------------------------------------------DATA INSERTION INTO TABLES---------------------------------------------------------------------------


--- Customer table
INSERT INTO
    customer_project(customer_id,customer_name,billing_address_line,city,addr_state,zip,phone_number) VALUES
    (100,'Tony Lee','2274 Morgan Street','Pensacola','Florida',32501,1234567890);
INSERT INTO
    customer_project(customer_id,customer_name,billing_address_line,city,addr_state,zip,phone_number) VALUES
    (200,'Lluc Cy','4616 Angus Road','Bethpage','New York',11714,1234567891);
INSERT INTO
    customer_project(customer_id,customer_name,billing_address_line,city,addr_state,zip,phone_number) VALUES
    (300,'Shan Rolande','3322 Edsel Road','Los Angeles','California',90071,2234567891);
INSERT INTO
    customer_project(customer_id,customer_name,billing_address_line,city,addr_state,zip,phone_number) VALUES
    (400,'Pratibha Gundilar','75 Cherry Camp Road','Wood Dale','Illinois',60191,3234567891);  
INSERT INTO
    customer_project(customer_id,customer_name,billing_address_line,city,addr_state,zip,phone_number) VALUES
    (500,'Dara Kym','4351 Peaceful Lane','Garfield Heights','Ohio',44128,4234567891);
INSERT INTO
    customer_project(customer_id,customer_name,billing_address_line,city,addr_state,zip,phone_number) VALUES
    (600,'Michalis Angerona','519 Barrington Court','Foreman','Arkansas',71836,5234567891);
    

--- Employee Table
INSERT INTO
    employee(employee_ssn,employee_name,employee_address_line,addr_state,zip,city,employee_phone,salary,employee_type,commission,dl_no,dl_exp_date) VALUES
    (1100,'Martha Boris','993 Veltri Drive','Michigan',48342,'Pontiac',2085305502,40000,'Sales Rep',5,NULL,NULL);
INSERT INTO
    employee(employee_ssn,employee_name,employee_address_line,addr_state,zip,city,employee_phone,salary,employee_type,commission,dl_no,dl_exp_date) VALUES
    (1200,'Germanus Rosina','4165 Taylor Street','New York',40543,'Mamaroneck',2085305500,50000,'Sales Rep',7,NULL,NULL);
INSERT INTO
    employee(employee_ssn,employee_name,employee_address_line,addr_state,zip,city,employee_phone,salary,employee_type,commission,dl_no,dl_exp_date) VALUES
    (1300,'Fanny Hasna','4045 Olive Street','Ohio',44902,'Johnsville',6825292402,70000,'Ops_Manager',NULL,NULL,NULL);
INSERT INTO
    employee(employee_ssn,employee_name,employee_address_line,addr_state,zip,city,employee_phone,salary,employee_type,commission,dl_no,dl_exp_date) VALUES
    (1400,'Gage Nadine','3499 Browning Lane','New York',13901,'Binghamton',2345678912,20000,'Driver',NULL,282099151,'12-OCT-2026');
INSERT INTO
    employee(employee_ssn,employee_name,employee_address_line,addr_state,zip,city,employee_phone,salary,employee_type,commission,dl_no,dl_exp_date) VALUES
    (1500,'Robert Greiner','1098 Jadewood Farms','New Jersey',07102,'Newark',8622558411,25000,'Driver',NULL,93716272,'24-JAN-2025');
INSERT INTO
    employee(employee_ssn,employee_name,employee_address_line,addr_state,zip,city,employee_phone,salary,employee_type,commission,dl_no,dl_exp_date) VALUES
    (1600,'Agnes Bax','4183 Laurel Lane','Texas',79830,'Calamity Creek',5123124196,22000,'Driver',NULL,38696882,'27-SEP-2024');
    
    
-- Furniture Table
INSERT INTO 
        furniture(item_code,price,quantity_stock,product_desc) VALUES 
        (10, 2000, 87, 'Three Seater Couch');
    
INSERT INTO 
        furniture(item_code,price,quantity_stock,product_desc) VALUES 
        (11, 1000, 49, 'Utility Drawer');
        
INSERT INTO 
        furniture(item_code,price,quantity_stock,product_desc) VALUES 
        (12, 4000, 32, 'Dining Table');
        
INSERT INTO 
        furniture(item_code,price,quantity_stock,product_desc) VALUES 
        (13, 700, 70, 'Table Lamp');
        
INSERT INTO 
        furniture(item_code,price,quantity_stock,product_desc) VALUES 
        (14, 1200, 12, 'Single Sofa');
        
INSERT INTO 
        furniture(item_code,price,quantity_stock,product_desc) VALUES 
        (15, 900, 67, 'Bedside Table');
        
INSERT INTO 
        furniture(item_code,price,quantity_stock,product_desc) VALUES 
        (16, 3000, 24, 'Computer Table');


-- Orders Table


INSERT INTO 
        orders(order_id, employee_SSN,customer_id,customer_del_address_line,addr_state,zip, city, item_code, order_quantity, total_price, ufo_del, delivery_fee,grand_total) VALUES 
        (01, 1100, 100,'2274 Morgan Street','Florida',32501,'Pensacola',12,2,8000,'Y',0,8000 );
        
INSERT INTO 
        orders(order_id, employee_SSN,customer_id,customer_del_address_line,addr_state,zip, city, item_code, order_quantity, total_price, ufo_del, delivery_fee,grand_total) VALUES 
        (02, 1200, 200,'123 ABC Street','Texas',78015,'Dallas',13,2,1400,'N',0,1400 );


-- Truck Table

INSERT INTO
        truck(vehicle_no, license_plate_no,license_exp_date, inspection_exp_date,employee_ssn) VALUES
        ('GHJ7652', 7832432, '12-FEB-2023', '30-MAR-2025',1500);
        
INSERT INTO
        truck(vehicle_no, license_plate_no,license_exp_date, inspection_exp_date,employee_ssn) VALUES
        ('QKW7872', 1092432, '12-FEB-2027', '27-MAR-2027',1600);
        
INSERT INTO
        truck(vehicle_no, license_plate_no,license_exp_date, inspection_exp_date,employee_ssn) VALUES
        ('RTY6543', 4932544, '04-OCT-2026', '10-DEC-2025',1400);
        
-- Shipment Table

-- For oders table, derive order id from this.

INSERT INTO
        shipment(shipment_id, order_id, vehicle_no, employee_ssn) VALUES
        (111, 02, 'GHJ7652', 1300);
        
INSERT INTO
        shipment(shipment_id, order_id, vehicle_no, employee_ssn) VALUES
        (222, 01, 'QKW7872', 1300);
        
INSERT INTO
        shipment(shipment_id, order_id, vehicle_no, employee_ssn) VALUES
        (333, 04, 'RTY6543', 1300);

        
INSERT INTO
        shipment(shipment_id, order_id, vehicle_no, employee_ssn) VALUES
        (444, 03, 'RTY6543', 1300);
        
INSERT INTO
        shipment(shipment_id, order_id, vehicle_no, employee_ssn) VALUES
        (555, 06, 'QKW7872', 1300);
        
INSERT INTO
        shipment(shipment_id, order_id, vehicle_no, employee_ssn) VALUES
        (666, 06, 'GHJ7652', 1300);
        
-- order_memo
INSERT INTO 
        order_memo(order_id, item_code, order_date) VALUES 
        (01,12,'7-APR-2022' );
        
INSERT INTO 
        order_memo(order_id, item_code, order_date) VALUES      
        (02,13,'22-FEB-2022');

/*
e. Execute the following queries using SQL:               
*/        

--1. List all customer names, addresses, and phone numbers.   
        
select customer_name as "Customer Name", 
billing_address_line|| ', ' || city || ', '|| addr_state|| ', ' || zip as "Customer Address", phone_number as "Cutomer Phone Number"
from customer_project;
    
/*2. Pick an order, and get all information about that order included in the order form.  You don’t need to 
compute the totals and the delivery fee.  This may be split into two queries, one for the header and the other 
for the order lines.  
*/
--header query
select order_id as "Order Number",
employee_name as "Sales Rep Name", 
customer_project.customer_id as "Customer Account", 
customer_name as "Customer Name", 
billing_address_line|| ', ' || customer_project.city || ', '|| customer_project.addr_state|| ', ' || customer_project.zip as "Billing Address",
customer_del_address_line|| ', ' || orders.city || ', '|| orders.addr_state|| ', ' || orders.zip as "Delivery Address"
from orders,customer_project,employee
where orders.customer_id = customer_project.customer_id 
and orders.employee_ssn= employee.employee_ssn and
order_id =1;

--order lines query
select furniture.item_code as "Furniture ID",
product_desc as "Description",
order_quantity as "Quantity",
price as "Unit Space Price",
price*order_quantity as "Extended Price"
from orders, furniture
where orders.item_code= furniture.item_code
and order_id =1;


/*
3. What is the phone number of the salesrep who took order in the query above?   
*/

select employee_phone as "Employee Phone Number" 
from orders,employee
where orders.employee_ssn= employee.employee_ssn and
order_id =1;


/*
4. Pick a driver and list all customers whose orders have been delivered by him/her.  
*/

select orders.customer_id as "Customer Account",
customer_name as "Customer Name", 
billing_address_line|| ', ' || customer_project.city || ', '|| customer_project.addr_state|| ', ' || customer_project.zip as "Billing Address"
from shipment,orders,customer_project,truck
where shipment.order_id = orders.order_id and
orders.customer_id = customer_project.customer_id and
truck.vehicle_no = shipment.vehicle_no and
truck.employee_ssn=1500;

/*
5. What is the total value (quantity time unit price) of all items in stock that have unit prices exceeding $25? 
*/

select price*quantity_stock as "Total value"
from furniture 
where price > 25 and quantity_stock >0;





