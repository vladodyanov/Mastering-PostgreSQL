UPDATE addresses
SET country = 'Blocked'
WHERE country LIKE 'B%';

UPDATE addresses
SET country = 'Test'
WHERE country LIKE 'T%';

UPDATE addresses
SET country = 'In Progress'
WHERE country LIKE 'P%';