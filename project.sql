-- If the database "COMPANY" already exists, then delete it.
DROP DATABASE IF EXISTS COMPANY;
-- Create the Database "COMPANY"
CREATE DATABASE COMPANY;


-- Set the currently active database to be "COMPANY"
USE COMPANY;


DROP TABLE IF EXISTS EMPLOYEE;
CREATE TABLE EMPLOYEE (
    emp_ID INT(10) NOT NULL,
    Ssn CHAR(9),
    Fname VARCHAR(15) NOT NULL,
    Minit VARCHAR(1),
    Lname VARCHAR(15) NOT NULL,
    Bdate DATE,
    emp_Addr VARCHAR(50),
    Sex CHAR(1),
    Salary DECIMAL(10 , 2 ),
    Super_ssn CHAR(9),
    CONSTRAINT pk_employee PRIMARY KEY (Ssn),
    CONSTRAINT super_emp FOREIGN KEY (Super_ssn) references EMPLOYEE(Ssn)
);


DROP TABLE IF EXISTS DEPARTMENT;
CREATE TABLE DEPARTMENT (
    Dname VARCHAR(25) NOT NULL,
    Dnumber INT NOT NULL,
    Mgr_ID CHAR(9) NOT NULL,
    store_ID INT NOT NULL,
    CONSTRAINT pk_Department PRIMARY KEY (Dnumber),
    CONSTRAINT uk_dname UNIQUE (Dname),
    CONSTRAINT uk_storeID UNIQUE (store_ID),
    CONSTRAINT manager FOREIGN KEY (Mgr_ID) references EMPLOYEE(emp_ID)
);


DROP TABLE IF EXISTS STORE;
CREATE TABLE STORE (
  store_ID    INT(5),
  manager_ID  INT(10), 
  store_phone INT(10),
  store_addr VARCHAR(50),
  store_type ENUM("general", "clothing", "shoe"),
  CONSTRAINT pk_stores PRIMARY KEY (store_ID),
  CONSTRAINT uk_store_location UNIQUE (store_addr),
  CONSTRAINT uk_store_phone UNIQUE (store_phone)
);

DROP TABLE IF EXISTS USERS;
CREATE TABLE USERS (
  user_ID    INT(12) NOT NULL,
  first_name  VARCHAR(15) NOT NULL, 
  middle_name VARCHAR(15),
  last_name VARCHAR(15),
  user_phone INT(10),
  reward_points INT(5),
  user_addr VARCHAR(50),
  user_email VARCHAR(50),
  CONSTRAINT pk_user PRIMARY KEY (user_ID),
  CONSTRAINT uk_phone UNIQUE (user_phone)
);

DROP TABLE If EXISTS PURCHASES;
CREATE TABLE PURCHASES (
  purchase_ID CHAR(20) NOT NULL,
  date_purchases DATETIME() NOT NULL,
  amount DECIMAL(10, 2),
  reward_earned int(20),
  shipment_tracking_ID int(20),
  user_ID int(12) NOT NULL,
  store_ID int(5)
);

DROP TABLE If EXISTS TRACKING;
CREATE TABLE PURCHASES (
  tracking CHAR(20) NOT NULL,
  departure DATETIME() NOT NULL,
  arrival DATETIME(),
  destination VARCHAR(50),
  weight DECIMAL(3, 2),
  user_ID int(12) NOT NULL,
  store_ID int(5)
);