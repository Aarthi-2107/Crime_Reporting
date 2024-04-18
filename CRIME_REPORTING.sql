create database Crime_Reporting;
use Crime_Reporting;

--1) Create a table for Victims
Create table Victims(
victim_id int primary key,
first_name varchar(10),
last_name varchar(10),
DOB date,
gender varchar(15),
contact_information text
);

--2) Create a table for Suspects
Create table Suspects(
suspect_id int primary key,
first_name varchar(10),
last_name varchar(10),
DOB date,
gender varchar(15),
contact_information text
);

--3) Create a table for Incidents
Create table Incidents(
 incident_id int primary key,
 incident_type varchar(100),
 incident_date date,
 location varchar(50),
 description text,
 status varchar(50),
 victim_id int,
 suspect_id int,
 foreign key (victim_id) references Victims(victim_id),
 foreign key (suspect_id) references Suspects(suspect_id)
);

--4) Create a table for Law Enforcement Agencies
Create table LawEnforcementAgencies(
agency_id int primary key,
agency_name varchar(20),
jurisdiction varchar(50),
contact_information text
);

--5) Create a table for Officers
Create table Officers(
officer_id int primary key,
first_name varchar(15),
last_name varchar(15),
badge_number varchar(20),
officer_rank varchar(20),
contact_information text,
agency_id int,
foreign key(agency_id) references LawEnforcementAgencies(agency_id)
);

--6) Create a table for Evidence
Create table Evidence(
evidence_id int primary key,
description text,
location_found varchar(50),
incident_id int,
foreign key(incident_id) references Incidents(incident_id)
);

--7) Create a table for Reports
Create table Reports(
report_id int primary key,
incident_id int,
report_date date,
report_details text,
report_status varchar(50),
officer_id int,
foreign key(incident_id) references Incidents(incident_id),
foreign key(officer_id) references Officers(officer_id)
);

1)--inserting values into Victim Table
insert into Victims (victim_id,first_name,last_name,DOB,gender,contact_information)
VALUES
(1,'John','doe','2002-04-01','Male','123 Main St,USA'),
(2,'Michael','john','2002-05-02','Male','789 Oak St,USA'),
(3,'Jane','josetta','2002-06-04','Female','Armed St,USA'),
(4,'Steve','smith','2002-07-08','Male','Jamnagar,USA');

select*from Victims;

2)--inserting values into Suspect Table
insert into Suspects(suspect_id,first_name,last_name,DOB,gender,contact_information)
VALUES 
(1,'Pat','cummins','2001-04-03','Male','456 Main St,USA'),
(2,'David','warner','2001-05-06','Male','567 Oak St,USA'),
(3,'Sam','curran','2001-06-09','Male','345 Elm St,USA'),
(4,'Katty','perry','2001-07-04','Female','South carolina,USA');

select*from Suspects;

3)--inserting values into Incidents Table
insert into Incidents (incident_id,incident_type,incident_date,location,description,status,victim_id, suspect_id)
VALUES
(1, 'Robbery', '2024-04-10', 'Latitude: 40.7128, Longitude: -74.0060', 'Armed robbery at a convenience store.', 'Open', 1, 1),
(2, 'Homicide', '2024-04-15', 'Latitude: 34.0522, Longitude: -118.2437', 'Investigating a murder case.', 'Under Investigation', 2, 2),
(3, 'Theft', '2024-04-08', 'Latitude: 51.5074, Longitude: -0.1278', 'Stolen vehicle reported.', 'Closed', 3, 3),
(4, 'Fraud', '2024-04-05', 'Latitude: 37.7749, Longitude: -122.4194', 'Financial fraud case.', 'Closed', 4, 4);

select*from Incidents;

4)--inserting values into LawEnforcementAgencies Table
insert into LawEnforcementAgencies (agency_id, agency_name, jurisdiction, contact_information)
VALUES
(1,'City Police','Citywide', '123 City Blvd, Cityville, USA'),
(2, 'County Sheriff','Countywide', '456 County Rd, Countytown, USA'),
(3, 'State Bureau','Statewide', '789 State Hwy, Statetown, USA'),
(4, 'Federal Bureau','National', '101 FBI Ave, Capital City, USA');

select*from LawEnforcementAgencies;

5)--inserting values into Officers Table
INSERT INTO Officers (officer_id, first_name, last_name, badge_number, officer_rank, contact_information, agency_id)
VALUES
(1, 'John', 'Smith', '12345', 'Detective', '1001 High St, Cityville, USA', 1),
(2, 'Sarah', 'Johnson', '54321', 'Sheriff', '2002 Low St, Townville, USA', 2),
(3, 'Michael', 'Williams', '98765', 'Special Agent', '3003 Middle St, Villagetown, USA', 3),
(4, 'Emily', 'Brown', '56789', 'Agent', '4004 East St, Suburbia, USA', 4);

select *from Officers;

6)--inserting values into Evidence Table
INSERT INTO Evidence (evidence_id, description, location_found,incident_id)
VALUES
(1, 'Security footage from the convenience store.', '37.7749° N, 122.4194° W', 1),
(2, 'Forensic evidence from the crime scene.', '34.0522° N, 118.2437° W', 2),
(3, 'Fingerprint evidence collected at the scene.', '40.7128° N, 74.0060° W', 3),
(4, 'DNA sample from the suspect.', '51.5074° N, 0.1278° W', 4);

select*from Evidence;

7)--inserting values into Reports Table
INSERT INTO Reports (report_id, incident_id, report_date, report_details,report_status,officer_id)
VALUES 
(1, 1, '2023-01-20', 'Investigation report detailing the robbery.', 'Finalized',1),
(2, 2, '2023-02-25', 'Initial report on the homicide case.', 'Draft',2),
(3, 3, '2023-03-15', 'Ongoing investigation into the theft.', 'Finalized',3),
(4, 4, '2023-04-10', 'Assault incident report.', 'Finalized',4);

select *from Reports;

