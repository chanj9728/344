-- Tables for 344 Project

/* DROP STATEMENTS */
DROP TABLE per CASCADE CONSTRAINTS;
DROP TABLE dem CASCADE CONSTRAINTS;
DROP TABLE email CASCADE CONSTRAINTS;
DROP TABLE hos CASCADE CONSTRAINTS;
DROP TABLE stu CASCADE CONSTRAINTS;
DROP TABLE par CASCADE CONSTRAINTS;
DROP TABLE phn CASCADE CONSTRAINTS;
DROP TABLE emg CASCADE CONSTRAINTS;
DROP TABLE inc CASCADE CONSTRAINTS;
DROP TABLE medin CASCADE CONSTRAINTS;
DROP TABLE addr CASCADE CONSTRAINTS;
DROP TABLE brn CASCADE CONSTRAINTS;
DROP TABLE stdoc CASCADE CONSTRAINTS;
DROP TABLE sdev CASCADE CONSTRAINTS;
DROP TABLE serv CASCADE CONSTRAINTS;
/* CREATE STATEMENTS */

--PERSON TABLE
CREATE TABLE per (
perID VARCHAR2(35),
perfname VARCHAR2(35),
perlname VARCHAR2(35),
permname VARCHAR2 (35),

CONSTRAINT per_perID_pk PRIMARY KEY(perID));
  
--DEMOGRAPHIC TABLE  
CREATE TABLE dem (
demID NUMBER (10),
demeth VARCHAR2 (35)NOT NULL, -- ETHNICITY
demgen VARCHAR2 (1) NOT NULL, -- GENDER

CONSTRAINT dem_demID_pk PRIMARY KEY (demID)
CONSTRAINT dem_demID_fk FOREIGN KEY (demID) REFERENCES dem(demID));

--EMAIL TABLE
CREATE TABLE email (
emailID NUMBER (10),
emailus VARCHAR2 (20) NOT NULL,
emaildom VARCHAR2 (20)NOT NULL,
  
CONSTRAINT email_emailID_pk PRIMARY KEY (emailID)
CONSTRAINT email_emailID_fk FOREIGN KEY (emailID) REFERENCES email(emailID));

--HOSPITAL TABLE
CREATE TABLE hos (
stuID NUMBER (10),
hosID NUMBER (10)NOT NULL,
hosname VARCHAR2 (35) NOT NULL,
hosprim VARCHAR2 (1) NOT NULL, --PRIMARY (Y/N)  
    
-- STUDENT TABLE
CREATE TABLE stu (
perID
stulunch VARCHAR2 (1) NOT NULL,
sturet VARCHAR2 (1) NOT NULL,
stutru VARCHAR2 (1) NOT NULL,
stugradecomm VARCHAR2 (1) NOT NULL,
stugradesatis VARCHAR2 (1) NOT NULL,
stuhomewrk VARCHAR2 (35) NOT NULL,
stuserviceID VARCHA2 (35) NOT NULL,--CHECK THIS
  
CONSTRAINT stu_perID_pk PRIMARY KEY(perID),
CONSTRAINT stu_perID_fk FOREIGN KEY (perID) REFERENCES per(perID),
CONSTRAINT stu_servID_fk FOREIGN KEY (servID) REFERENCES serv(servID)); -- MAKE THIS TABLE

-- PARENT TABLE
CREATE TABLE par (
stuID VARCHAR2 (35)
emgcont VARCHAR2 (35) NOT NULL,
parempplace VARCHAR2 (35) NOT NULL,
parrelation VARCHAR2 (35) NOT NULL,
parwrkphn NUMBER (10) NOT NULL,--CHECK THIS
 
  
-- PHONE TABLE  
CREATE TABLE phn (
phnID VARCHAR2 (35) NOT NULL,
phntype VARCHAR2 (1) NOT NULL,
phncntry NUMBER (1) NOT NULL,
phnarea NUMBER (1) NOT NULL,
phnexc NUMBER (35) NOT NULL,

CONSTRAINT phn_phnID_pk PRIMARY KEY(phnID)) ;

-- EMERGENCY TABLE  
CREATE emg (
emgID VARCHAR2 (35),    
emgdesc VARCHAR2 (35) NOT NULL,

CONSTRAINT phn_phnID_pk PRIMARY KEY(phnID)) ;
-- SPECIAL SERVICES TABLE
CREATE TABLE serv (
servID NUMBER (10),
  
--Income Table
CREATE TABLE inc (
perID NUMBER (10),
incfamsi NUMBER (10) NOT NULL,  --FAMILY SIZE
incmili VARCHAR2 (1) NOT NULL,  --MILITARY STATUS (Y/N)
incbran VARCHAR2 (15) NOT NULL, --BRANCH
inclivew VARCHAR2 (15) NOT NULL,--MEMBER LIVES WITH

--MEDICAL INFO TABLE
CREATE TABLE medin (
stuID NUMBER (10),
medinID NUMBER (10),
medindate DATE, -- DATE OF LAST VISIT
medinupda VARCHAR2 (1) --IMMUNIZATION UPDATE (Y/N)  
CONSTRAINT medin_stuID_pk PRIMARY KEY (stuID)
CONSTRAINT medin_medinID_pk PRIMARY KEY (medinID)  
CONSTRAINT medin_stuID_fk FOREIGN KEY (stuID) REFERENCES stu(stuID));  
  
  
-- ADDRESS TABLE   
CREATE TABLE addr (
addrID NUMBER (10),
addrstreet VARCHAR2 (35) NOT NULL,
addrcity VARCHAR2 (35) NOT NULL,  
addrzip NUMBER (5) NOT NULL,  
  
CONSTRAINT addr_addrID_pk PRIMARY KEY (addrID)) ;  

--MILITARY BRANCH TABLE
CREATE TABLE brn (
brnID NUMBER (10),
brnname VARCHAR2(35) NOT NULL,
  
CONSTRAINT brn_brnID_pk PRIMARY KEY (brnID));  

--STUDENT DOCTOR TABLE
CREATE TABLE stdoc (
stuID NUMBER (10),
docID NUMBER (10),
 
CONSTRAINT stdoc_pk PRIMARY KEY (stuID, docID)
CONSTRAINT stdoc_stuID_fk FOREIGN KEY (stuID) REFERENCES stu(stuID)
CONSTRAINT stdoc_docID_fk FOREIGN KEY (docID) REFERENCES doc(docID));
  
--SOCIAL DEVELOPMENT TABLE 
CREATE TABLE sdev (
stuID NUMBER (10),
sdevstress VARCHAR2 (1) NOT NULL, --STRESS (Y/N?)
sdevdral VARCHAR2 (1) NOT NULL, --DRUG AL PROBLEMS IN FAMILY (Y/N?)
sdevleg VARCHAR2 (1) NOT NULL, --LEGAL ISSUES (Y/N)
sdevbull VARCHAR2 (1) NOT NULL, --BULLYING ISSUES

CONSTRAINT sdev_stuID_pk PRIMARY KEY (stuID)
CONSTRIANT sdev_stuID_fk FOREIGN KEY (stuID) REFERENCES stu(stuID));
  
--MEMBERSHIP RELEASE FORM TABLE
CREATE TABLE mr (
stuID NUMBER (10),
mrdatsig DATE NOT NULL,     --DATE SIGNED
mrliab VARCHAR2 (1)NOT NULL, --LIABILITY Y/N
mrtrans VARCHAR2 (1)NOT NULL, --TRANSPORTATION
mrpho VARCHAR2 (1) NOT NULL, --PHOTO/VIDEO Y/N
mracadem VARCHAR2 (1) NOT NULL, -- ACADEMIC INFO RELEASE Y/N
mrcomp VARCHAR2 (1) NOT NULL, -- COMPUTER USE Y/N   
mrauthl VARCHAR2 (1) NOT NULL, -- AUTHORIZED TO LEAVE Y/N
mrmemsig VARCHAR2 (1) NOT NULL -- MEMBER SIGNATURE Y/N
  
