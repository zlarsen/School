use books;
#1
SELECT ROUND(AVG(price), 2) as "Average Price" FROM titles;
#2
SELECT COUNT(title_name) as "Qty" FROM titles;
#3
SELECT ROUND(SUM(sales * price), 2) as "Volume" FROM titles;
#4
SELECT type,
ROUND(AVG(pages),0) as "Average Pages" FROM titles GROUP BY type;
#5
SELECT type,
ROUND(AVG(pages),0) as "Average Pages" FROM titles GROUP BY type 
HAVING avg(pages) > 500;
#6
SELECT type,
ROUND(AVG(pages),0) as "Average Pages" FROM titles GROUP BY type
HAVING avg(pages) > 500 ORDER BY avg(pages) ASC;
#7
SELECT count(DISTINCT state) as "Number of States" FROM authors;
#8
SELECT state,
count(*) as "# of Authors"
FROM authors
GROUP BY state;
#9
SELECT type,
count(*) as "# of books"
FROM titles
GROUP BY type HAVING type != "children";
#10
SELECT type,
count(*) as "# of books"
FROM titles
GROUP BY type HAVING (type != "children" AND count(*) >= 3) ORDER BY type ASC ;

