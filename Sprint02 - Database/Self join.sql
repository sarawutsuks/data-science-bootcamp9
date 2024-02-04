-- create a new employee table
CREATE TABLE employee (
    id INT,
    name TEXT,
    level TEXT, -- ตำแหน่ง
    manager_id INT -- Report ไปที่ id อะไร 
);

INSERT INTO employee VALUES 
    (1, 'David', 'CEO', NULL),
    (2, 'John', 'SVP', 1),
    (3, 'Mary', 'VP', 2),
    (4, 'Adam', 'VP', 2),
    (5, 'Scott', 'Manager', 3),
    (6, 'Louise', 'Manager', 3),
    (7, 'Kevin', 'Manager', 4),
    (8, 'Takeshi', 'Manager', 4),
    (9, 'Joe', 'AM', 6),
    (10, 'Anna', 'AM', 7);

-- self join in action
SELECT 
		e1.id, 
    e1.name AS employeeName, 
    e1.level AS employeeLevel,
    e2.name AS managerName,
    e2.level AS managerLevel
FROM employee e1, employee e2
WHERE e1.manager_id = e2.id;
