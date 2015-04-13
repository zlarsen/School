use spj;
#1
SELECT DISTINCT 
 city 
FROM 
 s
UNION SELECT
 city
FROM
 j;
#2

SELECT DISTINCT 
 city 
FROM 
 s
UNION SELECT
 city
FROM
 j
UNION SELECT
 city
FROM
 p;
#3

SELECT DISTINCT 
 city 
FROM 
 s
INNER JOIN j
USING  (city);
#4

SELECT DISTINCT 
 city 
FROM 
 s
INNER JOIN j
USING (city)
INNER JOIN p
USING (city);
#5
SELECT DISTINCT 
 city 
FROM 
 s
WHERE NOT EXISTS (SELECT city from p WHERE s.city = p.city)
UNION SELECT
 city
FROM
 j
WHERE NOT EXISTS (SELECT city FROM p WHERE j.city = p.city);

