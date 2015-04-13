use books;
drop table if exists TaxAreaAuthority;
create table TaxAreaAuthority (
 tid int(3) NOT NULL AUTO_INCREMENT,
 TaxAuthority varchar(30),
 TaxArea varchar(30),
 PRIMARY KEY (tid)
);

drop table if exists TaxRates; 
create table TaxRates (
 tid int(3) NOT NULL AUTO_INCREMENT,
 TaxAuthority varchar(30),
 Effective date,
 AuthTaxRate float(2),
 PRIMARY KEY (tid)
);

insert into TaxAreaAuthority (TaxAuthority, TaxArea) Values
 ("city1", "city1"),
 ("city2", "city2"),
 ("city3", "city3"),
 ("county1", "city1"),
 ("county1", "city2"),
 ("county2", "city3"),
 ("state1", "city1"),
 ("state1", "city2"),
 ("state1", "city3");

insert into TaxRates (TaxAuthority, Effective, AuthTaxRate) Values
 ("city1", "1993-01-01", 1.0),
 ("city1", "1994-01-01", 1.5),
 ("city2", "1993-09-01", 1.5),
 ("city2", "1994-01-01", 2.0),
 ("city2", "1995-01-01", 2.5),
 ("city3", "1993-01-01", 1.9),
 ("city3", "1993-07-01", 2.3),
 ("county1", "1993-01-01", 2.3),
 ("county1", "1994-10-01", 2.5),
 ("county1", "1995-01-01", 2.7),
 ("county2", "1993-01-01", 2.4),
 ("county2", "1994-01-01", 2.7),
 ("county2", "1995-01-01", 2.8),
 ("state1", "1993-01-01", 0.5),
 ("state1", "1994-01-01", 0.8),
 ("state1", "1994-07-01", 0.9),
 ("state1", "1994-10-01", 1.1);

#What county is city2 in?
Select TaxAuthority From TaxAreaAuthority Where TaxArea = "city2" and TaxAuthority like "county%";
#What state is city2 in?
Select TaxAuthority From TaxAreaAuthority Where TaxArea = "city2" and TaxAuthority like "state%";

SELECT SUM(AuthTaxRate) as "Total Tax Rate"
FROM   TaxRates NATURAL JOIN (
  SELECT   TaxAuthority, MAX(Effective) Effective
  FROM     TaxRates JOIN TaxAreaAuthority USING (TaxAuthority)
  WHERE    TaxArea = 'city2' AND Effective <= '1994-11-01'
  GROUP BY TaxAuthority
) t ;
