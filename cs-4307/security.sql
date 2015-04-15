DROP DATABASE IF EXISTS RedFlameCompany;
CREATE DATABASE RedFlameCompany;
use RedFlameCompany;
DROP TABLE IF EXISTS payroll;
CREATE TABLE payroll (
 Dept int(3),
 Manager boolean,
 Name varchar(30),
 Birthdate date,
 Salary int(7)
);

INSERT into payroll (Dept, Manager, Name, Birthdate, Salary) VALUES
 (1, true, "BOB", "0001-01-01", 50000),
 (1, false, "BILL", "0002-02-02", 40000),
 (1, false, "BART", "0003-03-03", 70000),
 (2, true, "JIM", "0004-04-04", 40000),
 (2, false, "JANET", "0005-05-05", 50000),
 (2, false, "JACK", "0006-06-06", 60000),
 (3, true, "MARY", "0007-07-07", 50000),
 (3, false, "MARTHA", "0008-08-08", 70000),
 (3, false, "MARTY", "0009-09-09", 90000);


CREATE VIEW dept1 AS 
 SELECT 
  Dept,
  Manager,
  Name,
  Birthdate,
  Salary
 FROM
  payroll
 WHERE
  dept = 1;

CREATE VIEW dept2 AS 
 SELECT 
  Dept,
  Manager,
  Name,
  Birthdate,
  Salary
 FROM
  payroll
 WHERE
  dept = 2;

CREATE VIEW dept3 AS 
 SELECT 
  Dept,
  Manager,
  Name,
  Birthdate,
  Salary
 FROM
  payroll
 WHERE
  dept = 3;

CREATE VIEW birthday AS 
 SELECT 
  Dept,
  Manager,
  Name,
  Birthdate
 FROM
  payroll;

DROP user Bob;
DROP user Bill;
DROP user Bart;
DROP user Jim;
DROP user Janet;
DROP user Jack;
DROP user Mary;
DROP user Martha;
DROP user Marty;

CREATE user Bob identified by 'password';
CREATE user Bill identified by 'password';
CREATE user Bart identified by 'password';
CREATE user Jim identified by 'password';
CREATE user Janet identified by 'password';
CREATE user Jack identified by 'password';
CREATE user Mary identified by 'password';
CREATE user Martha identified by 'password';
CREATE user Marty identified by 'password';

GRANT SELECT on RedFlameCompany.dept1 to Bob;
GRANT UPDATE(Dept,Manager,Name,Birthdate) on RedFlameCompany.dept1 to Bob;
GRANT SELECT(Dept,Manager,Name,Birthdate) on RedFlameCompany.dept1 to Bill;
GRANT SELECT(Dept,Manager,Name,Birthdate) on RedFlameCompany.dept1 to Bart;

GRANT SELECT on RedFlameCompany.dept1 to Jim;
GRANT UPDATE(Dept,Manager,Name,Birthdate) on RedFlameCompany.dept2 to Jim;
GRANT SELECT(Dept,Manager,Name,Birthdate) on RedFlameCompany.dept2 to Janet;
GRANT SELECT(Dept,Manager,Name,Birthdate) on RedFlameCompany.dept2 to Jack;

GRANT SELECT(Dept,Manager,Name,Birthdate) on RedFlameCompany.dept3 to Martha;
GRANT SELECT(Dept,Manager,Name,Birthdate) on RedFlameCompany.dept3 to Marty;
GRANT SELECT on RedFlameCompany.birthday to Marty;
GRANT UPDATE(Birthdate) on RedFlameCompany.birthday to Marty;
GRANT ALL PRIVILEGES ON *.* to Mary;

SHOW GRANTS For 'Bob';
SHOW GRANTS For 'Bill';
SHOW GRANTS For 'Bart';
SHOW GRANTS For 'Jim';
SHOW GRANTS For 'Janet';
SHOW GRANTS For 'Jack';
SHOW GRANTS For 'Mary';
SHOW GRANTS For 'Martha';
SHOW GRANTS For 'Marty';
