use spj;
#1 list the jobs that use parts supplied from London (No Sub-queries)
SELECT 
 j.jid
FROM 
j
JOIN
 spj
  on j.jid = spj.jid
JOIN 
 s
 on spj.sid = s.sid
WHERE 
 s.city = "London";
#2 list the jobs that use parts supplied from London (Use Sub-queries) 
SELECT 
 j.jid
FROM 
j
JOIN
 spj
  on j.jid = spj.jid
JOIN 
 s
  on spj.sid = s.sid
WHERE 
 s.city IN
 (SELECT city FROM s WHERE city = "London");
#3 List the jobs that use red parts. (No Sub-Queries)
SELECT DISTINCT
 j.jid
FROM 
 j
JOIN
 spj
  on j.jid = spj.jid
JOIN 
 p
 on spj.pid = p.pid
WHERE 
 p.color = "Red";
 
#4 List the jobs that use red parts. (Use Sub-Queries)
SELECT DISTINCT
 j.jid
FROM 
 j
JOIN
 spj
  on j.jid = spj.jid
JOIN 
 p
 on spj.pid = p.pid
WHERE 
 p.color IN
 (SELECT color FROM p WHERE p.color = "Red");
 
#5 List the jid,pid,sid and qty where qty > average of all the supplied
parts.
SELECT
 jid,
 pid,
 sid,
 qty
FROM
 spj
WHERE
 spj.qty > (SELECT  avg(qty) FROM spj);
#7 List the suppliers that supply all the parts to some job.
 SELECT DISTINCT sid
 FROM spj
 WHERE
 sid = "s5";
