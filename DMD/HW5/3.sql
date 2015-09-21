SELECT DISTINCT p.last_name FROM nominations AS n
JOIN people as p ON n.person_id = p.id
JOIN categories as c ON n.category_id = c.id
WHERE 2000 <= n.year AND n.year <= 2002
AND c.name = 'Leading Actor'
ORDER BY p.last_name;
