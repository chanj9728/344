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
  VALUES (5001, 'Noah', 'Wetzel','James');
  
INSERT INTO pers
  VALUES (5002, 'Jordan', 'Jansen','Fredrick'); 
  
INSERT INTO pers 
  VALUES (5003, 'Ian', 'Wetzel','Charles');
  
INSERT INTO pers 
  VALUES (5004, 'Justin', 'Lorentz','Allen');  
  
INSERT INTO pers 
  VALUES (5005, 'Rachel', 'Stout','Marie');
  
INSERT INTO pers 
  VALUES (5006, 'Erin', 'Wetzel','Charlene');

INSERT INTO pers 
  VALUES (5007, 'Sunny', '', 'Chen');
  
INSERT INTO pers 
  VALUES (5008, 'Jacob', 'Maurer','Peter');

INSERT INTO pers 
  VALUES (5009, 'Yong Sheng', '', 'Lai');

INSERT INTO pers 
  VALUES (5010, 'Mark', 'Smith', 'Brewer');

INSERT INTO pers 
  VALUES (5011, 'Sarah', 'Adam', 'Lee');

INSERT INTO pers 
  VALUES (5012, 'Patricia', 'Jacobsen' ,'Pweter');

INSERT INTO pers 
  VALUES (5013, 'Adam', 'Martin' ,'Jake');

INSERT INTO pers 
  VALUES (5014, 'Eli', '','Behling');

INSERT INTO pers 
  VALUES (5015, 'Sam', 'Paul','Smith');

INSERT INTO pers 
  VALUES (5016, 'Sandy', '','Wong');

--INSERT EMERGENCY CONTACT
INSERT INTO emg
	VALUES (1010, 5001, 'Brother', 'Y', 'Y', 'N');

INSERT INTO emg
	VALUES (1011, 5002, Friend, 'N', 'Y', 'N');

INSERT INTO emg
	VALUES (1012, 5003, Colleague, 'Y', 'N', 'Y');

INSERT INTO emg
	VALUES (1013, 5004, Cousin, 'Y', 'Y', 'N');

INSERT INTO emg
	VALUES (1014, 5005, Sister, 'Y', 'N', 'Y');

INSERT INTO emg
	VALUES (1015, 5006, Brother, 'N', 'N', 'Y');

INSERT INTO emg
	VALUES (1016, 5007, Wife, 'Y', 'Y', 'N');
