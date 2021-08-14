create database VaccinationDelivetyDB;
USE VaccinationDelivetyDB;

CREATE TABLE Delivery_company (
    CID int NOT NULL PRIMARY KEY,
    Company_name varchar(50)
);

USE VaccinationDelivetyDB;

CREATE TABLE Laboratory (
    LID int PRIMARY KEY,
    lab_name varchar(50),
    city varchar(50),
    street varchar(50),
    num SMALLINT,    
    index address(city , street, num)
);

USE VaccinationDelivetyDB;

CREATE TABLE Vaccine (
    VID int PRIMARY KEY,
	LID int NOT NULL,
    FOREIGN KEY (LID) REFERENCES Laboratory(LID),
	validity DATE 
);

USE VaccinationDelivetyDB;

CREATE TABLE HMO (
    HMO_ID int NOT NULL PRIMARY KEY,
    HMO_name varchar(50),
	city varchar(50),
    street varchar(50),
    num SMALLINT,    
    index address(city , street, num),
    inventory  int unsigned
);

USE VaccinationDelivetyDB;

CREATE TABLE Orders (
    OID int NOT NULL PRIMARY KEY,
	LID int NOT NULL,
    HMO_ID int NOT NULL,
    CID int NOT NULL,
	FOREIGN KEY (LID) REFERENCES Laboratory(LID),
    FOREIGN KEY (HMO_ID) REFERENCES HMO(HMO_ID),
    FOREIGN KEY (CID) REFERENCES Delivery_company(CID),
	Vaccines_amount int NOT NULL,
	Supply_date DATE NOT NULL
);

USE VaccinationDelivetyDB;

CREATE TABLE Persons (
    PID int NOT NULL PRIMARY KEY,
    First_Name varchar(50),
	Last_Name varchar(50),
	Phone int,
	date_of_brith DATE NOT NULL,
    VID1 int,
	VID2 int,
	HMO_ID int,
    FOREIGN KEY (VID1) REFERENCES Vaccine(VID),
    FOREIGN KEY (VID2) REFERENCES Vaccine(VID),
	FOREIGN KEY (HMO_ID) REFERENCES HMO(HMO_ID)
);



