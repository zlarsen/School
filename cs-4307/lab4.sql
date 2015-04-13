USE books;

#1
SELECT
 t.title_id,
 t.title_name,
 a.au_lname
FROM 
 title_authors as ta
JOIN
 titles as t
  on ta.title_id = t.title_id
JOIN
 authors as a
  on ta.au_id = a.au_id
WHERE
 au_order = 1;
 
#2
SELECT
 title_id,
 title_name,
 publishers.pub_id
 pub_name
FROM
 titles,
 publishers
WHERE
 (titles.pub_id = publishers.pub_id)
ORDER BY
 publishers.pub_id,
 title_name;
#3
SELECT
 title_id,
 title_name,
 publishers.pub_id,
 pub_name
FROM
 titles,
 publishers
WHERE
 (titles.pub_id = publishers.pub_id AND state = 'CA')
ORDER BY
 publishers.pub_id,
 title_name;

#4
SELECT
 type,
 COUNT(type) as 'Number'
FROM
 titles,
 publishers
WHERE
 (titles.pub_id = publishers.pub_id AND state = 'CA')
GROUP BY
 type;
#5
SELECT
 count(emp_id) as '# Employees',
 SUM(sales) as 'Total Sales'
FROM
 empsales;
#6
SELECT
 count(em.emp_id) as '# Employees',
 SUM(sales) as 'Total Sales'
FROM
 empsales as em
LEFT JOIN
 employees as e
  on em.emp_id = e.emp_id;
#7
SELECT
 em.emp_id,
 emp_name,
 sales
FROM
 empsales as em
LEFT JOIN
 employees as e
  on em.emp_id = e.emp_id;
#8
SELECT
 em.emp_id,
 emp_name,
 sales
FROM
 employees as e
LEFT JOIN
 empsales as em
  on em.emp_id = e.emp_id;
#9
SELECT
 em.emp_id,
 emp_name,
 sales
FROM
 empsales as em
 LEFT JOIN employees as e
  on em.emp_id = e.emp_id
UNION

SELECT
 em.emp_id,
 emp_name,
 sales
FROM
 empsales as em
 RIGHT JOIN employees as e
  on em.emp_id = e.emp_id;
#10
SELECT
 e.emp_id,
 e.emp_name,
 h.boss_id,
 b.emp_name
 FROM hier h
 LEFT JOIN employees e
  on h.emp_id = e.emp_id
 LEFT JOIN employees b
  on h.boss_id = b.emp_id;



