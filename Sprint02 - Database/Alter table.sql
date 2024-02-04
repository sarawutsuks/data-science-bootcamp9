ALTER TABLE employee RENAME TO myemployee;

ALTER TABLE myemployee
ADD email text;

UPDATE myemployee
SET email = UPPER(name) || '@gg.com'
where id = 1, 2, 3  
