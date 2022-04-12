-- If the database "COMPANY" already exists, then delete it.
DROP DATABASE IF EXISTS COMPANY;
-- Create the Database "COMPANY"
CREATE DATABASE COMPANY;


-- Set the currently active database to be "COMPANY"
USE COMPANY;

DROP TABLE IF EXISTS DEPARTMENT;
CREATE TABLE DEPARTMENT (
    Dname VARCHAR(25) NOT NULL,
    Dnumber INT NOT NULL,
    Mgr_ssn CHAR(9) NOT NULL,
    store_ID INT NOT NULL,
    CONSTRAINT pk_Department PRIMARY KEY (Dnumber),
    CONSTRAINT uk_dname UNIQUE (Dname),
    CONSTRAINT uk_storeID UNIQUE (store_ID)
);

DROP TABLE IF EXISTS EMPLOYEE;
CREATE TABLE EMPLOYEE (
    Fname VARCHAR(15) NOT NULL,
    Minit VARCHAR(1),
    Lname VARCHAR(15) NOT NULL,
    Ssn CHAR(9),
    Bdate DATE,
    Address VARCHAR(50),
    Sex CHAR(1),
    Salary DECIMAL(10 , 2 ),
    Super_ssn CHAR(9),
    Dno INT,
    CONSTRAINT pk_employee PRIMARY KEY (Ssn),
    CONSTRAINT fk_employee_department FOREIGN KEY (Dno)
        REFERENCES DEPARTMENT (Dnumber)
);


DROP TABLE IF EXISTS DEPT_LOCATIONS;
CREATE TABLE DEPT_LOCATIONS (
  Dnumber    INT,
  Dlocation  VARCHAR(15), 
  CONSTRAINT pk_dept_locations PRIMARY KEY (Dnumber,Dlocation),
  CONSTRAINT fk_deptlocations_department FOREIGN KEY (Dnumber) references DEPARTMENT(Dnumber)
);