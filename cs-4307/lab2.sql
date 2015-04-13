use books;
#1 price list with discount
SELECT
  title_id,
  title_name,
  price,
  .10 as "Discount",
  round(price*.90,2) as "New Price"
FROM
  titles;
#2 authors name
SELECT
  concat(au_lname,", ",au_fname) as "Name"
FROM
  authors;
#3
 
SELECT
  concat(SUBSTR(UPPER(au_lname) from 1 for 3),SUBSTR(phone, -4)) as "Search ID",
  concat(au_lname,", ",au_fname) as "Name"
FROM
  authors;
#4
SELECT
  au_lname,
  CHAR_LENGTH(au_lname)as "Length"
FROM
  authors;
#5
select
  title_id,
  title_name,
  extract(year from pubdate) as "Year"
from
 titles;
#6
SELECT
 title_id,
 title_name,
 pubdate,
 pubdate + interval 28 year as "Copyright Date"
from
 titles;
#7
SELECT
 title_id,
 title_name,
 price,
 CASE
  WHEN type = "history" THEN round(price * .9, 2)
  ELSE round(price * .8, 2)
 END AS "New Price" 
FROM
 titles;
#8
SELECT
 title_id,
 title_name,
 CASE
  WHEN isNULL(price) THEN "priceless"
  ELSE price
 END AS "retail"
FROM
 titles;
#9
SELECT
 NOW() as "Current Time";

#10
SELECT
 SUBSTR(CURRENT_USER(), -9) as "Server";
