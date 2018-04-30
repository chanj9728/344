/* DROP STATEMENTS */
DROP TABLE pers CASCADE CONSTRAINTS;
DROP TABLE emg CASCADE CONSTRAINTS;

/* CREATE STATEMENTS */
--PERSON TABLE
CREATE TABLE pers (
persid VARCHAR2 (35),
persfname VARCHAR2 (35) NOT NULL,
persmname VARCHAR2 (35),
perslname VARCHAR2 (35) NOT NULL,
CONSTRAINT pers_pk PRIMARY KEY (persid));

--EMERGENCY CONTACT TABLE
--DOUBLE CHECK CONSTRAINTS
CREATE TABLE emg (
stuid VARCHAR2(35),
emgid VARCHAR2 (35),    
emgrel VARCHAR2 (35) NOT NULL,
emgcal CHAR (1) NOT NULL,
emgauth CHAR (1) NOT NULL,
emgnoauth CHAR (1) NOT NULL,
CONSTRAINT emg_pk PRIMARY KEY(stuid, emgid),
CONSTRAINT emg_student_fk FOREIGN KEY (stuid) REFERENCES pers (persid),
CONSTRAINT emg_person_fk FOREIGN KEY (emgid) REFERENCES pers (persid));


/* INSERT DATA INTO TABLES */
-- INSERT PERSON TABLE
INSERT INTO pers 
  VALUES (300001, 'Noah', 'Wetzel','James');
  
INSERT INTO pers
  VALUES (300002, 'Jordan', 'Jansen','Fredrick'); 
  
INSERT INTO pers 
  VALUES (300003, 'Ian', 'Wetzel','Charles');
  
INSERT INTO pers 
  VALUES (300004, 'Justin', 'Lorentz','Allen');  
  
INSERT INTO pers 
  VALUES (300005, 'Rachel', 'Stout','Marie');
  
INSERT INTO pers 
  VALUES (300006, 'Erin', 'Wetzel','Charlene');

INSERT INTO pers 
  VALUES (300007, 'Sunny', '', 'Chen');
  
INSERT INTO pers 
  VALUES (300008, 'Jacob', 'Maurer','Peter');

INSERT INTO pers 
  VALUES (300009, 'Yong Sheng', '', 'Lai');

INSERT INTO pers 
  VALUES (300010, 'Mark', 'Smith', 'Brewer');

INSERT INTO pers 
  VALUES (300011, 'Sarah', 'Adam', 'Lee');

INSERT INTO pers 
  VALUES (300012, 'Patricia', 'Jacobsen' ,'Pweter');

INSERT INTO pers 
  VALUES (300013, 'Adam', 'Martin' ,'Jake');

INSERT INTO pers 
  VALUES (300014, 'Eli', '','Behling');

INSERT INTO pers 
  VALUES (300015, 'Sam', 'Paul','Smith');

INSERT INTO pers 
  VALUES (300016, 'Sandy', '','Wong');

--INSERT EMERGENCY CONTACT
INSERT INTO emg
	VALUES (6900010, 300001, 'Brother', 'Y', 'Y', 'N');

INSERT INTO emg
	VALUES (6900011, 300002, Friend, 'N', 'Y', 'N');

INSERT INTO emg
	VALUES (6900012, 300003, Colleague, 'Y', 'N', 'Y');

INSERT INTO emg
	VALUES (6900013, 300004, Cousin, 'Y', 'Y', 'N');

INSERT INTO emg
	VALUES (6900014, 300005, Sister, 'Y', 'N', 'Y');

INSERT INTO emg
	VALUES (6900015, 300006, Brother, 'N', 'N', 'Y');

INSERT INTO emg
	VALUES (6900016, 300007, Wife, 'Y', 'Y', 'N');
